import React, { useEffect, useState, useMemo } from "react";
import { Link } from "react-router-dom";

const UserIndex = () => { 
  const [users, setUsers] = useState([]);

  useEffect(() => {
    fetch("/api/v1/users/index")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setUsers(response))
      .catch(() => console.log("Error getting users index"));
  }, []);

  let usersJsx = users.map(user => <div key={user.id}><Link to={`/users/show/${user.id}`}>{user.email}</Link></div>);

  return (
    <div>
      <h1>User Index</h1>
      {usersJsx}
    </div>
  );
}

export default UserIndex;