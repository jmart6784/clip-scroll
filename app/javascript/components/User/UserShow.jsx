import React, { useState, useEffect } from "react";

const UserShow = (props) => { 
  const [showUser, setShowUser] = useState({
    id: "",
    email: "",
    first_name: "",
    last_name: "",
    username: "",
    bio: "",
    avatar: { url: "" },
  });

  useEffect(() => {
    const {
      match: {
        params: { id },
      },
    } = props;

    fetch(`/api/v1/users/show/${id}`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setShowUser(response))
      .catch(() => props.history.push("/"));
  }, [props.match.params.id]);

  return (
    <div className="user-show-wrapper">
      
      <div className="user-show">
        <div style={{ backgroundImage: `url(${showUser.avatar.url})` }} className="background-image user-show-avatar" alt="user avatar"></div>

        <div className="user-show-username">{showUser.username}</div>
        <div className="us-fullname">{`${showUser.first_name} ${showUser.last_name}`}</div>

        <div className="user-show-bio">{showUser.bio}</div>
      </div>

    </div>
  );
}

export default UserShow;