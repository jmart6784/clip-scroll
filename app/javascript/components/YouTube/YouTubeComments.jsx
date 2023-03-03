import React, { useEffect, useState } from "react";

const YouTubeComments = (props) => {
  const [comments, setComments] = useState({items: []});

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

  let commentsJsx = comments.items.map(comment => { 
    let parentComment = comment.snippet.topLevelComment.snippet;

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
          {comment.replies ? " Replies: " + comment.replies.comments.length : ""}
        </p>
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