import React, { useEffect, useState } from "react";
import YoutubeVideo from "./YouTubeVideo";

const YouTubeIndex = () => { 
  const [videos, setVideos] = useState([]);
  const [index, setIndex] = useState(0);

  useEffect(() => { 
    fetch("/api/v1/youtube/videos")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setVideos(response))
      .catch(() => console.log("Error getting data"));
  }, []);

  const nextVideo = () => index != videos.length - 1 ? setIndex(index + 1) : ""

  let video = videos[index] ? <YoutubeVideo id={videos[index].video_id} /> : "Loading..."

  return (
    <div>
      <h1>YouTube Index</h1>
      {video}
      <button onClick={nextVideo}>Next</button>
    </div>
  );
}

export default YouTubeIndex;