import React from "react";
import { Link } from "react-router-dom";

const ExploreNav = (props) => { 
  let myPlaylists = <div><i className="fa-solid fa-face-grin"></i> My Playlists</div>;
  let playlists = <div><i className="fa-solid fa-circle-play"></i> Playlists</div>;
  let community = <div><i className="fa-solid fa-users"></i> Community</div>;

  if (props.view == 'playlist-mine') {
    playlists = (
      <Link to="/playlist/index">
        <i className="fa-solid fa-circle-play"></i> <span>Playlists</span>
      </Link>
    );
    community = (
      <Link to="/users/index">
        <i className="fa-solid fa-users"></i> <span>Community</span>
      </Link>
    );
  } else if (props.view == 'playlists') { 
    myPlaylists = (
      <Link to="/playlist/mine">
        <i className="fa-solid fa-face-grin"></i> <span>My Playlists</span>
      </Link>
    );
    playlists = (
      <Link to="/playlist/index">
        <i className="fa-solid fa-circle-play"></i> <span>Playlists</span>
      </Link>
    );
  } else if (props.view == 'community') {
    myPlaylists = (
      <Link to="/playlist/mine">
        <i className="fa-solid fa-face-grin"></i> <span>My Playlists</span>
      </Link>
    );
    playlists = (
      <Link to="/playlist/index">
        <i className="fa-solid fa-circle-play"></i> <span>Playlists</span>
      </Link>
    );
  }

  return (
    <div className="channels-nav-wrapper">
      {myPlaylists}
      {playlists}
      {community}
    </div>
  );
}

export default ExploreNav;