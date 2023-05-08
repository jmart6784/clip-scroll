import React from "react";
import { Link } from "react-router-dom";
import PlaylistDelete from "./PlaylistDelete";


const PlaylistCard = (props) => { 
  let user = props.playlist.user;
  let playlist = props.playlist;
  let ownerBtns = '';

  if (props.user) {
    if (user.id === props.user.id) {
      ownerBtns = (
        <div>
          <Link to={`/playlist/edit/${playlist.id}`}>Edit</Link>
          <PlaylistDelete id={playlist.id} />
        </div>
      );
    }
  }

  return (
    <div id={`playlist-${playlist.id}`} key={playlist.id} className="playlist-card">
      <Link to={`/users/show/${user.id}`}>
        <div style={{ backgroundImage: `url(${user.avatar.url})` }} className="background-image playlist-user-avatar" alt="user avatar"></div>

        <span>{user.username}</span>
      </Link>
      
      <strong><Link to={`/playlist/show/${playlist.id}`}>{playlist.name}</Link></strong>

      {ownerBtns}
    </div>
  );
}

export default PlaylistCard;