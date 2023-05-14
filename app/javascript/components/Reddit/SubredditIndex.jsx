import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import SubredditItem from "./SubredditItem";
import RedditLoading from "./RedditLoading";
import RedditNoResults from "./RedditNoResults";

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

  let mainJsx = <RedditLoading />;

  if (loading === false && subreddits.length > 0) {
    mainJsx = (
      <div>
        <Link to='/mysubreddits'>My Subreddits</Link>
        <Link to='/reddit/search'>Search for Subreddits</Link>
        <h3 className="subreddit-title"><i className="fa-brands fa-reddit"></i> r/Subreddits</h3>
        <div className="subreddit-index">{subredditsJsx}</div>
      </div>
    );
  } else if (loading === false && subreddits.length === 0) { 
    mainJsx = (
      <RedditNoResults />
    );
  }

  return mainJsx;
}

export default SubredditIndex;