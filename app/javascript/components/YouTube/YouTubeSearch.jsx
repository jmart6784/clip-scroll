import React, { useEffect, useState } from "react";
import ChannelTile from "./ChannelTile";
import ChannelsNav from "./ChannelsNav";
import YouTubeLoading from "./YouTubeLoading";
import NoChannels from "./NoChannels";

const YouTubeSearch = () => {
  const [results, setResults] = useState({items: []});
  const [search, setSearch] = useState("");
  const [addedChannels, setAddedChannels] = useState([]);
  const [loading, setLoading] = useState(true);
  const [submited, setSubmited] = useState(false);
  const [limitReached, setLimitReached] = useState(false);
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
        getUserConfig();
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

  const searchChannels = (e) => {
    e.preventDefault();
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
        if (response.message) {
          setLimitReached(true);
        } else { 
          setResults(response);
        }
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
    mainJsx = <YouTubeLoading height="20vh" />;
  } else if (loading === false && results.items.length === 0) { 
    mainJsx = <NoChannels height="20vh" />;
  }

  let parentJsx;

  if (limitReached) {
    parentJsx = <div className="yt-search-limit"><h3>Daily Search limit reached</h3></div>;
  } else { 
    parentJsx = results.items.length > 0 && submited ?
      <>
        <p className="yt-search-additions">Channel Additions left: {userConfig["youtube_channel_refresh_limit"]}</p>
        {resultsJsx}
      </>
    : mainJsx;
  }

  return (
    <div className="yt-channels-wrapper">
      <ChannelsNav view={'search'} />
      <h1 className="channels-view-title yt-search-title">YouTube Search</h1>
      
      <form onSubmit={(e) => searchChannels(e)} className="yt-search-div">
        <input type="text" value={search} onChange={(e) => setSearch(e.target.value)} placeholder="Limit 1 search per day" />
        <button onClick={searchChannels} disabled={search.trim() == ""}>
          <i className="fa-solid fa-magnifying-glass"></i>
        </button>
      </form>

      <div className="channels-wrapper">{parentJsx}</div>
    </div>
  );
}

export default YouTubeSearch;