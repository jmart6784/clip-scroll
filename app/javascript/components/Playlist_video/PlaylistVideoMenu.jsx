import React, { useEffect, useState } from "react";

const PlaylistVideoMenu = (props) => { 
  const [playlists, setPlaylists] = useState([]);
  const [prompt, setPrompt] = useState(false);

  useEffect(() => { 
    fetch(`/api/v1/playlist/mine?video_id=XYAe15w39LQ`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setPlaylists(response))
      .catch(() => console.log("Error getting playlist data"));
  }, [props]);

  // useEffect(() => console.log(playlists), [playlists]);

  const onCheck = (videoId, playlistId) => { 
    let pls = playlists
    let indexOfMatch = pls.findIndex(pl => pl.id === playlistId);

    // If there is a match by playlist ID toggle checkbox and added value.
    if (indexOfMatch != -1) {
      pls[indexOfMatch]["added"] = !pls[indexOfMatch]["added"];
    } else { 
      console.log("Playlist not found");
    }

    setPlaylists([...pls ]);
    // console.log(videoId, playlistId);
  }

  let playlistJsx = playlists.map(pl =>
    <div key={pl.id}>
      <input type="checkbox" checked={pl.added} onClick={() => onCheck(props.videoId, pl.id)} />
      <p>{pl.name}</p>
      <p>Private {pl.private.toString()}</p>
      <i>source: {pl.source}</i>
    </div>
  );

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