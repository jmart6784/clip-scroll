import React, { useEffect, useState, useContext } from "react";
import { Link } from "react-router-dom";
import PlaylistDelete from "./PlaylistDelete";
import GlobalContext from "../context/GlobalContext";

const PlaylistIndex = () => { 
  const [playlists, setPlaylists] = useState([]);
  const [loading, setLoading] = useState(true);
  const [global, setGlobal] = useContext(GlobalContext);

  useEffect(() => { 
    fetch("/api/v1/playlist/index")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setPlaylists(response), setLoading(false))
      .catch(() => console.log("Error getting data"));
  }, []);

  let playListJsx = playlists.map(playlist => { 
    let user = playlist.user;
    let ownerBtns = '';

    if (global.user) {
      if (user.id === global.user.id) {
        ownerBtns = (
          <div>
            <Link to={`/playlist/edit/${playlist.id}`}>Edit</Link>
            <PlaylistDelete id={playlist.id} location="index" />
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
  });

  let mainJsx = <h1>...Loading</h1>;

  if (loading === false && playlists.length > 0) {
    mainJsx = (
      <div>
        <Link to="/playlist/mine">My Playlists</Link>
        <h1>Playlist Index</h1>
        {playListJsx}
      </div>
    );
  } else if (loading === false && playlists.length === 0) { 
    mainJsx = (
      <div>No Results</div>
    );
  }

  return mainJsx;
}

export default PlaylistIndex;