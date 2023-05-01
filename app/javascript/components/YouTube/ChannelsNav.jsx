import React from "react";
import { Link } from "react-router-dom";

const ChannelsNav = (props) => {
  let channels = <div>Channels</div>;
  let search = <div>Search</div>;
  let myChannels = <div>My Channels</div>;

  if (props.view == 'channels') {
    search = <Link to="/youtube/search">Search</Link>;
    myChannels = <Link to="/youtube/my_channels">My Channels</Link>;
  } else if (props.view == 'search') { 
    channels = <Link to="/youtube/channels">Channels</Link>;
    myChannels = <Link to="/youtube/my_channels">My Channels</Link>;
  } else if (props.view == 'my channels') {
    channels = <Link to="/youtube/channels">Channels</Link>;
    search = <Link to="/youtube/search">Search</Link>;
  }

  return (
    <div className="channels-nav-wrapper">
      {channels}
      {search}
      {myChannels}
    </div>
  );
}

export default ChannelsNav;