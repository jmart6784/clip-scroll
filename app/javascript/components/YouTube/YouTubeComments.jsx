import React, { useEffect } from "react";

const YouTubeComments = (props) => { 
  useEffect(() => console.log(props.id), [props.id]);

  return <div>Comments {props.id}</div>
}

export default YouTubeComments;