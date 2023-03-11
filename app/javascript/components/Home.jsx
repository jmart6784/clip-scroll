import React from "react";
import { Link } from "react-router-dom";

const Home = () => {
  return (
    <div>
      <h1>Home</h1>
      <Link to="/youtube/index">YouTube Index</Link>
      <Link to="/playlist/index">Playlist Index</Link>
    </div>
  );
};

export default Home;