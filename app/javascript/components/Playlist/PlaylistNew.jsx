import React, { useState } from "react";

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

  // useEffect(() => console.log(forms), [forms]);

  return (
    <div>
      <h1>Playlist New</h1>

      <div>
        <form onSubmit={onSubmit}>
          <label>
            <span>Playlist name: </span>
            <input
              type="text"
              name="name"
              required
              onChange={onChange}
            />
          </label>

          <label>
            Type:
            <select onChange={onChange} name="source">
              {["mix", "youtube","reddit"].map((option, index) =>
                <option key={index} >{option}</option>
              )}
            </select>
          </label>
          
          <label>
            {forms["private"] ? "Playlist is private" : "Playlist is public"}
            <input name="private" type="checkbox" checked={forms["private"]} onChange={onCheck} />
          </label>

          <button type="submit">Create</button>
        </form>
      </div>
    </div>
  );
}

export default PlaylistNew;