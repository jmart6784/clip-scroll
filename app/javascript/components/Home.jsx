import React from "react";
import { Link } from "react-router-dom";
import ShortsImage from 'images/shorts.svg'
import RedditImage from 'images/Reddit.png'

const Home = () => {
  return (
    <div>
      <Link to="/youtube/index">
        <img src={ShortsImage} alt="shorts logo" height="100" width="300" />
      </Link>
      <Link to="/reddit/index">
        <img src={RedditImage} alt="shorts logo" height="100" width="300" />
      </Link>
    </div>
  );
};

export default Home;