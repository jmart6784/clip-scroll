import React from "react";
import YTloading from "images/youtube-error.png";

const YouTubeNoResults = () => { 
  return (
    <div className="loading-div">
      <img src={YTloading} alt="Youtube error image" />
      <p>No Results</p>
    </div>
  );
}

export default YouTubeNoResults;