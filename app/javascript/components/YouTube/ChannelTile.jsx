import React from "react";
import { Link } from "react-router-dom";
import formatDate from "../../helpers/formatDate";

const ChannelTile = (props) => { 
  let c = props.channel;
  let addBtn = true;
  let channelJsx = <div></div>;

  if (c.items) {
    let channel = c.items[0].snippet;
    let stats = c.items[0].statistics;
    let channelId = c.items[0].id;

    // Changes button depending if user is subscribed to the channel.
    for (let i = 0; i < props.addedChannels.length; i++) {
      if (props.addedChannels[i]["channel_id"] == channelId) {
        addBtn = false;
      } 
    }

    channelJsx = (
      <div key={channelId} className="channel-tile-div">
        <Link to={`/youtube/show/${channelId}`} className="channel-tile-link">
          <img src={channel.thumbnails.default.url} alt="channel avatar" className="channel-avatar" />
          <span>{channel.title}</span>
        </Link>

        <p>{channel.description}</p>
        <p>Subscribers count: {stats.subscriberCount}</p>
        <p>Video Count: {stats.videoCount}</p>
        <p>Total View Count: {stats.viewCount}</p>
        <p>Joined: {formatDate(channel.publishedAt)}</p>

        <div className="channel-tile-nav-div">
          {
            addBtn ? 
              <button onClick={(e) => props.addShorts(e, channelId)} className="ch-tile-add">
                <i className="fa-solid fa-plus"></i> Add
              </button>
            : 
              <button onClick={(e) => props.removeShorts(e, channelId)} className="ch-tile-remove">
                <i className="fa-solid fa-xmark"></i> Remove
              </button>
          }

          <button onClick={(e) => props.refreshVideos(e, channelId)} type="button" className="ch-tile-refresh">
            <i className="fa-solid fa-rotate"></i> Refresh Videos
          </button>

          <Link to={`/youtube/show/${channelId}`}>
            <i className="fa-solid fa-eye"></i> View Videos
          </Link>

          <a href={`https://www.youtube.com/${channel.customUrl}`} target="_blank">
            View on <i className="fa-brands fa-youtube"></i> YouTube
          </a>
        </div>
      </div>
    );
  } else {
    // Changes button depending if user is subscribed to the channel.
    for (let i = 0; i < props.addedChannels.length; i++) {
      if (props.addedChannels[i]["channel_id"] == c.channelId) {
        addBtn = false;
      } 
    }
    // YouTube Search data does not include stats, a differnt JSX render is needed.
    channelJsx = (
      <div key={c.channelId}>
        <img src={c.thumbnails.default.url} alt="channel avatar" />
        <span>{c.title}</span>

        <p>Description: {c.description}</p>
        <p>Joined: {c.publishedAt}</p>

        {
          addBtn ? 
            <button onClick={(e) => props.addShorts(e, c.channelId)}>Add</button>
          : 
            <button onClick={(e) => props.removeShorts(e, c.channelId)}>Remove</button>
        }
      </div>
    );
  }

  return channelJsx;
}

export default ChannelTile;