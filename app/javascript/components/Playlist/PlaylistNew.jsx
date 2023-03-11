import React, { useEffect, useState } from "react";

const PlaylistNew = () => { 
  const [forms, setForms] = useState({
    name: "",
    source: "mix",
    private: false
  });

  const onSubmit = () => { 

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
          
        </form>
      </div>
    </div>
  );
}

export default PlaylistNew;