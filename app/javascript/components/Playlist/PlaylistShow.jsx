import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import PlaylistDelete from "./PlaylistDelete";
import YoutubeVideo from "../YouTube/YouTubeVideo";
import RedditVideo from "../Reddit/RedditVideo";

const PlaylistShow = (props) => {
  const [playlist, setPlaylist] = useState({
    id: 0,
    name: '',
    source: 'mix',
    private: false,
    user_id: 0,
    created_at: '',
    updated_at: '',
    user: { id: 0, email: '', first_name: '', last_name: '', username: '', bio: "", avatar: { url: "" } }
  });
  const [index, setIndex] = useState(0);
  const [videos, setVideos] = useState([]);
  const [offset, setOffset] = useState(0);
  const [noResults, setNoResults] = useState(false);

  useEffect(() => {
    fetch(`/api/v1/playlist/show/${props.match.params.id}`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setPlaylist(response))
      .catch(() => console.log("Error getting data"));
      
    moreVideos();
  }, []);

  // Select video by index when option is clicked on playlist menu
  const selectVideo = (videoId) => {
    let index = videos.findIndex(v => v.video_id === videoId);
    index != -1 ? setIndex(index) : ""
  }
  
  // Render click-able playlist menu options
  let videosJsx = videos.map((v, i) => {
    let selectedStyle = index == i ? { border: "1px solid black", cursor: "pointer"  } : {};
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
        </div>
      );
    } else if (v['source'] == 'reddit') { 
      let video = v['video']['data'];

      return (
        <div key={v['id']} onClick={() => selectVideo(video['id'])} style={selectedStyle}>
          <img src={video['thumbnail']} alt="video thumbnail" />
          <strong>Reddit: {v['video_id']}</strong>
          <p>{video['title']}</p>
          <p>{video['subreddit']}</p>
          <p>{video['score']}</p>
        </div>
      ); 
    }
  });

  let vidJsx = <div>...Loading</div>;

  // Render Youtube or Reddit video depending on video source
  if (videos[index]) {
    if (videos[index]['source'] == 'youtube') {
      if (videos[index]) {
        vidJsx = <YoutubeVideo id={videos[index]["video"]["items"][0]["id"]} />;
      } else {
        vidJsx = <div>..Loading YouTube video</div>;
      }
    } else if (videos[index]['source'] == 'reddit') { 
      // If API request has added 'video' key render Reddit video, else loading screen
      if (videos[index]['video']) {
        vidJsx = <RedditVideo post={videos[index]['video']} />;
      } else {
        vidJsx = <div>..Loading Reddit video</div>;
      }
    }
  }

  const moreVideos = () => { 
    fetch(`/api/v1/playlist_videos/videos/${props.match.params.id}?offset=${offset}`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => {
        // Set video response and update offset
        setVideos([...videos, ...response]);
        setOffset(offset + 5);
        if (response.length == 0) {
          setNoResults(true);
        }
      })
      .catch(() => console.log("Error getting playlist video data"));
  }

  const nextVideo = () => index != videos.length - 1 ? setIndex(index + 1) : moreVideos();
  const previousVideo = () => index > 0 ? setIndex(index - 1) : "";

  // useEffect(() => console.log("EFFECT: ", videos, index), [videos, index]);

  return (
    <div>
      <h1>Playlist Show</h1>
      <p>name: {playlist.name}</p>
      <p>Private: {playlist.private.toString()}</p>
      <p>Source: {playlist.source}</p>
      <Link to={`/playlist/edit/${playlist.id}`}>Edit</Link>
      <PlaylistDelete id={playlist.id} />
      <p>{playlist.user.username}</p>
      <Link to={`/users/show/${playlist.user.id}`}>
        <img src={playlist.user.avatar.url} height="50" width="50" alt="user avatar" />
        <span>{playlist.user.username}</span>
      </Link>
      <button onClick={previousVideo}>Previous</button>
      <button onClick={nextVideo} disabled={noResults}>Next</button>
      {vidJsx}
      {videosJsx}
    </div>
  );
}

export default PlaylistShow;