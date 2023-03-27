import React, { useState } from "react";
import { Link } from "react-router-dom";

const SubredditItem = (props) => {
  const [subbed, setSubbed] = useState(false);
  let subreddit = props.subreddit;

  const handleForm = (e, subreddit) => { 
    fetch(`/api/v1/addedsubreddit/create`, {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        body: {subreddit}
      }
    })
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => console.log("RES: ", response))
      .catch(() => console.log("Error getting data"));
  }

  return (
    <div>
      <Link to={`/reddit/show/${subreddit.subreddit}`}>
        <p>{subreddit.subreddit}</p>
      </Link>
      <input type="checkbox" onChange={(e) => handleForm(e, subreddit.subreddit)} checked={subbed} />
    </div>  
  );
}

export default SubredditItem;