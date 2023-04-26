import React, { useContext, useState } from "react";
import { Link } from "react-router-dom";
import GlobalContext from "../context/GlobalContext";
import YouTubeMenu from "./YouTubeMenu";
import RedditMenu from "./RedditMenu";
import ExploreMenu from "./ExploreMenu";
import ProfileMenu from "./ProfileMenu";

const Nav = () => {
  const [global, setGlobal] = useContext(GlobalContext);
  const [currentMenu, setCurrentMenu] = useState('');
  const [visbility, setvisibility] = useState({ youtube: false, reddit: false, explore: false, profile: false });
  
  const hideMenu = () => {
    setCurrentMenu('');
    setvisibility({ youtube: false, reddit: false, explore: false, profile: false })
  };

  const toggleMenu = (selection) => { 
    if (selection == "youtube") {
      // Toggle menu visibility depending on next updated value ( !visbility.youtube  )
      !visbility.youtube ? setCurrentMenu(<YouTubeMenu hideMenu={hideMenu} />) : setCurrentMenu('');
    } else if (selection == "reddit") {
      !visbility.reddit ? setCurrentMenu(<RedditMenu hideMenu={hideMenu} />) : setCurrentMenu('');
    } else if (selection == "explore") { 
      !visbility.explore ? setCurrentMenu(<ExploreMenu hideMenu={hideMenu} />) : setCurrentMenu('');
    } else if (selection == "profile") { 
      !visbility.profile ? setCurrentMenu(<ProfileMenu hideMenu={hideMenu} user={global.user} />) : setCurrentMenu('');
    }

    // Update nav menu visibility
    setvisibility({
      reddit: false,
      youtube: false,
      explore: false,
      profile: false,
      [`${selection}`]: !visbility[selection]
    });
  }
  
  if (global.user) {
    return (
      <div className="nav-parent">
        {currentMenu}
        <div className="nav-wrapper">
          <Link to="/" className="nav-item" onClick={() => hideMenu()}>
            <i className="fa-solid fa-house"></i>
            <span className="nav-label"> Home</span>
          </Link>

          <button type="button" className="nav-btn nav-item" onClick={() => toggleMenu("youtube")}>
            <i className="fa-brands fa-youtube"></i>
            <span className="nav-label"> YouTube</span>
          </button>

          <button type="button" className="nav-btn nav-item" onClick={() => toggleMenu("explore")}>
            <i className="fa-sharp fa-regular fa-compass"></i>
            <span className="nav-label"> Explore</span>
          </button>

          <button type="button" className="nav-btn nav-item" onClick={() => toggleMenu("reddit")}>
            <i className="fa-brands fa-reddit-alien"></i>
            <span className="nav-label"> Reddit</span>
          </button>

          <button type="button" className="nav-btn nav-item" onClick={() => toggleMenu("profile")}>
            <i className="fa-solid fa-user"></i>
            <span className="nav-label"> Profile</span>
          </button>
        </div>
      </div>
    );
  } else { 
    return (
      <div>
        <Link to="/">Home</Link>
        <a href="/users/sign_in">Sign In</a>
        <a href="/users/sign_up">Sign Up</a>
      </div>
    );
  }
};

export default Nav;