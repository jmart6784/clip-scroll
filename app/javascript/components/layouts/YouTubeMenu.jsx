import React from "react";
import { Link } from "react-router-dom";

const YouTubeMenu = () => { 
  return (
    <div>
      <Link to="/youtube/channels">Channels</Link>
      <Link to="/youtube/my_channels">My Channels</Link>
      <Link to="/youtube/index">YouTube Index</Link>
    </div>
  );
}

export default YouTubeMenu;