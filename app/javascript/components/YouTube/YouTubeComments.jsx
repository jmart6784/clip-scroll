import React, { useEffect, useState } from "react";

const YouTubeComments = (props) => { 
  const [comments, setComments] = useState([]);

  useEffect(() => {
    fetch(`/api/v1/youtube/comments/${props.id}`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setComments(response))
      .catch(() => console.log("Failed to get video"));
  }, [props.id]);

  useEffect(() => console.log(comments), [comments]);

  return <div>Comments {props.id}</div>
}

export default YouTubeComments;