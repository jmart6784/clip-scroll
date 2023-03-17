import React, { useEffect, useState } from "react";

const RedditIndex = () => {
  const [posts, setPosts] = useState({});

  useEffect(() => { 
    fetch("https://www.reddit.com/r/interestingasfuck.json")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setPosts(response))
      .catch(() => console.log("Error getting posts data"));
  }, []);

  useEffect(() => console.log(posts), [posts]);

  let videosJsx = <h1>...Loading</h1>;

  if (posts['data']) {
    videosJsx = posts['data']['children'].map(post => { 
      if (post['data']['secure_media']) {
        let postId = post['data']['id']

        return (
          <div key={postId}>
            <p>{postId}</p>
            <video src={post['data']['secure_media']['reddit_video']['fallback_url']} width="300" height="500" controls></video>
          </div>
        ); 
      }
    });
  }

  return (
    <div>
      <h1>Reddit Index</h1>
      {videosJsx}
    </div>
  );
}

export default RedditIndex;