import React, { useEffect, useState } from "react";

const YoutubeVideo = () => { 
  const [video, setVideo] = useState({});
  
  useEffect(() => { 
    fetch(`/api/v1/youtube/video/XYAe15w39LQ`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setVideo(response))
      .catch(() => console.log("Failed to get video"));
  }, []);

  return (
    <div>
      <h1>Youtube Video</h1>
      {video.items ? <iframe className='video' title='Youtube player' sandbox='allow-same-origin allow-forms allow-popups allow-scripts allow-presentation' src={`https://youtube.com/embed/${video.items[0].id}?autoplay=1&mute=1`} allowFullScreen></iframe> : "Loading..."}
    </div>
  );
}

export default YoutubeVideo;