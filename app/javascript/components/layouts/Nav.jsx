import React, { useContext, useEffect } from "react";
import { Link } from "react-router-dom";
import GlobalContext from "../context/GlobalContext";

const Nav = () => {
  const [global, setGlobal] = useContext(GlobalContext);
  
  if (global.user) {
    return (
      <div>
        <Link to="/">Home</Link>
        <Link to="/users/index">User Index</Link>
        <Link to="/playlist/new">New Playlist</Link>
        <Link to={`/users/show/${global.user.id}`}>Show Profile</Link>
        <a href="/users/edit" >Edit profile</a>
        <a rel="nofollow" data-method="delete" href="/users/sign_out">Log out</a>
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