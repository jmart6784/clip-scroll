import React from "react";
import YTloading from "images/yt-loading.gif";

const YouTubeLoading = () => { 
  return (
    <div className="loading-div">
      <img src={YTloading} alt="loading screen image" />
    </div>
  );
}

export default YouTubeLoading;