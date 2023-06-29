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

  let delJsx = <button type="button" onClick={() => setPrompt(true)} className="playlist-delete">Remove</button>;

  if (prompt) {
    delJsx = (
      <div className="playlist-delete-wrapper">
        <p>Are you sure?</p>

        <div className="pl-delete-div">
          <button onClick={deletePlaylistVideo} type="button" className="pl-delete-btn">Remove</button>
          <button onClick={() => setPrompt(false)} type="button" className="pl-delete-cancel">Cancel</button>
        </div>
      </div>
    );
  }

  return (
    <div>
      {delJsx}
    </div>
  );
}

export default PlaylistVideoDelete;