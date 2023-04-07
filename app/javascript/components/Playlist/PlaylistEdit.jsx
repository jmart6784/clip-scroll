import React, { useEffect, useState } from "react";
import Form from "./Form";

const PlaylistEdit = (props) => { 
  const [forms, setForms] = useState({
    name: "",
    source: "mix",
    private: false
  });
  const [options, setOptions] = useState(["mix", "youtube", "reddit"]);

  useEffect(() => { 
    fetch(`/api/v1/playlist/show/${props.match.params.id}`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => {
        let optionsAry = [response['source'], ...options];
        optionsAry = [...new Set(optionsAry)];
        setOptions(optionsAry);
        setForms(response);
      })
      .catch((error) => console.log(error.message));
  }, []);

  const onSubmit = () => { 
    event.preventDefault();

    fetch(`/api/v1/playlist/update/${props.match.params.id}`, {
      method: "PUT",
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
      <h1>Playlist Edit</h1>
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

export default PlaylistEdit;