import React, { useEffect, useState } from "react";

const YoutubeVideo = () => { 
  const [video, setVideo] = useState({});
  
  useEffect(() => { 
    fetch(``)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setVideo(response))
      // .catch(() => props.history.push("/"));
  }, []);
  
  useEffect(() => console.log(video), [video]);

  return (
    <div>
      <h1>Youtube Video</h1>

    </div>
  );
}

export default YoutubeVideo;