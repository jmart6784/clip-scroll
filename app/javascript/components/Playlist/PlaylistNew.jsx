import React, { useState } from "react";
import Form from "./Form";

const PlaylistNew = (props) => { 
  const [forms, setForms] = useState({
    name: "",
    source: "mix",
    private: false
  });
  const [options, setOptions] = useState(["mix", "youtube", "reddit"]);

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
    if (name == 'name' && value.length <= 50) {
      setForms({ ...forms, [name]: value });
    }
  };

  const onCheck = (event) => { 
    const { name, checked } = event.target;
    setForms({...forms, [name]: checked});
  }

  return (
    <div className="devise-form-parent-wrapper devise-100vh">
      <h2 className="devise-title">New Playlist</h2>
      <Form
        forms={forms}
        onChange={onChange}
        onCheck={onCheck}
        onSubmit={onSubmit} 
        options={options}
      />
    </div>
  );
}

export default PlaylistNew;