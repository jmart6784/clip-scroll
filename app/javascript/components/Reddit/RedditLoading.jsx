import React from "react";
import loading from "images/reddit-loading.gif";

const RedditLoading = () => { 
  return (
    <div className="loading-gif-wrapper">
      <img src={loading} alt="Reddit loading image" />
    </div>
  );
}

export default RedditLoading;