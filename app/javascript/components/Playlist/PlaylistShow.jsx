import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

const PlaylistShow = (props) => { 
  const [playlist, setPlaylist] = useState({
    id: 0,
    name: '',
    source: 'youtube',
    private: false,
    user_id: 0,
    created_at: '',
    updated_at: ''
  });

  useEffect(() => { 
    fetch(`/api/v1/playlist/show/${props.match.params.id}`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setPlaylist(response))
      .catch(() => console.log("Error getting data"));
  }, []);

  return (
    <div>
      <h1>Playlist Show</h1>
      <p>name: {playlist.name}</p>
      <p>Private: {playlist.private.toString()}</p>
      <p>Source: {playlist.source}</p>
      <Link to={`/playlist/edit/${playlist.id}`}>Edit</Link>
    </div>
  );
}

export default PlaylistShow;