import React from "react";
import { Link } from "react-router-dom";

const ExploreNav = (props) => { 
  let myPlaylists = <div><i className="fa-solid fa-face-grin"></i> My Playlists</div>;
  let playlists = <div><i className="fa-solid fa-circle-play"></i> Playlists</div>;
  let community = <div><i className="fa-solid fa-users"></i> Community</div>;

  return (
    <div className="channels-nav-wrapper">
      {myPlaylists}
      {playlists}
      {community}
    </div>
  );
}

export default ExploreNav;