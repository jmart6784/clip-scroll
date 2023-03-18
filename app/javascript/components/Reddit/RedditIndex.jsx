import React, { useEffect, useState } from "react";

const RedditIndex = () => {
  const [posts, setPosts] = useState({});

  useEffect(() => more("initial"), []);

  const more = (type) => {
    let url = "https://www.reddit.com/r/interestingasfuck.json?limit=100&raw_json=1";

    if (type == "page") {
      url = `https://www.reddit.com/r/interestingasfuck.json?limit=100&raw_json=1&count=100&after=${posts['data']['after']}`;
    } 
    console.log("URL ", type, url);
    fetch(url)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setPosts(response))
      .catch(() => console.log("Error getting posts data"));
  }

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
      <button onClick={() => more("page")}>More</button>
    </div>
  );
}

export default RedditIndex;