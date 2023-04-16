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
import YouTubeShow from "../components/YouTube/YouTubeShow";

import RedditIndex from "../components/Reddit/RedditIndex";
import RedditShow from "../components/Reddit/RedditShow";
import SubredditIndex from "../components/Reddit/SubredditIndex";
import MySubreddits from "../components/Reddit/MySubreddits";
import RedditSearch from "../components/Reddit/RedditSearch";

import PlaylistIndex from "../components/Playlist/PlaylistIndex";
import PlaylistShow from "../components/Playlist/PlaylistShow";
import PlaylistNew from "../components/Playlist/PlaylistNew";
import PlaylistEdit from "../components/Playlist/PlaylistEdit";
import PlaylistMine from "../components/Playlist/PlaylistMine";

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
          <Route path="/youtube/show/:id" exact component={YouTubeShow} />

          <Route path="/reddit/index" exact component={RedditIndex} />
          <Route path="/reddit/show/:subreddit" exact component={RedditShow} />
          <Route path="/subreddit/index" exact component={SubredditIndex} />
          <Route path="/mysubreddits" exact component={MySubreddits} />
          <Route path="/reddit/search" exact component={RedditSearch} />
          
          <Route path="/playlist/index" exact component={PlaylistIndex} />
          <Route path="/playlist/show/:id" exact component={PlaylistShow} />
          <Route path="/playlist/new" exact component={PlaylistNew} />
          <Route path="/playlist/edit/:id" exact component={PlaylistEdit} />
          <Route path="/playlist/mine" exact component={PlaylistMine} />
        </Switch>
      </Router>
    </GlobalContext.Provider>
  );
};

export default Index;