import React from "react";
import { Link } from "react-router-dom";

const RedditMenu = (props) => { 
  return (
    <div>
      <Link to="/subreddit/index" onClick={() => props.hideMenu()}>Subreddit Index</Link>
      <Link to='/mysubreddits' onClick={() => props.hideMenu()}>My Subreddits</Link>
      <Link to="/reddit/index" onClick={() => props.hideMenu()}>RedditIndex</Link>
    </div>
  );
}

export default RedditMenu;