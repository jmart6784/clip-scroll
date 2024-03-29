import React, { useEffect, useState } from "react";
import YouTube from 'react-youtube';
import YouTubeComments from "./YouTubeComments";
import prettyNumbers from "../../helpers/prettyNumbers";
import PlaylistVideoMenu from "../Playlist_video/PlaylistVideoMenu";
import Draggable from "react-draggable";

const YoutubeVideo = (props) => {
  const [video, setVideo] = useState({});
  const [commentsShow, setCommentsShow] = useState(false);
  const [playlistsShow, setPlaylistsShow] = useState(false);
  const [videoDrag, setVideoDrag] = useState(false);
  const [lastUp, setLastUp] = useState(0);
  const [lastDown, setLastDown] = useState(0);
  
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

  const onReady = (event) => event.target.unMute();
  const onEnd = (event) => event.target.playVideo();
  const toggleComments = () => setCommentsShow(!commentsShow);
  const togglePlaylists = () => setPlaylistsShow(!playlistsShow);
  // Toggle draggability of video component, disabled when playlist or comments menu is displayed
  const toggleDrag = () => setVideoDrag(!videoDrag);

  // Detect arrow up and down key presses
  useEffect(() => {
    const downHandler = ({ key }) => {
      // Delay key press by 1 second then fire next/previous video
      if (Date.now() - lastDown < 1000) return;
      key === "ArrowDown" || key == "s" ? props.nextVideo() : ''; 
      setLastDown(Date.now());
    }
  
    const upHandler = ({ key }) => {
      if (Date.now() - lastUp < 1000) return;
      key === "ArrowUp" || key == "w" ? props.previousVideo() : ''; 
      setLastUp(Date.now());
    };

    window.addEventListener("keydown", downHandler);
    window.addEventListener("keyup", upHandler);

    return () => {
      window.removeEventListener("keydown", downHandler);
      window.removeEventListener("keyup", upHandler);
    };
  }, [lastUp, lastDown]);

  let videoId;
  let channelId;
  let stats;
  let statsJsx = '';

  if (video.items) {
    if (video.items.length != 0) {
      videoId = video.items ? video.items[0].id : '';
      channelId = video.items ? video.items[0].snippet.channelId : '';
      stats = video.items ? video.items[0].statistics : { viewCount: '0', likeCount: '0', favoriteCount: '0', commentCount: '0' };

      // Change style of parent div when comment or playlist menu is visible
      let menuStyle = commentsShow || playlistsShow ? (
        {
          margin: 0,
          width: '100%',
          height: '100%',
          backgroundColor: 'rgba(0, 0, 0, 0.5)',
          backdropFilter: 'blur(5px)'
        }
      ) : {};
      let commentCount = 0;

      if (video.items) {
        commentCount = video.items[0].statistics.commentCount;
      }

      let cJsx = (
        <button type="button" className="show-comments-btn yt-stat-div">
          <i className="fa-solid fa-message"></i> <span>{commentCount}</span>
        </button>
      );

      if (commentCount > 0) {
        cJsx = (
          <YouTubeComments
            id={videoId}
            commentCount={commentCount}
            toggleComments={toggleComments}
            toggleDrag={toggleDrag}
          />
        );
      }

      statsJsx = (
        <div className="youtube-video-stats-wrapper" style={menuStyle}>
          {/* If comment or playlist menu is visible, icons */}
          {commentsShow || playlistsShow ? '' : (
            <>
              <div className="yt-stat-div">
                <i className="fa-solid fa-thumbs-up"></i>
                <span>{prettyNumbers(stats.likeCount, 1)}</span>
              </div>

              <div className="yt-stat-div">
                <i className="fa-solid fa-thumbs-down"></i> <span></span>
              </div>

              <div className="yt-stat-div">
                <i className="fa-solid fa-eye"></i>
                <span>{prettyNumbers(stats.viewCount, 1)}</span>
              </div>
            </>
          )}
          {/* If playlist menu is visible, hide comment menu */}
          {playlistsShow ? '' : cJsx}
          {/* If comment menu is visible, hide playlist menu */}
          {
            commentsShow ? '' : (
              <PlaylistVideoMenu
                videoId={videoId}
                parentSourceId={channelId}
                source="youtube"
                togglePlaylists={togglePlaylists}
                toggleDrag={toggleDrag}
              />
            )
          }
        </div>
      );
    }
  }

  // Dragging element an element inside the deadzone will not trigger next or previous video
  const handleStop = (event, dragElement) => {
    if (dragElement.y >= 120 || dragElement.y <= -120) {
      dragElement.y > 0 ? props.previousVideo() : props.nextVideo();
    }
  };

  
  return (
    <Draggable
      axis="y" position={{ x: 0, y: 0 }}
      disabled={videoDrag}
      onStop={handleStop}
      allowAnyClick={true}
    >
      <div className="youtube-video-div">
        <div className="drag-bypass"></div>
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
      </div>
    </Draggable>
  );
}

export default YoutubeVideo;