import React, { useEffect, useState } from "react";
import YouTube from 'react-youtube';

const YoutubeVideo = (props) => { 
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
  }, [props.id]);

  const onReady = (event) => event.target.unMute();

  let video_id = video.items ? video.items[0].id : "ofqIENNSx_0"

  return (
    <div>
      <p>{props.id}</p>
      {
        <YouTube
          videoId={video_id}
          id={"youtube-video-main"}
          className={"youtube-video"}
          opts={{
            height: "500",
            width: "300",
            playerVars: {
              autoplay: 1,
              mute: 1,
              loop: 1,
              controls: 0,
              enablejsapi: 1,
              playlist: `${video_id}`,
            },
          }}                        
          onReady={onReady}                    
          />
      }
    </div>
  );
}

export default YoutubeVideo;