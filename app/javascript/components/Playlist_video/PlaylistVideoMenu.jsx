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

  let menuJsx = <button type="button" onClick={() => setPrompt(true)}>Prompt</button>;

  if (prompt) {
    menuJsx = (
      <div>
        <button type="button" onClick={() => setPrompt(false)}>Close</button>
      </div>
    );
  }

  return menuJsx;
}

export default PlaylistVideoMenu;