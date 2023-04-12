import React, { useContext } from "react";
import { Link } from "react-router-dom";
import GlobalContext from "../context/GlobalContext";

const Nav = () => {
  const [global, setGlobal] = useContext(GlobalContext);
  
  if (global.user) {
    return (
      <div>
        <Link to="/">
          <i class="fa-solid fa-house"></i>
          <span> Home</span>
        </Link>

        <button type="button">
          <i class="fa-sharp fa-regular fa-compass"></i>
          <span> Explore</span>
        </button>

        <button type="button">
          <i class="fa-brands fa-reddit-alien"></i>
          <span> Reddit</span>
        </button>

        <button type="button">
          <i class="fa-brands fa-youtube"></i>
          <span> YouTube</span>
        </button>

        <button type="button">
          <i class="fa-solid fa-user"></i>
          <span> Profile</span>
        </button>
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