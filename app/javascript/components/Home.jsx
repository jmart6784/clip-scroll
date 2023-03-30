import React from "react";
import { Link } from "react-router-dom";

const Home = () => {
  return (
    <div>
      <h1>Home</h1> <br />
      <Link to="/youtube/index">YouTube Index</Link> <br />
      <Link to="/reddit/index">Reddit Index</Link> <br />
      <Link to="/subreddit/index">Subreddit Index</Link> <br />
      <Link to="/playlist/index">Playlist Index</Link>
    </div>
  );
};

export default Home;