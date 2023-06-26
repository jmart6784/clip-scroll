import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

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
    let sourceJsx = '';

    if (pl.source == 'reddit') {
      sourceJsx = <i className="fa-brands fa-reddit"></i>;
    } else if (pl.source == 'youtube') {
      sourceJsx = <i className="fa-brands fa-youtube"></i>;
    } else { 
      sourceJsx = (
        <>
          <i className="fa-brands fa-reddit"></i>
          <i className="fa-brands fa-youtube"></i>
        </>
      );
    }

    if (pl.source == props.source || pl.source == 'mix') { 
      return (
        <div key={pl.id} className="playlist-menu-item">
          <input
            type="checkbox"
            checked={pl.added}
            onChange={() => onCheck(pl.id)} 
            className="pl-menu-checkbox"
          />
          <p className="pl-item-name">{pl.name.slice(0, 20)}...</p>

          {
            pl.private ? (
              <i className="fa-solid fa-lock"></i>
            ) : (
              <i className="fa-solid fa-earth-americas"></i>
            )
          }
          
          {sourceJsx}
        </div>
      );
    }
  });

  let menuJsx = (
    <button
      type="button"
      className="show-comments-btn yt-stat-div"
      onClick={() => {
        setPrompt(true);
        props.togglePlaylists();
        props.toggleDrag();
      }}
    >
      <i className="fa-solid fa-square-plus"></i>
      <span id="playlist-video-text">Playlist</span>
    </button>
  );

  if (prompt) {
    let contentJsx = <h1>...Loading</h1>;

    if (loading === false && playlists.length > 0) {
      contentJsx = playlistJsx;
    } else if (loading === false && playlists.length === 0) { 
      contentJsx = (
        <div className="no-playlist-menu">
          <p>You have no playlists!</p>
          <p>
            Create one <Link to="/playlist/new">here.</Link>
          </p>
        </div>
      );
    }

    menuJsx = (
      <div className="playlist-menu-wrapper">
        <button type="button" className="hide-comments-btn" onClick={() => {
          setPrompt(false);
          props.togglePlaylists();
          props.toggleDrag();
        }}>
          <i className="fa-sharp fa-solid fa-xmark"></i>
        </button>
        <p className="comments-title playlists-header-title">
          <p style={{textDecoration: "underline"}}>Your playlists</p>
          <p>
            Public/Private: <i className="fa-solid fa-earth-americas"></i>/<i className="fa-solid fa-lock"></i>
          </p>
          <p>
            Playlist compatability: <i className="fa-brands fa-reddit"></i> <i className="fa-brands fa-youtube"></i>
          </p>
        </p>
        {contentJsx}
      </div>
    );
  }

  return menuJsx;
}

export default PlaylistVideoMenu;