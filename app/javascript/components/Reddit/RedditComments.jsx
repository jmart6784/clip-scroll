import React, { useState, useEffect } from "react";

const RedditComments = (props) => { 
  const [comments, setComments] = useState([]);

  useEffect(() => {
    console.log(props.postId);
    fetch(`https://www.reddit.com/r/interestingasfuck/comments/${props.postId}.json?raw_json=1`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setComments(response))
      .catch(() => console.log("Error getting data"));
  }, [props]);

  useEffect(() => console.log(comments), [comments]);

  return (
    <div>
      <h1>Reddit Comments</h1>
    </div>
  );
}

export default RedditComments;