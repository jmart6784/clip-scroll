import React, { useState } from "react";
import { Link } from "react-router-dom";
import RedditComments from "./RedditComments";

const RedditVideo = (props) => {
  const [prompt, setPrompt] = useState(false);

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

  return (
    <div key={postId} className="reddit-video-wrapper">
      <p className="reddit-video-title">
        <Link to={`/reddit/show/${post['data']['subreddit']}`}>{post['data']['subreddit_name_prefixed']}</Link>
      </p>

      <div className="reddit-video-author-title">
        <p className="reddit-video-author">u/{post['data']['author']}</p>
        <p className="rv-title">{post['data']['title']}</p>
      </div>

      <div className="reddit-stats">
        <div className="reddit-stat">
          <i className="fa-solid fa-up-long reddit-stat-icon"></i>
          <p>{post['data']['score']}</p>
          <i className="fa-solid fa-down-long reddit-stat-icon"></i>
        </div>

        <p className="reddit-stat"><i className="fa-solid fa-gift reddit-stat-icon"></i> {awards}</p>

        <button
          type="button"
          className="reddit-stat reddit-comment-btn"
          disabled={parseInt(post['data']['num_comments']) === 0}
          onClick={() => setPrompt(!prompt)}
        >
          <i className="fa-regular fa-message reddit-stat-icon"></i>
          {post['data']['num_comments']}
        </button>
      </div>
      
      <video
        id="reddit-video"
        src={post['data']['media']['reddit_video']['fallback_url']}
        onTimeUpdate={(e) => synchronize(e)}
        onClick={(e) => playPause(e)}
        width="300"
        height="500"
        autoPlay
        loop
      />
      <audio id="reddit-audio" src={audioUrl} controls autoPlay />

      {prompt ? <RedditComments postId={postId} subreddit={post['data']['subreddit']} /> : ""}
    </div>
  );
}

export default RedditVideo;