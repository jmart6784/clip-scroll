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
    let bio = user.bio;
    
    if (user.bio != null) {
      let truncated = '';

      truncated = (
        <>
          <span id={`user-read-more-${user.id}`}>{`${user.bio.slice(0, 100)}...`}</span>

          <span onClick={(e) => {
            let span1 = document.getElementById(`user-read-more-${user.id}`);

            if (e.target.textContent === "Read more") {
              e.target.textContent = "Read less";
              span1.textContent = `${user.bio}...`;
            } else { 
              e.target.textContent = "Read more";
              span1.textContent = `${user.bio.slice(0, 100)}...`;
            }
          }}>Read more</span>
        </>
      );

      bio = user.bio.length >= 100 ? truncated : user.bio;
    }

    return (
      <div key={user.id} className="user-card">
        <div style={{ backgroundImage: `url(${user.avatar.url})` }} className="background-image user-avatar-index" alt="user avatar"></div>
        
        <span className="user-card-name">{user.username}</span>

        <p className="user-index-bio">{bio}</p>
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