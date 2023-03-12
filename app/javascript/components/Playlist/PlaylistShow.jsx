import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import PlaylistDelete from "./PlaylistDelete";
import YoutubeVideo from "../YouTube/YouTubeVideo";

const PlaylistShow = (props) => { 
  const [playlist, setPlaylist] = useState({
    id: 0,
    name: '',
    source: 'youtube',
    private: false,
    user_id: 0,
    created_at: '',
    updated_at: '',
    user: { id: 0, email: '', first_name: '', last_name: '', username: '', bio: "", avatar: { url: ""} }
  });
  const [index, setIndex] = useState(0);

  const [videos, setVideos] = useState([]);

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
    
    fetch(`/api/v1/playlist_videos/videos/${props.match.params.id}`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setVideos(response))
      .catch(() => console.log("Error getting playlist video data"));
  }, []);

  let videosJsx = videos.map(v => { 
    let video = v["video"]["items"][0]["snippet"];
    let videoId = v["video"]["items"][0]["id"];
    let stats = v["video"]["items"][0]["statistics"];

    return (
      <div key={videoId}>
        <img src={video.thumbnails.default.url} alt="video thumbnail" />
        <p>{video.title}</p>
        <p>{video.channelTitle}</p>
        <p>{stats.viewCount}</p>
      </div>
    );
  });

  useEffect(() => console.log(videos), [videos]);

  const nextVideo = () => index != videos.length - 1 ? setIndex(index + 1) : "";
  const previousVideo = () => index > 0 ? setIndex(index - 1) : "";

  let video = videos[index] ? <YoutubeVideo id={videos[index]["video"]["items"][0]["id"]} /> : "Loading..."

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
      <button onClick={nextVideo}>Next</button>
      {video}
      {videosJsx}
    </div>
  );
}

export default PlaylistShow;