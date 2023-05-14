import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import SubredditItem from "./SubredditItem";
import RedditLoading from "./RedditLoading";
import RedditNoResults from "./RedditNoResults";

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
    <div>
      <Link to='/subreddit/index'>Subreddit Index</Link>
      <h1>My Subreddits</h1>
      {subredditsJsx}
    </div>
  );
  } else if (loading === false && subreddits.length === 0) { 
    mainJsx = <RedditNoResults />;
  }

  return mainJsx;
}

export default MySubreddits;