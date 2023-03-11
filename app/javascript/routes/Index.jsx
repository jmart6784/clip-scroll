import React, { useState, useEffect } from "react";
import { HashRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../components/Home";
import Nav from "../components/layouts/Nav";

import GlobalContext from "../components/context/GlobalContext";
import UserIndex from "../components/User/UserIndex";
import UserShow from "../components/User/UserShow";

import YouTubeIndex from "../components/YouTube/YouTubeIndex";
import YouTubeSearch from "../components/YouTube/YouTubeSearch";
import YouTubeChannels from "../components/YouTube/YouTubeChannels";
import MyChannels from "../components/YouTube/MyChannels";

import PlaylistIndex from "../components/Playlist/PlaylistIndex";

const Index = () => { 
  const [global, setGlobal] = useState({});

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
      .then((response) => setGlobal({ user: { ...response } }))
      .catch((error) => console.log(error));
  }, []);

  return (
    <GlobalContext.Provider value={[global, setGlobal]}>
      <Router>
        <Nav />
        <Switch>
          <Route path="/" exact component={Home} />
          <Route path="/users/index" exact component={UserIndex} />
          <Route path="/users/show/:id" exact component={UserShow} />

          <Route path="/youtube/index" exact component={YouTubeIndex} />
          <Route path="/youtube/search" exact component={YouTubeSearch} />
          <Route path="/youtube/channels" exact component={YouTubeChannels} />
          <Route path="/youtube/my_channels" exact component={MyChannels} />
          
          <Route path="/playlist/index" exact component={PlaylistIndex} />
        </Switch>
      </Router>
    </GlobalContext.Provider>
  );
};

export default Index;