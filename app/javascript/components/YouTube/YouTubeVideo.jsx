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
  }, []);

  const onReady = (event) => event.target.unMute();

  return (
    <div>
      {
        video.items ?
          <YouTube
            videoId={video.items[0].id}
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
                playlist: `${video.items[0].id}`,
              },
            }}                        
            onReady={onReady}                    
          />
          : 
          <YouTube
            videoId="ofqIENNSx_0"
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
                playlist: 'ofqIENNSx_0'
              },
            }}                        
            onReady={onReady}                    
          />
      }
    </div>
  );
}

export default YoutubeVideo;