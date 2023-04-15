import React, { useEffect, useState } from "react";
import YoutubeVideo from "./YouTubeVideo";
import PlaylistVideoMenu from "../Playlist_video/PlaylistVideoMenu";
import YouTubeLoading from "./YouTubeLoading";
import YouTubeNoResults from "./YouTubeNoResults";

const YouTubeIndex = () => { 
  const [videos, setVideos] = useState([]);
  const [index, setIndex] = useState(0);
  const [loading, setLoading] = useState(true);

  useEffect(() => { 
    fetch("/api/v1/youtube/videos")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setVideos(response), setLoading(false))
      .catch(() => console.log("Error getting data"));
  }, []);

  const nextVideo = () => index != videos.length - 1 ? setIndex(index + 1) : "";
  const previousVideo = () => index > 0 ? setIndex(index - 1) : "";

  let video = videos[index] ? <YoutubeVideo id={videos[index].video_id} /> : "Loading..."

  let mainJsx = <YouTubeLoading />;

  if (loading === false && videos.length > 0) {
    mainJsx = (
      <div>
        <PlaylistVideoMenu
          videoId={videos[index] ? videos[index].video_id : ""}
          parentSourceId={videos[index] ? videos[index].channel_id : ""}
          source="youtube"
        />

        <button onClick={previousVideo}>Previous</button>
        <button onClick={nextVideo}>Next</button>
        {video}
      </div>
    );
  } else if (loading === false && videos.length === 0) { 
    mainJsx = <YouTubeNoResults />;
  }

  return (
    <div>
      {mainJsx}
    </div>
  );
}

export default YouTubeIndex;