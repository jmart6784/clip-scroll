import React from "react";
import { Link } from "react-router-dom";

const ProfileMenu = () => { 
  return (
    <div>
      <Link to={`/users/show/${global.user.id}`}>Show Profile</Link>
      <a href="/users/edit" >Edit profile</a>
      <a rel="nofollow" data-method="delete" href="/users/sign_out">Log out</a>
    </div>
  );
}

export default ProfileMenu;