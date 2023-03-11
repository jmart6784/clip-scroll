import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";

const YouTubeChannels = () => { 
  const [channels, setChannels] = useState([]);
  const [addedChannels, setAddedChannels] = useState([]);

  useEffect(() => { 
    fetch(`/api/v1/youtube/channels`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setChannels(response))
      .catch(() => console.log("Error getting data"));
    
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

  let channelsJsx = channels.map(c => {
    let channel = c.items[0].snippet;
    let stats = c.items[0].statistics;
    let channelId = c.items[0].id;
    let addBtn = true;
    // Changes button depending if user is subscribed to the channel.
    for (let i = 0; i < addedChannels.length; i++) {
      if (addedChannels[i]["channel_id"] == channelId) {
        addBtn = false;
      } 
    }

    return (
      <div key={channelId}>
        <a href={`https://www.youtube.com/${channel.customUrl}`} target="_blank">
          <img src={channel.thumbnails.default.url} alt="channel avatar" />
          <span>{channel.title}</span>
        </a>
        <p>Description: {channel.description}</p>
        <p>Subscribers count: {stats.subscriberCount}</p>
        <p>Video Count: {stats.videoCount}</p>
        <p>Total View Count: {stats.viewCount}</p>
        <p>Joined: {channel.publishedAt}</p>

        {
          addBtn ? 
            <button onClick={(e) => addShorts(e, channelId)}>Add</button>
          : 
            <button onClick={(e) => removeShorts(e, channelId)}>Remove</button>
        }
      </div>
    );
  });

  return (
    <div>
      <Link to="/youtube/my_channels">My Channels</Link>
      <h1>YouTube Channels</h1>
      {channelsJsx}
    </div>
  );
}

export default YouTubeChannels;