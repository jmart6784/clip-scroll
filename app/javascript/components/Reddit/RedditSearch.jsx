import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

const RedditSearch = () => { 
  const [search, setSearch] = useState("");
  const [subreddits, setSubreddits] = useState([]);

  useEffect(() => { 
    fetch(`http://www.reddit.com/search.json?q=${search}&sort=relevance&type=sr&limit=100`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setSubreddits(response['data']['children']))
      .catch(() => console.log("Error getting subreddit data"));
  }, []);

  useEffect(() => console.log(subreddits), [subreddits]);

  return (
    <div>
      <Link to="/subreddit/index">Back</Link>
      <h1>Reddit Search</h1>
    </div>
  );
}

export default RedditSearch;