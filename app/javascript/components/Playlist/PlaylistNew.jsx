import React, { useEffect, useState } from "react";

const PlaylistNew = () => { 
  const [forms, setForms] = useState({
    name: "",
    source: "",
    private: false
  });

  const onSubmit = () => { 

  }

  const onChange = (event) => {
    const { name, value } = event.target;
    setForms({ ...forms, [name]: value });
  };

  const onOptionChangeHandler = (event) => {
    const { name, value } = event.target;
    setForms({ ...forms, [name]: value });
  }

  useEffect(() => console.log(forms), [forms]);

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

          <select onChange={onOptionChangeHandler}>
            <option name="source">Please choose </option>
            {["youtube","reddit", "mix"].map((option, index) => {
                return <option key={index} >
                    {option}
                </option>
            })}
          </select>
        </form>
      </div>
    </div>
  );
}

export default PlaylistNew;