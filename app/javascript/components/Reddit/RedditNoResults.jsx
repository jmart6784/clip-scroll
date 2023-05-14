import React from "react";
import error from "images/reddit-error.png";

const RedditNoResults = (props) => {
  let style = {
    height: props.height ? props.height : "100vh"
  }

  return (
    <div className="reddit-no-results" style={style}>
      <img src={error} className="reddit-nr-image" alt="Reddit error image" />
      <p>No Results</p>
    </div>
  );
}

export default RedditNoResults;