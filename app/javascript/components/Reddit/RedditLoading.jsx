import React from "react";
import loading from "images/reddit-loading.gif";

const RedditLoading = (props) => { 
  let style = {
    height: props.height ? props.height : "100vh"
  }

  return (
    <div className="loading-gif-wrapper" style={style}>
      <img src={loading} alt="Reddit loading image" />
    </div>
  );
}

export default RedditLoading;