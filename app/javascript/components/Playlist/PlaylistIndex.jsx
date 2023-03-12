import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import PlaylistDelete from "./PlaylistDelete";

const PlaylistIndex = () => { 
  const [playlists, setPlaylists] = useState([]);

  useEffect(() => { 
    fetch("/api/v1/playlist/index")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setPlaylists(response))
      .catch(() => console.log("Error getting data"));
  }, []);

  let playListJsx = playlists.map(playlist => { 
    let user = playlist.user;
    return (
      <div id={`playlist-${playlist.id}`} key={playlist.id}>
        <strong><Link to={`/playlist/show/${playlist.id}`}>{playlist.name}</Link></strong>
        <Link to={`/playlist/edit/${playlist.id}`}>Edit</Link>
        <PlaylistDelete id={playlist.id} location="index" />
        <Link to={`/users/show/${user.id}`}>
          <img src={user.avatar.url} height="50" width="50" alt="user avatar" />
          <span>{user.username}</span>
        </Link>
      </div>
    );
  });

  return (
    <div>
      <h1>Playlist Index</h1>
      {playListJsx}
    </div>
  );
}

export default PlaylistIndex;