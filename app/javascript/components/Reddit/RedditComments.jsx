import React, { useState, useEffect } from "react";

const RedditComments = (props) => { 
  const [comments, setComments] = useState([{}, { data: {children: []} }]);

  useEffect(() => {
    fetch(`https://www.reddit.com/r/${props.subreddit}/comments/${props.postId}.json?raw_json=1`)
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

  let commentsJsx = comments[1]['data']['children'].map(comment => { 
    comment = comment['data'];

    return (
      <div key={comment['id']}>
        <p>{comment['author']}</p>
        <p><strong>BODY: </strong> {comment['body']}</p>
        <p>{comment['score']}</p>
        <p>Created UTC: {comment['created_utc']}</p>
      </div>
    );
  });

  return (
    <div>
      <h1>Reddit Comments:</h1>
      {commentsJsx}
    </div>
  );
}

export default RedditComments;