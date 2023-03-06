import React, { useState, useEffect } from "react";

const YouTubeChannels = () => { 
  const [channels, setChannels] = useState([]);

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
  }, []);

  useEffect(() => console.log(channels), [channels]);

  return (
    <div>
      <h1>YouTube Channels</h1>
    </div>
  );
}

export default YouTubeChannels;