import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import SubredditItem from "./SubredditItem";

const SubredditIndex = () => { 
  const [subreddits, setSubreddits] = useState([]);
  const [mySubreddits, setMySubreddits] = useState([]);
  const [subredditsJsx, setSubredditsJsx] = useState(<div>Loading...</div>);
  const [loading, setLoading] = useState(true);

  useEffect(() => { 
    fetch("/api/v1/subreddit/index")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setSubreddits(response), setLoading(false))
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

  let mainJsx = <h1>...Loading</h1>;

  if (loading === false && subreddits.length > 0) {
    mainJsx = (
      <div>
        <Link to='/mysubreddits'>My Subreddit</Link>
        <Link to='/reddit/search'>Search for Subreddits</Link>
        <h1>Subreddit Index</h1>
        {subredditsJsx}
      </div>
    );
  } else if (loading === false && subreddits.length === 0) { 
    mainJsx = (
      <div>No Results</div>
    );
  }

  return mainJsx;
}

export default SubredditIndex;