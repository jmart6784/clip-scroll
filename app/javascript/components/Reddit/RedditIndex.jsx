import React, { useEffect, useState } from "react";
import RedditVideo from "./RedditVideo";
import shuffle from "../../helpers/shuffle";

const RedditIndex = () => {
  const [posts, setPosts] = useState([]);
  const [index, setIndex] = useState(0);
  const [noResults, setNoResults] = useState(false);
  const [subreddits, setSubreddits] = useState([]);
  const [apiHistory, setApiHistory] = useState({ requestIndex: 0, watched: [], refreshAtIndex: 5 });

  useEffect(() => { 
    fetch("/api/v1/addedsubreddit/mine")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => {
        let shuffledArray = shuffle(response);
        setSubreddits(shuffledArray);
        getVideoData(shuffledArray);
      })
      .catch(() => console.log("Error getting subreddit data"));
  }, []);

  const getVideoData = (subreddits) => { 
    if (subreddits.length > 0) {
      // Randomized subreddits user is subbed to will have an API request for three.
      let previousEntry = subreddits[apiHistory.requestIndex - 1];
      let currentEntry = subreddits[apiHistory.requestIndex];
      let nextEntry = subreddits[apiHistory.requestIndex + 1];
      let requestList = [previousEntry, currentEntry, nextEntry];
      let videos = [];

      for (let i = 0; i < requestList.length; i++) {
        const sr = requestList[i];
        
        if (sr != undefined) {
          fetch(`https://www.reddit.com/r/${sr.subreddit}.json?limit=100&raw_json=1`)
          .then((response) => {
            if (response.ok) {
              return response.json();
            }
            throw new Error("Network response was not ok.");
          })
          .then((response) => {
            let res = response;
            let tempAry = [];

            for (let i = 0; i < res['data']['children'].length; i++) {
              let post = res['data']['children'][i];
              // push to array if reddit video is detected.
              if (post['data']['media'] != null) {
                if (post['data']['media']['reddit_video']) {
                  let height = post['data']['media']['reddit_video']['height']; 
                  let width = post['data']['media']['reddit_video']['width']; 
                  // Include vertical videos only
                  height >= width ? tempAry.push(post) : "";
                }
              }
            }
            
            if (tempAry.length > 0) {
              videos = shuffle([...videos, ...tempAry]);
              // Avoid multiple renders by setting posts at the end
              i == requestList.length - 1 ? setPosts(videos) : "";
            } else { 
              setNoResults(true);
            }
          })
          .catch(() => console.log("Error getting posts data"));
        }
      }
    }
  }

  useEffect(() => console.log("POSTS: ", posts), [posts]);

  const previousVideo = () => index > 0 ? setIndex(index - 1) : "";
  const nextVideo = () => index != posts.length - 1 ? setIndex(index + 1) : "";

  let videoJsx = <h1>...Loading</h1>;

  if (noResults && posts.length == 0) {
    videoJsx = <h1>No Results</h1>
  } else { 
    posts[index] ? videoJsx = <RedditVideo post={posts[index]} /> : "";
  }

  return (
    <div>
      <h1>Reddit Index</h1>
      {videoJsx}
      <button type="button" onClick={previousVideo}>Previous</button>
      <button type="button" onClick={nextVideo} disabled={noResults}>Next</button>
    </div>
  );
}

export default RedditIndex;