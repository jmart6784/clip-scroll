import React from "react";

const ChannelTile = (props) => { 
  let c = props.channel;
  let channel = c.items[0].snippet;
  let stats = c.items[0].statistics;
  let channelId = c.items[0].id;
  let addBtn = true;
  // Changes button depending if user is subscribed to the channel.
  for (let i = 0; i < props.addedChannels.length; i++) {
    if (props.addedChannels[i]["channel_id"] == channelId) {
      addBtn = false;
    } 
  }

  return (
    <div key={channelId}>
      <a href={`https://www.youtube.com/${channel.customUrl}`} target="_blank">
        <img src={channel.thumbnails.default.url} alt="channel avatar" />
        <span>{channel.title}</span>
      </a>
      <p>Description: {channel.description}</p>
      <p>Subscribers count: {stats.subscriberCount}</p>
      <p>Video Count: {stats.videoCount}</p>
      <p>Total View Count: {stats.viewCount}</p>
      <p>Joined: {channel.publishedAt}</p>

      {
        addBtn ? 
          <button onClick={(e) => props.addShorts(e, channelId)}>Add</button>
        : 
          <button onClick={(e) => props.removeShorts(e, channelId)}>Remove</button>
      }
    </div>
  );
}

export default ChannelTile;