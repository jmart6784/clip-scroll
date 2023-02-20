import React, { useContext } from "react";
import { Link } from "react-router-dom";
import UserContext from "../context/UserContext";

const Nav = () => {
  const [user, setUser] = useContext(UserContext);
  
  if (user.id) {
    return (
      <div>
        <Link to="/">Home</Link>
        <Link to={`/users/show/${user.id}`}>Show Profile</Link>
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