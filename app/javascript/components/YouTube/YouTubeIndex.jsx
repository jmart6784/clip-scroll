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

  const nextVideo = () => setIndex(index + 1);

  let videosJsx = videos.slice(0, index + 1).map(video => { 
    return (
      <div key={video.video_id}>
        <YoutubeVideo id={video.video_id} />
      </div>
    );
  });

  return (
    <div>
      <h1>YouTube Index</h1>
      <div>{videosJsx}</div>
      <button onClick={nextVideo}>Next</button>
    </div>
  );
}

export default YouTubeIndex;