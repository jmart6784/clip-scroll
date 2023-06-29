import React, { useEffect, useState, useContext } from "react";
import YoutubeVideo from "../YouTube/YouTubeVideo";
import RedditVideo from "../Reddit/RedditVideo";
import GlobalContext from "../context/GlobalContext";
import GeneralNoResults from "../../helpers/GeneralNoResults";
import GeneralLoading from "../../helpers/GeneralLoading";
import PlaylistUI from "./PlaylistUI";

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
  const [loading, setLoading] = useState(true);
  const [global, setGlobal] = useContext(GlobalContext);

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

  const nextVideo = () => index != videos.length - 1 ? setIndex(index + 1) : moreVideos();
  const previousVideo = () => index > 0 ? setIndex(index - 1) : "";

  let vidJsx = <div>...Loading</div>;

  // Render Youtube or Reddit video depending on video source
  if (videos[index]) {
    if (videos[index]['source'] == 'youtube') {
      if (videos[index]) {
        vidJsx = (
          <YoutubeVideo
            id={videos[index]["video"]["items"][0]["id"]} 
            previousVideo={previousVideo}
            nextVideo={nextVideo} 
          />
        );
      } else {
        vidJsx = <div>..Loading YouTube video</div>;
      }
    } else if (videos[index]['source'] == 'reddit') { 
      // If API request has added 'video' key render Reddit video, else loading screen
      if (videos[index]['video']) {
        vidJsx = (
          <RedditVideo
            post={videos[index]['video']} 
            previousVideo={previousVideo}
            nextVideo={nextVideo} 
          />
        );
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
        setLoading(false);
        if (response.length < 5) {
          setNoResults(true);
          document.getElementById("more-btn").style.display = "none";
        }
      })
      .catch(() => console.log("Error getting playlist video data"));
  }

  let mainJsx = <GeneralLoading />;

  if (loading === false && videos.length > 0) {
    mainJsx = (
      <div>
        <PlaylistUI
          playlist={playlist}
          videos={videos}
          setIndex={setIndex}
          setVideos={setVideos}
          moreVideos={moreVideos}
          noResults={noResults}
          index={index}
        />
        <div className="yt-video-listing-div">{vidJsx}</div>
      </div>
    );
  } else if (loading === false && videos.length === 0) { 
    mainJsx = <GeneralNoResults />;
  }

  return mainJsx;
}

export default PlaylistShow;