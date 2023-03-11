import React, { useEffect, useState } from "react";

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

  useEffect(() => console.log(playlists), [playlists]);

  let playListJsx = playlists.map(playlist => { 

    return (
      <div key={playlist.id}>
        <strong>{playlist.name}</strong>
        <p>{playlist.private}</p>
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