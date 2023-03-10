import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

const YouTubeSearch = () => {
  const [results, setResults] = useState({items: []});
  const [search, setSearch] = useState("");
  const [addedChannels, setAddedChannels] = useState([]);

  useEffect(() => { 
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

  const searchChannels = () => {
    fetch(`/api/v1/youtube/search/${search}`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setResults(response))
      .catch(() => console.log("Error getting data"));
  }

  let resultsJsx = results.items.map(result => {
    let channel = result.snippet;
    let addBtn = <button onClick={(e) => addShorts(e, channel.channelId)} id={`add-btn-${channel.channelId}`}>Add Channel</button>;
    let removeBtn = <button onClick={(e) => removeShorts(e, channel.channelId)} id={`remove-btn-${channel.channelId}`}>Remove</button>;

    // Changes button depending if user is subscribed to the channel.
    for (let i = 0; i < addedChannels.length; i++) {
      let aChannel = addedChannels[i];
      if (aChannel["channel_id"] == channel.channelId) {
        addBtn = <button onClick={(e) => addShorts(e, channel.channelId)} id={`add-btn-${channel.channelId}`} style={{ display: "none" }}>Add Channel</button>;
        
        removeBtn = <button onClick={(e) => removeShorts(e, channel.channelId)} id={`remove-btn-${channel.channelId}`} style={{ display: "block" }}>Remove</button>
      } else { 
        addBtn = <button onClick={(e) => addShorts(e, channel.channelId)} id={`add-btn-${channel.channelId}`} style={{ display: "block" }}>Add Channel</button>;
        
        removeBtn = <button onClick={(e) => removeShorts(e, channel.channelId)} id={`remove-btn-${channel.channelId}`} style={{ display: "none" }}>Remove</button>
      }
    }

    return (
      <div key={channel.channelId}>
        <img src={channel.thumbnails.default.url} alt="channel avatar" />
        <span>{channel.title}</span>
        <p>Description: {channel.description}</p>
        <p>Joined: {channel.publishedAt}</p>
        {addBtn}
        {removeBtn}
      </div>
    );
  });

  useEffect(() => console.log("Results", results), [results]);

  return (
    <div>
      <h1>YouTube Search</h1>
      <Link to="/youtube/index">Back</Link>
      <input type="text" value={search} onChange={(e) => setSearch(e.target.value)} />
      <button onClick={searchChannels} disabled={search.trim() == ""}>Search</button>

      {resultsJsx}
    </div>
  );
}

export default YouTubeSearch;