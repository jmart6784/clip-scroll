import React, { useEffect, useState } from "react";

const YouTubeSearch = () => {
  const [results, setResults] = useState([]);
  const [search, setSearch] = useState("");

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

  return (
    <div>
      <h1>YouTube Search</h1>
      <input type="text" value={search} onChange={(e) => setSearch(e.target.value)} />
      <button onClick={Search} disabled={search.trim() == "" ? true : false}>Search</button>
    </div>
  );
}

export default YouTubeSearch;