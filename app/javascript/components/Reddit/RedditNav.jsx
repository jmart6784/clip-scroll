import React from "react";
import { Link } from "react-router-dom";

const RedditNav = (props) => { 
  let subreddits = <div><i className="fa-brands fa-reddit-alien"></i> Subreddits</div>;
  let search = <div><i className="fa-solid fa-magnifying-glass"></i> Search</div>;
  let mySubreddits = <div><i className="fa-solid fa-face-grin"></i> My Subreddits</div>;

  if (props.view == 'subreddits') {
    search = <Link to='/reddit/search'><i className="fa-solid fa-magnifying-glass"></i> Search</Link>;
    mySubreddits = <Link to='/mysubreddits'><i className="fa-solid fa-face-grin"></i> My Subreddits</Link>;
  } else if (props.view == 'search') {
    subreddits = <Link to='/subreddit/index'><i className="fa-brands fa-reddit-alien"></i> Subreddit</Link>;
    mySubreddits = <Link to='/mysubreddits'><i className="fa-solid fa-face-grin"></i> My Subreddits</Link>;
  } else if (props.view == 'my subreddits') { 
    subreddits = <Link to='/subreddit/index'><i className="fa-brands fa-reddit-alien"></i> Subreddit</Link>;
    search = <Link to='/reddit/search'><i className="fa-solid fa-magnifying-glass"></i> Search</Link>;
  }

  return (
    <div className="channels-nav-wrapper">
      {subreddits}
      {search}
      {mySubreddits}
    </div>
  );
}

export default RedditNav;