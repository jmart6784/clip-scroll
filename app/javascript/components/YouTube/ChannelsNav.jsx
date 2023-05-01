import React from "react";
import { Link } from "react-router-dom";

const ChannelsNav = (props) => {
  let channels = <div><i className="fa-brands fa-youtube"></i> Channels</div>;
  let search = <div><i className="fa-solid fa-magnifying-glass"></i> Search</div>;
  let myChannels = <div><i className="fa-solid fa-face-grin"></i> My Channels</div>;

  if (props.view == 'channels') {
    search = <Link to="/youtube/search"><i className="fa-solid fa-magnifying-glass"></i> Search</Link>;
    myChannels = <Link to="/youtube/my_channels"><i className="fa-solid fa-face-grin"></i> My Channels</Link>;
  } else if (props.view == 'search') { 
    channels = <Link to="/youtube/channels"><i className="fa-brands fa-youtube"></i> Channels</Link>;
    myChannels = <Link to="/youtube/my_channels"><i className="fa-solid fa-face-grin"></i> My Channels</Link>;
  } else if (props.view == 'my channels') {
    channels = <Link to="/youtube/channels"><i className="fa-brands fa-youtube"></i> Channels</Link>;
    search = <Link to="/youtube/search"><i className="fa-solid fa-magnifying-glass"></i> Search</Link>;
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