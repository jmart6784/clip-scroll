import React, { useEffect, useState } from "react";
import SubredditItem from "./SubredditItem";
import RedditNav from "./RedditNav";

const RedditSearch = () => { 
  const [search, setSearch] = useState("");
  const [subreddits, setSubreddits] = useState([]);
  const [mySubreddits, setMySubreddits] = useState([]);
  const [loading, setLoading] = useState(true);
  const [submited, setSubmited] = useState(false);

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

  const searchSubreddits = (e) => { 
    e.preventDefault();
    setLoading(true);
    setSubmited(true);
    
    fetch(`http://www.reddit.com/search.json?q=${search}&sort=relevance&type=sr&limit=100`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => {
        setLoading(false);
        if (response['data'] == undefined) {
          setSubreddits([]);
        } else { 
          setSubreddits(response['data']['children']);
        }
      })
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

  let mainJsx;

  if (loading && submited) {
    mainJsx = <h1>...Loading</h1>;
  } else if (loading === false && subreddits.length === 0) { 
    mainJsx = <div>No Results</div>;
  }
  
  return (
    <div className="yt-channels-wrapper">
      <RedditNav view="search" />
      <h1 className="channels-view-title yt-search-title">Reddit Search</h1>

      <form onSubmit={(e) => searchSubreddits(e)} className="yt-search-div">
        <input type="text" value={search} onChange={(e) => setSearch(e.target.value)} />
        <button onClick={searchSubreddits} disabled={search.trim() == ""}>
          <i className="fa-solid fa-magnifying-glass"></i>
        </button>
      </form>

      {subreddits.length > 0 ? subredditsJsx : mainJsx}
    </div>
  );
}

export default RedditSearch;