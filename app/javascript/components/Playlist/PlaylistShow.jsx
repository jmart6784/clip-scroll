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

  // Reddit API request for current video
  useEffect(() => {
    if (videos[index]) {
      if (videos[index]['source'] == 'reddit') {
        // Single video API response
        fetch(`https://www.reddit.com/r/${videos[index]['parent_source_id']}/${videos[index]['video_id']}.json?raw_json=1`)
          .then((response) => {
            if (response.ok) {
              return response.json();
            }
            throw new Error("Network response was not ok.");
          })
          .then((response) => {
            // Skip API request if video data is already present
            if (videos[index]['video'] === undefined) {
              let vids = [...videos];
              // Add API video data to playlist video object and then to vids array
              vids[index] = {
                ...vids[index],
                ['video']: response[0]['data']['children'][0]
              };

              setVideos(vids);
            }
          })
          .catch(() => console.log("Error getting posts data"));
      }
    }
  }, [videos, index]);

  // Select video by index when option is clicked on playlist menu
  const selectVideo = (videoId) => { 
    let index = videos.findIndex(v => v.video_id === videoId);
    index != -1 ? setIndex(index) : ""
  }

  let i = -1;
  
  // Render click-able playlist menu options
  let videosJsx = videos.map(v => { 
    if (v['source'] == 'youtube') {
      let video = v["video"]["items"][0]["snippet"];
      let videoId = v["video"]["items"][0]["id"];
      let stats = v["video"]["items"][0]["statistics"];
      i += 1;
      let selectedStyle = index == i ? { border: "1px solid black" } : {};

      return (
        <div key={videoId} onClick={() => selectVideo(videoId)} style={{ ...selectedStyle, cursor: "pointer" }}>
          <img src={video.thumbnails.default.url} alt="video thumbnail" />
          <p>{video.title}</p>
          <p>{video.channelTitle}</p>
          <p>{stats.viewCount}</p>
        </div>
      );
    } else if (v['source'] == 'reddit') { 

    }
  });

  const nextVideo = () => index != videos.length - 1 ? setIndex(index + 1) : "";
  const previousVideo = () => index > 0 ? setIndex(index - 1) : "";

  let video = <div>Loading...</div>
  // Render Youtube or Reddit video depending on video source
  if (videos[index]) {
    if (videos[index]['source'] == 'youtube') {
      video = videos[index] ? <YoutubeVideo id={videos[index]["video"]["items"][0]["id"]} /> : "Loading..."
    } else if (videos[index]['source'] == 'reddit') { 
      // If API request has added 'video' key render Reddit video, else loading screen
      if (videos[index]['video']) {
        video = <RedditVideo post={videos[index]['video']} />;
      } else {
        video = <div>..Loading Reddit video</div>;
      }
    }
  }

  useEffect(() => console.log("EFFECT: ", playlist, videos), [playlist, videos]);

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