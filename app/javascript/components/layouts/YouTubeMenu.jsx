import React from "react";
import { Link } from "react-router-dom";

const YouTubeMenu = (props) => { 
  return (
    <div className="menu-div">
      <div className="menu-link-wrapper">
        <button className="close-nav-menu" type="button" onClick={() => props.hideMenu()}>
          <i className="fa-solid fa-xmark"></i>
        </button>

        <Link to="/youtube/index" onClick={() => props.hideMenu()} className="menu-link">
          <i className="fa-brands fa-youtube"></i> <span>YouTube Shorts</span>
        </Link>

        <Link to="/youtube/my_channels" onClick={() => props.hideMenu()} className="menu-link">
          <i className="fa-solid fa-face-grin"></i> <span>My Channels</span>
        </Link>

        <Link to="/youtube/channels" onClick={() => props.hideMenu()} className="menu-link">
          <i className="fa-solid fa-tv"></i> <span>Channels</span>
        </Link>
      </div>
    </div>
  );
}

export default YouTubeMenu;