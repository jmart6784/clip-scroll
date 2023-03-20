import React from "react";
import RedditComments from "./RedditComments";

const RedditVideo = (props) => {
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

  return (
    <div key={postId}>
      <p>{postId}</p>
      <p>{post['data']['subreddit_name_prefixed']}</p>
      <p>{post['data']['title']}</p>
      <p>Upvotes {post['data']['score']}</p>
      <p>Posted by {post['data']['author']}</p>
      <p>All awardings: {awards}</p>
      <p>Comments: {post['data']['num_comments']}</p>
      <video id="reddit-video" src={post['data']['media']['reddit_video']['fallback_url']} onTimeUpdate={(e) => synchronize(e)} width="300" height="500" controls autoPlay></video>
      <audio id="reddit-audio" src={audioUrl} controls autoPlay />
      <RedditComments postId={postId} />
    </div>
  );
}

export default RedditVideo;