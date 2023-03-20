import React from "react";

const RedditVideo = (props) => {
  let post = props.post;
  let height = post['data']['media']['reddit_video']['height']; 
  let width = post['data']['media']['reddit_video']['width']; 

  if (height > width) {
    let postId = post['data']['id']
    
    let awards = 0;

    post['data']['all_awardings'].forEach(award => awards += award['count']);

    return (
      <div key={postId}>
        <p>{postId}</p>
        <p>{post['data']['subreddit_name_prefixed']}</p>
        <p>{post['data']['title']}</p>
        <p>{post['data']['score']}</p>
        <p>Posted by {post['data']['author']}</p>
        <p>All awardings: {awards}</p>
        <p>Comments: {post['data']['num_comments']}</p>
        <video src={post['data']['media']['reddit_video']['fallback_url']} width="300" height="500" controls></video>
      </div>
    );
  } else { return <div></div> }
}

export default RedditVideo;