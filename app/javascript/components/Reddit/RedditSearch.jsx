import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import SubredditItem from "./SubredditItem";

const RedditSearch = () => { 
  const [search, setSearch] = useState("11foot8");
  const [subreddits, setSubreddits] = useState([]);
  const [mySubreddits, setMySubreddits] = useState([]);

  useEffect(() => {
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

  const searchSubreddits = () => { 
    fetch(`http://www.reddit.com/search.json?q=${search}&sort=relevance&type=sr&limit=100`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setSubreddits(response['data']['children']))
      .catch(() => console.log("Error getting subreddit data"));
  }

  let subredditsJsx = subreddits.map(sr => { 
    let subreddit = sr['data'];

    // Set checkbox value depending if user is subscribed
    let subbed = false;
    mySubreddits.forEach(ms => ms.subreddit === subreddit['display_name'] ? subbed = true : "")

    let srObj = {subreddit: subreddit['display_name']}

    return <SubredditItem key={subreddit['id']} subreddit={srObj} subbed={subbed} view={'index'} />;
  });

  return (
    <div>
      <Link to="/subreddit/index">Back</Link>
      <h1>Reddit Search</h1>
      <input type="text" value={search} onChange={(e) => setSearch(e.target.value)} />
      <button onClick={searchSubreddits} disabled={search.trim() == ""}>Search</button>

      {subredditsJsx}
    </div>
  );
}

export default RedditSearch;