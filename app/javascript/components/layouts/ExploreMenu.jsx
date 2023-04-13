import React from "react";
import { Link } from "react-router-dom";

const ExploreMenu = (props) => { 
  return (
    <div className="menu-div">
      <div className="menu-link-wrapper">
        <button className="close-nav-menu" type="button">
          <i className="fa-sharp fa-solid fa-xmark"></i>
        </button>

        <Link to="/playlist/index" onClick={() => props.hideMenu()} className="menu-link">
          Playlist Index
        </Link>

        <Link to="/playlist/mine" onClick={() => props.hideMenu()} className="menu-link">
          My Playlists
        </Link>

        <Link to="/users/index" onClick={() => props.hideMenu()} className="menu-link">
          User Index
        </Link>
      </div>
    </div>
  );
}

export default ExploreMenu;