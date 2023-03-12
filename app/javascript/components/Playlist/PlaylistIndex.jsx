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

    return (
      <div key={playlist.id}>
        <strong><Link to={`/playlist/show/${playlist.id}`}>{playlist.name}</Link></strong>
        <Link to={`/playlist/edit/${playlist.id}`}>Edit</Link>
        <PlaylistDelete id={playlist.id} />
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