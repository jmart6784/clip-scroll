import React from "react";
import { Link } from "react-router-dom";

const SubredditItem = (props) => {
  let subreddit = props.subreddit;

  return (
    <div>
      <Link to={`/reddit/show/${subreddit.subreddit}`}>
        <p>{subreddit.subreddit}</p>
      </Link>
    </div>  
  );
}

export default SubredditItem;