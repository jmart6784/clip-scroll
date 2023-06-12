import React from "react";
import { Link } from "react-router-dom";

const ExploreMenu = (props) => { 
  return (
    <div className="menu-div">
      <div className="menu-link-wrapper">
        <button className="close-nav-menu" type="button" onClick={() => props.hideMenu()}>
          <i className="fa-sharp fa-solid fa-xmark"></i>
        </button>

        <Link to="/playlist/mine" onClick={() => props.hideMenu()} className="menu-link">
          <i className="fa-solid fa-face-grin"></i> <span>My Playlists</span>
        </Link>
        
        <Link to="/playlist/index" onClick={() => props.hideMenu()} className="menu-link">
          <i className="fa-solid fa-circle-play"></i> <span>Playlists</span>
        </Link>

        <Link to="/users/index" onClick={() => props.hideMenu()} className="menu-link">
          <i className="fa-solid fa-users"></i> <span>Community</span>
        </Link>

        <Link to="/about" onClick={() => props.hideMenu()} className="menu-link">
          <i className="fa-solid fa-circle-info"></i> <span>About</span>
        </Link>
      </div>
    </div>
  );
}

export default ExploreMenu;