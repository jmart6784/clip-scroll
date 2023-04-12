import React, { useContext } from "react";
import { Link } from "react-router-dom";
import GlobalContext from "../context/GlobalContext";

const Nav = () => {
  const [global, setGlobal] = useContext(GlobalContext);
  
  if (global.user) {
    return (
      <div className="nav-parent">
        <div className="nav-wrapper">
          <Link to="/" className="nav-item">
            <i className="fa-solid fa-house"></i>
            <span className="nav-label"> Home</span>
          </Link>

          <button type="button" className="nav-btn nav-item">
            <i className="fa-brands fa-youtube"></i>
            <span className="nav-label"> YouTube</span>
          </button>

          <button type="button" className="nav-btn nav-item">
            <i className="fa-sharp fa-regular fa-compass"></i>
            <span className="nav-label"> Explore</span>
          </button>

          <button type="button" className="nav-btn nav-item">
            <i className="fa-brands fa-reddit-alien"></i>
            <span className="nav-label"> Reddit</span>
          </button>

          <button type="button" className="nav-btn nav-item">
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