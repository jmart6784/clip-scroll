import React, { useEffect, useState } from "react";
import DefaultImage from 'images/default-avatar-youtube.jpg';
import prettyNumbers from "../../helpers/prettyNumbers";
import timeSince from "../../helpers/timeSince";

const YouTubeComments = (props) => {
  const [comments, setComments] = useState({ items: [] });
  const [prompt, setPrompt] = useState(false);
  const [loading, setLoading] = useState(true);

  // Get comments and reply thread
  useEffect(() => {
    if (prompt) {
      // 0 comments zaHi4HycUv4, long username MgHmMymfOd4
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
      props.toggleDrag();
    }} className="show-comments-btn yt-stat-div">
      <i className="fa-solid fa-message"></i>
      <span>{prettyNumbers(props.commentCount, 1)}</span>
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
          <div key={reply.id} className="yt-comment-div" id="yt-reply-div">
            <div className="comment-avatar-div">
              <a href={r.authorChannelUrl} target="_blank">
                <img
                  id="yt-reply-avatar"
                  src={r.authorProfileImageUrl}
                  alt="user avatar" 
                  onError={e => {
                    e.target.onerror = null;
                    e.target.src = DefaultImage;
                  }}
                />
                <span>{
                  r.authorDisplayName.length >= 30 ? (
                    r.authorDisplayName.substring(0, 29) + ' ...'
                  ) : r.authorDisplayName
                }</span>
                <span id="yt-comment-age">{timeSince(r.publishedAt)}</span>
              </a>
            </div>

            <p className="yt-comment-body">{r.textDisplay}</p>

            <div className="comment-like-count-div">
              <i className="fa-solid fa-thumbs-up"></i>
              <span>{prettyNumbers(r.likeCount, 1)}</span>
              <i className="fa-solid fa-thumbs-down"></i>
            </div>
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
              <span>{
                parentComment.authorDisplayName.length >= 30 ? (
                  parentComment.authorDisplayName.substring(0, 29) + ' ...'
                ) : parentComment.authorDisplayName
              }</span>
              <span id="yt-comment-age">{timeSince(parentComment.publishedAt)}</span>
            </a>
          </div>

          <p className="yt-comment-body">{parentComment.textDisplay}</p>

          <div className="comment-like-count-div">
            <i className="fa-solid fa-thumbs-up"></i>
            <span>{prettyNumbers(parentComment.likeCount, 1)}</span>
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
                  <span>{prettyNumbers(comment.replies.comments.length, 1)}</span>
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
          props.toggleDrag();
        }}>
          <i className="fa-solid fa-xmark"></i>
        </button>

        <p className="comments-title">Comments (limited):</p>

        {commentsJsx}
      </div>
    );
  }

  return menuJsx;
}

export default YouTubeComments;