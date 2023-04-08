import React, { useState } from "react";

const PlaylistVideoDelete = (props) => {
  const [prompt, setPrompt] = useState(false);

  const deletePlaylistVideo = () => { 
    let pv = props.video;
    let form = {
      ['video_id']: pv['video_id'],
      ['playlist_id']: pv['playlist_id'],
      ['source']: pv['source'],
      ['parent_source_id']: pv['parent_source_id'],
    };

    fetch('/api/v1/playlist_videos/destroy_from_playlist', {
      method: "DELETE",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        "Content-Type": "application/json",
      },
      body: JSON.stringify(form),
    })
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => props.removeVideo(pv.id))
      .catch((error) => console.log(error.message));
  }

  let delJsx = <button type="button" onClick={() => setPrompt(true)}>Delete</button>;

  if (prompt) {
    delJsx = <div>
      <p>Are you sure you would like to delete this playlist?</p>
      <button onClick={deletePlaylistVideo} type="button">Delete</button>
      <button onClick={() => setPrompt(false)} type="button">Cancel</button>
    </div>
  }

  return (
    <div>
      {delJsx}
    </div>
  );
}

export default PlaylistVideoDelete;