import React, { useEffect, useState } from "react";

const YouTubeShow = (props) => { 
  const [videos, setVideos] = useState([]);

  useEffect(() => { 
    fetch(`/api/v1/youtube/videos_by_channel/${props.match.params.id}`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setVideos(response))
      .catch(() => console.log("Error getting video data"));
  }, []);

  useEffect(() => console.log(videos), [videos]);

  return (
    <div>
      <h1>YouTube Show</h1>
    </div>
  );
}

export default YouTubeShow;