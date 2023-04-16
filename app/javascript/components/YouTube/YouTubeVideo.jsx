import React, { useEffect, useState } from "react";
import YouTube from 'react-youtube';
import YouTubeComments from "./YouTubeComments";

const YoutubeVideo = (props) => { 
  const [video, setVideo] = useState({});
  const [commentsShow, setCommentsShow] = useState(false);
  
  useEffect(() => { 
    // Example of deleted video /api/v1/youtube/video/xRa9SZUdk_Q
    fetch(`/api/v1/youtube/video/${props.id}`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setVideo(response))
      .catch(() => console.log("Failed to get video"));
  }, [props.id]);

  const onReady = (event) =>  event.target.unMute();
  const onEnd = (event) => event.target.playVideo();
  const toggleComments = () => setCommentsShow(!commentsShow);

  let videoId;
  let stats;
  let statsJsx = <div>No stats available</div>;
  let commentsJsx = <div>No comments available</div>;

  if (video.items) {
    if (video.items.length != 0) { 
      videoId = video.items ? video.items[0].id : '';
      stats = video.items ? video.items[0].statistics : { viewCount: '0', likeCount: '0', favoriteCount: '0', commentCount: '0' };

      statsJsx = (
        <div className="youtube-video-stats-wrapper">
          <div className="yt-stat-div">
            <i className="fa-solid fa-thumbs-up"></i> <span>{stats.likeCount}</span>
          </div>

          <div className="yt-stat-div">
            <i className="fa-solid fa-thumbs-down"></i> <span></span>
          </div>

          <div className="yt-stat-div">
            <i className="fa-solid fa-eye"></i> <span>{stats.viewCount}</span>
          </div>

          <YouTubeComments
            id={videoId}
            commentCount={video.items ? video.items[0].statistics.commentCount : ""}
            toggleComments={toggleComments}
          />

          {/* Comments: {stats.commentCount} */}
        </div>
      );
      // commentsJsx = (
      //   <YouTubeComments
      //     id={videoId}
      //     commentCount={video.items ? video.items[0].statistics.commentCount : ""}
      //   />
      // );
    }
  }

  useEffect(() => console.log(commentsShow), [commentsShow]);
  
  return (
    <div>
      <div className="youtube-video-div">
        <YouTube
          videoId={videoId}
          id={"youtube-video-main"}
          className={"youtube-video"}
          opts={{
            height: "700",
            width: "400",
            playerVars: {
              autoplay: 1,
              mute: 0,
              loop: 1,
              controls: 0,
              enablejsapi: 1,
              fs: 0,
              playlist: `${videoId}`,
            },
          }}
          onReady={onReady}
          onEnd={onEnd}
        />
        
        {statsJsx}
        {/* {commentsJsx} */}
      </div>
    </div>
  );
}

export default YoutubeVideo;