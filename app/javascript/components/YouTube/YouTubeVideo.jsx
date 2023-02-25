import React, { useEffect, useState } from "react";

const YoutubeVideo = () => { 
  // const [video, setVideo] = useState({});
  
  // useEffect(() => { 
  //   fetch(`/api/v1/youtube/video/XYAe15w39LQ`)
  //     .then((response) => {
  //       if (response.ok) {
  //         return response.json();
  //       }
  //       throw new Error("Network response was not ok.");
  //     })
  //     .then((response) => setVideo(response))
  //     .catch(() => console.log("Failed to get video"));
  // }, []);
//https://youtube.com/embed/XYAe15w39LQ
  return (
    <div>
      <h1>Youtube Video</h1>
      {/* {{
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
      }} */}

      <iframe
        className="youtube-video"
        allow="autoplay"
        title='Youtube player'
        height="500"
        width="300"
        sandbox='allow-same-origin allow-forms allow-popups allow-scripts allow-presentation'
        src={`https://youtube.com/embed/XYAe15w39LQ?autoplay=1&loop=1&mute=1&controls=0&playlist=XYAe15w39LQ`}
        allowFullScreen
      ></iframe>
    </div>
  );
}

export default YoutubeVideo;