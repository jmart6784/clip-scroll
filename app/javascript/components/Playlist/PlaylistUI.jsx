import React, { useContext, useState } from "react";
import { Link } from "react-router-dom";
import PlayImage from 'images/play.png'
import PlaylistVideoDelete from "../Playlist_video/PlaylistVideoDelete";
import GlobalContext from "../context/GlobalContext";
import PlaylistDelete from "./PlaylistDelete";

const PlaylistUI = (props) => { 
  const [global, setGlobal] = useContext(GlobalContext);
  const [prompt, setPrompt] = useState(true);

  // Select video by index when option is clicked on playlist menu
  const selectVideo = (videoId) => {
    let index = props.videos.findIndex(v => v.video_id === videoId);
    index != -1 ? props.setIndex(index) : ""
  }

  const removeVideo = (videoId) => {
    // If the last video is deleted, decrement the index
    props.videos.length - 1 == props.index ? props.setIndex(props.index - 1) : '';
    props.setVideos(props.videos.filter(vid => vid.id !== videoId));
  }

  // Render click-able playlist menu options
  let videosJsx = props.videos.map((v, i) => {
    let selectedStyle = props.index == i ? { border: "1px solid black", cursor: "pointer" } : {};
    let ownerBtns = '';

    if (global.user) {
      if (props.playlist['user_id'] === global.user.id) {
        ownerBtns = <PlaylistVideoDelete video={v} removeVideo={removeVideo} />;
      }
    }
    
    if (v['source'] == 'youtube') {
      let video = v["video"]["items"][0]["snippet"];
      let videoId = v["video"]["items"][0]["id"];
      let stats = v["video"]["items"][0]["statistics"];

      return (
        <div key={videoId} onClick={() => selectVideo(videoId)} style={selectedStyle}>
          <img src={video.thumbnails.default.url} alt="video thumbnail" />
          <strong>YouTube {v['video_id']}</strong>
          <p>{video.title}</p>
          <p>{video.channelTitle}</p>
          <p>{stats.viewCount}</p>
          {ownerBtns}
        </div>
      );
    } else if (v['source'] == 'reddit') { 
      let video = v['video']['data'];

      return (
        <div key={v['id']} onClick={() => selectVideo(video['id'])} style={selectedStyle}>
          <img
            src={video['thumbnail']}
            alt="video thumbnail" 
            onError={e => {
              e.target.onerror = null;
              e.target.src = PlayImage;
            }}
            height="100"
            width="100"
          />
          <strong>Reddit: {v['video_id']}</strong>
          <p>{video['title']}</p>
          <p>{video['subreddit']}</p>
          <p>{video['score']}</p>
          {ownerBtns}
        </div>
      ); 
    }
  });

  let menuJsx = <i id="plui-show" className="fa-solid fa-bars" onClick={() => setPrompt(true)}></i>;

  if (prompt) {
    let ownerBtns = '';

    if (global.user) {
      if (props.playlist['user_id'] === global.user.id) {
        ownerBtns = (
          <div>
            <Link to={`/playlist/edit/${props.playlist.id}`}>Edit</Link>
            <PlaylistDelete id={props.playlist.id} />
          </div>
        );
      }
    }

    menuJsx = (
      <div>
        <i onClick={() => setPrompt(false)} class="fa-solid fa-xmark"></i>
        <div>
          <p>name: {props.playlist.name}</p>
          <p>Private: {props.playlist.private.toString()}</p>
          <p>Source: {props.playlist.source}</p>
        </div>
        
        <div>
            <p>{props.playlist.user.username}</p>
            <Link to={`/users/show/${props.playlist.user.id}`}>
              <img src={props.playlist.user.avatar.url} height="50" width="50" alt="user avatar" />
              <span>{props.playlist.user.username}</span>
            </Link>
        </div>

        {ownerBtns}
        
        {videosJsx}

        <button onClick={props.moreVideos} disabled={props.noResults} id="more-btn">Show More</button>
      </div>
    );
  }

  return menuJsx;
}

export default PlaylistUI;