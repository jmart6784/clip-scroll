import React, { useEffect, useState } from "react";
import YoutubeVideo from "./YouTubeVideo";

const YouTubeIndex = () => { 
  const [videos, setVideos] = useState([]);

  useEffect(() => { 
    fetch("/api/v1/youtube/videos")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setVideos(response))
      .catch(() => console.log("Error getting quiz index"));
  }, []);

  useEffect(() => console.log(videos), [videos]);

  return (
    <div>
      <h1>YouTube Index</h1>
      <YoutubeVideo id="XYAe15w39LQ" data={{}} />
    </div>
  );
}

export default YouTubeIndex;