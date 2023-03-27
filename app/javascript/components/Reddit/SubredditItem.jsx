import React, { useState } from "react";
import { Link } from "react-router-dom";

const SubredditItem = (props) => {
  const [subbed, setSubbed] = useState(props.subbed);
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
      .then((response) => response.message ? setSubbed(false) : setSubbed(true))
      .catch(() => console.log("Error getting data"));
  }

  return (
    <div>
      <Link to={`/reddit/show/${subreddit.subreddit}`}>
        <p>{subreddit.subreddit}</p>
      </Link>
      <input type="checkbox" onChange={() => handleForm(subreddit.subreddit)} checked={subbed} />
    </div>  
  );
}

export default SubredditItem;