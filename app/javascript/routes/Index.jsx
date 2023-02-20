import React, { useState, useEffect } from "react";
import { HashRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../components/Home";
import Nav from "../components/layouts/Nav";
import UserContext from "../components/context/UserContext";

const Index = () => { 
  const [user, setUser] = useState({});

  useEffect(() => {
    fetch("/api/v1/users/user_info", {
      method: "GET",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        "Content-Type": "application/json",
      },
    })
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setUser(response))
      .catch((error) => console.log(error));
  }, []);

  return (
    <UserContext.Provider value={[user, setUser]}>
      <Router>
        <Nav />
        <Switch>
          <Route path="/" exact component={Home} />
        </Switch>
      </Router>
    </UserContext.Provider>
  );
};

export default Index;