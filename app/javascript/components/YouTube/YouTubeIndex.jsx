import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import YoutubeVideo from "./YouTubeVideo";
import PlaylistVideoMenu from "../Playlist_video/PlaylistVideoMenu";

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

  const nextVideo = () => index != videos.length - 1 ? setIndex(index + 1) : "";
  const previousVideo = () => index > 0 ? setIndex(index - 1) : "";

  let video = videos[index] ? <YoutubeVideo id={videos[index].video_id} /> : "Loading..."

  return (
    <div>
      <Link to="/youtube/search">Search</Link>
      <Link to="/youtube/channels">Channels</Link>
      <PlaylistVideoMenu />
      <h1>YouTube Index</h1>
      <button onClick={previousVideo}>Previous</button>
      <button onClick={nextVideo}>Next</button>
      {video}
    </div>
  );
}

export default YouTubeIndex;