import React, { useState } from "react";
import { Link } from "react-router-dom";
import RedditComments from "./RedditComments";
import PlaylistVideoMenu from "../Playlist_video/PlaylistVideoMenu";
import prettyNumbers from "../../helpers/prettyNumbers";
import Draggable, {DraggableCore} from "react-draggable";

const RedditVideo = (props) => {
  const [prompt, setPrompt] = useState(false);
  const [playlistsShow, setPlaylistsShow] = useState(false);
  const [commentsShow, setCommentsShow] = useState(false);
  const [videoDrag, setVideoDrag] = useState(false);
  const toggleComments = () => setCommentsShow(!commentsShow);
  const togglePlaylists = () => setPlaylistsShow(!playlistsShow);
  const togglePrompt = () => setPrompt(!prompt);

  let post = props.post;
  let postId = post['data']['id']
  let awards = 0;
  let audioUrl = post['data']['media']['reddit_video']['scrubber_media_url'];
  audioUrl = audioUrl.replace(/DASH_.*?.mp4/, 'DASH_audio.mp4');

  post['data']['all_awardings'].forEach(award => awards += award['count']);

  // Synchronize video and audio data
  const synchronize = (e) => { 
    let video = e.target;
    let audio = document.getElementById("reddit-audio");
    audio.currentTime = video.currentTime;
    video.paused ? audio.pause() : "";
    !video.paused ? audio.play() : "";
  }

  const playPause = (e) => { 
    let video = e.target;
    video.paused ? video.play() : video.pause(); 
  }

  let menuStyling = {};
  let commentStyling = {};
  let statStyling = {};
  // Change styling on reddit stats items if comments or playlist menu is showing
  if (playlistsShow || prompt) {
    menuStyling = {
      width: "100%",
      height: "100%",
      backgroundColor: "rgba(0, 0, 0, 0.5)",
      backdropFilter: "blur(5px)",
      margin: "0",
      overflowY: "auto"
    }
    statStyling = {display: "none"};
  } else {
    menuStyling = {
      width: "15%",
      backgroundColor: "rgba(0, 0, 0, 0.0)"
    }
    statStyling = {display: "block"};
  }

  const handleStop = (event, dragElement) => {
    if (dragElement.y >= 120 || dragElement.y <= -120) {
      dragElement.y > 0 ? props.previousVideo() : props.nextVideo();
    }
  };

  // Toggle draggability of video component, disabled when playlist or comments menu is displayed
  const toggleDrag = () => setVideoDrag(!videoDrag);

  return (
    <Draggable axis="y" position={{ x: 0, y: 0 }} disabled={videoDrag} onStop={handleStop}>
      <div key={postId} className="reddit-video-wrapper">
        <p className="reddit-video-title" style={statStyling}>
          <Link to={`/reddit/show/${post['data']['subreddit']}`}>{post['data']['subreddit_name_prefixed']}</Link>
        </p>

        <div className="reddit-video-author-title" style={statStyling}>
          <p className="reddit-video-author">u/{post['data']['author']}</p>
          <p className="rv-title">{post['data']['title']}</p>
        </div>

        <div className="reddit-stats" style={menuStyling}>
          <div className="reddit-stat" style={statStyling}>
            <i className="fa-solid fa-up-long reddit-stat-icon"></i>
            <p>{prettyNumbers(post['data']['score'], 1)}</p>
            <i className="fa-solid fa-down-long reddit-stat-icon"></i>
          </div>

          <button
            type="button"
            className="reddit-stat reddit-comment-btn"
            style={statStyling}
            disabled={parseInt(post['data']['num_comments']) === 0}
            onClick={() => {
              setPrompt(!prompt);
              toggleDrag();
            }}
          >
            <i className="fa-regular fa-message reddit-stat-icon"></i>
            {prettyNumbers(post['data']['num_comments'], 1)}
          </button>

          <p className="reddit-stat" style={statStyling}>
            <i className="fa-solid fa-gift reddit-stat-icon"></i> {prettyNumbers(awards, 1)}
          </p>
          
          { 
            prompt ? "" : 
              <PlaylistVideoMenu
                videoId={post['data']['id']}
                parentSourceId={post['data']['subreddit']}
                source="reddit"
                togglePlaylists={togglePlaylists}  
                toggleDrag={toggleDrag}
              />
          }

          {
            prompt ?
              <RedditComments
                postId={postId}
                subreddit={post['data']['subreddit']}
                togglePrompt={togglePrompt}
                toggleDrag={toggleDrag}
              /> : ""
          }
        </div>
        
        <video
          id="reddit-video"
          src={post['data']['media']['reddit_video']['fallback_url']}
          onTimeUpdate={(e) => synchronize(e)}
          onClick={(e) => playPause(e)}
          width="400"
          height="700"
          autoPlay
          loop
        />
        <audio id="reddit-audio" src={audioUrl} controls autoPlay />
      </div>
    </Draggable>
  );
}

export default RedditVideo;