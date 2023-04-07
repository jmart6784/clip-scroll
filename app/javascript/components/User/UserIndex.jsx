import React, { useEffect, useState, useMemo } from "react";
import { Link } from "react-router-dom";

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

  let usersJsx = users.map(user => <div key={user.id}><Link to={`/users/show/${user.id}`}>{`${user.first_name} ${user.last_name}`}</Link></div>);

  let mainJsx = <h1>...Loading</h1>;

  if (loading === false && users.length > 0) {
    mainJsx = (
      <div>
        <h1>User Index</h1>
        {usersJsx}
      </div>
    );
  } else if (loading === false && users.length === 0) { 
    mainJsx = (
      <div>No Results</div>
    );
  }

  return mainJsx;
}

export default UserIndex;