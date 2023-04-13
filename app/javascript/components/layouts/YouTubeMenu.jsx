import React from "react";
import { Link } from "react-router-dom";

const YouTubeMenu = (props) => { 
  return (
    <div>
      <Link to="/youtube/channels" onClick={() => props.hideMenu()}>Channels</Link>
      <Link to="/youtube/my_channels" onClick={() => props.hideMenu()}>My Channels</Link>
      <Link to="/youtube/index" onClick={() => props.hideMenu()}>YouTube Index</Link>
    </div>
  );
}

export default YouTubeMenu;