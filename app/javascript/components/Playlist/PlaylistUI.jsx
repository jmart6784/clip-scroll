import React, { useContext, useState } from "react";
import { Link } from "react-router-dom";
import PlayImage from 'images/play.png'
import PlaylistVideoDelete from "../Playlist_video/PlaylistVideoDelete";
import GlobalContext from "../context/GlobalContext";
import PlaylistDelete from "./PlaylistDelete";

const PlaylistUI = (props) => { 
  const [global, setGlobal] = useContext(GlobalContext);
  const [prompt, setPrompt] = useState(false);

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
    let selectedStyle = props.index == i ? { backgroundColor: "rgba(255, 255, 255, 0.1)" } : {};
    let ownerBtns = '';

    if (global.user) {
      if (props.playlist['user_id'] === global.user.id) {
        ownerBtns = <PlaylistVideoDelete video={v} removeVideo={removeVideo} showPrompt={false}  />;
      }
    }
    
    if (v['source'] == 'youtube') {
      let video = v["video"]["items"][0]["snippet"];
      let videoId = v["video"]["items"][0]["id"];
      // let stats = v["video"]["items"][0]["statistics"];

      return (
        <div
          key={videoId}
          onClick={() => selectVideo(videoId)}
          style={selectedStyle}
          className="pui-video-item"
        >
          <div style={{ backgroundImage: `url(${video.thumbnails.default.url})` }} className="background-image pui-v-image"></div>
          {/* <img src={video.thumbnails.default.url} alt="video thumbnail" /> */}
          <p><i className="fa-brands fa-youtube"></i> {video.title}</p>
          {/* <p>{video.channelTitle}</p> */}
          {/* <p>{stats.viewCount}</p> */}
          {ownerBtns}
        </div>
      );
    } else if (v['source'] == 'reddit') { 
      let video = v['video']['data'];

      return (
        <div
          key={v['id']}
          onClick={() => selectVideo(video['id'])}
          style={selectedStyle}
          className="pui-video-item"
        >
          <div style={{ backgroundImage: `url(${video['thumbnail']})` }} className="background-image pui-v-image"></div>
          {/* <img
            src={video['thumbnail']}
            alt="video thumbnail" 
            onError={e => {
              e.target.onerror = null;
              e.target.src = PlayImage;
            }}
            height="100"
            width="100"
          /> */}
          <p><i className="fa-brands fa-reddit"></i> {video['title']}</p>
          {/* <p>{video['subreddit']}</p> */}
          {/* <p>{video['score']}</p> */}
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
          <div className="pui-owner-buttons">
            <Link to={`/playlist/edit/${props.playlist.id}`}>Edit</Link>
            <PlaylistDelete id={props.playlist.id} />
          </div>
        );
      }
    }

    let sourceIcons = (
      <>
        <i className="fa-brands fa-reddit"></i>{' '}
        <i className="fa-brands fa-youtube"></i>
      </>
    );
    
    if (props.playlist.source == 'reddit') {
      sourceIcons = <i className="fa-brands fa-reddit"></i>;
    } else if (props.playlist.source == 'youtube') {
      sourceIcons = <i className="fa-brands fa-youtube"></i>;
    }

    menuJsx = (
      <div className="playlist-ui-wrapper">
        <i id="pui-close" onClick={() => setPrompt(false)} className="fa-solid fa-xmark"></i>
        <div className="pui-header">
          <p className="pui-playlist-title">{props.playlist.name} {
            props.playlist.private ? (
              <i className="fa-solid fa-lock"></i>
            ) : <i className="fa-solid fa-earth-americas"></i>
          } {sourceIcons}</p>
        </div>
        
        <Link to={`/users/show/${props.playlist.user.id}`} className="pui-au-div">
          <img src={props.playlist.user.avatar.url} className="pui-avatar" height="30" width="30" alt="user avatar" />
          <span>{props.playlist.user.username}</span>
        </Link>

        {ownerBtns}
        
        <div className="pui-videos">
          {videosJsx}

          <button className="pui-show-more" onClick={props.moreVideos} style={props.noResults ? { display: "none" } : {}} id="more-btn">Show More</button>
        </div>
      </div>
    );
  }

  return menuJsx;
}

export default PlaylistUI;