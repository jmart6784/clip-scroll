import React, { useState } from "react";
import { Link } from "react-router-dom";

const YouTubeSearch = () => {
  const [results, setResults] = useState({items: []});
  const [search, setSearch] = useState("");

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
    return (
      <div key={channel.channelId}>
        <img src={channel.thumbnails.default.url} alt="channel avatar" />
        <span>{channel.title}</span>
        <p>Description: {channel.description}</p>
        <p>Joined: {channel.publishedAt}</p>
        <button onClick={(e) => addShorts(e, channel.channelId)}>Add Channel</button>
      </div>
    );
  });

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