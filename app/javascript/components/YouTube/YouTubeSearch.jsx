import React, { useEffect, useState } from "react";

const YouTubeSearch = () => {
  const [results, setResults] = useState({items: []});
  const [search, setSearch] = useState("Yes Theory");

  const addShorts = (channelId) => { 
    console.log("Add shorts", channelId);
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

  useEffect(() => console.log(results), [results]);

  let resultsJsx = results.items.map(result => {
    let channel = result.snippet;
    return (
      <div key={channel.channelId}>
        <img src={channel.thumbnails.default.url} alt="channel avatar" />
        <span>{channel.title}</span>
        <button onClick={() => addShorts(channel.channelId)}>Add Shorts</button>
      </div>
    );
  });

  return (
    <div>
      <h1>YouTube Search</h1>
      <input type="text" value={search} onChange={(e) => setSearch(e.target.value)} />
      <button onClick={searchChannels} disabled={search.trim() == ""}>Search</button>

      {resultsJsx}
    </div>
  );
}

export default YouTubeSearch;