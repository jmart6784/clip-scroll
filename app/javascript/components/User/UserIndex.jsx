import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import GeneralLoading from "../../helpers/GeneralLoading";
import GeneralNoResults from "../../helpers/GeneralNoResults";
import ExploreNav from "../Playlist/ExploreNav";

const UserIndex = () => { 
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch("/api/v1/users/index")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setUsers(response), setLoading(false))
      .catch(() => console.log("Error getting users index"));
  }, []);

  let usersJsx = users.map(user => {
    return (
      <div key={user.id} className="user-card">
        <div style={{ backgroundImage: `url(${user.avatar.url})` }} className="background-image user-avatar-index" alt="user avatar"></div>
        
        <span className="user-card-name">{user.username}</span>

        <p className="user-index-bio">{user.bio}</p>
      </div>
    );
  });

  let mainJsx = <GeneralLoading />;

  if (loading === false && users.length > 0) {
    mainJsx = (
      <div className="yt-channels-wrapper">
        <ExploreNav view="community" />
        <div className="user-index-wrapper">{usersJsx}</div>
      </div>
    );
  } else if (loading === false && users.length === 0) { 
    mainJsx = <GeneralNoResults />;
  }

  return mainJsx;
}

export default UserIndex;