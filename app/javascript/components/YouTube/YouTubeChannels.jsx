import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import ChannelTile from "./ChannelTile";

const YouTubeChannels = () => { 
  const [channels, setChannels] = useState([]);
  const [addedChannels, setAddedChannels] = useState([]);
  const [offset, setOffset] = useState(0);
  const [loading, setLoading] = useState(true);

  useEffect(() => { 
    moreChannels();
    
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
    fetch(`/api/v1/youtube/channels?offset=${offset}`)
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

  let channelsJsx = channels.map(c =>
    <ChannelTile
      key={c.items[0].id}
      channel={c}
      addShorts={addShorts}
      removeShorts={removeShorts}
      addedChannels={addedChannels} 
    />
  );

  let mainJsx = <h1>...Loading</h1>;

  if (loading === false && channels.length > 0) { 
    mainJsx = (
      <div>
        <Link to="/youtube/search">Search</Link>
        <h1>YouTube Channels</h1>
        {channelsJsx}
        <button onClick={moreChannels} type="button">More...</button>
      </div>
    );
  } else if (loading === false && channels.length === 0) { 
    mainJsx = (
      <div>No Channels search more <Link to="/youtube/search">here!</Link></div>
    );
  }

  return mainJsx;
}

export default YouTubeChannels;