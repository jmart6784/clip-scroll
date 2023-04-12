import React from "react";
import { Link } from "react-router-dom";

const RedditMenu = () => { 
  return (
    <div>
      <Link to="/subreddit/index">Subreddit Index</Link>
      <Link to='/mysubreddits'>My Subreddits</Link>
      <Link to="/reddit/index">RedditIndex</Link>
    </div>
  );
}

export default RedditMenu;