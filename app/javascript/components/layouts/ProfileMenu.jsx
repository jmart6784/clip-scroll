import React from "react";
import { Link } from "react-router-dom";

const ProfileMenu = (props) => { 
  let userId = props.user ? props.user.id : '';

  return (
    <div className="menu-div">
      <div className="menu-link-wrapper">
        <button className="close-nav-menu" type="button" onClick={() => props.hideMenu()}>
          <i className="fa-solid fa-xmark"></i>
        </button>

        <Link to={`/users/show/${userId}`} onClick={() => props.hideMenu()} className="menu-link">
          <i className="fa-solid fa-face-grin"></i> <span>My Profile</span>
        </Link>

        <a href="/users/edit" onClick={() => props.hideMenu()} className="menu-link">
          <i className="fa-solid fa-user-pen"></i> <span>Edit profile</span>
        </a>

        <a rel="nofollow" data-method="delete" href="/users/sign_out" onClick={() => props.hideMenu()} className="menu-link">
          <i className="fa-solid fa-power-off"></i> <span>Log out</span>
        </a>
      </div>
    </div>
  );
}

export default ProfileMenu;