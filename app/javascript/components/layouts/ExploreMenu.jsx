import React from "react";
import { Link } from "react-router-dom";

const ExploreMenu = () => { 
  return (
    <div>
      <Link to="/playlist/index">Playlist Index</Link>
      <Link to="/playlist/mine">My Playlists</Link>
      <Link to="/users/index">User Index</Link>
    </div>
  );
}

export default ExploreMenu;