import React, { useEffect, useState } from "react";

const YouTubeSearch = () => {
  const [results, setResults] = useState({items: []});
  const [search, setSearch] = useState("Yes Theory");

  const Search = () => {
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
    return (
      <div key={result.snippet.channelId}>
        <img src={result.snippet.thumbnails.default.url} alt="channel avatar" />
        <span>{result.snippet.title}</span>
      </div>
    );
  });

  return (
    <div>
      <h1>YouTube Search</h1>
      <input type="text" value={search} onChange={(e) => setSearch(e.target.value)} />
      <button onClick={Search} disabled={search.trim() == "" ? true : false}>Search</button>

      {resultsJsx}
    </div>
  );
}

export default YouTubeSearch;