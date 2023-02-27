import React, { useEffect, useState } from "react";

const YoutubeVideo = (props) => { 

  console.log("PROPS", props);
  const [video, setVideo] = useState({});
  
  useEffect(() => { 
    fetch(`/api/v1/youtube/video/${props.id}`)
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
      {
        video.items ?
          <iframe
            className="youtube-video"
            allow="autoplay"
            title='Youtube player'
            height="500"
            idth="300"
            sandbox='allow-same-origin allow-forms allow-popups allow-scripts allow-presentation'
            src={`https://youtube.com/embed/${video.items[0].id}?autoplay=1&loop=1&mute=1&controls=0&playlist=${video.items[0].id}`}
            allowFullScreen
          ></iframe>
        : "Loading..."
      }
    </div>
  );
}

export default YoutubeVideo;