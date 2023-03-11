import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

const MyChannels = () => { 
  const [channels, setChannels] = useState([]);

  useEffect(() => { 
    fetch(`/api/v1/youtube/my_channels`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setChannels(response))
      .catch(() => console.log("Error getting data"));
  }, []);

  useEffect(() => console.log(channels), [channels]);
  
  return (
    <div>
      <Link to="/youtube/channels">More Channels</Link>
      <h1>My Channels</h1>
    </div>
  );
}

export default MyChannels;