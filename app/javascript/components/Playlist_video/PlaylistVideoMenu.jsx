import React, { useEffect, useState } from "react";

const PlaylistVideoMenu = (props) => { 
  const [playlists, setPlaylists] = useState([]);
  const [prompt, setPrompt] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => { 
    fetch(`/api/v1/playlist/mine?video_id=${props.videoId}`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setPlaylists(response), setLoading(false))
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

  const removeFromPlaylist = (index, playlistId) => { 
    let pvParams = {
      "source": props.source,
      "video_id": props.videoId,
      "playlist_id": playlistId,
      "parent_source_id": props.parentSourceId
    }

    fetch(`/api/v1/playlist_videos/destroy_from_playlist`, {
      method: "DELETE",
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
        removeFromPlaylist(indexOfMatch, playlistId)
      :
        addToPlaylist(indexOfMatch, playlistId);
    }
  }

  let playlistJsx = playlists.map(pl => {
    if (pl.source == props.source || pl.source == 'mix') { 
      return (
        <div key={pl.id}>
          <input
            type="checkbox"
            checked={pl.added}
            onChange={() => onCheck(pl.id)} 
          />
          <p>{pl.name}</p>
          <p>Private {pl.private.toString()}</p>
          <i>source: {pl.source}</i>
        </div>
      );
    }
  });

  let menuJsx = (
    <button type="button" className="show-comments-btn yt-stat-div" onClick={() => setPrompt(true)}>
      <i className="fa-solid fa-square-plus"></i>
      <span>Playlist</span>
    </button>
  );

  if (prompt) {
    let contentJsx = <h1>...Loading</h1>;

    if (loading === false && playlists.length > 0) {
      contentJsx = (
        <div>
          <h1>Playlist Index</h1>
          {playlistJsx}
        </div>
      );
    } else if (loading === false && playlists.length === 0) { 
      contentJsx = (
        <div>No Playlists created</div>
      );
    }

    menuJsx = (
      <div>
        <button type="button" onClick={() => setPrompt(false)}>Close</button>
        {contentJsx}
      </div>
    );
  }

  return menuJsx;
}

export default PlaylistVideoMenu;