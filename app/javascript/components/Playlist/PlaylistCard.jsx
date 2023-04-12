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
          <PlaylistDelete id={playlist.id} location={props.location} />
        </div>
      );
    }
  }

  return (
    <div id={`playlist-${playlist.id}`} key={playlist.id}>
      <strong><Link to={`/playlist/show/${playlist.id}`}>{playlist.name}</Link></strong>

      {ownerBtns}
      
      <Link to={`/users/show/${user.id}`}>
        <img src={user.avatar.url} height="50" width="50" alt="user avatar" />
        <span>{user.username}</span>
      </Link>
    </div>
  );
}

export default PlaylistCard;