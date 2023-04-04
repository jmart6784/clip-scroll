import React from "react";

const ChannelItem = (props) => { 
  return (
    <div>
      <img src={props.channel.thumbnails.default.url} alt="channel avatar" />
      <span>{props.channel.title}</span>
      <p>Description: {props.channel.description}</p>
      <p>Joined: {props.channel.publishedAt}</p>
      {
        props.addBtn ? 
          <button onClick={(e) => props.addShorts(e, props.channel.channelId)}>Add</button>
        : 
          <button onClick={(e) => props.removeShorts(e, props.channel.channelId)}>Remove</button>
      }
    </div>
  );
}

export default ChannelItem;