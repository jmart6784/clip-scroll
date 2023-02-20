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
    <div>
      <h1>User Show</h1>
      <p>{`${showUser.first_name} ${showUser.last_name}`}</p>
    </div>
  );
}

export default UserShow;