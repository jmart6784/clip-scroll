import React from "react";
import { Link } from "react-router-dom";

const ChannelsNav = (props) => {
  let channels = <div>Channels</div>;
  let search = <div>Search</div>;
  let myChannels = <div>My Channels</div>;

  if (props.view == 'channels') {
    channels = <Link to="/youtube/channels">Channels</Link>;
  } else if (props.view == 'search') { 
    search = <Link to="/youtube/search">Search</Link>;
  } else if (props.view == 'my channels') {
    myChannels = <Link to="/youtube/my_channels">My Channels</Link>;
  }

  return (
    <div>
      {channels}
      {search}
      {myChannels}
    </div>
  );
}

export default ChannelsNav;