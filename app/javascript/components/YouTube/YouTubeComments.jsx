import React, { useEffect, useState } from "react";
import DefaultImage from 'images/default-avatar-youtube.jpg'

const YouTubeComments = (props) => {
  const [comments, setComments] = useState({ items: [] });
  const [prompt, setPrompt] = useState(false);
  const [loading, setLoading] = useState(true);

  // Get comments and reply thread
  useEffect(() => {
    if (prompt) {
      // Long comment example zbyJggYs-Ak, 3 comments XGi3kqMlvGA, 1 comment & long N9odqUUIalE, 0 zaHi4HycUv4, short comments CosNGOuLcG4
      fetch(`/api/v1/youtube/comments/${props.id}`)
        .then((response) => {
          if (response.ok) {
            return response.json();
          }
          throw new Error("Network response was not ok.");
        })
        .then((response) => setComments(response), setLoading(false))
        .catch(() => console.log("Failed to get video"));
    }
  }, [props.id, prompt]);

  let menuJsx = (
    <button type="button" onClick={() => {
      setPrompt(true);
      props.toggleComments();
    }} className="show-comments-btn yt-stat-div">
      <i className="fa-solid fa-message"></i> <span>{props.commentCount}</span>
    </button>
  );

  let commentsJsx = <h1>...Loading</h1>;

  // Generate logic to display comments and replies
  if (loading === false && comments.items.length > 0) {
    commentsJsx = comments.items.map(comment => { 
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
        <div key={comment.id} className="yt-comment-div">
          <div className="comment-avatar-div">
            <a href={parentComment.authorChannelUrl} target="_blank">
              <img
                src={parentComment.authorProfileImageUrl}
                alt="user avatar" 
                onError={e => {
                  e.target.onerror = null;
                  e.target.src = DefaultImage;
                }}
              />
              <span>{parentComment.authorDisplayName}</span>
              <span>{parentComment.publishedAt}</span>
            </a>
          </div>

          <p className="yt-comment-body">{parentComment.textDisplay}</p>

          <div className="comment-like-count-div">
            <i className="fa-solid fa-thumbs-up"></i>
            <span>{parentComment.likeCount}</span>
            <i className="fa-solid fa-thumbs-down"></i>
          </div>

          <div>
            {
              // Hide replies if clicked
              comment.replies ?
                <button className="yt-replies-btn" onClick={() => {
                  let repliesContainer = document.getElementById(comment.snippet.topLevelComment.id)

                  repliesContainer.style.display == "block" ?
                    repliesContainer.style.display = "none"
                  :
                    repliesContainer.style.display = "block"
                }}>
                  <i className="fa-solid fa-caret-down"></i>
                  <span>{comment.replies.comments.length}</span>
                  <span>
                    {comment.replies.comments.length === 1 ? "reply" : "replies"}
                  </span>
                </button>
              : ""
            }
          </div>
          <div id={comment.snippet.topLevelComment.id} style={{display: "none"}}>
            {replies}
          </div>
        </div>
      );
    });
  } else if (loading === false && comments.items.length === 0) { 
    commentsJsx = (
      <div>No Results</div>
    );
  }

  if (prompt) {
    menuJsx = (
      <div className="comments-wrapper">
        <button type="button" className="hide-comments-btn" onClick={() => {
          setPrompt(false);
          props.toggleComments();
        }}>
          <i className="fa-sharp fa-solid fa-xmark"></i>
        </button>

        <p className="comments-title">Comments (limited):</p>

        {commentsJsx}
      </div>
    );
  }

  return menuJsx;
}

export default YouTubeComments;