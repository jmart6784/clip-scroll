import React from "react";
import { Link } from "react-router-dom";
import ytImage from 'images/youtube-error.png'

const NoChannels = (props) => {
  let style = {
    height: props.height ? props.height : "100vh"
  }

  return (
    <div className="no-channels-div" style={style}>
      <img src={ytImage} alt="youtube error" />
      <div>
        No Channels added, search for more <Link to="/youtube/search">here!</Link>
      </div>
    </div>
  );
}

export default NoChannels;