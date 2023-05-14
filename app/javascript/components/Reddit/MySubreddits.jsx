import React, { useState, useEffect } from "react";
import SubredditItem from "./SubredditItem";
import RedditLoading from "./RedditLoading";
import RedditNoResults from "./RedditNoResults";
import RedditNav from "./RedditNav";

const MySubreddits = () => { 
  const [subreddits, setSubreddits] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => { 
    fetch("/api/v1/addedsubreddit/mine")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setSubreddits(response), setLoading(false))
      .catch(() => console.log("Error getting subreddit data"));
  }, []);

  let subredditsJsx = <div>Loading...</div>;

  subredditsJsx = subreddits.map(subreddit => <SubredditItem key={subreddit.id} subreddit={subreddit} subbed={true} />);

  let mainJsx = <RedditLoading />;

  if (loading === false && subreddits.length > 0) {
    mainJsx = (
    <div className="yt-channels-wrapper">
      <RedditNav view="my subreddits" />
      <div className="subreddit-index">{subredditsJsx}</div>
    </div>
  );
  } else if (loading === false && subreddits.length === 0) { 
    mainJsx = <RedditNoResults />;
  }

  return mainJsx;
}

export default MySubreddits;