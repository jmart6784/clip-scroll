import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import ChannelTile from "./ChannelTile";

const YouTubeSearch = () => {
  const [results, setResults] = useState({items: []});
  const [search, setSearch] = useState("");
  const [addedChannels, setAddedChannels] = useState([]);
  const [loading, setLoading] = useState(true);
  const [submited, setSubmited] = useState(false);

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

  const searchChannels = () => {
    fetch(`/api/v1/youtube/search/${search}`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => {
        setLoading(false);
        setSubmited(true);
        setResults(response);
      })
      .catch(() => console.log("Error getting data"));
  }

  let resultsJsx = results.items.map(result => {
    let channel = result.snippet;
    let addBtn = true;
    // Changes button depending if user is subscribed to the channel.
    for (let i = 0; i < addedChannels.length; i++) {
      if (addedChannels[i]["channel_id"] == channel.channelId) {
        addBtn = false;
      } 
    }

    return <ChannelTile
      key={channel.channelId}
      channel={channel}
      addShorts={addShorts}
      removeShorts={removeShorts}
      addedChannels={addedChannels} 
    />;
  });

  let mainJsx;

  if (loading && submited) {
    mainJsx = <h1>...Loading</h1>;
  } else if (loading === false && results.items.length === 0) { 
    mainJsx = <div>No Results</div>;
  }

  return (
    <div>
      <h1>YouTube Search</h1>
      <Link to="/youtube/index">Back</Link>
      <input type="text" value={search} onChange={(e) => setSearch(e.target.value)} />
      <button onClick={searchChannels} disabled={search.trim() == ""}>Search</button>

      {results.items.length > 0 && submited ? resultsJsx : mainJsx}
    </div>
  );
}

export default YouTubeSearch;