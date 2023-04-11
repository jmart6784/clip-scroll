import React from "react";
import { Link } from "react-router-dom";
import ShortsImage from 'images/shorts.svg'
import RedditImage from 'images/Reddit.png'

const Home = () => {
  return (
    <div>
      <img src={ShortsImage} alt="shorts logo" height="100" width="300" />
      <img src={RedditImage} alt="shorts logo" height="100" width="300" />
      <h1>Home</h1> <br />
      <Link to="/youtube/index">YouTube Index</Link> <br />
      <Link to="/reddit/index">Reddit Index</Link> <br />
      <Link to="/subreddit/index">Subreddit Index</Link> <br />
      <Link to="/playlist/index">Playlist Index</Link>
    </div>
  );
};

export default Home;