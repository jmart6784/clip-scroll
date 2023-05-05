import React from "react";
import YTloading from "images/yt-loading.gif";

const YouTubeLoading = (props) => { 
  let style = {
    height: props.height ? props.height : "100vh"
  }

  return (
    <div className="loading-div" style={style}>
      <img src={YTloading} alt="loading screen image" />
    </div>
  );
}

export default YouTubeLoading;