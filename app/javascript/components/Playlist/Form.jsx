import React from "react";


const Form = (props) => {
  return (
    <form onSubmit={props.onSubmit} className="devise-form">
      <div class="field">
        <label>Playlist name</label>

        <input
          type="text"
          name="name"
          value={props.forms["name"]}
          required
          onChange={props.onChange}
        />
        <div>{`${props.forms['name'].length}/50`}</div>
      </div>

      <div className="field">
        <label>Type</label>

        <select onChange={props.onChange} name="source">
          {props.options.map((option, index) =>
            <option key={index} >{option}</option>
          )}
        </select>
      </div>

      <div>
        <input name="private" type="checkbox" checked={props.forms["private"]} onChange={props.onCheck} />
        <label> {props.forms["private"] ? "Playlist is private" : "Playlist is public"}</label>
      </div>

      <button type="submit" className="devise-submit">Submit</button>
    </form>
  );
}

export default Form;