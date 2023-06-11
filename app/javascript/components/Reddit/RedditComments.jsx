import React, { useState, useEffect } from "react";
import timeSince from "../../helpers/timeSince";

const RedditComments = (props) => { 
  const [comments, setComments] = useState([{}, { data: { children: [] } }]);
  const [noResults, setNoResults] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(`https://www.reddit.com/r/${props.subreddit}/comments/${props.postId}.json?raw_json=1`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => {
        // If comments array is empty set no results to true
        response[1]['data']['children'].length == 0 ? setNoResults(true) : ""
        setLoading(false);
        setComments(response);
      })
      .catch(() => console.log("Error getting data"));
  }, [props]);

  let commentsJsx = comments[1]['data']['children'].map(comment => { 
    if (comment['kind'] != 'more') {
      comment = comment['data'];
      let replies = <div></div>;

      if (comment['replies'] != "" && comment['replies']['data']) {
        replies = comment['replies']['data']['children'].map(reply => {
          reply = reply['data'];

          if (reply['body']) {
            return (
              <div key={reply['id']} className="reddit-comment-div reddit-reply">
                <p className="reddit-comment-author">
                  {reply['author']} · {timeSince(reply['created_utc'], 'epoch')}
                </p>

                <p className="reddit-comment-body">{reply['body']}</p>
                
                <div className="reddit-comment-sub-menu">
                  <p className="reddit-comment-score">
                    <i className="fa-solid fa-up-long"></i>
                    {reply['score']}
                    <i className="fa-solid fa-down-long"></i>
                  </p>
                </div>
              </div>
            ); 
          }
        });
      }
      let repliesBtn = "";
      // If there are replies render the hide/show comments button
      if (comment['replies'] != "" && comment['replies']['data']) { 
        if (comment['replies']['data']['children'][0]['kind'] != 'more') {
          repliesBtn = (
            <button className="comment-replies-btn" onClick={() => {
              let repliesContainer = document.getElementById(comment['id']);

              repliesContainer.style.display == "block" ?
                repliesContainer.style.display = "none"
                :
                repliesContainer.style.display = "block"
            }}>
              {comment['replies']['data']['children'].length} {comment['replies']['data']['children'].length > 1 ? 'replies' : 'reply'}
            </button>
          ); 
        }
      }

      return (
        <div key={comment['id']} className="reddit-comment-div">
          <p className="reddit-comment-author">
            {comment['author']} · {timeSince(comment['created_utc'], 'epoch')}
          </p>

          <p className="reddit-comment-body">{comment['body']}</p>
          
          <div className="reddit-comment-sub-menu">
            <p className="reddit-comment-score">
              <i className="fa-solid fa-up-long"></i>
              {comment['score']}
              <i className="fa-solid fa-down-long"></i>
            </p>

            {repliesBtn}
          </div>

          <div id={comment['id']} style={{ display: "none" }}>
            {replies}
          </div>
        </div>
      );
    }
  });

  let mainJsx = <h1>...Loading</h1>;

  if (loading === false && comments[1]['data']['children'].length > 0) {
    mainJsx = (
      <div className="reddit-comment-wrapper">
        <div className="reddit-comment-close-wrapper">
          <button type="button" onClick={() => props.togglePrompt()}>
            <i className="fa-sharp fa-solid fa-xmark"></i>
          </button>
        </div>

        <div className="reddit-inner-comments">{commentsJsx}</div>
      </div>
    )
  } else if (loading === false && comments[1]['data']['children'].length === 0) { 
    mainJsx = (
      <div>No Comments</div>
    );
  }

  return mainJsx;
}

export default RedditComments;