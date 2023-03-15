import React, { useEffect, useState } from "react";

const PlaylistVideoMenu = (props) => { 
  const [playlists, setPlaylists] = useState([]);
  const [prompt, setPrompt] = useState(false);

  useEffect(() => { 
    //fetch(`/api/v1/playlist/mine?video_id=${props.videoId}`)
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

  const addToPlaylist = (index, playlistId) => { 
    let pvParams = {
      "source": props.source,
      "video_id": props.videoId,
      "playlist_id": playlistId,
      "parent_source_id": props.parentSourceId
    }

    fetch("/api/v1/playlist_videos/create", {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        "Content-Type": "application/json",
      },
      body: JSON.stringify(pvParams),
    })
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => {
        // If records creates successfully change "added" which changes checkbox
        let pls = [...playlists];
        pls[index]["added"] = !pls[index]["added"];
        setPlaylists([...playlists ]);
      })
      .catch((error) => console.log(error.message));
  }

  const onCheck = (playlistId) => { 
    let indexOfMatch = playlists.findIndex(pl => pl.id === playlistId);

    // If there is a match, determine function to run
    if (indexOfMatch != -1) {
      playlists[indexOfMatch]["added"] ?
        console.log("already added")
      :
        addToPlaylist(indexOfMatch, playlistId);
    }
  }

  let playlistJsx = playlists.map(pl =>
    <div key={pl.id}>
      <input
        type="checkbox"
        checked={pl.added}
        onClick={() => onCheck(pl.id)} 
      />
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