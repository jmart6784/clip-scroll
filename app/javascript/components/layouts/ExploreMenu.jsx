import React from "react";
import { Link } from "react-router-dom";

const ExploreMenu = (props) => { 
  return (
    <div>
      <Link to="/playlist/index" onClick={() => props.hideMenu()}>Playlist Index</Link>
      <Link to="/playlist/mine" onClick={() => props.hideMenu()}>My Playlists</Link>
      <Link to="/users/index" onClick={() => props.hideMenu()}>User Index</Link>
    </div>
  );
}

export default ExploreMenu;