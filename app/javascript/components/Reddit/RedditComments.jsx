import React from "react";

const RedditComments = () => { 
  const [comments, setComments] = useState([]);

  useEffect(() => {
    console.log(props.post['data']['id']);
    fetch(`https://www.reddit.com/r/interestingasfuck/comments/${props.post['data']['id']}.json?raw_json=1`)
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