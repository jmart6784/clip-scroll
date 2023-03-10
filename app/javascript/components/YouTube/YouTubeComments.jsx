import React, { useEffect, useState } from "react";

const YouTubeComments = (props) => {
  const [comments, setComments] = useState({ items: [] });

  // Get comments and reply thread
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

  // Generate logic to display comments and replies
  let commentsJsx = comments.items.map(comment => { 
    let parentComment = comment.snippet.topLevelComment.snippet;
    let replies = comment.replies ? comment.replies.comments : [];

    replies = replies.map(reply => { 
      let r = reply.snippet;

      return (
        <div key={reply.id}>
          <p>
            <a href={r.authorChannelUrl} target="_blank">
              <img src={r.authorProfileImageUrl} alt="user avatar" />
            </a> {r.authorDisplayName}
          </p>
          <p>{r.textDisplay}</p>
          <p>Likes: {r.likeCount}</p>
        </div>
      );
    });

    return (
      <div key={comment.id}>
        <p>
          <a href={parentComment.authorChannelUrl} target="_blank">
            <img src={parentComment.authorProfileImageUrl} alt="user avatar" />
          </a> {parentComment.authorDisplayName}
        </p>
        <p>{parentComment.textDisplay}</p>
        <p>
          Likes: {parentComment.likeCount}
          {
            // Hide replies if clicked
            comment.replies ?
              <button onClick={() => {
                let repliesContainer = document.getElementById(comment.snippet.topLevelComment.id)

                repliesContainer.style.display == "block" ?
                  repliesContainer.style.display = "none"
                :
                  repliesContainer.style.display = "block"
              }}>
                {comment.replies.comments.length} replies
              </button>
            : ""
          }
        </p>
        <div id={comment.snippet.topLevelComment.id} style={{display: "none"}}>
          {replies}
        </div>
      </div>
    );
  });

  return (
    <div>
      <h1>Comments:</h1>
      {commentsJsx}
    </div>
  );
}

export default YouTubeComments;