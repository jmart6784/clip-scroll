import React, { useEffect, useState } from "react";
import RedditVideo from "./RedditVideo";
import shuffle from "../../helpers/shuffle";
import PlaylistVideoMenu from "../Playlist_video/PlaylistVideoMenu";

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
        getVideoData(shuffledArray, apiHistory);
      })
      .catch(() => console.log("Error getting subreddit data"));
  }, []);

  const getVideoData = (subreddits, apiHist) => { 
    if (subreddits.length > 0) {
      // Randomized subreddits user is subbed to will have an API request for three.
      let previousEntry = subreddits[apiHist.requestIndex - 1];
      let currentEntry = subreddits[apiHist.requestIndex];
      let nextEntry = subreddits[apiHist.requestIndex + 1];
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
              // Shuffle data order
              shuffle([...posts, ...tempAry]).forEach(vid => videos.push(vid));
              
              let hist = [];

              // Remove duplicates off of API history
              if (apiHist.watched.length > 0) { 
                hist = apiHist.watched.filter((value, index, self) =>
                  index === self.findIndex((t) => (
                    t['data']['id'] === value['data']['id']
                  ))
                )
              }

              // Append watch history so state is synched
              videos = [...hist, ...videos];

              // Remove duplicates videos
              videos = videos.filter((value, index, self) =>
                index === self.findIndex((t) => (
                  t['data']['id'] === value['data']['id']
                ))
              )
              setPosts(videos);
            } else { 
              setNoResults(true);
            }
          })
          .catch(() => console.log("Error getting posts data"));
        }
      }
    }
  }

  const previousVideo = () => index > 0 ? setIndex(index - 1) : "";

  const nextVideo = () => {
    if (index != posts.length - 1) { 
      // Refresh after posts index hits 5, The request index will increase by 3 to get more subreddits. Add current video to watch history
      if (index + 1 == apiHistory.refreshAtIndex || index == posts.length - 1) {
        let changes = {
          watched: [...apiHistory.watched, posts[index]],
          refreshAtIndex: apiHistory.refreshAtIndex + 5,
          requestIndex: apiHistory.requestIndex + 3
        };
        // If there is another video in the array add it to the watched array.
        if (posts[index  useEffect(() => console.log(posts[index] ? posts[index] : "NONE"), [posts]); + 1] != undefined) {
          changes = {
            ...changes,
            watched: [...apiHistory.watched, posts[index], posts[index + 1]]
          }
        }

        setApiHistory(changes);
        getVideoData(subreddits, changes);
      } else { 
        // Add current video to watched history
        if (posts[index] != undefined) {
          setApiHistory({...apiHistory, watched: [...apiHistory.watched, posts[index]]});
        }
      }
      // Increment index to trigger next video
      setIndex(index + 1);
    }
  };

  let videoJsx = <h1>...Loading</h1>;

  if (noResults && posts.length == 0) {
    videoJsx = <h1>No Results</h1>
  } else { 
    posts[index] ? videoJsx = <RedditVideo post={posts[index]} /> : "";
  }

  return (
    <div>
      <PlaylistVideoMenu
        videoId={posts[index] ? posts[index]['data']['id'] : ""}
        parentSourceId={posts[index] ? posts[index]['data']['subreddit'] : ""}
        source="reddit"
      />
      <h1>Reddit Index: {index}</h1>
      {videoJsx}
      <button type="button" onClick={previousVideo}>Previous</button>
      <button type="button" onClick={nextVideo} disabled={noResults}>Next</button>
    </div>
  );
}

export default RedditIndex;