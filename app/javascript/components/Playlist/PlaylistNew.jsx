import React, { useEffect, useState } from "react";
import Form from "./Form";

const PlaylistNew = (props) => { 
  const [forms, setForms] = useState({
    name: "",
    source: "mix",
    private: false
  });

  const onSubmit = () => { 
    event.preventDefault();

    fetch("/api/v1/playlist/create", {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        "Content-Type": "application/json",
      },
      body: JSON.stringify(forms),
    })
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => props.history.push(`/playlist/show/${response.id}`))
      .catch((error) => console.log(error.message));
  }

  const onChange = (event) => {
    const { name, value } = event.target;
    setForms({ ...forms, [name]: value });
  };

  const onCheck = (event) => { 
    const { name, checked } = event.target;
    setForms({...forms, [name]: checked});
  }

  return (
    <div>
      <h1>Playlist New</h1>
      <Form forms={forms} onChange={onChange} onCheck={onCheck} onSubmit={onSubmit} />
    </div>
  );
}

export default PlaylistNew;