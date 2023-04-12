import React, { useState } from "react";
import { useHistory } from 'react-router-dom';

const PlaylistDelete = (props) => {
  const [prompt, setPrompt] = useState(false);
  let history = useHistory();

  const deletePlaylist = () => { 
    fetch(`/api/v1/playlist/destroy/${props.id}`, {
      method: "DELETE",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        "Content-Type": "application/json",
      },
    })
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => document.getElementById(`playlist-${props.id}`).style.display = "none")
      .catch((error) => console.log(error.message));
  }

  let delJsx = <button type="button" onClick={() => setPrompt(true)}>Delete</button>;
  
  if (prompt) {
    delJsx = <div>
      <p>Are you sure you would like to delete this playlist?</p>
      <button onClick={deletePlaylist} type="button">Delete</button>
      <button onClick={() => setPrompt(false)} type="button">Cancel</button>
    </div>
  } else { 
    delJsx = <button type="button" onClick={() => setPrompt(true)}>Delete</button>
  }

  return (
    <div>
      {delJsx}
    </div>
  );
};

export default PlaylistDelete;