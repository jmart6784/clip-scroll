import React, { useState, useEffect } from "react";
import SubredditItem from "./SubredditItem";

const MySubreddits = () => { 
  const [subreddits, setSubreddits] = useState([]);

  useEffect(() => { 
    fetch("/api/v1/addedsubreddit/mine")
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

  subredditsJsx = subreddits.map(subreddit => <SubredditItem key={subreddit.id} subreddit={subreddit} subbed={true} />);

  return (
    <div>
      <h1>My Subreddits</h1>
      {subredditsJsx}
    </div>
  );
}

export default MySubreddits;