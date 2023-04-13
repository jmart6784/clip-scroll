import React from "react";
import { Link } from "react-router-dom";

const ProfileMenu = (props) => { 
  return (
    <div>
      <Link to={`/users/show/${props.user.id}`} onClick={() => props.hideMenu()}>Show Profile</Link>
      <a href="/users/edit" onClick={() => props.hideMenu()}>Edit profile</a>
      <a rel="nofollow" data-method="delete" href="/users/sign_out" onClick={() => props.hideMenu()}>Log out</a>
    </div>
  );
}

export default ProfileMenu;