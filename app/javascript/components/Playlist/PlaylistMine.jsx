import React, { useEffect, useState, useContext } from "react";
import { Link } from "react-router-dom";
import GlobalContext from "../context/GlobalContext";
import PlaylistCard from "./PlaylistCard";

const PlaylistMine = () => { 
  const [playlists, setPlaylists] = useState([]);
  const [loading, setLoading] = useState(true);
  const [global, setGlobal] = useContext(GlobalContext);

  useEffect(() => { 
    fetch("/api/v1/playlist/mine")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setPlaylists(response), setLoading(false))
      .catch(() => console.log("Error getting data"));
  }, []);

  let playListJsx = playlists.map(playlist => <PlaylistCard key={playlist.id} playlist={playlist} user={global.user} />);

  let mainJsx = <h1>...Loading</h1>;

  if (loading === false && playlists.length > 0) {
    mainJsx = (
      <div>
        <Link to="/playlist/index">Playlist Index</Link>
        <h1>Playlist Mine</h1>
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

export default PlaylistMine;