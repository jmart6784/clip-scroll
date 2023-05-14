import React from "react";
import error from "images/reddit-error.png";

const RedditNoResults = () => { 
  return (
    <div className="reddit-no-results">
      <img src={error} className="reddit-nr-image" alt="Reddit error image" />
      <p>No Results</p>
    </div>
  );
}

export default RedditNoResults;