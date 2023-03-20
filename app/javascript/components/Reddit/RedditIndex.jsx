import React, { useEffect, useState } from "react";
import RedditVideo from "./RedditVideo";

const RedditIndex = () => {
  const [posts, setPosts] = useState({});
  const [index, setIndex] = useState(0);

  useEffect(() => more("initial"), []);

  const more = (type) => {
    let subReddit = 'interestingasfuck';
    let url = `https://www.reddit.com/r/${subReddit}.json?limit=100&raw_json=1`;

    if (type == "page") {
      url = `https://www.reddit.com/r/${subReddit}.json?limit=100&raw_json=1&count=100&after=${posts['data']['after']}`;
    } 
    fetch(url)
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
            let height = post['data']['media']['reddit_video']['height']; 
            let width = post['data']['media']['reddit_video']['width']; 
            // Include vertical videos only
            height > width ? tempAry.push(post) : "";
          }
        }
        res['data']['children'] = tempAry;

        if (type == "page") {
          // Cache past posts and save the new ones
          setPosts({
            ...res,
            ['data']: {
              ...res['data'],
              ['children']: [
                ...posts['data']['children'],
                ...res['data']['children']
              ]
            }
          });
          // If more posts exist then increase index by 1 on paginated response
          tempAry.length > 0 ? setIndex(index + 1) : "";
        } else { setPosts(res) }
      })
      .catch(() => console.log("Error getting posts data"));
  }

  const previousVideo = () => index > 0 ? setIndex(index - 1) : "";
  const nextVideo = () => index != posts['data']['children'].length - 1 ? setIndex(index + 1) : more("page");

  let videoJsx = <h1>...Loading</h1>;

  posts['data'] ? videoJsx = <RedditVideo post={posts['data']['children'][index]} /> : "";

  return (
    <div>
      <h1>Reddit Index</h1>
      {videoJsx}
      <button onClick={() => more("page")}>More</button>
      <button type="button" onClick={previousVideo}>Previous</button>
      <button type="button" onClick={nextVideo}>Next</button>
    </div>
  );
}

export default RedditIndex;