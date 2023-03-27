import React, { useEffect, useState } from "react";
import SubredditItem from "./SubredditItem";

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

  subredditsJsx = subreddits.map(subreddit => <SubredditItem key={subreddit.id} subreddit={subreddit} />);

  return (
    <div>
      <h1>Subreddit Index</h1>
      {subredditsJsx}
    </div>
  )
}

export default SubredditIndex;