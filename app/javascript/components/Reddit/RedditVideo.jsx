import React, { useState } from "react";
import RedditComments from "./RedditComments";
import SnooImage from 'images/reddit_snoo.png'

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
    <div key={postId}>
      <p>{postId}</p>
      <p>{post['data']['subreddit_name_prefixed']}</p>
      <p>{post['data']['title']}</p>
      <p>Upvotes {post['data']['score']}</p>
      <p>Posted by {post['data']['author']}</p>
      <p>All awardings: {awards}</p>
      <p>Comments: {post['data']['num_comments']}</p>
      
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

      <button type="button" onClick={() => setPrompt(!prompt)}>Comments</button>

      {prompt ? <RedditComments postId={postId} subreddit={post['data']['subreddit']} /> : ""}
    </div>
  );
}

export default RedditVideo;