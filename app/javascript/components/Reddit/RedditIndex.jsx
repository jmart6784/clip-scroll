import React, { useEffect, useState } from "react";
import RedditVideo from "./RedditVideo";
import shuffle from "../../helpers/shuffle";
import PlaylistVideoMenu from "../Playlist_video/PlaylistVideoMenu";

const RedditIndex = () => {
  const [posts, setPosts] = useState([]);
  const [index, setIndex] = useState(0);
  const [noResults, setNoResults] = useState(false);
  const [subreddits, setSubreddits] = useState([]);
  const [requested, setRequested] = useState(false);
  const [apiHistory, setApiHistory] = useState({ requestIndex: 0, watched: [], refreshAtIndex: 5 });

  useEffect(() => { 
    fetch("/api/v1/addedsubreddit/mine")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => {
        let shuffledArray = shuffle(response);
        setSubreddits(shuffledArray);
        getVideoData(shuffledArray, apiHistory);
      })
      .catch(() => console.log("Error getting subreddit data"));
  }, []);

  const getVideoData = (subreddits, apiHist) => { 
    if (subreddits.length > 0) {
      // Randomized subreddits user is subbed to will have an API request for three.
      let previousEntry = subreddits[apiHist.requestIndex - 1];
      let currentEntry = subreddits[apiHist.requestIndex];
      let nextEntry = subreddits[apiHist.requestIndex + 1];
      let requestList = [previousEntry, currentEntry, nextEntry];
      let videos = [];

      // for (let i = 0; i < requestList.length; i++) {
      //   const sr = requestList[i];
        
      //   if (sr != undefined) {
      //     fetch(`https://www.reddit.com/r/${sr.subreddit}.json?limit=100&raw_json=1`)
      //     .then((response) => {
      //       if (response.ok) {
      //         return response.json();
      //       }
      //       throw new Error("Network response was not ok.");
      //     })
      //     .then((response) => {
      //       let res = response;
      //       let tempAry = [];

      //       for (let i = 0; i < res['data']['children'].length; i++) {
      //         let post = res['data']['children'][i];
      //         // push to array if reddit video is detected.
      //         if (post['data']['media'] != null) {
      //           if (post['data']['media']['reddit_video']) {
      //             let height = post['data']['media']['reddit_video']['height'];
      //             let width = post['data']['media']['reddit_video']['width'];
      //             // Include vertical videos only
      //             height >= width ? tempAry.push(post) : "";
      //           }
      //         }
      //       }
            
      //       if (tempAry.length > 0) {
      //         // Shuffle data order
      //         shuffle([...posts, ...tempAry]).forEach(vid => videos.push(vid));
              
      //         let hist = [];

      //         // Remove duplicates off of API history
      //         if (apiHist.watched.length > 0) {
      //           hist = apiHist.watched.filter((value, index, self) =>
      //             index === self.findIndex((t) => (
      //               t['data']['id'] === value['data']['id']
      //             ))
      //           )
      //         }

      //         // Append watch history so state is synched
      //         videos = [...hist, ...videos];

      //         // Remove duplicates videos
      //         videos = videos.filter((value, index, self) =>
      //           index === self.findIndex((t) => (
      //             t['data']['id'] === value['data']['id']
      //           ))
      //         )
      //         setPosts(videos);
      //         setRequested(false);
      //       } else {
      //         setNoResults(true);
      //       }
      //     })
      //     .catch(() => console.log("Error getting posts data"));
      //   }
      // }
      
      setPosts(
        [
                      {
                "kind": "t3",
                "data": {
                    "approved_at_utc": null,
                    "subreddit": "agedlikewine",
                    "selftext": "",
                    "author_fullname": "t2_4zrw9l0b",
                    "saved": false,
                    "mod_reason_title": null,
                    "gilded": 0,
                    "clicked": false,
                    "title": "Aging reversal!",
                    "link_flair_richtext": [],
                    "subreddit_name_prefixed": "r/agedlikewine",
                    "hidden": false,
                    "pwls": 7,
                    "link_flair_css_class": null,
                    "downs": 0,
                    "thumbnail_height": 140,
                    "top_awarded_type": null,
                    "hide_score": false,
                    "name": "t3_12xlq7q",
                    "quarantine": false,
                    "link_flair_text_color": "dark",
                    "upvote_ratio": 0.37,
                    "author_flair_background_color": null,
                    "subreddit_type": "public",
                    "ups": 0,
                    "total_awards_received": 0,
                    "media_embed": {},
                    "thumbnail_width": 140,
                    "author_flair_template_id": null,
                    "is_original_content": false,
                    "user_reports": [],
                    "secure_media": {
                        "reddit_video": {
                            "bitrate_kbps": 2400,
                            "fallback_url": "https://v.redd.it/ayudx1tu7wva1/DASH_720.mp4?source=fallback",
                            "height": 720,
                            "width": 406,
                            "scrubber_media_url": "https://v.redd.it/ayudx1tu7wva1/DASH_96.mp4",
                            "dash_url": "https://v.redd.it/ayudx1tu7wva1/DASHPlaylist.mpd?a=1687927500%2CYmI5ZjhkY2NiMzkzYjA0MmQzMjFjYzFlOWY3ZTg2YmM2ZDM3NjIzNDBmN2FiMjI0YzczODAwZjkzZGIzNDY2Ng%3D%3D&v=1&f=sd",
                            "duration": 102,
                            "hls_url": "https://v.redd.it/ayudx1tu7wva1/HLSPlaylist.m3u8?a=1687927500%2CYjQ4MDc4YWVlNjAwMzI4NWEyMGU4NGRlNmJhMDA2M2ZiYjZkNWM1YzQ3MjFlOGI0ZWM0NTE1M2JjMzRkNTJiYw%3D%3D&v=1&f=sd",
                            "is_gif": false,
                            "transcoding_status": "completed"
                        }
                    },
                    "is_reddit_media_domain": true,
                    "is_meta": false,
                    "category": null,
                    "secure_media_embed": {},
                    "link_flair_text": null,
                    "can_mod_post": false,
                    "score": 0,
                    "approved_by": null,
                    "is_created_from_ads_ui": false,
                    "author_premium": true,
                    "thumbnail": "https://external-preview.redd.it/KXU404t8r8LTTqGtBKM0uM_4Ro01_Y1Gk0U4_C97DsE.png?width=140&height=140&crop=140:140,smart&format=jpg&v=enabled&lthumb=true&s=4584ccaeecff23f1b66d6dd6fc55d451093e25bd",
                    "edited": false,
                    "author_flair_css_class": null,
                    "author_flair_richtext": [],
                    "gildings": {},
                    "post_hint": "hosted:video",
                    "content_categories": null,
                    "is_self": false,
                    "mod_note": null,
                    "created": 1682350528.0,
                    "link_flair_type": "text",
                    "wls": 7,
                    "removed_by_category": null,
                    "banned_by": null,
                    "author_flair_type": "text",
                    "domain": "v.redd.it",
                    "allow_live_comments": false,
                    "selftext_html": null,
                    "likes": null,
                    "suggested_sort": null,
                    "banned_at_utc": null,
                    "url_overridden_by_dest": "https://v.redd.it/ayudx1tu7wva1",
                    "view_count": null,
                    "archived": false,
                    "no_follow": true,
                    "is_crosspostable": false,
                    "pinned": false,
                    "over_18": false,
                    "preview": {
                        "images": [
                            {
                                "source": {
                                    "url": "https://external-preview.redd.it/KXU404t8r8LTTqGtBKM0uM_4Ro01_Y1Gk0U4_C97DsE.png?format=pjpg&auto=webp&v=enabled&s=30e59e26629c5a244defcaad2723bae3ab9d5f80",
                                    "width": 576,
                                    "height": 1024
                                },
                                "resolutions": [
                                    {
                                        "url": "https://external-preview.redd.it/KXU404t8r8LTTqGtBKM0uM_4Ro01_Y1Gk0U4_C97DsE.png?width=108&crop=smart&format=pjpg&auto=webp&v=enabled&s=57a00b60c34d0181d1cef60c0fc27064cfeca7a1",
                                        "width": 108,
                                        "height": 192
                                    },
                                    {
                                        "url": "https://external-preview.redd.it/KXU404t8r8LTTqGtBKM0uM_4Ro01_Y1Gk0U4_C97DsE.png?width=216&crop=smart&format=pjpg&auto=webp&v=enabled&s=c904a1849a66521a1158bd9c93bd8f36492c3a2e",
                                        "width": 216,
                                        "height": 384
                                    },
                                    {
                                        "url": "https://external-preview.redd.it/KXU404t8r8LTTqGtBKM0uM_4Ro01_Y1Gk0U4_C97DsE.png?width=320&crop=smart&format=pjpg&auto=webp&v=enabled&s=49a351526f3bd9d80fb82b5504cc3cba7444de06",
                                        "width": 320,
                                        "height": 568
                                    }
                                ],
                                "variants": {},
                                "id": "KXU404t8r8LTTqGtBKM0uM_4Ro01_Y1Gk0U4_C97DsE"
                            }
                        ],
                        "enabled": false
                    },
                    "all_awardings": [],
                    "awarders": [],
                    "media_only": false,
                    "can_gild": false,
                    "spoiler": false,
                    "locked": false,
                    "author_flair_text": null,
                    "treatment_tags": [],
                    "visited": false,
                    "removed_by": null,
                    "num_reports": null,
                    "distinguished": null,
                    "subreddit_id": "t5_swhbd",
                    "author_is_blocked": false,
                    "mod_reason_by": null,
                    "removal_reason": null,
                    "link_flair_background_color": "",
                    "id": "12xlq7q",
                    "is_robot_indexable": true,
                    "report_reasons": null,
                    "author": "OwnCarpenter5119",
                    "discussion_type": null,
                    "num_comments": 7,
                    "send_replies": true,
                    "whitelist_status": "some_ads",
                    "contest_mode": false,
                    "mod_reports": [],
                    "author_patreon_flair": false,
                    "author_flair_text_color": null,
                    "permalink": "/r/agedlikewine/comments/12xlq7q/aging_reversal/",
                    "parent_whitelist_status": "some_ads",
                    "stickied": false,
                    "url": "https://v.redd.it/ayudx1tu7wva1",
                    "subreddit_subscribers": 195543,
                    "created_utc": 1682350528.0,
                    "num_crossposts": 0,
                    "media": {
                        "reddit_video": {
                            "bitrate_kbps": 2400,
                            "fallback_url": "https://v.redd.it/ayudx1tu7wva1/DASH_720.mp4?source=fallback",
                            "height": 720,
                            "width": 406,
                            "scrubber_media_url": "https://v.redd.it/ayudx1tu7wva1/DASH_96.mp4",
                            "dash_url": "https://v.redd.it/ayudx1tu7wva1/DASHPlaylist.mpd?a=1687927500%2CYmI5ZjhkY2NiMzkzYjA0MmQzMjFjYzFlOWY3ZTg2YmM2ZDM3NjIzNDBmN2FiMjI0YzczODAwZjkzZGIzNDY2Ng%3D%3D&v=1&f=sd",
                            "duration": 102,
                            "hls_url": "https://v.redd.it/ayudx1tu7wva1/HLSPlaylist.m3u8?a=1687927500%2CYjQ4MDc4YWVlNjAwMzI4NWEyMGU4NGRlNmJhMDA2M2ZiYjZkNWM1YzQ3MjFlOGI0ZWM0NTE1M2JjMzRkNTJiYw%3D%3D&v=1&f=sd",
                            "is_gif": false,
                            "transcoding_status": "completed"
                        }
                    },
                    "is_video": true
                }
            },
        ]
      );
    }
  }

  const previousVideo = () => index > 0 ? setIndex(index - 1) : "";

  const nextVideo = () => {
    if (index != posts.length - 1 && !requested) { 
      // Refresh after posts index hits 5, The request index will increase by 3 to get more subreddits. Add current video to watch history
      if (index + 1 == apiHistory.refreshAtIndex || index == posts.length - 1) {
        let changes = {
          watched: [...apiHistory.watched, posts[index]],
          refreshAtIndex: apiHistory.refreshAtIndex + 5,
          requestIndex: apiHistory.requestIndex + 3
        };
        // If there is another video in the array add it to the watched array.
        if (posts[index + 1] != undefined) {
          changes = {
            ...changes,
            watched: [...apiHistory.watched, posts[index], posts[index + 1]]
          }
        }
        // Set requested to true to prevent duplicate requests
        setRequested(true);
        setApiHistory(changes);
        getVideoData(subreddits, changes);
      } else { 
        // Add current video to watched history
        if (posts[index] != undefined) {
          setApiHistory({...apiHistory, watched: [...apiHistory.watched, posts[index]]});
        }
      }
      // Increment index to trigger next video
      setIndex(index + 1);
    }
  };

  let videoJsx = <h1>...Loading</h1>;

  if (noResults && posts.length == 0) {
    videoJsx = <h1>No Results</h1>
  } else { 
    posts[index] ? videoJsx = <RedditVideo post={posts[index]} /> : "";
  }

  return (
    <div>
      <PlaylistVideoMenu
        videoId={posts[index] ? posts[index]['data']['id'] : ""}
        parentSourceId={posts[index] ? posts[index]['data']['subreddit'] : ""}
        source="reddit"
      />
      <h1>Reddit Index</h1>
      {videoJsx}
      <button type="button" onClick={previousVideo}>Previous</button>
      <button type="button" onClick={nextVideo} disabled={noResults}>Next</button>
    </div>
  );
}

export default RedditIndex;