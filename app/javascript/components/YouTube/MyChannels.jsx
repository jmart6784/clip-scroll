import React, { useEffect, useState } from "react";
import ChannelTile from "./ChannelTile";
import ChannelsNav from "./ChannelsNav";
import YouTubeLoading from "./YouTubeLoading";
import NoChannels from "./NoChannels";

const MyChannels = () => {
  const [channels, setChannels] = useState([]);
  const [addedChannels, setAddedChannels] = useState([]);
  const [loading, setLoading] = useState(true);
  const [offset, setOffset] = useState(0);
  const [userConfig, setUserConfig] = useState({
    ["youtube_channel_refresh_limit"]: 0
  });

  const getUserConfig = () => { 
    fetch(`/api/v1/user_configuration/mine`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setUserConfig(response))
      .catch(() => console.log("Error getting user configuration"));
  }

  useEffect(() => {
    moreChannels();
    getUserConfig();
    
    fetch(`/api/v1/youtube/added_channels`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setAddedChannels(response))
      .catch(() => console.log("Error getting data"));
  }, []);

  const moreChannels = () => {
    fetch(`/api/v1/youtube/my_channels?offset=${offset}`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setChannels([...channels, ...response]), setLoading(false))
      .catch(() => console.log("Error getting data"));
    // Increment API request offset by 5
    setOffset(offset + 5);
  };

  const addShorts = (e, channelId) => {
    fetch(`/api/v1/youtube/add_shorts/${channelId}`, {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      }
    })
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => {
        if (typeof response == "object") {
          e.target.disabled = true;
          if (response.length == 0) {
            e.target.textContent = "No shorts found";
          } else {
            e.target.textContent = "Added";
          }
        }
      })
      .catch(() => console.log("Error getting shorts data"));
  }

  const removeShorts = (e, channelId) => {
    fetch(`/api/v1/youtube/remove_shorts/${channelId}`, {
      method: "DELETE",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      }
    })
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => {
        if (response.message === 'Channel removed') {
          e.target.disabled = true;
          e.target.textContent = "Removed";
        }
      })
      .catch(() => console.log("Error deleting shorts data"));
  }

  const refreshVideos = (e, channelId) => { 
    e.target.disabled = true;
    fetch(`/api/v1/youtube/add_shorts/${channelId}?refresh=true`, {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      }
    })
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => getUserConfig())
      .catch(() => console.log("Error getting shorts data"));
  }

  let channelsJsx = channels.map(c =>
    <ChannelTile
      key={c.items[0].id}
      channel={c}
      addShorts={addShorts}
      removeShorts={removeShorts}
      addedChannels={addedChannels}
      refreshVideos={refreshVideos}
    />
  );

  let mainJsx = <YouTubeLoading />;

  if (loading === false && channels.length > 0) {
    mainJsx = (
      <div className="yt-channels-wrapper">
        <ChannelsNav view="my channels" />
        <h1 className="channels-view-title">My Channels</h1>
        <p>Daily Channel Add/Refreshes left: {userConfig["youtube_channel_refresh_limit"]}</p>

        <div className="channels-wrapper">{channelsJsx}</div>
        <button onClick={moreChannels} type="button" className="yt-channel-more">More...</button>
      </div>
    );
  } else if (loading === false && channels.length === 0) { 
    mainJsx = <NoChannels />;
  }
  
  return mainJsx;
}

export default MyChannels;