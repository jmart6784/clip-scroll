import React, { useState, useEffect } from "react";

const YouTubeChannels = () => { 
  const [channels, setChannels] = useState([]);

  useEffect(() => { 
    fetch(`/api/v1/youtube/channels`)
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

  let channelsJsx = channels.map(c => { 
    let channel = c.items[0].snippet;
    let stats = c.items[0].statistics;
    let channelId = c.items[0].id;

    return (
      <div key={channelId}>
        <a href={`https://www.youtube.com/${channel.customUrl}`} target="_blank">
          <img src={channel.thumbnails.default.url} alt="channel avatar" />
          <span>{channel.title}</span>
        </a>
        <p>Description: {channel.description}</p>
        <p>Subscribers: {stats.subscriberCount}</p>
        <p>Video Count: {stats.videoCount}</p>
        <p>Total View Count: {stats.viewCount}</p>
        <p>Joined: {channel.publishedAt}</p>
      </div>
    );
  });

  return (
    <div>
      <h1>YouTube Channels</h1>
      {channelsJsx}
    </div>
  );
}

export default YouTubeChannels;