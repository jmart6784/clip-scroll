import React from "react";
import { Link } from "react-router-dom";

const Nav = () => {
  return (
    <div>
      <Link to="/">Home</Link>
      <a href="/users/sign_in">Sign In</a>
      <a href="/users/sign_up">Sign Up</a>
    </div>
  );
};

export default Nav;