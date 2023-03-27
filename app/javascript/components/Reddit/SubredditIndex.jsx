import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

const SubredditIndex = () => { 
  const [subreddits, setSubreddits] = useState([]);

  useEffect(() => { 
    fetch("/api/v1/subreddit/index")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setSubreddits(response))
      .catch(() => console.log("Error getting subreddit data"));
  }, []);

  let subredditsJsx = <div>Loading...</div>;

  subredditsJsx = subreddits.map(subreddit => 
    <div key={subreddit.id}>
      <Link to={`/reddit/show/${subreddit.subreddit}`}>
        <p>{subreddit.subreddit}</p>
      </Link>
    </div>  
  );

  return (
    <div>
      <h1>Subreddit Index</h1>
      {subredditsJsx}
    </div>
  )
}

export default SubredditIndex;