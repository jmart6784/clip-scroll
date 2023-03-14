import React, { useEffect, useState } from "react";

const PlaylistVideoMenu = () => { 
  const [playlists, setPlaylists] = useState([]);
  const [prompt, setPrompt] = useState(false);

  useEffect(() => { 
    fetch("/api/v1/playlist/mine")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setPlaylists(response))
      .catch(() => console.log("Error getting playlist data"));
  }, []);

  useEffect(() => console.log(playlists), [playlists]);

  let playlistJsx = playlists.map(pl => { 

    return (
      <div key={pl.id}>
        <p>{pl.name}</p>
        <p>Private {pl.private.toString()}</p>
        <i>source: {pl.source}</i>
      </div>
    );
  });

  let menuJsx = <button type="button" onClick={() => setPrompt(true)}>Prompt</button>;

  if (prompt) {
    menuJsx = (
      <div>
        <button type="button" onClick={() => setPrompt(false)}>Close</button>
        {playlistJsx}
      </div>
    );
  }

  return menuJsx;
}

export default PlaylistVideoMenu;