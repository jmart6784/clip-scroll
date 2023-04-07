import React from "react";


const Form = (props) => {
  return (
    <div>
      <form onSubmit={props.onSubmit}>
        <label>
          <span>Playlist name: </span>
          <input
            type="text"
            name="name"
            value={props.forms["name"]}
            required
            onChange={props.onChange}
          />
        </label>

        <label>
          Type:
          <select onChange={props.onChange} name="source">
            {props.options.map((option, index) =>
              <option key={index} >{option}</option>
            )}
          </select>
        </label>
        
        <label>
          {props.forms["private"] ? "Playlist is private" : "Playlist is public"}
          <input name="private" type="checkbox" checked={props.forms["private"]} onChange={props.onCheck} />
        </label>

        <button type="submit">Submit</button>
      </form>
    </div>
  );
}

export default Form;