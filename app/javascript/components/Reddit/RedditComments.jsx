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
    if (comment['kind'] != 'more') {
      comment = comment['data'];
      let replies = <div></div>;

      if (comment['replies'] != "" && comment['replies']['data']) {
        replies = comment['replies']['data']['children'].map(reply => {
          reply = reply['data'];

          if (reply['body']) {
            return (
              <div key={reply['id']} style={{backgroundColor: "grey"}}>
                <p>{reply['author']}</p>
                <p><strong>BODY: </strong> {reply['body']}</p>
                <p>{reply['score']}</p>
                <p>Created UTC: {reply['created_utc']}</p>
              </div>
            ); 
          }
        });
      }
      let repliesBtn = "";
      // If there are replies render the hide/show comments button
      if (comment['replies'] != "" && comment['replies']['data']) { 
        if (comment['replies']['data']['children'][0]['kind'] != 'more') {
          console.log("button: ", comment['replies']['data']['children'][0]['kind'] != 'more')
          repliesBtn = (
            <button onClick={() => {
              let repliesContainer = document.getElementById(comment['id']);

              repliesContainer.style.display == "block" ?
                repliesContainer.style.display = "none"
                :
                repliesContainer.style.display = "block"
            }}>
              {comment['replies']['data']['children'].length} replies
            </button>
          ); 
        }
      }

      return (
        <div key={comment['id']}>
          <p>{comment['author']}</p>
          <p><strong>BODY: </strong> {comment['body']}</p>
          <p>{comment['score']}</p>
          <p>Created UTC: {comment['created_utc']}</p>

          {repliesBtn}

          <div id={comment['id']} style={{ display: "none" }}>
            {replies}
          </div>
        </div>
      );
    }
  });

  return (
    <div>
      <h1>Reddit Comments:</h1>
      {commentsJsx}
    </div>
  );
}

export default RedditComments;