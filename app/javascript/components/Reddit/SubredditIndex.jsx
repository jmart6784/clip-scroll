import React, { useEffect, useState } from "react";
import SubredditItem from "./SubredditItem";
import RedditLoading from "./RedditLoading";
import RedditNoResults from "./RedditNoResults";
import RedditNav from "./RedditNav";

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
      <div className="yt-channels-wrapper">
        <RedditNav view="subreddits" />
        <div className="subreddit-index">{subredditsJsx}</div>
      </div>
    );
  } else if (loading === false && subreddits.length === 0) { 
    mainJsx = <RedditNoResults />;
  }

  return mainJsx;
}

export default SubredditIndex;