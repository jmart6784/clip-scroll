import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

const SubredditItem = (props) => {
  const [subbed, setSubbed] = useState(props.subbed);
  const [count, setCount] = useState(0);
  let subreddit = props.subreddit;

  const handleForm = (subreddit) => { 
    fetch(`/api/v1/addedsubreddit/create`, {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({subreddit})
    })
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      // Set subbed value depending on backend response
      .then((response) => {
        setCount(1);
        response.message ? setSubbed(false) : setSubbed(true)
      })
      .catch(() => console.log("Error getting data"));
  }

  return (
    <div className="subreddit-item-wrapper">
      {/* switch state depending on view and if API request has occured (count) */}
      <input type="checkbox" className="subreddit-checkbox" onChange={() => handleForm(subreddit.subreddit)} checked={props.view == 'index' && count == 0 ? props.subbed : subbed} />

      <Link to={`/reddit/show/${subreddit.subreddit}`}>{subreddit.subreddit}</Link>
    </div>  
  );
}

export default SubredditItem;