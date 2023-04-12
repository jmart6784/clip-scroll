import React from "react";
import { Link } from "react-router-dom";
import ShortsImage from 'images/shorts.svg'
import RedditImage from 'images/Reddit.png'

const Home = () => {
  return (
    <div>
      <div className="home-logo-wrapper">
        <h3 className="home-title">What do you want to watch?</h3>
        <Link to="/youtube/index" className="home-logo">
          <img src={ShortsImage} alt="shorts logo" height="100" width="300" />
        </Link>
        <Link to="/reddit/index" className="home-logo">
          <img src={RedditImage} alt="shorts logo" height="100" width="300" />
        </Link>
      </div>
    </div>
  );
};

export default Home;