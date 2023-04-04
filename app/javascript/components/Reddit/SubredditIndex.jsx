import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import SubredditItem from "./SubredditItem";
import RedditSearch from "./RedditSearch";

const SubredditIndex = () => { 
  const [subreddits, setSubreddits] = useState([]);
  const [mySubreddits, setMySubreddits] = useState([]);
  const [subredditsJsx, setSubredditsJsx] = useState(<div>Loading...</div>);

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
    
    fetch("/api/v1/addedsubreddit/mine")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setMySubreddits(response))
      .catch(() => console.log("Error getting subreddit data"));
  }, []);

  useEffect(() => { 
    setSubredditsJsx(subreddits.map(subreddit => {
      // Set checkbox value depending if user is subscribed
      let subbed = false;
      mySubreddits.forEach(ms => ms.subreddit === subreddit.subreddit ? subbed = true : "")

      return <SubredditItem key={subreddit.id} subreddit={subreddit} subbed={subbed} view={'index'} />;
    }));
  }, [subreddits, mySubreddits]);

  return (
    <div>
      <Link to='/mysubreddits'>My Subreddit</Link>
      <RedditSearch />
      <h1>Subreddit Index</h1>
      {subredditsJsx}
    </div>
  )
}

export default SubredditIndex;