import React from "react";
import youtubelogo from "images/youtube-logo.png";
import redditlogo from "images/reddit-logo.png";

const About = () => { 
  return (
    <div>
      <h1>About</h1>

      <div>
        <p>
          This web application utilizes both the Reddit and Youtube API to display and serve vertical videos. You can create custom playlists that support both platforms or organize them by platform.
        </p>

        <img src={youtubelogo} alt="youtube logo" className="ab-yt-logo" />

        <p>
          The Youtube content that is served in this web application utilizes the YouTube v3 API. This API allows for 10,000 units of API calls per day. This is a good amount of requests, but I have limited some features like the channels search and channel refreshes. As it consumes more request units. Features such as liking and creating comments are not currently implemented into this application.
        </p>

        <img src={redditlogo} alt="youtube logo" className="ab-reddit-logo" />

        <p>
          The Reddit video content that is served is based on the Reddit API, it does not utilize an OAuth client ID. When I began creating this project the free tier query limit was 60 per minute. As of July 1, 2023 the limit will be decreased down to 10 queries per minute. This change significantly limits the functionality of the application. As for unsupported features it is similar to the YouTube content. Upvoting, commenting and awarding are currently unsupported.
        </p>
      </div>
    </div>
  );
}

export default About;