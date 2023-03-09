import React, { useState, useEffect } from "react";

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
          // e.target.disabled = true;
          if (response.length == 0) {
            e.target.textContent = "No shorts found";
            e.target.disabled = true;
          } else { 
            // Toggle button visibility
            document.getElementById(`remove-btn-${channelId}`).style.display = "block";
            document.getElementById(`add-btn-${channelId}`).style.display = "none";
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
          // Toggle button visibility
          document.getElementById(`add-btn-${channelId}`).style.display = "block";
          document.getElementById(`remove-btn-${channelId}`).style.display = "none";
        }
      })
      .catch(() => console.log("Error deleting shorts data"));
  }

  // useEffect(() => console.log("Channels", channels), console.log("Added channels", addedChannels), [channels, addedChannels]);

  let channelsJsx = channels.map(c => {
    let channel = c.items[0].snippet;
    let stats = c.items[0].statistics;
    let channelId = c.items[0].id;
    let addBtn = <button onClick={(e) => addShorts(e, channelId)} id={`add-btn-${channelId}`}>Add Channel</button>;
    let removeBtn = <button onClick={(e) => removeShorts(e, channelId)} id={`remove-btn-${channelId}`}>Remove</button>

    // Changes button depending if user is subscribed to the channel.
    for (let i = 0; i < addedChannels.length; i++) {
      let channel = addedChannels[i];
      if (channel["channel_id"] == channelId) {
        addBtn = <button onClick={(e) => addShorts(e, channelId)} id={`add-btn-${channelId}`} style={{ display: "none" }}>Add Channel</button>;
        
        removeBtn = <button onClick={(e) => removeShorts(e, channelId)} id={`remove-btn-${channelId}`} style={{ display: "block" }}>Remove</button>
      } else { 
        addBtn = <button onClick={(e) => addShorts(e, channelId)} id={`add-btn-${channelId}`} style={{ display: "block" }}>Add Channel</button>;
        
        removeBtn = <button onClick={(e) => removeShorts(e, channelId)} id={`remove-btn-${channelId}`} style={{ display: "none" }}>Remove</button>
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
        {addBtn}
        {removeBtn}
      </div>
    );
  });

  return (
    <div>
      <h1>YouTube Channels</h1>
      {channelsJsx}
    </div>
  );
}

export default YouTubeChannels;