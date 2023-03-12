import React from "react";

const PlaylistDelete = (props) => {
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
      .then((response) => props.history.push(`/playlist/index`))
      .catch((error) => console.log(error.message));
  }

  return (
    <div>
      <button onClick={deletePlaylist} type="button">Delete</button>
    </div>
  );
};

export default PlaylistDelete;