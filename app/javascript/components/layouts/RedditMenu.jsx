import React from "react";
import { Link } from "react-router-dom";

const RedditMenu = (props) => { 
  return (
    <div className="menu-div">
      <div className="menu-link-wrapper">
        <button className="close-nav-menu" type="button" onClick={() => props.hideMenu()}>
          <i className="fa-sharp fa-solid fa-xmark"></i>
        </button>

        <Link to="/reddit/index" onClick={() => props.hideMenu()} className="menu-link">
          <i className="fa-brands fa-reddit-alien"></i> <span>Reddit Videos</span>
        </Link>

        <Link to='/mysubreddits' onClick={() => props.hideMenu()} className="menu-link">
          <i className="fa-solid fa-face-grin"></i> <span>My Subreddits</span>
        </Link>

        <Link to="/subreddit/index" onClick={() => props.hideMenu()} className="menu-link">
          <i className="fa-brands fa-reddit"></i> <span>Subreddits</span>
        </Link>
      </div>
    </div>
  );
}

export default RedditMenu;