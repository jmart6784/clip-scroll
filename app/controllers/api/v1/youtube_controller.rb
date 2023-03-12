class Api::V1::YoutubeController < ApplicationController
  include HTTParty

  def videos
    videos = YoutubeVideo.all.order(Arel.sql('RANDOM()'))
    render json: videos, status: 200
  end

  def video
    # response = HTTParty.get("https://www.googleapis.com/youtube/v3/videos?part=snippet,statistics&id=#{params[:id]}&key=#{Rails.application.credentials.dig(:youtube_api_key)}")

    # puts JSON.parse(response.body).inspect

    # render json: JSON.parse(response.body)

    render json: {"kind"=>"youtube#videoListResponse", "etag"=>"nkpHW4Q5v0_GR8mANaKzrX6_ZnU", "items"=>[{"kind"=>"youtube#video", "etag"=>"9Ko4pciJptfkvBz4OdfY9z-XQHU", "id"=>"XYAe15w39LQ", "snippet"=>{"publishedAt"=>"2023-02-24T21:56:36Z", "channelId"=>"UCdC0An4ZPNr_YiFiYoVbwaw", "title"=>"Watermelon without the melon", "description"=>"Source: Collab.Inc\n\n#shorts", "thumbnails"=>{"default"=>{"url"=>"https://i.ytimg.com/vi/XYAe15w39LQ/default.jpg", "width"=>120, "height"=>90}, "medium"=>{"url"=>"https://i.ytimg.com/vi/XYAe15w39LQ/mqdefault.jpg", "width"=>320, "height"=>180}, "high"=>{"url"=>"https://i.ytimg.com/vi/XYAe15w39LQ/hqdefault.jpg", "width"=>480, "height"=>360}, "standard"=>{"url"=>"https://i.ytimg.com/vi/XYAe15w39LQ/sddefault.jpg", "width"=>640, "height"=>480}, "maxres"=>{"url"=>"https://i.ytimg.com/vi/XYAe15w39LQ/maxresdefault.jpg", "width"=>1280, "height"=>720}}, "channelTitle"=>"Daily Dose Of Internet", "tags"=>["Internet", "Internet videos", "Daily Dose", "Animals", "TikTok", "Science", "TikTok Compilation", "Compilation", "Daily Dose Of Internet", "watermelon"], "categoryId"=>"24", "liveBroadcastContent"=>"none", "defaultLanguage"=>"en", "localized"=>{"title"=>"Watermelon without the melon", "description"=>"Source: Collab.Inc\n\n#shorts"}, "defaultAudioLanguage"=>"en"}, "statistics"=>{"viewCount"=>"184328", "likeCount"=>"7034", "favoriteCount"=>"0", "commentCount"=>"410"}}], "pageInfo"=>{"totalResults"=>1, "resultsPerPage"=>1}}
  end

  def search
    # response = HTTParty.get("https://www.googleapis.com/youtube/v3/search?part=snippet&type=channel&maxResults=50&q=#{params[:search]}&key=#{Rails.application.credentials.dig(:youtube_api_key)}")

    # puts JSON.parse(response.body).inspect

    # render json: JSON.parse(response.body)  

    render json: {
    "kind": "youtube#searchListResponse",
    "etag": "V7hnizIh5R_0nTcrkAkJNbzKb2M",
    "nextPageToken": "CDIQAA",
    "regionCode": "US",
    "pageInfo": {
        "totalResults": 11890,
        "resultsPerPage": 50
    },
    "items": [
        {
            "kind": "youtube#searchResult",
            "etag": "0-DxqfX3uwRFii85NvmEBFvsQJM",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCvK4bOhULCpmLabd2pDMtnA"
            },
            "snippet": {
                "publishedAt": "2014-01-13T16:59:30Z",
                "channelId": "UCvK4bOhULCpmLabd2pDMtnA",
                "title": "Yes Theory",
                "description": "We believe that life's greatest moments and deepest connections exist outside your comfort zone. Brand Partnerships: ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/vVNRN2owIpF1EKhfENoMhDRwNNXHDjL1o_6oG3K13aMlu3dyl4DZuWkq_oAv8an-B1D5Mzbn_UM=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/vVNRN2owIpF1EKhfENoMhDRwNNXHDjL1o_6oG3K13aMlu3dyl4DZuWkq_oAv8an-B1D5Mzbn_UM=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/vVNRN2owIpF1EKhfENoMhDRwNNXHDjL1o_6oG3K13aMlu3dyl4DZuWkq_oAv8an-B1D5Mzbn_UM=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory",
                "liveBroadcastContent": "upcoming",
                "publishTime": "2014-01-13T16:59:30Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "8jhNidrOzLuxIVOp7M2Dwdsx6qQ",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCTd7KzdwnFE3lm6LCfYDmUQ"
            },
            "snippet": {
                "publishedAt": "2020-04-09T19:55:33Z",
                "channelId": "UCTd7KzdwnFE3lm6LCfYDmUQ",
                "title": "Seek Discomfort",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/oeJE-e7YBvhODlDLkP7t7H-k7B0M8qBhaOmfCeMEd3dHE3HXtNXtezt7gx8tR8HvPdRWdoZ0Wjg=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/oeJE-e7YBvhODlDLkP7t7H-k7B0M8qBhaOmfCeMEd3dHE3HXtNXtezt7gx8tR8HvPdRWdoZ0Wjg=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/oeJE-e7YBvhODlDLkP7t7H-k7B0M8qBhaOmfCeMEd3dHE3HXtNXtezt7gx8tR8HvPdRWdoZ0Wjg=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Seek Discomfort",
                "liveBroadcastContent": "none",
                "publishTime": "2020-04-09T19:55:33Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "4YcPW4j482Tqnovk_8kbJUSlbG0",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCSZ3GYzaZlMNNxFsIslehoQ"
            },
            "snippet": {
                "publishedAt": "2021-09-26T11:41:21Z",
                "channelId": "UCSZ3GYzaZlMNNxFsIslehoQ",
                "title": "The Yes Theory Podcast",
                "description": "Welcome to The Yes Theory Podcast Channel! This is where we will be sharing clips, special moments, and full length video ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/TVi9uLf0Hiknf6HOF8DqKwXVpLv-hN-BeDOdJQ9R88xjrmGVDK1cgn3zVqRLdTokGsqiZn60=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/TVi9uLf0Hiknf6HOF8DqKwXVpLv-hN-BeDOdJQ9R88xjrmGVDK1cgn3zVqRLdTokGsqiZn60=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/TVi9uLf0Hiknf6HOF8DqKwXVpLv-hN-BeDOdJQ9R88xjrmGVDK1cgn3zVqRLdTokGsqiZn60=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "The Yes Theory Podcast",
                "liveBroadcastContent": "none",
                "publishTime": "2021-09-26T11:41:21Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "d1M2DeNozpCWMlrp4QJHWd-hjXI",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCcIc2xUPXcbB02oiTIfU4xQ"
            },
            "snippet": {
                "publishedAt": "2018-09-02T20:49:08Z",
                "channelId": "UCcIc2xUPXcbB02oiTIfU4xQ",
                "title": "Yes Theory",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWVQ0l4j3K1Ww2QWTvNkfLytUdhdQsict34iO5I=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWVQ0l4j3K1Ww2QWTvNkfLytUdhdQsict34iO5I=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWVQ0l4j3K1Ww2QWTvNkfLytUdhdQsict34iO5I=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory",
                "liveBroadcastContent": "none",
                "publishTime": "2018-09-02T20:49:08Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "3nCvNh1WmoaBpyOIPFo31qEw0BE",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCWoEpiHaC7LOQhaHFT8Rx7A"
            },
            "snippet": {
                "publishedAt": "2017-11-23T02:04:30Z",
                "channelId": "UCWoEpiHaC7LOQhaHFT8Rx7A",
                "title": "Lexie Limitless",
                "description": "Lexie recently shattered the \"Guinness World Record for the Youngest Person to Travel to Every Country.\" She traveled to all 196 ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUY5Dzl8UQvE9su4muRVu2dnaKm1Bort9yRDI_jdA=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUY5Dzl8UQvE9su4muRVu2dnaKm1Bort9yRDI_jdA=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUY5Dzl8UQvE9su4muRVu2dnaKm1Bort9yRDI_jdA=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Lexie Limitless",
                "liveBroadcastContent": "none",
                "publishTime": "2017-11-23T02:04:30Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "33yW5YTAfo3S9kC_tIHs2noyjtQ",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCakmCJOK1gJFZS-lUF6xEiQ"
            },
            "snippet": {
                "publishedAt": "2016-11-23T19:31:24Z",
                "channelId": "UCakmCJOK1gJFZS-lUF6xEiQ",
                "title": "Sky Life",
                "description": "My name is Sky and I share stories about wellness, spirituality, and alternative lifestyle with the intention to inspire personal ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUCEIkyQlJ-0pUm8oCD3RTT91nibPOHb2pF1j8XWpQ=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUCEIkyQlJ-0pUm8oCD3RTT91nibPOHb2pF1j8XWpQ=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUCEIkyQlJ-0pUm8oCD3RTT91nibPOHb2pF1j8XWpQ=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Sky Life",
                "liveBroadcastContent": "none",
                "publishTime": "2016-11-23T19:31:24Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "rVaj3aFELkG79Z2K1jFnnHAxwYQ",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UC-nhLOLf7GVWxN2ntqJscmA"
            },
            "snippet": {
                "publishedAt": "2022-05-12T13:31:52Z",
                "channelId": "UC-nhLOLf7GVWxN2ntqJscmA",
                "title": "Yes Theory Shorts",
                "description": "Get to know our channels: Yes Theory - https://www.youtube.com/c/YesTheory Seek Discomfort ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/jBPnQ0GSLAg0_aA4jqLP8R2OAC9B6N4r3PTxVmK3SUUU4tku6QlD4l3q8I26ph2wgpe-P_z3Sg=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/jBPnQ0GSLAg0_aA4jqLP8R2OAC9B6N4r3PTxVmK3SUUU4tku6QlD4l3q8I26ph2wgpe-P_z3Sg=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/jBPnQ0GSLAg0_aA4jqLP8R2OAC9B6N4r3PTxVmK3SUUU4tku6QlD4l3q8I26ph2wgpe-P_z3Sg=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory Shorts",
                "liveBroadcastContent": "none",
                "publishTime": "2022-05-12T13:31:52Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "mKv0yeICM0Jtc8Vjd7XEmY2Ov5s",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UC1E5Ti2P70zZxA4osS2MhiA"
            },
            "snippet": {
                "publishedAt": "2018-05-11T20:03:43Z",
                "channelId": "UC1E5Ti2P70zZxA4osS2MhiA",
                "title": "Conor Castle",
                "description": "You only get one shot. So do it all. Challenging myself to live a more interesting life. And documenting the journey. If you feel like ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXW3QWK8C-TRDcYDHbu9pvjT_fztU3B8Kw03SKR6Q=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXW3QWK8C-TRDcYDHbu9pvjT_fztU3B8Kw03SKR6Q=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXW3QWK8C-TRDcYDHbu9pvjT_fztU3B8Kw03SKR6Q=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Conor Castle",
                "liveBroadcastContent": "upcoming",
                "publishTime": "2018-05-11T20:03:43Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "-qYNHCx4_qL7f-JKSka7-4AITS4",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCyi_6vNS4wH5Wo_H1L2sx1Q"
            },
            "snippet": {
                "publishedAt": "2020-03-09T07:49:17Z",
                "channelId": "UCyi_6vNS4wH5Wo_H1L2sx1Q",
                "title": "YES Theory",
                "description": "Education,fun and many more things in the channel See all aviation related stories in the channel first . Thankyou for your support ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXUBDhpOwon41QHH_GOTB_Z1fNYaiCF-8YSU8kN=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXUBDhpOwon41QHH_GOTB_Z1fNYaiCF-8YSU8kN=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXUBDhpOwon41QHH_GOTB_Z1fNYaiCF-8YSU8kN=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "YES Theory",
                "liveBroadcastContent": "none",
                "publishTime": "2020-03-09T07:49:17Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "bxfH7Qd7AJPC8fnr_fRJxcgwZmw",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UClKwidAS9e0Tcyt4_-Flxww"
            },
            "snippet": {
                "publishedAt": "2019-12-24T14:49:27Z",
                "channelId": "UClKwidAS9e0Tcyt4_-Flxww",
                "title": "yes theory",
                "description": "this is best moments of yes theory and deleted content.",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJVx8150X3ysBjgsqblQb-O2GUxN44UI8nqS7_Oo=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJVx8150X3ysBjgsqblQb-O2GUxN44UI8nqS7_Oo=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJVx8150X3ysBjgsqblQb-O2GUxN44UI8nqS7_Oo=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "yes theory",
                "liveBroadcastContent": "none",
                "publishTime": "2019-12-24T14:49:27Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "kXTUHRu4a-VJEwTra4KcAErbl8E",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCYXhaLEoRfUc34MPSx4HpDw"
            },
            "snippet": {
                "publishedAt": "2019-12-17T20:37:10Z",
                "channelId": "UCYXhaLEoRfUc34MPSx4HpDw",
                "title": "Eric Tabach",
                "description": "I'm a real actor with an IMDb. NEW VIDEOS every Wednesday & Sunday! Business/collabs: erictabachbiz@gmail.com ERIC ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWafxx_iie21Z3r2BK0_zsOTywGzETmzkJYcsg=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWafxx_iie21Z3r2BK0_zsOTywGzETmzkJYcsg=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWafxx_iie21Z3r2BK0_zsOTywGzETmzkJYcsg=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Eric Tabach",
                "liveBroadcastContent": "none",
                "publishTime": "2019-12-17T20:37:10Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "9wK2bQKM4thDowzB8xwLXfsLvJ4",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCNCcq_2gDATS2GPvMdeBHjg"
            },
            "snippet": {
                "publishedAt": "2020-10-03T10:28:15Z",
                "channelId": "UCNCcq_2gDATS2GPvMdeBHjg",
                "title": "IE Yes Theory Club IE University",
                "description": "This YouTube channel is dedicated to the IE Yes Theory Club, run by IE University students. It aims to help people overcome their ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUROLUyfId4ZpzVP95laoixy65i8U6XwwdVM1_3=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUROLUyfId4ZpzVP95laoixy65i8U6XwwdVM1_3=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUROLUyfId4ZpzVP95laoixy65i8U6XwwdVM1_3=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "IE Yes Theory Club IE University",
                "liveBroadcastContent": "none",
                "publishTime": "2020-10-03T10:28:15Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "r7apRJvuzU4msBSu4w16OiVBK_Q",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCFdJjD2oyI-H68pmQowySZg"
            },
            "snippet": {
                "publishedAt": "2020-09-18T15:19:44Z",
                "channelId": "UCFdJjD2oyI-H68pmQowySZg",
                "title": "Meaningful Podcasts",
                "description": "Seek Discomfort! The Yes Theory Podcast P.S. This channel is simply an attempt to get Yes Theory's attention. I need their help in ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUB6og_IgPZjgL1a34dEejmUBhoECFw9e0yctIB=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUB6og_IgPZjgL1a34dEejmUBhoECFw9e0yctIB=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUB6og_IgPZjgL1a34dEejmUBhoECFw9e0yctIB=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Meaningful Podcasts",
                "liveBroadcastContent": "none",
                "publishTime": "2020-09-18T15:19:44Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "WlmvFQ-fDPj7YZ2AcGaYxuefw9A",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCOv3shFSw6M18yBA9N7IkzQ"
            },
            "snippet": {
                "publishedAt": "2020-11-27T12:34:38Z",
                "channelId": "UCOv3shFSw6M18yBA9N7IkzQ",
                "title": "Yes Theory Logic",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUH5WHy9-1p1ieXTUQPqg88wkNjsHLjwvLpPqMQ=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUH5WHy9-1p1ieXTUQPqg88wkNjsHLjwvLpPqMQ=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUH5WHy9-1p1ieXTUQPqg88wkNjsHLjwvLpPqMQ=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory Logic",
                "liveBroadcastContent": "none",
                "publishTime": "2020-11-27T12:34:38Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "Rdb_fLkIliuRHFLqLojgxDEVEMo",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCQEyZy5UuAZFKmdYZ_V4XzA"
            },
            "snippet": {
                "publishedAt": "2018-06-13T09:10:46Z",
                "channelId": "UCQEyZy5UuAZFKmdYZ_V4XzA",
                "title": "Yes Theory Ng",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUet4mjhwUlKc7mpMqFtfA-CWwh5HmdTS_XRpV_=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUet4mjhwUlKc7mpMqFtfA-CWwh5HmdTS_XRpV_=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUet4mjhwUlKc7mpMqFtfA-CWwh5HmdTS_XRpV_=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory Ng",
                "liveBroadcastContent": "none",
                "publishTime": "2018-06-13T09:10:46Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "F8TYSYeLVysC6HtoTGsf02o6ADs",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UC5mTF0ZMT9wGRo0YNmYBv4A"
            },
            "snippet": {
                "publishedAt": "2020-05-15T01:06:19Z",
                "channelId": "UC5mTF0ZMT9wGRo0YNmYBv4A",
                "title": "Yes Theory PLUS",
                "description": "We believe that life's greatest moments and deepest connections exist outside your comfort zone. Business Inquiries: ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJU7w94Fsw8VcDeg_MNgiDPD8DDIEF9pSm_kd7NuEw=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJU7w94Fsw8VcDeg_MNgiDPD8DDIEF9pSm_kd7NuEw=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJU7w94Fsw8VcDeg_MNgiDPD8DDIEF9pSm_kd7NuEw=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory PLUS",
                "liveBroadcastContent": "none",
                "publishTime": "2020-05-15T01:06:19Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "mSRE-8JF9H1QRtiq8XjyG6dAd7w",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCgc0nXsSZktNfXr4jj0ldPw"
            },
            "snippet": {
                "publishedAt": "2019-01-09T06:00:34Z",
                "channelId": "UCgc0nXsSZktNfXr4jj0ldPw",
                "title": "Yes theory",
                "description": "Everything in one second.",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWbAkf-SlpN0Y2CtROAnUMuxVKGEtbiM_WdgWt3mg=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWbAkf-SlpN0Y2CtROAnUMuxVKGEtbiM_WdgWt3mg=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWbAkf-SlpN0Y2CtROAnUMuxVKGEtbiM_WdgWt3mg=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes theory",
                "liveBroadcastContent": "upcoming",
                "publishTime": "2019-01-09T06:00:34Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "cJxaXgZpX3AyzncUhcGYmuiw6s0",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCru6-7TTYvpeORvRFCaox9w"
            },
            "snippet": {
                "publishedAt": "2020-09-10T22:04:32Z",
                "channelId": "UCru6-7TTYvpeORvRFCaox9w",
                "title": "Yes Theory Podcast Highlights",
                "description": "THIS IS A FAN ACCOUNT - It has no affiliation with Yes Theory, any of its members, or the podcast. Yes Theory Official Channel ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWfvEMpP16Tlly3sfcxXHhcMMGSt2midIp39wm_=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWfvEMpP16Tlly3sfcxXHhcMMGSt2midIp39wm_=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWfvEMpP16Tlly3sfcxXHhcMMGSt2midIp39wm_=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory Podcast Highlights",
                "liveBroadcastContent": "none",
                "publishTime": "2020-09-10T22:04:32Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "fNBlzoEnPayQ12vxpdYI3YPTcvc",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCp3oSacwOk4mBopyJjg8jbg"
            },
            "snippet": {
                "publishedAt": "2022-06-07T18:13:35Z",
                "channelId": "UCp3oSacwOk4mBopyJjg8jbg",
                "title": "Yes Theory Shorts Fam",
                "description": "This is the fan account Get to know our channels: Yes Theory - https://www.youtube.com/c/YesTheory Seek Discomfort ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/Hfmcad6B1l9_RUg9rwtGoA1jarWoGmDsdyRZCpA3h-RJ-VPS_E8YERZxLUufud250HOo4zmbjg=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/Hfmcad6B1l9_RUg9rwtGoA1jarWoGmDsdyRZCpA3h-RJ-VPS_E8YERZxLUufud250HOo4zmbjg=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/Hfmcad6B1l9_RUg9rwtGoA1jarWoGmDsdyRZCpA3h-RJ-VPS_E8YERZxLUufud250HOo4zmbjg=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory Shorts Fam",
                "liveBroadcastContent": "none",
                "publishTime": "2022-06-07T18:13:35Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "yo2F6eMPapLYo8snUpTsKaFBqAE",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCVz7aWPae0WPJqP08M1lZMg"
            },
            "snippet": {
                "publishedAt": "2017-07-11T18:54:57Z",
                "channelId": "UCVz7aWPae0WPJqP08M1lZMg",
                "title": "Yes Theory Newsletter",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJW2Y8YpvOXOrlpXkp5V49GPYxPgWat5YVb1cPya=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJW2Y8YpvOXOrlpXkp5V49GPYxPgWat5YVb1cPya=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJW2Y8YpvOXOrlpXkp5V49GPYxPgWat5YVb1cPya=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory Newsletter",
                "liveBroadcastContent": "none",
                "publishTime": "2017-07-11T18:54:57Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "NgmyRWS6OyqxzkBozLkiEg9pBbo",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCxldHXtWKRdPheV2ORkHG5Q"
            },
            "snippet": {
                "publishedAt": "2022-02-14T07:58:51Z",
                "channelId": "UCxldHXtWKRdPheV2ORkHG5Q",
                "title": "Yes Theory vlogs",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/dZTYspzyxfOJa1saTrGZYqKeSM6aQvmtAQPpp67wmQPNPgijAhOR6zJhN1_uAmHnhTJiIJxpZA=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/dZTYspzyxfOJa1saTrGZYqKeSM6aQvmtAQPpp67wmQPNPgijAhOR6zJhN1_uAmHnhTJiIJxpZA=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/dZTYspzyxfOJa1saTrGZYqKeSM6aQvmtAQPpp67wmQPNPgijAhOR6zJhN1_uAmHnhTJiIJxpZA=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory vlogs",
                "liveBroadcastContent": "none",
                "publishTime": "2022-02-14T07:58:51Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "WL3WEbeGo8j0d57UrDltx2bfsYU",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UC-6pzTm76m3RQIBTqAq97fw"
            },
            "snippet": {
                "publishedAt": "2021-07-26T20:07:20Z",
                "channelId": "UC-6pzTm76m3RQIBTqAq97fw",
                "title": "Yes theory clips ",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/aqqwLLmdKlYYlVOhen6lIi_KLNe9e3vXgMykV78_jR9ST81SOpb4fqfLO-sGWykRArKQUKS_=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/aqqwLLmdKlYYlVOhen6lIi_KLNe9e3vXgMykV78_jR9ST81SOpb4fqfLO-sGWykRArKQUKS_=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/aqqwLLmdKlYYlVOhen6lIi_KLNe9e3vXgMykV78_jR9ST81SOpb4fqfLO-sGWykRArKQUKS_=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes theory clips ",
                "liveBroadcastContent": "none",
                "publishTime": "2021-07-26T20:07:20Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "vdHJP0lgCOE2yF4lSdj4C8s0px4",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCTiVnDrcUjNoY3wZyEs5lKA"
            },
            "snippet": {
                "publishedAt": "2011-06-11T14:53:53Z",
                "channelId": "UCTiVnDrcUjNoY3wZyEs5lKA",
                "title": "Staffan Taylor",
                "description": "Hey you! :) My name is Staffan Taylor and I call myself a professional dreamer! After thinking about it for many years I got the ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXwsl7tF7vBv90c5RY5EgQMJnFO1O5LdvJI4pv8sw=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXwsl7tF7vBv90c5RY5EgQMJnFO1O5LdvJI4pv8sw=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXwsl7tF7vBv90c5RY5EgQMJnFO1O5LdvJI4pv8sw=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Staffan Taylor",
                "liveBroadcastContent": "none",
                "publishTime": "2011-06-11T14:53:53Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "1Vh8BJ_kQSERG6YN-OiCjOQFT98",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCJwGrIhKZPSPICAXZwZDpig"
            },
            "snippet": {
                "publishedAt": "2019-08-12T08:33:12Z",
                "channelId": "UCJwGrIhKZPSPICAXZwZDpig",
                "title": "Yes Theory Uploads",
                "description": "Premium Yes Theory Uploads.",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXVDtIQ8ctjAkqdG9PWJDQ7_3AqYjUWqsqqhm6Y=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXVDtIQ8ctjAkqdG9PWJDQ7_3AqYjUWqsqqhm6Y=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXVDtIQ8ctjAkqdG9PWJDQ7_3AqYjUWqsqqhm6Y=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory Uploads",
                "liveBroadcastContent": "none",
                "publishTime": "2019-08-12T08:33:12Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "VMrn2otcypvKpZPbNzP3_8t9Y-4",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCaI6YDZFpCig3JUugIhNDMA"
            },
            "snippet": {
                "publishedAt": "2018-08-19T02:24:53Z",
                "channelId": "UCaI6YDZFpCig3JUugIhNDMA",
                "title": "The Yes Theory Family",
                "description": "Hi there. This is the official announcement of an idea I've been sitting on for a while, and if you are a true member of this family, ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUzCxDJS5nZOBAeHym-Nr9syMxuIIInXIOmtPKd=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUzCxDJS5nZOBAeHym-Nr9syMxuIIInXIOmtPKd=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUzCxDJS5nZOBAeHym-Nr9syMxuIIInXIOmtPKd=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "The Yes Theory Family",
                "liveBroadcastContent": "none",
                "publishTime": "2018-08-19T02:24:53Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "-GpmpWKBG_0EfwdVkIOiXFmbQ9M",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCczkQ3ljD6Gfs9NXDJmoqQQ"
            },
            "snippet": {
                "publishedAt": "2019-03-07T14:09:36Z",
                "channelId": "UCczkQ3ljD6Gfs9NXDJmoqQQ",
                "title": "Yes Theory На Русском",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJVDU7fAGKVhWNwYgNCoBOZzSLKPoqijuNTFWwro=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJVDU7fAGKVhWNwYgNCoBOZzSLKPoqijuNTFWwro=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJVDU7fAGKVhWNwYgNCoBOZzSLKPoqijuNTFWwro=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory На Русском",
                "liveBroadcastContent": "none",
                "publishTime": "2019-03-07T14:09:36Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "to26vOzogGG8Lrr8VwIZUDA51Lo",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCe6YoTvLvNLjLAscMFHYvTQ"
            },
            "snippet": {
                "publishedAt": "2022-01-14T07:05:03Z",
                "channelId": "UCe6YoTvLvNLjLAscMFHYvTQ",
                "title": "Yes Theory 日本語字幕チャンネル",
                "description": "Yes Theory 日本語字幕チャンネルへようこそ！ このチャンネルでは、アメリカの大人気Youtuber YES THEORY の動画に日本語 ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/V21ORCKcSsmntym2S7Xu0N3ZkueInvd_fyxn0nnylxxWUql4kzNJgeGFag0RIfZ7KZOYR1mSHg=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/V21ORCKcSsmntym2S7Xu0N3ZkueInvd_fyxn0nnylxxWUql4kzNJgeGFag0RIfZ7KZOYR1mSHg=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/V21ORCKcSsmntym2S7Xu0N3ZkueInvd_fyxn0nnylxxWUql4kzNJgeGFag0RIfZ7KZOYR1mSHg=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory 日本語字幕チャンネル",
                "liveBroadcastContent": "none",
                "publishTime": "2022-01-14T07:05:03Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "3R4GyaHtR7u-8lRE-r2gg9MsZCM",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCX-2bAelMKnFKH1PNlHqAoQ"
            },
            "snippet": {
                "publishedAt": "2019-04-07T04:45:24Z",
                "channelId": "UCX-2bAelMKnFKH1PNlHqAoQ",
                "title": "Yes Theory Deleted",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJVfyGROerDI3q_N9Wo5OkgoIrNeNW-C5oUMb0jW=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJVfyGROerDI3q_N9Wo5OkgoIrNeNW-C5oUMb0jW=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJVfyGROerDI3q_N9Wo5OkgoIrNeNW-C5oUMb0jW=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory Deleted",
                "liveBroadcastContent": "none",
                "publishTime": "2019-04-07T04:45:24Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "qc2vlUyuaro74JvHLJPvODbkSXY",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCDOGramu2-YPLYMFmMu6aBw"
            },
            "snippet": {
                "publishedAt": "2023-01-02T15:22:34Z",
                "channelId": "UCDOGramu2-YPLYMFmMu6aBw",
                "title": "YES THEORY (বাংলা)",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/mmE7akzJ_Ev3Fhbk72LmNW3RKw7TLZ4JI4ly-uDUB11RLeojg_cpL9VTW3FM0vR_MQRfUTZdrJc=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/mmE7akzJ_Ev3Fhbk72LmNW3RKw7TLZ4JI4ly-uDUB11RLeojg_cpL9VTW3FM0vR_MQRfUTZdrJc=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/mmE7akzJ_Ev3Fhbk72LmNW3RKw7TLZ4JI4ly-uDUB11RLeojg_cpL9VTW3FM0vR_MQRfUTZdrJc=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "YES THEORY (বাংলা)",
                "liveBroadcastContent": "none",
                "publishTime": "2023-01-02T15:22:34Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "IoMo_jjec8i2qeamncMvKDA3vx4",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UC2AF9q-_Zc5TY7t_cKy0BNg"
            },
            "snippet": {
                "publishedAt": "2022-09-09T10:55:29Z",
                "channelId": "UC2AF9q-_Zc5TY7t_cKy0BNg",
                "title": "Yes Theory (For You Always)",
                "description": "I am just trying to fuel the flame and keep engine going. Don't stop if you have failed, going through tough times, sad about ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/eX4SSNERwkT1qYYa5Tuqd78ESypV5nwPvDC3PtICYL5SJn7zs-G1S99jlzehr6WtS7q2w7Ce=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/eX4SSNERwkT1qYYa5Tuqd78ESypV5nwPvDC3PtICYL5SJn7zs-G1S99jlzehr6WtS7q2w7Ce=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/eX4SSNERwkT1qYYa5Tuqd78ESypV5nwPvDC3PtICYL5SJn7zs-G1S99jlzehr6WtS7q2w7Ce=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory (For You Always)",
                "liveBroadcastContent": "none",
                "publishTime": "2022-09-09T10:55:29Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "03EA7diGKTZ68N6_BC0ChzuMMW8",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCmcjAwGBvNdvCm96QI8LnQA"
            },
            "snippet": {
                "publishedAt": "2018-09-13T16:44:11Z",
                "channelId": "UCmcjAwGBvNdvCm96QI8LnQA",
                "title": "yes theory gaming",
                "description": "hi i am mohamud plz follow my channel and like also plz use code.",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWFqizef0jrp__4N9XKYgBqJUsiJ5DuRChQcQqO=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWFqizef0jrp__4N9XKYgBqJUsiJ5DuRChQcQqO=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWFqizef0jrp__4N9XKYgBqJUsiJ5DuRChQcQqO=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "yes theory gaming",
                "liveBroadcastContent": "none",
                "publishTime": "2018-09-13T16:44:11Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "o0VaYm0bi157IVOX0uivkrlF1Dc",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCvDOo4CyafVlSQCBmHdDdJg"
            },
            "snippet": {
                "publishedAt": "2020-08-21T16:55:05Z",
                "channelId": "UCvDOo4CyafVlSQCBmHdDdJg",
                "title": "Yes Theory IU",
                "description": "Seeking Discomfort at Indiana University.",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWKyiLmgI5P_200g6deWY2kc01mm7lG6VzkFHkz=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWKyiLmgI5P_200g6deWY2kc01mm7lG6VzkFHkz=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWKyiLmgI5P_200g6deWY2kc01mm7lG6VzkFHkz=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory IU",
                "liveBroadcastContent": "none",
                "publishTime": "2020-08-21T16:55:05Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "Xx_0m-HmurSjqFFRYNzAnGP9nzk",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCJoPJVKFJfEVCiEgMZbxkxQ"
            },
            "snippet": {
                "publishedAt": "2013-08-26T21:47:47Z",
                "channelId": "UCJoPJVKFJfEVCiEgMZbxkxQ",
                "title": "Yes Theory Fans",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWxGg4w2xp3U7-oBHmQP1q_1Lroo1Uk_o9Xv19t=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWxGg4w2xp3U7-oBHmQP1q_1Lroo1Uk_o9Xv19t=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWxGg4w2xp3U7-oBHmQP1q_1Lroo1Uk_o9Xv19t=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory Fans",
                "liveBroadcastContent": "none",
                "publishTime": "2013-08-26T21:47:47Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "tQGJRyokcRPvAlZoatnNmrJxU_A",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCHNOiP-8RfNBXAOhzGluoTw"
            },
            "snippet": {
                "publishedAt": "2021-05-15T10:14:40Z",
                "channelId": "UCHNOiP-8RfNBXAOhzGluoTw",
                "title": "YES THEORY PROJECT",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/9WeFGf3jPnwiA1LcTrO-4aFvngTNMRIHMGji8O7-Nm7AQXojyI0gY0NF0GnyRs0mgyAaPkp0yAw=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/9WeFGf3jPnwiA1LcTrO-4aFvngTNMRIHMGji8O7-Nm7AQXojyI0gY0NF0GnyRs0mgyAaPkp0yAw=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/9WeFGf3jPnwiA1LcTrO-4aFvngTNMRIHMGji8O7-Nm7AQXojyI0gY0NF0GnyRs0mgyAaPkp0yAw=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "YES THEORY PROJECT",
                "liveBroadcastContent": "none",
                "publishTime": "2021-05-15T10:14:40Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "ZEVPDRRGNB8Nyt46mcAVHwSMBng",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCz7t5Vqed6h3Xojwfx5ydwQ"
            },
            "snippet": {
                "publishedAt": "2019-04-26T21:35:11Z",
                "channelId": "UCz7t5Vqed6h3Xojwfx5ydwQ",
                "title": "Yes Theory x Penn State",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJX7pYVTJM40LfjHfg_tKAKLeuAN_YzC6N8JAq54=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJX7pYVTJM40LfjHfg_tKAKLeuAN_YzC6N8JAq54=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJX7pYVTJM40LfjHfg_tKAKLeuAN_YzC6N8JAq54=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory x Penn State",
                "liveBroadcastContent": "none",
                "publishTime": "2019-04-26T21:35:11Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "7ND8PIhrVbQLb-s4-zVZndDL6Wc",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCpY2b3Fb9XxjzYYKIbRO0Gw"
            },
            "snippet": {
                "publishedAt": "2022-01-30T08:50:22Z",
                "channelId": "UCpY2b3Fb9XxjzYYKIbRO0Gw",
                "title": "YES Theory bd",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/QQRq-tKmvwKGc7fZtK0F7sT3Pjp-oe1bl3DbKRr80_7CaR28z-c5zpZ1EmmTttp5pDcig2dG=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/QQRq-tKmvwKGc7fZtK0F7sT3Pjp-oe1bl3DbKRr80_7CaR28z-c5zpZ1EmmTttp5pDcig2dG=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/QQRq-tKmvwKGc7fZtK0F7sT3Pjp-oe1bl3DbKRr80_7CaR28z-c5zpZ1EmmTttp5pDcig2dG=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "YES Theory bd",
                "liveBroadcastContent": "none",
                "publishTime": "2022-01-30T08:50:22Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "C48yYiOW4pXfFbuDggwOkiAhep8",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCyUEsn1N5GHe5V2N3RtAnuw"
            },
            "snippet": {
                "publishedAt": "2019-11-08T00:53:28Z",
                "channelId": "UCyUEsn1N5GHe5V2N3RtAnuw",
                "title": "Yes Theory",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWZ7awTgO__Z9X6uGxKGn5og6-T2gVcsQRvRw=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWZ7awTgO__Z9X6uGxKGn5og6-T2gVcsQRvRw=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWZ7awTgO__Z9X6uGxKGn5og6-T2gVcsQRvRw=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory",
                "liveBroadcastContent": "none",
                "publishTime": "2019-11-08T00:53:28Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "3kmHEI3cCQ75s_cxn0WpmmcBZfE",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCxOILyM6WpRL3FNUhgBpq4g"
            },
            "snippet": {
                "publishedAt": "2010-05-13T19:42:57Z",
                "channelId": "UCxOILyM6WpRL3FNUhgBpq4g",
                "title": "yestheory",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/_BvZ1AAqUfDpYWz7odN-ibh_GAAbcWdOiQyzHVZIjiy6BkcBlVLxV2RPa3Suh6WE173tvoR8mg=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/_BvZ1AAqUfDpYWz7odN-ibh_GAAbcWdOiQyzHVZIjiy6BkcBlVLxV2RPa3Suh6WE173tvoR8mg=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/_BvZ1AAqUfDpYWz7odN-ibh_GAAbcWdOiQyzHVZIjiy6BkcBlVLxV2RPa3Suh6WE173tvoR8mg=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "yestheory",
                "liveBroadcastContent": "none",
                "publishTime": "2010-05-13T19:42:57Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "gm55OwkCXV35PH3h5VrXm18Zn5w",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCPArHjc2xRcBk5BNHvcd6lw"
            },
            "snippet": {
                "publishedAt": "2023-01-18T03:37:26Z",
                "channelId": "UCPArHjc2xRcBk5BNHvcd6lw",
                "title": "yes theory bangla",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/N5_9H-rLNpKfWQYcHw0okvyi3CRxKM6P53Xu5vsScKpUQXuLmRJRtTW2BKSOBWOjv5qafLIi4K8=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/N5_9H-rLNpKfWQYcHw0okvyi3CRxKM6P53Xu5vsScKpUQXuLmRJRtTW2BKSOBWOjv5qafLIi4K8=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/N5_9H-rLNpKfWQYcHw0okvyi3CRxKM6P53Xu5vsScKpUQXuLmRJRtTW2BKSOBWOjv5qafLIi4K8=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "yes theory bangla",
                "liveBroadcastContent": "none",
                "publishTime": "2023-01-18T03:37:26Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "K-J916z06ufOf8zQ2TGomR9lWks",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UC2ms6n5dXoJ4yxrB7VqF15Q"
            },
            "snippet": {
                "publishedAt": "2013-02-06T16:30:28Z",
                "channelId": "UC2ms6n5dXoJ4yxrB7VqF15Q",
                "title": "Yes Theory На Русском",
                "description": "Буду всегда рад помочь вам с переводом новых зарубежных видео.",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXWX97JHx3DhtlAWDU_vLvr1zt0UZh_RTuSIiRzjw=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXWX97JHx3DhtlAWDU_vLvr1zt0UZh_RTuSIiRzjw=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXWX97JHx3DhtlAWDU_vLvr1zt0UZh_RTuSIiRzjw=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Yes Theory На Русском",
                "liveBroadcastContent": "none",
                "publishTime": "2013-02-06T16:30:28Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "h_gyAiwZqJrR4UaSukcTsvLs_5k",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCFpkjtssQpOh0VXcpq1KceQ"
            },
            "snippet": {
                "publishedAt": "2017-04-22T01:12:42Z",
                "channelId": "UCFpkjtssQpOh0VXcpq1KceQ",
                "title": "Hennessy’s yes theory",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/q-i6trUHh3QgXzlUQ_dDHTe5zX9O3-95gKjzwbxAIi6HPx5LfCdV6_Yp8HOpcL7CoxqWOej6LIg=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/q-i6trUHh3QgXzlUQ_dDHTe5zX9O3-95gKjzwbxAIi6HPx5LfCdV6_Yp8HOpcL7CoxqWOej6LIg=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/q-i6trUHh3QgXzlUQ_dDHTe5zX9O3-95gKjzwbxAIi6HPx5LfCdV6_Yp8HOpcL7CoxqWOej6LIg=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Hennessy’s yes theory",
                "liveBroadcastContent": "none",
                "publishTime": "2017-04-22T01:12:42Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "oU6nqdvafP29p4E8CmGc6N3sGrg",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UC8-1md0Bg2cbsrVE_TOKvvQ"
            },
            "snippet": {
                "publishedAt": "2016-05-19T01:52:29Z",
                "channelId": "UC8-1md0Bg2cbsrVE_TOKvvQ",
                "title": "Cynical Duchess",
                "description": "Cynical Duchess is a fashion & lifestyle channel dedicated to embracing your misfit. I love trying fashion trends from all over the ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWgjRXJ2_SkBH56Km2K4pLChiTO1X97dVNIO-dmWQ=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWgjRXJ2_SkBH56Km2K4pLChiTO1X97dVNIO-dmWQ=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJWgjRXJ2_SkBH56Km2K4pLChiTO1X97dVNIO-dmWQ=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Cynical Duchess",
                "liveBroadcastContent": "none",
                "publishTime": "2016-05-19T01:52:29Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "VKy9dQVIV9buyLiT0_rpzDXwz8k",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCsoYQCXaLgrKsqis6EjYL8g"
            },
            "snippet": {
                "publishedAt": "2021-04-12T11:54:44Z",
                "channelId": "UCsoYQCXaLgrKsqis6EjYL8g",
                "title": "Harrison @ The Oddity Forge",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/HoE-MXewHN3NOw3WWRAXsDSdU0v7xTpekEB6htE8usERFS0BZWQ-KlquxOKROY9YhqY7iWTq=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/HoE-MXewHN3NOw3WWRAXsDSdU0v7xTpekEB6htE8usERFS0BZWQ-KlquxOKROY9YhqY7iWTq=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/HoE-MXewHN3NOw3WWRAXsDSdU0v7xTpekEB6htE8usERFS0BZWQ-KlquxOKROY9YhqY7iWTq=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Harrison @ The Oddity Forge",
                "liveBroadcastContent": "none",
                "publishTime": "2021-04-12T11:54:44Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "S__aDrMilhs-E8-KPbK13BaTIpQ",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCemJygrPb53JW2uU9JsbrVA"
            },
            "snippet": {
                "publishedAt": "2014-12-16T17:05:53Z",
                "channelId": "UCemJygrPb53JW2uU9JsbrVA",
                "title": "Cory S Martin",
                "description": "For the past 7 years I've been a freelancer filmmaker focusing on travel and lifestyle content. I've worked alongside companies ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/oDt6yz1eL69xRURi2wyK-kiXR3IKrmMgLAdzcLIhe0KwNX5wljU9oR9T3J28LWx14bof7EEvNGk=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/oDt6yz1eL69xRURi2wyK-kiXR3IKrmMgLAdzcLIhe0KwNX5wljU9oR9T3J28LWx14bof7EEvNGk=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/oDt6yz1eL69xRURi2wyK-kiXR3IKrmMgLAdzcLIhe0KwNX5wljU9oR9T3J28LWx14bof7EEvNGk=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Cory S Martin",
                "liveBroadcastContent": "none",
                "publishTime": "2014-12-16T17:05:53Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "FsT4Pd6oxV_cFrag9_4npEjbi_0",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCgVjaXUO1ZVuL8xxCoR3Mhw"
            },
            "snippet": {
                "publishedAt": "2012-12-11T12:42:40Z",
                "channelId": "UCgVjaXUO1ZVuL8xxCoR3Mhw",
                "title": "Aleksa Camur",
                "description": "A channel about living life to the fullest, traveling, and friendship, and as yes theory would say \"seeking discomfort\".",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUhvkj3UhnP_2_z3ocPLt005EvAjDzXc_c027qx2g=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUhvkj3UhnP_2_z3ocPLt005EvAjDzXc_c027qx2g=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUhvkj3UhnP_2_z3ocPLt005EvAjDzXc_c027qx2g=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Aleksa Camur",
                "liveBroadcastContent": "none",
                "publishTime": "2012-12-11T12:42:40Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "YfrsnUJKO1O6gE1RU-dHxDS2cDQ",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCQeBNkfmc-OTMPNggmBLB9w"
            },
            "snippet": {
                "publishedAt": "2017-07-05T18:08:55Z",
                "channelId": "UCQeBNkfmc-OTMPNggmBLB9w",
                "title": "Logical Lamont",
                "description": "Started learning vlogs, didn't work. Started trying something new, now making skits. Going back to vlog format one day  ‍   Social ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/QSXWpAq2M08AFRxdW20vUgz2eNM2IClcgI-EnjpYW1Qiku4PfFJmqnWkqLCS8Cl60szByjlwEw=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/QSXWpAq2M08AFRxdW20vUgz2eNM2IClcgI-EnjpYW1Qiku4PfFJmqnWkqLCS8Cl60szByjlwEw=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/QSXWpAq2M08AFRxdW20vUgz2eNM2IClcgI-EnjpYW1Qiku4PfFJmqnWkqLCS8Cl60szByjlwEw=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Logical Lamont",
                "liveBroadcastContent": "upcoming",
                "publishTime": "2017-07-05T18:08:55Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "3wlJR5u2TpyqrdPFjF_6a9PBK1Y",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCX8f2cg3wNNTqLJiNZ22nsg"
            },
            "snippet": {
                "publishedAt": "2021-01-20T05:30:32Z",
                "channelId": "UCX8f2cg3wNNTqLJiNZ22nsg",
                "title": "GEN Y",
                "description": "WE are the GENERATION \"YES\" YES THEORY Inspired We take pleasure *SEEKING DISCOMFORT*",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/vt_4i8xwsEmKjFDgCZT-8OxVpAjZ3w4QESB37ErD74ysb7Dhrr_q63cYV7aGXrt9LRj2kUv0=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/vt_4i8xwsEmKjFDgCZT-8OxVpAjZ3w4QESB37ErD74ysb7Dhrr_q63cYV7aGXrt9LRj2kUv0=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/vt_4i8xwsEmKjFDgCZT-8OxVpAjZ3w4QESB37ErD74ysb7Dhrr_q63cYV7aGXrt9LRj2kUv0=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "GEN Y",
                "liveBroadcastContent": "none",
                "publishTime": "2021-01-20T05:30:32Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "WXfiiu-qMDuTRI7Gt-_E9tYYseo",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCcg-esxCzfSKhhJl1-5Gb1A"
            },
            "snippet": {
                "publishedAt": "2020-02-12T00:35:05Z",
                "channelId": "UCcg-esxCzfSKhhJl1-5Gb1A",
                "title": "Ivan Ye",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUIHJ1QUTL1tisMQgJDutbMlIZZx6ua8-5OOBIq=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUIHJ1QUTL1tisMQgJDutbMlIZZx6ua8-5OOBIq=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJUIHJ1QUTL1tisMQgJDutbMlIZZx6ua8-5OOBIq=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Ivan Ye",
                "liveBroadcastContent": "upcoming",
                "publishTime": "2020-02-12T00:35:05Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "ECz9ZauYGj741G2cHJeoNS_s1V8",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCQAde-Kd0k41wIU9hM6r_7A"
            },
            "snippet": {
                "publishedAt": "2020-01-15T23:06:06Z",
                "channelId": "UCQAde-Kd0k41wIU9hM6r_7A",
                "title": "STOKED",
                "description": "Welcome to STOKED. This is an 8 part documentary series dives into the process of building community. We live in a society that ...",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXX6BXCB1SPol_t4IDLIjOyKJ0FRU7XpdWap65p=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXX6BXCB1SPol_t4IDLIjOyKJ0FRU7XpdWap65p=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJXX6BXCB1SPol_t4IDLIjOyKJ0FRU7XpdWap65p=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "STOKED",
                "liveBroadcastContent": "none",
                "publishTime": "2020-01-15T23:06:06Z"
            }
        },
        {
            "kind": "youtube#searchResult",
            "etag": "XkDfKEJsyRmMgM6gBoiuoqtDckc",
            "id": {
                "kind": "youtube#channel",
                "channelId": "UCjNTROEFX2TtvH4iSG9F6qA"
            },
            "snippet": {
                "publishedAt": "2014-12-27T15:16:22Z",
                "channelId": "UCjNTROEFX2TtvH4iSG9F6qA",
                "title": "Ray Guzzone",
                "description": "",
                "thumbnails": {
                    "default": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJVqJLG2bdcTcnSKgmLhBSIQmPo7wkgDYdRroSLmFP4=s88-c-k-c0xffffffff-no-rj-mo"
                    },
                    "medium": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJVqJLG2bdcTcnSKgmLhBSIQmPo7wkgDYdRroSLmFP4=s240-c-k-c0xffffffff-no-rj-mo"
                    },
                    "high": {
                        "url": "https://yt3.ggpht.com/ytc/AL5GRJVqJLG2bdcTcnSKgmLhBSIQmPo7wkgDYdRroSLmFP4=s800-c-k-c0xffffffff-no-rj-mo"
                    }
                },
                "channelTitle": "Ray Guzzone",
                "liveBroadcastContent": "none",
                "publishTime": "2014-12-27T15:16:22Z"
            }
        }
    ]
}
  end

  def add_shorts
    response = HTTParty.get("https://yt.lemnoslife.com/channels?part=shorts&id=#{params[:channel_id]}")
    shorts = JSON.parse(response.body)["items"][0]["shorts"]

    # Create channel if shorts exist
    if shorts.length > 0
        response = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=snippet&maxResults=1&id=#{params[:channel_id]}&key=#{Rails.application.credentials.dig(:youtube_api_key)}")

        # current user adds a channel
        AddedChannel.create!(
            user_id: current_user.id, 
            channel_id: params[:channel_id], 
            name: JSON.parse(response.body)["items"][0]["snippet"]["title"]
        )
        #
        if YoutubeChannel.find_by(channel_id: params[:channel_id]).nil?
            YoutubeChannel.create!(
                name: JSON.parse(response.body)["items"][0]["snippet"]["title"], 
                channel_id: params[:channel_id]
            )
        end
        # Create shorts videos
        shorts.each do |short|
            if YoutubeVideo.find_by(video_id: short["videoId"]).nil?
            YoutubeVideo.create!(channel_id: params[:channel_id], video_id: short["videoId"])
            end
        end
    end

    render json: YoutubeVideo.where(channel_id: params[:channel_id])
  end

  def remove_shorts
    AddedChannel.find_by(user_id: current_user.id, channel_id: params[:channel_id])&.destroy
    render json: { message: 'Channel removed' }
  end

  def channels
    # channels = []

    # YoutubeChannel.all.order("name").each do |channel|
    #     response = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=snippet,statistics&id=#{channel.channel_id}&maxResults=1&key=#{Rails.application.credentials.dig(:youtube_api_key)}")
    
    #     channels << JSON.parse(response.body)
    # end
    # puts channels.inspect
    # render json: channels

    render json: [{"kind"=>"youtube#channelListResponse", "etag"=>"2EquT9QYSGDXhUIZWYQ8UO0O-oE", "pageInfo"=>{"totalResults"=>1, "resultsPerPage"=>1}, "items"=>[{"kind"=>"youtube#channel", "etag"=>"ZQczFEYhwAMTjEJkiuLODeAV9K0", "id"=>"UCkhDeBavkCxdSycc_8ETWqQ", "snippet"=>{"title"=>"calm_art", "description"=>"~Hey everyone!! welcome to my channel!!\nIf you find my channel interesting, then hit that subscribe button and I would do my best to post more fun and interesting content:)", "customUrl"=>"@calm_art", "publishedAt"=>"2021-09-14T05:56:42.108745Z", "thumbnails"=>{"default"=>{"url"=>"https://yt3.ggpht.com/26n9kr69JOMFpE3-BZVDhgeIq3mXB_GVUBsOUdrV-NRWe2wGjs5UVjI8IqqAzQuvEzQsTyof9xk=s88-c-k-c0x00ffffff-no-rj", "width"=>88, "height"=>88}, "medium"=>{"url"=>"https://yt3.ggpht.com/26n9kr69JOMFpE3-BZVDhgeIq3mXB_GVUBsOUdrV-NRWe2wGjs5UVjI8IqqAzQuvEzQsTyof9xk=s240-c-k-c0x00ffffff-no-rj", "width"=>240, "height"=>240}, "high"=>{"url"=>"https://yt3.ggpht.com/26n9kr69JOMFpE3-BZVDhgeIq3mXB_GVUBsOUdrV-NRWe2wGjs5UVjI8IqqAzQuvEzQsTyof9xk=s800-c-k-c0x00ffffff-no-rj", "width"=>800, "height"=>800}}, "localized"=>{"title"=>"calm_art", "description"=>"~Hey everyone!! welcome to my channel!!\nIf you find my channel interesting, then hit that subscribe button and I would do my best to post more fun and interesting content:)"}}, "statistics"=>{"viewCount"=>"220234780", "subscriberCount"=>"685000", "hiddenSubscriberCount"=>false, "videoCount"=>"314"}}]}, {"kind"=>"youtube#channelListResponse", "etag"=>"A5AkEI61K4s3BFb21pSeIaz59-w", "pageInfo"=>{"totalResults"=>1, "resultsPerPage"=>1}, "items"=>[{"kind"=>"youtube#channel", "etag"=>"v0DdkruJG5l86tp2HDEucNyFrr4", "id"=>"UCeb_Lnqnnsz81Sdj-2CX6Lg", "snippet"=>{"title"=>"Contemporary Shorts", "description"=>"The Funniest and Best Clips from TV Shows, Interviews, Stand up and Podcasts throughtout the years.\n\nI make YouTube shorts from the videos that are available on YouTube. I try to make the best crop for the 9:16 aspect ratio, and sometimes I trim parts of the original video to make it 60 seconds so that the whole point is intact.\n\nPlease subscribe to see more from this channel on your YouTube feed!\n\nFor any General/Copyright Inquiries please contact me at: espen@myntcom.no\n", "customUrl"=>"@contemporaryshorts", "publishedAt"=>"2021-07-20T09:19:37.554743Z", "thumbnails"=>{"default"=>{"url"=>"https://yt3.ggpht.com/JOI4irnyYbowDEvhNp2fDMn8kcwcPqEnCQHnsu4JZdfmKnlVxoZwnA4UIH--iRbm329k6t0-pw=s88-c-k-c0x00ffffff-no-rj", "width"=>88, "height"=>88}, "medium"=>{"url"=>"https://yt3.ggpht.com/JOI4irnyYbowDEvhNp2fDMn8kcwcPqEnCQHnsu4JZdfmKnlVxoZwnA4UIH--iRbm329k6t0-pw=s240-c-k-c0x00ffffff-no-rj", "width"=>240, "height"=>240}, "high"=>{"url"=>"https://yt3.ggpht.com/JOI4irnyYbowDEvhNp2fDMn8kcwcPqEnCQHnsu4JZdfmKnlVxoZwnA4UIH--iRbm329k6t0-pw=s800-c-k-c0x00ffffff-no-rj", "width"=>800, "height"=>800}}, "localized"=>{"title"=>"Contemporary Shorts", "description"=>"The Funniest and Best Clips from TV Shows, Interviews, Stand up and Podcasts throughtout the years.\n\nI make YouTube shorts from the videos that are available on YouTube. I try to make the best crop for the 9:16 aspect ratio, and sometimes I trim parts of the original video to make it 60 seconds so that the whole point is intact.\n\nPlease subscribe to see more from this channel on your YouTube feed!\n\nFor any General/Copyright Inquiries please contact me at: espen@myntcom.no\n"}, "country"=>"NO"}, "statistics"=>{"viewCount"=>"271527825", "subscriberCount"=>"277000", "hiddenSubscriberCount"=>false, "videoCount"=>"182"}}]}, {"kind"=>"youtube#channelListResponse", "etag"=>"Lm-q4qsJl2lPmM6AtwvX4Nl_I1U", "pageInfo"=>{"totalResults"=>1, "resultsPerPage"=>1}, "items"=>[{"kind"=>"youtube#channel", "etag"=>"Ym-r7RGfvWZ-uHgElvGkF7ZGtcA", "id"=>"UCdC0An4ZPNr_YiFiYoVbwaw", "snippet"=>{"title"=>"Daily Dose Of Internet", "description"=>"Welcome to your Daily Dose of Internet where I search for the best trending videos, or videos people have forgotten about, and put them all in one video. I always ask for permission to share videos that I find!\n\n-------------------------------------------------------------------------------------------------------------\n\nIf YOU film a video and think it is good enough to be featured on Daily Dose Of Internet, you can submit videos to me using the link below.\n\nOnly send in videos that you personally filmed. If you are not 18, you can have a parent or guardian sign for you.\n\nhttps://www.thedailydoseofinternet.com/\n\n------------------------------------\n\nBusiness Inquires: Hit me up on my social media. I can't give out email due to spam.\n\n------------------------------------", "customUrl"=>"@dailydoseofinternet", "publishedAt"=>"2015-07-15T02:13:53Z", "thumbnails"=>{"default"=>{"url"=>"https://yt3.ggpht.com/ytc/AL5GRJWvvFEaRr2Aue3aNbGzyXXwkKgUralnOLm3mGS5Dg=s88-c-k-c0x00ffffff-no-rj", "width"=>88, "height"=>88}, "medium"=>{"url"=>"https://yt3.ggpht.com/ytc/AL5GRJWvvFEaRr2Aue3aNbGzyXXwkKgUralnOLm3mGS5Dg=s240-c-k-c0x00ffffff-no-rj", "width"=>240, "height"=>240}, "high"=>{"url"=>"https://yt3.ggpht.com/ytc/AL5GRJWvvFEaRr2Aue3aNbGzyXXwkKgUralnOLm3mGS5Dg=s800-c-k-c0x00ffffff-no-rj", "width"=>800, "height"=>800}}, "localized"=>{"title"=>"Daily Dose Of Internet", "description"=>"Welcome to your Daily Dose of Internet where I search for the best trending videos, or videos people have forgotten about, and put them all in one video. I always ask for permission to share videos that I find!\n\n-------------------------------------------------------------------------------------------------------------\n\nIf YOU film a video and think it is good enough to be featured on Daily Dose Of Internet, you can submit videos to me using the link below.\n\nOnly send in videos that you personally filmed. If you are not 18, you can have a parent or guardian sign for you.\n\nhttps://www.thedailydoseofinternet.com/\n\n------------------------------------\n\nBusiness Inquires: Hit me up on my social media. I can't give out email due to spam.\n\n------------------------------------"}, "country"=>"US"}, "statistics"=>{"viewCount"=>"5195228839", "subscriberCount"=>"14900000", "hiddenSubscriberCount"=>false, "videoCount"=>"507"}}]}, {"kind"=>"youtube#channelListResponse", "etag"=>"_w_DZFhFsl6cqisCwV9RZtbUbmo", "pageInfo"=>{"totalResults"=>1, "resultsPerPage"=>1}, "items"=>[{"kind"=>"youtube#channel", "etag"=>"rQfKKJ2l6YoTyEXukO7fU3HS8Ew", "id"=>"UCRH6FEPoRlqFLY_-TOs78Aw", "snippet"=>{"title"=>"deermeatfordinner", "description"=>"Hey there! We're stoked you're taking the time to check out our channel!!! I'm just a guy who grew up in Jupiter, Florida loving my BB gun a lot more than my lego's... I love to hunt, fish, freedive and get dirty! \n\nAnd I am just a girl who grew up in Oshkosh, Wisconsin and excelled in softball... When I wasn't on the softball field, I was in a different field hunting with my Dad! I also have a passion for fishing and anything else that gets me outdoors! \n\nDeer Meat For Dinner is an in depth look at who we are as individuals and as a couple. We are meat eaters and eat what we harvest! \n\nBe sure to subscribe and check out some of our previous videos! This is our story, no make-believe... Keep in touch and please be respectful when you comment. We don't have a problem with you if you disagree with us and our lifestyle, just please don't use foul language and try to be respectful.... thanks and we'll see you soon!\n\n(Don't forget to look at our website!! www.deermeatfordinner.com)", "customUrl"=>"@deermeatfordinner", "publishedAt"=>"2013-02-27T17:22:01Z", "thumbnails"=>{"default"=>{"url"=>"https://yt3.ggpht.com/ytc/AL5GRJX5e8MNikLSz4uhhne4beHyAn6ziBBbq1tyFI1yFw=s88-c-k-c0x00ffffff-no-rj", "width"=>88, "height"=>88}, "medium"=>{"url"=>"https://yt3.ggpht.com/ytc/AL5GRJX5e8MNikLSz4uhhne4beHyAn6ziBBbq1tyFI1yFw=s240-c-k-c0x00ffffff-no-rj", "width"=>240, "height"=>240}, "high"=>{"url"=>"https://yt3.ggpht.com/ytc/AL5GRJX5e8MNikLSz4uhhne4beHyAn6ziBBbq1tyFI1yFw=s800-c-k-c0x00ffffff-no-rj", "width"=>800, "height"=>800}}, "localized"=>{"title"=>"deermeatfordinner", "description"=>"Hey there! We're stoked you're taking the time to check out our channel!!! I'm just a guy who grew up in Jupiter, Florida loving my BB gun a lot more than my lego's... I love to hunt, fish, freedive and get dirty! \n\nAnd I am just a girl who grew up in Oshkosh, Wisconsin and excelled in softball... When I wasn't on the softball field, I was in a different field hunting with my Dad! I also have a passion for fishing and anything else that gets me outdoors! \n\nDeer Meat For Dinner is an in depth look at who we are as individuals and as a couple. We are meat eaters and eat what we harvest! \n\nBe sure to subscribe and check out some of our previous videos! This is our story, no make-believe... Keep in touch and please be respectful when you comment. We don't have a problem with you if you disagree with us and our lifestyle, just please don't use foul language and try to be respectful.... thanks and we'll see you soon!\n\n(Don't forget to look at our website!! www.deermeatfordinner.com)"}, "country"=>"US"}, "statistics"=>{"viewCount"=>"845813563", "subscriberCount"=>"3200000", "hiddenSubscriberCount"=>false, "videoCount"=>"1045"}}]}, {"kind"=>"youtube#channelListResponse", "etag"=>"qn0xqgv6ytJKiE66DxarqwwaunY", "pageInfo"=>{"totalResults"=>1, "resultsPerPage"=>1}, "items"=>[{"kind"=>"youtube#channel", "etag"=>"p5GLLalXRc2i5JlP7VGYSHwzQ9c", "id"=>"UC82GyU7a3UhAMkOzVOxIlEw", "snippet"=>{"title"=>"DIY Garden Channel", "description"=>"Hi, welcome to our  DIY Garden Channel. In this channel We will share regularly garden related videos. Thanks for visiting us. \n👍 If you like our videos don't forget to press the button \"Subscribe ❤️\" and \"Like 👍\" !!\n", "customUrl"=>"@diygardenchannel", "publishedAt"=>"2022-10-26T13:02:57.781665Z", "thumbnails"=>{"default"=>{"url"=>"https://yt3.ggpht.com/0LRitaYd0bZIxanbVBOcnfXR59nOvt3yR0MYfLkoz7D8yi1oOVZwbqe_ZdZsnUnwrXcNhhY3Cg=s88-c-k-c0x00ffffff-no-rj", "width"=>88, "height"=>88}, "medium"=>{"url"=>"https://yt3.ggpht.com/0LRitaYd0bZIxanbVBOcnfXR59nOvt3yR0MYfLkoz7D8yi1oOVZwbqe_ZdZsnUnwrXcNhhY3Cg=s240-c-k-c0x00ffffff-no-rj", "width"=>240, "height"=>240}, "high"=>{"url"=>"https://yt3.ggpht.com/0LRitaYd0bZIxanbVBOcnfXR59nOvt3yR0MYfLkoz7D8yi1oOVZwbqe_ZdZsnUnwrXcNhhY3Cg=s800-c-k-c0x00ffffff-no-rj", "width"=>800, "height"=>800}}, "localized"=>{"title"=>"DIY Garden Channel", "description"=>"Hi, welcome to our  DIY Garden Channel. In this channel We will share regularly garden related videos. Thanks for visiting us. \n👍 If you like our videos don't forget to press the button \"Subscribe ❤️\" and \"Like 👍\" !!\n"}, "country"=>"IN"}, "statistics"=>{"viewCount"=>"67062368", "subscriberCount"=>"210000", "hiddenSubscriberCount"=>false, "videoCount"=>"124"}}]}, {"kind"=>"youtube#channelListResponse", "etag"=>"_Z60D8p06EGPL13JL9mTu7bXFr0", "pageInfo"=>{"totalResults"=>1, "resultsPerPage"=>1}, "items"=>[{"kind"=>"youtube#channel", "etag"=>"Q9JUyQ5TiS4BeDSMOF63q_Pu2MY", "id"=>"UCpuT8AlP9P9EgW_pZ0_xInQ", "snippet"=>{"title"=>"Dylan Anderson", "description"=>"Telling the stories of the best videos on the internet", "customUrl"=>"@dylan_anderson", "publishedAt"=>"2010-09-05T14:30:04Z", "thumbnails"=>{"default"=>{"url"=>"https://yt3.ggpht.com/ytc/AL5GRJXynWp2whQmyQeCU1ZxQ7CrveOx_xhOA6tt0ksOSA=s88-c-k-c0x00ffffff-no-rj", "width"=>88, "height"=>88}, "medium"=>{"url"=>"https://yt3.ggpht.com/ytc/AL5GRJXynWp2whQmyQeCU1ZxQ7CrveOx_xhOA6tt0ksOSA=s240-c-k-c0x00ffffff-no-rj", "width"=>240, "height"=>240}, "high"=>{"url"=>"https://yt3.ggpht.com/ytc/AL5GRJXynWp2whQmyQeCU1ZxQ7CrveOx_xhOA6tt0ksOSA=s800-c-k-c0x00ffffff-no-rj", "width"=>800, "height"=>800}}, "localized"=>{"title"=>"Dylan Anderson", "description"=>"Telling the stories of the best videos on the internet"}, "country"=>"US"}, "statistics"=>{"viewCount"=>"7776975205", "subscriberCount"=>"4810000", "hiddenSubscriberCount"=>false, "videoCount"=>"837"}}]}]
  end

  def added_channels
    render json: current_user.added_channels
  end

  def my_channels
    channels = []

    current_user.added_channels.order("name").each do |channel|
        response = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=snippet,statistics&id=#{channel.channel_id}&maxResults=1&key=#{Rails.application.credentials.dig(:youtube_api_key)}")
    
        channels << JSON.parse(response.body)
    end
    
    render json: channels
  end

  def comments
    # response = HTTParty.get("https://www.googleapis.com/youtube/v3/commentThreads?part=snippet,id,replies&videoId=#{params[:video_id]}&maxResults=100&order=relevance&textFormat=plainText&key=#{Rails.application.credentials.dig(:youtube_api_key)}")

    # puts JSON.parse(response.body).inspect

    # render json: JSON.parse(response.body)

    render json: {
    "kind": "youtube#commentThreadListResponse",
    "etag": "LGe0ZTsp8N9UyKjBJQmfKnlqcNM",
    "nextPageToken": "Z2V0X3JhbmtlZF9zdHJlYW1zLS1DdjhEQ0lBRUZSZTMwVGdhOUFNSzd3TUkyRjhRZ0FRWUJ5TGtBNnVTU05hMFRwdVFqamJRUUdtSEN0NHhwTEJsdXJnemxUcG9qUkdkeGVTcW1MaFdvZkFMY1kyUkVXaHB0S0ZvbXNPTjE5a1BxcUxQb2o0M1VkUUlGQW9Hb3dCbEVlZG1oNVZPazRMQW1CaDFHbkhvVFpwTWJraUloUWlFcmd3TFVDWnVXVWRUdzZaczRiQlhaa3dRSW44M1dOMEZRaUJMR2FLeGNJcEtvcEdqQVlvSTZmQzZ5TW9tYW5DZ0VCdDZDWU9RdzdDeFlZM3NVdEJQTWZGN3ctQWYwRUJZQ0dYeXlFRTBFNUZxaEtOQmhUdU9rTGVYdnZWeHJoQzlnU3lyMGMzNDJxeHR4MGtkN0VkNDBBeENsMUZWYTRpOUY3alFKR0tMd254RlpfbmFPeXBaZElRZnVwaGMwQlhiNFFfTzRtMG5PUGRubFd4MkRCbTMxWFRSRU5XRXBGVkp4ZlJzTWNpN0pnbGphUWp4blhJQ05tb1NvUU0zZGp2MHFKSFFtaUQwcEtzc3Mxb2EweEhLS0NjdGgxNW1pc3RWak1zY0ZuUHRhQXlkWWRVcGprS05xWk9sWTB5ZzJFLWZTQU1UQjFrdk8xUVc5ekhiNkt1UUtFVVJxbzloSjJTZ0Nod1gxdG1jdnFSdkx4NDJ0TFZwaTlsUW1PaUVILTJtaWVJaEhDYWsyNHVSaG0wa2phQlJjY1FxcldWZTZHSjdsREl1eTM0SkpWYXg4Q3kyQ2cxVHBFWWxoZEVMRkdZdVM0T05EWnptYUkzVzZMWXJvV3FRUncwekRqbHNWTWVjRTFUYUZXYWt0TjV4WWdVM1dFYkptaHFJa3NVczJqSWhzWW5xaVdsSVhTTVFaQklGQ0lnZ0dBQVNCd2lFSUJBdUdBRVNCUWlISUJnQUVnVUlpU0FZQUJJSENJVWdFRUlZQVJJRkNJWWdHQUFZQVE=",
    "pageInfo": {
        "totalResults": 99,
        "resultsPerPage": 100
    },
    "items": [
        {
            "kind": "youtube#commentThread",
            "etag": "-8i7Pkk2hnG7foSKobzOSa7O-SQ",
            "id": "UgzOpS_RRFR0IsErbS54AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "G4egwOVUtRL6jTWy6o6CXvJ-AIg",
                    "id": "UgzOpS_RRFR0IsErbS54AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I found an employee who now has a mess to clean",
                        "textOriginal": "I found an employee who now has a mess to clean",
                        "authorDisplayName": "Destry Lefebre",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUuhF5RoyuoyZaeaK9yCzvGP_eklxRGqJSFOw=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCD2847OGaa_qxTc5KQj2DDA",
                        "authorChannelId": {
                            "value": "UCD2847OGaa_qxTc5KQj2DDA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 20945,
                        "publishedAt": "2023-02-24T22:36:48Z",
                        "updatedAt": "2023-02-24T22:36:48Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 74,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "LWyqEwb_geC-WorBndIuh1Ys-xY",
                        "id": "UgzOpS_RRFR0IsErbS54AaABAg.9mXUPHCOyA_9mm54_jMah7",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@HellBentt oh no 😱you mean an employee would have to… have to.. do their job?!! 😱😱😱😫😫😫",
                            "textOriginal": "@HellBentt oh no 😱you mean an employee would have to… have to.. do their job?!! 😱😱😱😫😫😫",
                            "parentId": "UgzOpS_RRFR0IsErbS54AaABAg",
                            "authorDisplayName": "souc 🩸",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/22EDfnVRx_Wn9YPiF2DZORAGAfWLl0utq9lo8JtDerX-mIa4jriJWk3dGwQeL9dutyALV4uW=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCENE1sEZZ03xjQ6nnEfQ4pA",
                            "authorChannelId": {
                                "value": "UCENE1sEZZ03xjQ6nnEfQ4pA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-03T00:03:22Z",
                            "updatedAt": "2023-03-03T00:03:22Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "ADSKf5-RPnYlT0_GibOA8C0c5Ag",
                        "id": "UgzOpS_RRFR0IsErbS54AaABAg.9mXUPHCOyA_9mm21GDhlOX",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "The employee did it",
                            "textOriginal": "The employee did it",
                            "parentId": "UgzOpS_RRFR0IsErbS54AaABAg",
                            "authorDisplayName": "ScubaJoe",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/hChGRFhNiGULQyLEY_larVZtdkapsjj1QvfOdcQQt1hvZgTZaPOpdfzCR0Him9_Vwx4NQJBIwjQ=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCPtHhzfCG-CMbukDA-uRGJw",
                            "authorChannelId": {
                                "value": "UCPtHhzfCG-CMbukDA-uRGJw"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T23:36:42Z",
                            "updatedAt": "2023-03-02T23:36:42Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "cAX6aiDAVAv-H4L9ZR8xmAh4aaY",
                        "id": "UgzOpS_RRFR0IsErbS54AaABAg.9mXUPHCOyA_9mlziInXxMw",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "ok",
                            "textOriginal": "ok",
                            "parentId": "UgzOpS_RRFR0IsErbS54AaABAg",
                            "authorDisplayName": "Katrina Remular",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJXTtS4x6_hFg9ddhc81rhr5NQGFWaiLsDa86S6wcuc=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UChn5Omm-dhnec8D9Ispu3kw",
                            "authorChannelId": {
                                "value": "UChn5Omm-dhnec8D9Ispu3kw"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T23:07:46Z",
                            "updatedAt": "2023-03-02T23:07:46Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "kWcsGjWHpH9fb3UgSBPrRu05jbg",
                        "id": "UgzOpS_RRFR0IsErbS54AaABAg.9mXUPHCOyA_9mlvfFo6iHx",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "Employee: \"I found your address.\"",
                            "textOriginal": "Employee: \"I found your address.\"",
                            "parentId": "UgzOpS_RRFR0IsErbS54AaABAg",
                            "authorDisplayName": "Crazy Contraptions",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/YMiaDeeMriNqf_a1tPJbYlL5aTdvDaRw9qAA_gFuFYAbCz_ygR_KeTVLLFnkYNHMMUFqev2Y42g=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCClPWwt8dtMExtGVzzDpp-A",
                            "authorChannelId": {
                                "value": "UCClPWwt8dtMExtGVzzDpp-A"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T22:32:23Z",
                            "updatedAt": "2023-03-02T22:32:23Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "jl0SgJ6tQsabWEggxDSSvmgd_Fg",
                        "id": "UgzOpS_RRFR0IsErbS54AaABAg.9mXUPHCOyA_9mlc6QLKmL6",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "it happened at the store i work at im not even joking",
                            "textOriginal": "it happened at the store i work at im not even joking",
                            "parentId": "UgzOpS_RRFR0IsErbS54AaABAg",
                            "authorDisplayName": "7Tee6ix",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/-0Coffg4o3eyQOHqlvbPl0oqqxMsqu7rkUOd4PbWvNERmkT9YSXIfI8NImPySBIJc6GEXqHSGyY=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCdSnqQc8gjaepcx6VCh51JA",
                            "authorChannelId": {
                                "value": "UCdSnqQc8gjaepcx6VCh51JA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T19:41:28Z",
                            "updatedAt": "2023-03-02T19:41:28Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "kzcyP6ShXeaMSuupq-vxf2BAkFw",
            "id": "UgyFTdzijAlJfO5ZusZ4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "8_dnPRQEq9IYYe7wrwjoECyU334",
                    "id": "UgyFTdzijAlJfO5ZusZ4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I work in a produce department, and rotting watermelon is definitely my top 3 worst things I’ve had to smell. Rotting pumpkin and sunflowers are also up in that top 3",
                        "textOriginal": "I work in a produce department, and rotting watermelon is definitely my top 3 worst things I’ve had to smell. Rotting pumpkin and sunflowers are also up in that top 3",
                        "authorDisplayName": "Xaos",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/hnizlNYCzpAKLuDDiZJgdzsiUPd4b4C1H5bp1FXkJo45wAa1aVWKaUPbCC9kBjtP4GsPiU-mTQ=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCM287kGQOyWpzdMm30H_Qeg",
                        "authorChannelId": {
                            "value": "UCM287kGQOyWpzdMm30H_Qeg"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1057,
                        "publishedAt": "2023-02-27T21:38:21Z",
                        "updatedAt": "2023-02-27T21:38:21Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 16,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "VzahAr-tDtKpkbmCSSps31b1cyI",
                        "id": "UgyFTdzijAlJfO5ZusZ4AaABAg.9me65kKq0CZ9mmSXMCCQS4",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "So you never tried old milk like 2-3 months old milk.",
                            "textOriginal": "So you never tried old milk like 2-3 months old milk.",
                            "parentId": "UgyFTdzijAlJfO5ZusZ4AaABAg",
                            "authorDisplayName": "mtkl23",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJXzqRIKODPYHl4NUxfotXXjIgZW_Jo29ijUz1AJ=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCg0uigBLmLzuuRPvo4-9FMA",
                            "authorChannelId": {
                                "value": "UCg0uigBLmLzuuRPvo4-9FMA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-03T03:28:16Z",
                            "updatedAt": "2023-03-03T03:28:16Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "cN0sokLgTVxuuIvhy2RSbFlYeqA",
                        "id": "UgyFTdzijAlJfO5ZusZ4AaABAg.9me65kKq0CZ9mmSD_fjQJo",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "Been there.  We had to clean all of the hood melons.  Worst smelling thing I’ve have ever smelt.",
                            "textOriginal": "Been there.  We had to clean all of the hood melons.  Worst smelling thing I’ve have ever smelt.",
                            "parentId": "UgyFTdzijAlJfO5ZusZ4AaABAg",
                            "authorDisplayName": "PyrexPopp",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/nWRx6HC6gdNn3AGK9Jo-tjcUPh__uLdyPbanLj75TQxBLVphVO5YriAsfqs-Lxh35pJo8AJ_1g=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCf_6vLAAITWJllOubVb83Rg",
                            "authorChannelId": {
                                "value": "UCf_6vLAAITWJllOubVb83Rg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-03T03:25:34Z",
                            "updatedAt": "2023-03-03T03:25:34Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "0poMeESQf9AxJdOna1i13Z7uW9s",
                        "id": "UgyFTdzijAlJfO5ZusZ4AaABAg.9me65kKq0CZ9mmRdsJLUHE",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "YES and then you have the damn rotten bean sprouts, cantaloupe, and onions. Accompanied by the seasonal swarm of fruit flies all over the place",
                            "textOriginal": "YES and then you have the damn rotten bean sprouts, cantaloupe, and onions. Accompanied by the seasonal swarm of fruit flies all over the place",
                            "parentId": "UgyFTdzijAlJfO5ZusZ4AaABAg",
                            "authorDisplayName": "Dillpickle",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/kC2BdOZMJu06nJa4tZ003eRY80Tv-77rux9bxnYThNXvQr0kHGb9Kv9cGiAuPtYwYgYW-SHK9Nc=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCSXQuRQdofmKUzRAnUgcp2w",
                            "authorChannelId": {
                                "value": "UCSXQuRQdofmKUzRAnUgcp2w"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-03T03:20:34Z",
                            "updatedAt": "2023-03-03T03:20:34Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "JBl8XOQJDgwYeG1XTAuswkNvZ_4",
                        "id": "UgyFTdzijAlJfO5ZusZ4AaABAg.9me65kKq0CZ9mmQwm9nQzQ",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "Sunflowers rot????",
                            "textOriginal": "Sunflowers rot????",
                            "parentId": "UgyFTdzijAlJfO5ZusZ4AaABAg",
                            "authorDisplayName": "Columbus Astrid Avenue",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJWxJrrRzYqEAaDmIYv1zEEykAwdS_Br7noNjO-l6fM=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCoxXiQbwlEtXwJA7u7lXJmw",
                            "authorChannelId": {
                                "value": "UCoxXiQbwlEtXwJA7u7lXJmw"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-03T03:14:24Z",
                            "updatedAt": "2023-03-03T03:14:24Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "UUpcz5m1ygcJEaNPb_2vyosDCLM",
            "id": "UgzUM18ypqQy7M6qRRF4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "MLUgzGkpllXL1CDB1MEYW10KM2g",
                    "id": "UgzUM18ypqQy7M6qRRF4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "As a produce manager who has went to pick up a watermelon and have it melt in my hand like that: I can smell this video.",
                        "textOriginal": "As a produce manager who has went to pick up a watermelon and have it melt in my hand like that: I can smell this video.",
                        "authorDisplayName": "PAYNE FPV",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJXnEMe4CXgucPtKANvjgiKnUrzRmebEhNzc-zwhzg=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCKb9EUfWz0m26qZiCuwrXbQ",
                        "authorChannelId": {
                            "value": "UCKb9EUfWz0m26qZiCuwrXbQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 340,
                        "publishedAt": "2023-02-28T20:47:27Z",
                        "updatedAt": "2023-02-28T20:47:27Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "VEyTkaSAgoGDFx4t1SMXEaCv1CM",
            "id": "UgyCsMwaV00ei3zmxU94AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "FFdfj3_Cu7QNqSz7YlU_YkVuJI4",
                    "id": "UgyCsMwaV00ei3zmxU94AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Humans are 70% water . . . I'm just glad this doesn't happen to humans!",
                        "textOriginal": "Humans are 70% water . . . I'm just glad this doesn't happen to humans!",
                        "authorDisplayName": "Painting Winter — Music ",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/A_-W4FaTz5-rD__Qgnvgzn78OJP6337Gw2S7dygMCUIrf78IdhjIuz3hcoovBsrut2MYHZ1Tug=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC_a-KEgXRnZsYd1nnhkYbCQ",
                        "authorChannelId": {
                            "value": "UC_a-KEgXRnZsYd1nnhkYbCQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 8835,
                        "publishedAt": "2023-02-24T22:30:17Z",
                        "updatedAt": "2023-02-24T22:30:17Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 126,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "wQBkKKwWKT3lP8zu-BqvQZi0ejs",
                        "id": "UgyCsMwaV00ei3zmxU94AaABAg.9mXTeTLJcLm9mmUQhS2ZTK",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@Venobit what are the heck",
                            "textOriginal": "@Venobit what are the heck",
                            "parentId": "UgyCsMwaV00ei3zmxU94AaABAg",
                            "authorDisplayName": "cool",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/GFG6X_040mK4hTcAWkCJn1447B1-ujlYckwqTIjZe58S3o05SqUnsb5x9JLW6oonxnGLFlp7=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCPkBCtuwu64sbck2xcdLWTg",
                            "authorChannelId": {
                                "value": "UCPkBCtuwu64sbck2xcdLWTg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-03T03:44:50Z",
                            "updatedAt": "2023-03-03T03:44:50Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "92L3LjqJ6Wx-wB5z9S6WXr2MKvk",
                        "id": "UgyCsMwaV00ei3zmxU94AaABAg.9mXTeTLJcLm9mmULOM6X-m",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "uhm ackthually, humans are 60% water☝️🤓",
                            "textOriginal": "uhm ackthually, humans are 60% water☝️🤓",
                            "parentId": "UgyCsMwaV00ei3zmxU94AaABAg",
                            "authorDisplayName": "cool",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/GFG6X_040mK4hTcAWkCJn1447B1-ujlYckwqTIjZe58S3o05SqUnsb5x9JLW6oonxnGLFlp7=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCPkBCtuwu64sbck2xcdLWTg",
                            "authorChannelId": {
                                "value": "UCPkBCtuwu64sbck2xcdLWTg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-03T03:44:07Z",
                            "updatedAt": "2023-03-03T03:44:07Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "rDBp4CizNwLxdjrOsvlxh6zH0yE",
                        "id": "UgyCsMwaV00ei3zmxU94AaABAg.9mXTeTLJcLm9mmQ_QABJPE",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "Thats when they vomit 🤢",
                            "textOriginal": "Thats when they vomit 🤢",
                            "parentId": "UgyCsMwaV00ei3zmxU94AaABAg",
                            "authorDisplayName": "Bilal Azizi",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/Z9tQro2plPcRxQfG3_UIA4iG49vKKkv0FVCvPG8hlhlD41qjT0S4jZaZsVywF8v7d4AgQCFLBQ=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCGO0WBhA7fPinxdk6zQ4I2w",
                            "authorChannelId": {
                                "value": "UCGO0WBhA7fPinxdk6zQ4I2w"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-03T03:11:13Z",
                            "updatedAt": "2023-03-03T03:11:13Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "lYxjppP6LNBSmBYoGdgHTIIJT6w",
                        "id": "UgyCsMwaV00ei3zmxU94AaABAg.9mXTeTLJcLm9mmNFbjC3Vi",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "​@Venobit You're wild",
                            "textOriginal": "​@Venobit You're wild",
                            "parentId": "UgyCsMwaV00ei3zmxU94AaABAg",
                            "authorDisplayName": "NULL 𝓂𝒶𝓉𝓉𝑒𝓇",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/Mlny22aQF9yoGD9kDtNx1Tme088Et_fuO2cLKj7K0169PMuLs81W2WGn29W_xDY_EFHiLWoR=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UC4pHFOipoznYj9NeysSGP7Q",
                            "authorChannelId": {
                                "value": "UC4pHFOipoznYj9NeysSGP7Q"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-03T02:42:09Z",
                            "updatedAt": "2023-03-03T02:42:09Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "NKaaOqLPJ0ZeH0G6K2M03F93drE",
            "id": "UgyW8bHYBL-vSzHKRct4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "fDyUD5Gs-nGHXehKg9zm2xuVfgA",
                    "id": "UgyW8bHYBL-vSzHKRct4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I would never do that simply because of the acrid smell of rotten watermelon. It seriously hits your sinus where it hurts and stays there for a little while, and everything you taste has that rancid bitterness to accompany it.",
                        "textOriginal": "I would never do that simply because of the acrid smell of rotten watermelon. It seriously hits your sinus where it hurts and stays there for a little while, and everything you taste has that rancid bitterness to accompany it.",
                        "authorDisplayName": "wynter pulchritudo",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJU4lOOBsVaPbBZG9Mrrw-V750a3WxHHRb3WSg=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCHn7XyYwMpRrcCZNysQffUw",
                        "authorChannelId": {
                            "value": "UCHn7XyYwMpRrcCZNysQffUw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 166,
                        "publishedAt": "2023-02-27T23:31:05Z",
                        "updatedAt": "2023-02-27T23:31:05Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "xAGCeIizA1txVvmezLLGGtfCt_0",
            "id": "Ugyxbi2UwsTfHZ5LD0l4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "z10z5OUg6PR2UVw4M_nv_1hwgbY",
                    "id": "Ugyxbi2UwsTfHZ5LD0l4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I work in a grocery store’s produce department\n\nThat is tied to be the single most stinkiest thing I have encountered. Second is rotten chopped up onions and 20 pounds of banana sweating in plastic.",
                        "textOriginal": "I work in a grocery store’s produce department\n\nThat is tied to be the single most stinkiest thing I have encountered. Second is rotten chopped up onions and 20 pounds of banana sweating in plastic.",
                        "authorDisplayName": "InterAC",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJVLw1Zjn61raoIG1eEn5-i0u-F1tU7nYZD1FDEfzYFmeZE223w6RS8fR6BOS3M7=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCQBHkapHCjtpfQDfVdHAhDA",
                        "authorChannelId": {
                            "value": "UCQBHkapHCjtpfQDfVdHAhDA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 55,
                        "publishedAt": "2023-02-28T02:29:15Z",
                        "updatedAt": "2023-02-28T02:29:15Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "oSpVp21lGFg55OoU6l9yWfbxGZY",
            "id": "UgwuSzQuXD7vQWlK5b54AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "ukushmM-fUL6O2SPrJsLf8Vbftk",
                    "id": "UgwuSzQuXD7vQWlK5b54AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Nope, that's rotten. You're gonna clear out half a store with that",
                        "textOriginal": "Nope, that's rotten. You're gonna clear out half a store with that",
                        "authorDisplayName": "Elijah Jarman",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/rrBdp-J8n0BlWiUCCOSDn72sseUp65Zvvgg8zrp1gOToahRDJKOSwdj644aheLXz0IthoNNooC8=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCW6UTASThKclUn-b3ig71MA",
                        "authorChannelId": {
                            "value": "UCW6UTASThKclUn-b3ig71MA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 4785,
                        "publishedAt": "2023-02-24T23:29:36Z",
                        "updatedAt": "2023-02-24T23:29:36Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 17,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "ySvDHBKIPYPqHXe1PSmXG9K8GvI",
                        "id": "UgwuSzQuXD7vQWlK5b54AaABAg.9mX_RzzdSnC9mm0yotEcqa",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "​@P Thats literally in the back. You think an influencer really went back there? Lol This is obviously an employee.",
                            "textOriginal": "​@P Thats literally in the back. You think an influencer really went back there? Lol This is obviously an employee.",
                            "parentId": "UgwuSzQuXD7vQWlK5b54AaABAg",
                            "authorDisplayName": "PickyVicky4487 Vindictive",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJVFtXr-DYlJxIs2NVNhNL4K6a8XD3J9u_vX27VG=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCPsmhYWAGjvNhltGl7haeOQ",
                            "authorChannelId": {
                                "value": "UCPsmhYWAGjvNhltGl7haeOQ"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T23:27:29Z",
                            "updatedAt": "2023-03-02T23:27:29Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "5KEfRqBMoGPwOgUI3CfwQQcB7ZI",
                        "id": "UgwuSzQuXD7vQWlK5b54AaABAg.9mX_RzzdSnC9mkygQ5mjnn",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "​@Jimmy the Shadow Leviathan And the bin is literally half empty, meaning that it was at the bottom previously. How do *you* not notice that?",
                            "textOriginal": "​@Jimmy the Shadow Leviathan And the bin is literally half empty, meaning that it was at the bottom previously. How do *you* not notice that?",
                            "parentId": "UgwuSzQuXD7vQWlK5b54AaABAg",
                            "authorDisplayName": "SoulOfFlame",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/mCddFkp6YGP9jt5YaHB0vVjmyvL2-WuvMpzaCXQMuV0FFslGoqMQHMXwiEfYSobFKOXKBuaM2w=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCUKoL6hjfkOVoc8JlIGIHOw",
                            "authorChannelId": {
                                "value": "UCUKoL6hjfkOVoc8JlIGIHOw"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-03-02T13:39:31Z",
                            "updatedAt": "2023-03-02T13:39:31Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "VHfJuFCIa9mTv5KaLICq5ve-tGs",
                        "id": "UgwuSzQuXD7vQWlK5b54AaABAg.9mX_RzzdSnC9mjj9iEZmlZ",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@I. S. the watermelon is on the top and is literally drooping. How do you not see that",
                            "textOriginal": "@I. S. the watermelon is on the top and is literally drooping. How do you not see that",
                            "parentId": "UgwuSzQuXD7vQWlK5b54AaABAg",
                            "authorDisplayName": "Jimmy the Shadow Leviathan",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/P7KgZlYDgZHb7comC12QP278bOnO9jrRYxLbnOiJpWxHYTpLup14RD9XX7cBc_RHT1D7k2gNEg=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCoobV0Hil2XRhpOzdBdyTCQ",
                            "authorChannelId": {
                                "value": "UCoobV0Hil2XRhpOzdBdyTCQ"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T02:04:36Z",
                            "updatedAt": "2023-03-02T02:04:36Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "OWHqvZaZ_HP6N6LVW50Ud9gi1t8",
                        "id": "UgwuSzQuXD7vQWlK5b54AaABAg.9mX_RzzdSnC9mjSOCEragx",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "​@P look at the surroundings and the bg sounds, it looks like a warehouse or storage area not a storefront so it's probably an employee that did it, the title is probably just for views I doubt ddoi himself went and did it",
                            "textOriginal": "​@P look at the surroundings and the bg sounds, it looks like a warehouse or storage area not a storefront so it's probably an employee that did it, the title is probably just for views I doubt ddoi himself went and did it",
                            "parentId": "UgwuSzQuXD7vQWlK5b54AaABAg",
                            "authorDisplayName": "jimtsap04",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJWRUiVe8F56wTeAFRDNg5QyRgteXUMpfHOgoGEPQg=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCVbP8qykewwSYNojcwHWeCA",
                            "authorChannelId": {
                                "value": "UCVbP8qykewwSYNojcwHWeCA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 2,
                            "publishedAt": "2023-03-01T23:29:18Z",
                            "updatedAt": "2023-03-01T23:29:18Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "JwzrG5V4O-h25YMQX0kp4XMCvl8",
            "id": "UgychXgSBqTssHGnFyF4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "3KU2rqPTBqcRw3mPJZEOCqS7XPg",
                    "id": "UgychXgSBqTssHGnFyF4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "The watermelon Queen is sadden by this. No-melon syndrome is a terrible illness amongst my people. Luckily it’s very rare.",
                        "textOriginal": "The watermelon Queen is sadden by this. No-melon syndrome is a terrible illness amongst my people. Luckily it’s very rare.",
                        "authorDisplayName": "Watermelon Queen",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/82n7l0v1HMYS-ZP2T16M44QVG29Aewh3kFDxThGwUxEEntmkDl_8k9IElP3i2KzMPmVWBC3u=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC4vpscjssr7l2rfgqULZS5Q",
                        "authorChannelId": {
                            "value": "UC4vpscjssr7l2rfgqULZS5Q"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 32,
                        "publishedAt": "2023-03-02T18:40:29Z",
                        "updatedAt": "2023-03-02T18:40:29Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "oH5dicef5bawkmihylnEftsjn94",
            "id": "UgxJCbACyT3LAzKUdb14AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "h8bXYbLn7VdKdQETC0GlWQDPQFI",
                    "id": "UgxJCbACyT3LAzKUdb14AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "As someone who worked in produce, I can confirm, it’s really not that bad a smell as people make it out to be",
                        "textOriginal": "As someone who worked in produce, I can confirm, it’s really not that bad a smell as people make it out to be",
                        "authorDisplayName": "Oscar",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJWMUq_ERvY_CY6CWG07X66Cw4e93Zka3_vs8Kmdlw=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCMS6glJrIS_pSrk7Wb_2Lmw",
                        "authorChannelId": {
                            "value": "UCMS6glJrIS_pSrk7Wb_2Lmw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 13,
                        "publishedAt": "2023-03-02T15:08:56Z",
                        "updatedAt": "2023-03-02T15:08:56Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 1,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "LAAYkZPSy_LMUf42AnDjCYMqoMo",
                        "id": "UgxJCbACyT3LAzKUdb14AaABAg.9ml7vHxpOUN9mm5FV1K5ap",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "fr",
                            "textOriginal": "fr",
                            "parentId": "UgxJCbACyT3LAzKUdb14AaABAg",
                            "authorDisplayName": "Sexy Thanos",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJWP8QilWrRx_x-Ye493Aud7xLQe8IEKA4FjfOEs=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCQQf2P68Y3njGjE7cSoz64g",
                            "authorChannelId": {
                                "value": "UCQQf2P68Y3njGjE7cSoz64g"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-03-03T00:04:51Z",
                            "updatedAt": "2023-03-03T00:04:51Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "yKOXvtEIyRJ2wle9r-zNqT43iaM",
            "id": "Ugw2rUm-0myg9AKqHDl4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "aQmZgRZ1RpfJb55ce7ZUWZlo9Vw",
                    "id": "Ugw2rUm-0myg9AKqHDl4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Rotten watermelon is quite possibly the absolute worst smell you can ever encounter.",
                        "textOriginal": "Rotten watermelon is quite possibly the absolute worst smell you can ever encounter.",
                        "authorDisplayName": "Michael G",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/3dv4qTeHkcqZjp-xUxqlmsYBvmbla3x70zq8_J5Ulak1je_MvammNJlMxwjns7H-dZTmSvxm=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCiZV9RIa-wdGRk84UO7kP-w",
                        "authorChannelId": {
                            "value": "UCiZV9RIa-wdGRk84UO7kP-w"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 8086,
                        "publishedAt": "2023-02-24T23:41:17Z",
                        "updatedAt": "2023-02-24T23:41:17Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 117,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "YduDHjb6t1FR-oakkb1du_zMbBU",
                        "id": "Ugw2rUm-0myg9AKqHDl4AaABAg.9mXamUQA4Am9mlw9HU20LU",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "What does it smell like?!",
                            "textOriginal": "What does it smell like?!",
                            "parentId": "Ugw2rUm-0myg9AKqHDl4AaABAg",
                            "authorDisplayName": "Everafterhighforever",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/J_eMiYmxATYR9pR0hV5-sFxnZCYi1aY6pU3V5WuNJ3RlKUjDXBSQP2ZuhioJtENHYDXzZggQEAk=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCtvamQ1mqfbXM6k_hAQBt0A",
                            "authorChannelId": {
                                "value": "UCtvamQ1mqfbXM6k_hAQBt0A"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T22:36:38Z",
                            "updatedAt": "2023-03-02T22:36:38Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "sIn4YhRvRj8LawOW85BUC_-s9pw",
                        "id": "Ugw2rUm-0myg9AKqHDl4AaABAg.9mXamUQA4Am9mlZJKDrwIb",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "​@Candlestyx Yeah",
                            "textOriginal": "​@Candlestyx Yeah",
                            "parentId": "Ugw2rUm-0myg9AKqHDl4AaABAg",
                            "authorDisplayName": "William Wheeler",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJX8ZMoRVVhtNQ_kwiy80lVbNLtv1FRJMLdePg=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCdLFG10c52Uu5_Nx-iXLy8Q",
                            "authorChannelId": {
                                "value": "UCdLFG10c52Uu5_Nx-iXLy8Q"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T19:08:17Z",
                            "updatedAt": "2023-03-02T19:08:17Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "c6vXkUAeOiufBaTwJZuzVWifsro",
                        "id": "Ugw2rUm-0myg9AKqHDl4AaABAg.9mXamUQA4Am9mkw6XAXEGK",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@Inquisitorhow would you know? 🤨",
                            "textOriginal": "@Inquisitorhow would you know? 🤨",
                            "parentId": "Ugw2rUm-0myg9AKqHDl4AaABAg",
                            "authorDisplayName": "Dominic Clark",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJX0OCmJ4vr9ujXRh0uo9hBLLzfMUnDQeYe-4js7G4nEMTEzygnBFXStptAK28rr=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCETNrZjHzwjhO8EvO-2C0eA",
                            "authorChannelId": {
                                "value": "UCETNrZjHzwjhO8EvO-2C0eA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-03-02T13:17:01Z",
                            "updatedAt": "2023-03-02T13:17:01Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "G9bupQEYomy7oiP3voNx0NW1jKI",
                        "id": "Ugw2rUm-0myg9AKqHDl4AaABAg.9mXamUQA4Am9mkw2fLcz6-",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "CHALLENGE ACCEPTED",
                            "textOriginal": "CHALLENGE ACCEPTED",
                            "parentId": "Ugw2rUm-0myg9AKqHDl4AaABAg",
                            "authorDisplayName": "Dominic Clark",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJX0OCmJ4vr9ujXRh0uo9hBLLzfMUnDQeYe-4js7G4nEMTEzygnBFXStptAK28rr=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCETNrZjHzwjhO8EvO-2C0eA",
                            "authorChannelId": {
                                "value": "UCETNrZjHzwjhO8EvO-2C0eA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T13:16:29Z",
                            "updatedAt": "2023-03-02T13:16:29Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "No0oT6wmyn2mzv_4WOWgdZrqfBI",
                        "id": "Ugw2rUm-0myg9AKqHDl4AaABAg.9mXamUQA4Am9mkATQQN1Cq",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "Frfr",
                            "textOriginal": "Frfr",
                            "parentId": "Ugw2rUm-0myg9AKqHDl4AaABAg",
                            "authorDisplayName": "Darien Edwards",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJXw2nV5-LX_TLo50ZkGHOjIyFU6uefPvWwnXdcS2HA=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCtxiT0sZuwadddHlpKr5HTA",
                            "authorChannelId": {
                                "value": "UCtxiT0sZuwadddHlpKr5HTA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T06:11:58Z",
                            "updatedAt": "2023-03-02T06:11:58Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "FEB83Y_pdx53RJe_cCAYXZPl_v8",
            "id": "UgxaaO_XgKUB_I6XbXV4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "RgyD2KB9eQo2Su14D2w44cR2p-o",
                    "id": "UgxaaO_XgKUB_I6XbXV4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Nothing triggers my gag reflex more than rotten fruits and vegetables",
                        "textOriginal": "Nothing triggers my gag reflex more than rotten fruits and vegetables",
                        "authorDisplayName": "Sad-ish Human",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/GL_PXwJj6eQFyESkA76Gzl5mvYAwvv9Y9mSIZct8or8VTfIp0sn7g_4ziUwqYruFjuJ_Pz8zyg=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCLb0aNiRIK5TyuV0KM1s8hQ",
                        "authorChannelId": {
                            "value": "UCLb0aNiRIK5TyuV0KM1s8hQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 9,
                        "publishedAt": "2023-03-03T01:18:19Z",
                        "updatedAt": "2023-03-03T01:18:19Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 1,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "ojNf-lbczCrvpEmC66kejkjFQuA",
                        "id": "UgxaaO_XgKUB_I6XbXV4AaABAg.9mmDeTkI_4Q9mmJM-uorRX",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "you can actually die from eating rotten fruit, I heard a story of a guy that ate rotten coconut and straight up died",
                            "textOriginal": "you can actually die from eating rotten fruit, I heard a story of a guy that ate rotten coconut and straight up died",
                            "parentId": "UgxaaO_XgKUB_I6XbXV4AaABAg",
                            "authorDisplayName": "TechDeath28",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/3hmJnAmw93NSNwVB6yF9ys1MYZPcE_R5Hc6bxe0cUnA0UmB_qs_MUp5sdWxh_oSHrqHItkhx1OM=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UC-cjux0sDEi3lM9YazOrkog",
                            "authorChannelId": {
                                "value": "UC-cjux0sDEi3lM9YazOrkog"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-03T02:08:05Z",
                            "updatedAt": "2023-03-03T02:08:05Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "s8MC84xtPZulyKZpWkA3LlgxhGo",
            "id": "UgypxLFQM2eBpN_VXXN4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "URxj5KnqWbt6XLfKphgHfVV1XU0",
                    "id": "UgypxLFQM2eBpN_VXXN4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "the melon ain't meloning💀",
                        "textOriginal": "the melon ain't meloning💀",
                        "authorDisplayName": "CakeyShowdown",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/HKe5uu2GXyUF6cRs4n6KG3B-Z8Q7zuVDvMcmufQZAtyAnJ-v9N2PFVbQM7g4RbzN8qMykraS=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCldbSgllaIsciMci0sF2DKg",
                        "authorChannelId": {
                            "value": "UCldbSgllaIsciMci0sF2DKg"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 12,
                        "publishedAt": "2023-02-28T12:11:05Z",
                        "updatedAt": "2023-02-28T12:11:05Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "KESEAKaBkJasQyogLrYI2OiitDg",
            "id": "UgyiyUa2GqHrOO7GxZt4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "G1SsJleO7mi8pGfyGEm-0X0Npew",
                    "id": "UgyiyUa2GqHrOO7GxZt4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Words do not convey how uncomfortable this makes me feel….",
                        "textOriginal": "Words do not convey how uncomfortable this makes me feel….",
                        "authorDisplayName": "McKay Spencer",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUAdO4yQTqiLuKQSJ70zPIeOI4HAkZpqCREwAspIA=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCUbCVspGN592LBLIf8NTjtw",
                        "authorChannelId": {
                            "value": "UCUbCVspGN592LBLIf8NTjtw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 4351,
                        "publishedAt": "2023-02-24T22:46:54Z",
                        "updatedAt": "2023-02-24T22:46:54Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 12,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "gjAeX9BlHFvPKxP2T8-5nNzMmr0",
                        "id": "UgyiyUa2GqHrOO7GxZt4AaABAg.9mXVZErKLt-9mjhxkYe0WV",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@Flowery0I can’t tell if you’re saying enough or if eough is a word like you were saying",
                            "textOriginal": "@Flowery0I can’t tell if you’re saying enough or if eough is a word like you were saying",
                            "parentId": "UgyiyUa2GqHrOO7GxZt4AaABAg",
                            "authorDisplayName": "Taco",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/w_HZyG_FcDb5jIoXJbhgnStJFwXtz_ayztm-GYTgSuOZ7CaSJYpswQtixEhElLWlgEhv5PyKSQ=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCHIuOKV6G4gy3kzYbqF2RJw",
                            "authorChannelId": {
                                "value": "UCHIuOKV6G4gy3kzYbqF2RJw"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-03-02T01:54:06Z",
                            "updatedAt": "2023-03-02T01:54:06Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "6TTbVbi6I_Z7jtoaI3cmaMY6w_E",
                        "id": "UgyiyUa2GqHrOO7GxZt4AaABAg.9mXVZErKLt-9mjZlYbitQ7",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@Wildfire I love being crazy",
                            "textOriginal": "@Wildfire I love being crazy",
                            "parentId": "UgyiyUa2GqHrOO7GxZt4AaABAg",
                            "authorDisplayName": "Santino Santoro",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/MRBCYLeczX3xVms0p_AOwY1uur3ujir8XkHJ4ZszrlYyMfsLyIfGwneiDucpKKa73pCIX00MRg=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCosYIejdL3ppCGibMh-B6Vw",
                            "authorChannelId": {
                                "value": "UCosYIejdL3ppCGibMh-B6Vw"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T00:33:47Z",
                            "updatedAt": "2023-03-02T00:33:47Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "7_gS-GDUkXXNGWgjsvfWTjHqGDE",
                        "id": "UgyiyUa2GqHrOO7GxZt4AaABAg.9mXVZErKLt-9mhkTpDAPpE",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "*-SPLØSH-*",
                            "textOriginal": "*-SPLØSH-*",
                            "parentId": "UgyiyUa2GqHrOO7GxZt4AaABAg",
                            "authorDisplayName": "Generic Protagonist",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJX_2eJLu7OiQlbkTsFSbJ5b90UWmzLj1O6gCuCb=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCAELEghm-xGljXke5SGZzqQ",
                            "authorChannelId": {
                                "value": "UCAELEghm-xGljXke5SGZzqQ"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-03-01T07:37:37Z",
                            "updatedAt": "2023-03-01T07:37:37Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "OixI0Na3IcLzQ4eF0VJl5LdP254",
            "id": "UgxAwNXQgVtsVhlJ-cF4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "Xix-cfrxl8oF78i3qnX0dJ454no",
                    "id": "UgxAwNXQgVtsVhlJ-cF4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "as a produce stocker at walmart i can smell this video",
                        "textOriginal": "as a produce stocker at walmart i can smell this video",
                        "authorDisplayName": "ItsBungybooce",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJVvQmEpv8W_wq8t2KwhxCHd8zxyhUn2BuD3PGHRXA=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCzlFJUqw-6i2Mu7LPmr_ebg",
                        "authorChannelId": {
                            "value": "UCzlFJUqw-6i2Mu7LPmr_ebg"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 6,
                        "publishedAt": "2023-03-02T13:29:44Z",
                        "updatedAt": "2023-03-02T13:29:44Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "2eMBk2CiwCL9pRnHYbA4qP2Q15M",
            "id": "Ugy56DYyBZLbn9r0BUN4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "U0uJejM7QraqwIaXqmTj55JCaZQ",
                    "id": "Ugy56DYyBZLbn9r0BUN4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Man, that watermelon is blowing some epic chunks!",
                        "textOriginal": "Man, that watermelon is blowing some epic chunks!",
                        "authorDisplayName": "Dean Gulston",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUplOsN5BylLy8423MCkiGFOnyQIQ0sN_0SHCYJIw=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCxlfp-qCmqV0OdVJzSujiEQ",
                        "authorChannelId": {
                            "value": "UCxlfp-qCmqV0OdVJzSujiEQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 5,
                        "publishedAt": "2023-02-28T08:55:17Z",
                        "updatedAt": "2023-02-28T08:55:17Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "3LsduKrrSzTUPJTWvJogXWRGpDc",
            "id": "UgySBS-mNFqpXhWohQN4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "SIVS2E6eXWqplrnxK3QRP74_2pU",
                    "id": "UgySBS-mNFqpXhWohQN4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "The poor employee outside of the frame watching you is priceless.",
                        "textOriginal": "The poor employee outside of the frame watching you is priceless.",
                        "authorDisplayName": "Gawni",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUdILzpLnw28pwoQmFP0CdvlXoan36t3QTD5mZkjvl1lfkVnuLtj2LiAa5SKAe8=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCp9oB1PCEzKBGwbTIPSM8TA",
                        "authorChannelId": {
                            "value": "UCp9oB1PCEzKBGwbTIPSM8TA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 2364,
                        "publishedAt": "2023-02-25T03:48:56Z",
                        "updatedAt": "2023-02-25T03:48:56Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 14,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "ttssIdb4FbIz2yfCPVY02tMx2Bs",
                        "id": "UgySBS-mNFqpXhWohQN4AaABAg.9mY27Q3KxJO9mmSCjv6-Ff",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@there is an insecure person above this comment I don't think that there is an appeal to it nor any negative outcome it's the equivalent of someone talking to themselves which I a lot of people do so whatever",
                            "textOriginal": "@there is an insecure person above this comment I don't think that there is an appeal to it nor any negative outcome it's the equivalent of someone talking to themselves which I a lot of people do so whatever",
                            "parentId": "UgySBS-mNFqpXhWohQN4AaABAg",
                            "authorDisplayName": "dibby xan",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/uFeBwD-9qzdoHHnfQrmJ1_dHqXCIPaa1oiB0nmWYI1d_ibatlmSgKOF4bPhuOyiJ37gH-Mdpb-w=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCizJ34RCc0UssGYTWJgPPsQ",
                            "authorChannelId": {
                                "value": "UCizJ34RCc0UssGYTWJgPPsQ"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-03T03:25:27Z",
                            "updatedAt": "2023-03-03T03:25:27Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "AXTxqqFc93fyoFUC6DuNLjRWKQs",
                        "id": "UgySBS-mNFqpXhWohQN4AaABAg.9mY27Q3KxJO9mlE4ywlb-3",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@dibby xan yeah i just dont see the appeal of it, they literally dont have the ability to care, it's like talking to a wall",
                            "textOriginal": "@dibby xan yeah i just dont see the appeal of it, they literally dont have the ability to care, it's like talking to a wall",
                            "parentId": "UgySBS-mNFqpXhWohQN4AaABAg",
                            "authorDisplayName": "there is an insecure person above this comment",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ikPvgO2F68trWYckiIMkft01QfE7QcCNSJlP3FTLC8me_qPFMS1QgXI_33kNCi06xSZjd_6e=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCxC_A_lbaTeKGbOkApRXJYA",
                            "authorChannelId": {
                                "value": "UCxC_A_lbaTeKGbOkApRXJYA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T16:02:49Z",
                            "updatedAt": "2023-03-02T16:02:49Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "LwtK9E-FRw5ZL2Mr2vyY89cXU9E",
                        "id": "UgySBS-mNFqpXhWohQN4AaABAg.9mY27Q3KxJO9ml2hK-Piq-",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "I mean I'm pretty sure it's not his footage, I've been seeing this for years now",
                            "textOriginal": "I mean I'm pretty sure it's not his footage, I've been seeing this for years now",
                            "parentId": "UgySBS-mNFqpXhWohQN4AaABAg",
                            "authorDisplayName": "Rishabh Vailaya",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJXumKivY48w3-SufQr-0vwaY5Cjo8HUcRzOF8s4Zg=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCJGszSheILjKR77P3Jlr3XQ",
                            "authorChannelId": {
                                "value": "UCJGszSheILjKR77P3Jlr3XQ"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T14:23:20Z",
                            "updatedAt": "2023-03-02T14:23:20Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "VSS3SqAgZw6OkTaec5Sl6GMSzVU",
                        "id": "UgySBS-mNFqpXhWohQN4AaABAg.9mY27Q3KxJO9mklCfWj46g",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "​@there is an insecure person above this comment it's not like calling him a loser or something gives him more subscriber counts lol",
                            "textOriginal": "​@there is an insecure person above this comment it's not like calling him a loser or something gives him more subscriber counts lol",
                            "parentId": "UgySBS-mNFqpXhWohQN4AaABAg",
                            "authorDisplayName": "dibby xan",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/uFeBwD-9qzdoHHnfQrmJ1_dHqXCIPaa1oiB0nmWYI1d_ibatlmSgKOF4bPhuOyiJ37gH-Mdpb-w=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCizJ34RCc0UssGYTWJgPPsQ",
                            "authorChannelId": {
                                "value": "UCizJ34RCc0UssGYTWJgPPsQ"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T11:41:44Z",
                            "updatedAt": "2023-03-02T11:41:44Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "Qi99-bxmKtn4lXeY7-c4Tsyaatg",
                        "id": "UgySBS-mNFqpXhWohQN4AaABAg.9mY27Q3KxJO9mkJANYdcgV",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "I didn't notice him on the frame",
                            "textOriginal": "I didn't notice him on the frame",
                            "parentId": "UgySBS-mNFqpXhWohQN4AaABAg",
                            "authorDisplayName": "Boleslav Black",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/2R4KkbKoyVEDiDCCu6uY8ShTMU1xVYF4LUeXhD7ovkU-gA-c_9ptuYOu6LfteO1e-M8RPxSPBg=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCoi2wRr6hpK6hV5qrSC1WZA",
                            "authorChannelId": {
                                "value": "UCoi2wRr6hpK6hV5qrSC1WZA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T07:28:00Z",
                            "updatedAt": "2023-03-02T07:28:00Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "cf3u9LXxffhJWtZJzFd-CRVLh4Q",
            "id": "UgwCoAEfjS0ZVvFHwox4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "oohtJmtFb5UKO8AzDi6CBwjhBkk",
                    "id": "UgwCoAEfjS0ZVvFHwox4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "The 12k likes are the janitor and his alt accounts lol",
                        "textOriginal": "The 12k likes are the janitor and his alt accounts lol",
                        "authorDisplayName": "RareM",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/eBZL-48BYKJM9MI9qzS2V9qUPg4mmTfwo4FxjOmkPoYtuktZEtZjo9iWYMR6rXSsZGAGauSs=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCWrEgNKGzqxoK7LQHEkzauQ",
                        "authorChannelId": {
                            "value": "UCWrEgNKGzqxoK7LQHEkzauQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 4,
                        "publishedAt": "2023-02-28T08:58:47Z",
                        "updatedAt": "2023-02-28T08:58:47Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 1,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "L5G-CxerV-jvtQh97MNNHt-694I",
                        "id": "UgwCoAEfjS0ZVvFHwox4AaABAg.9mfJyP7sv4v9mmI2-JAlfa",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "What sense does that make? 🤔 🤨 The janitor is the one that has to clean up that mess that he just made.....why would he \"like\" this video?",
                            "textOriginal": "What sense does that make? 🤔 🤨 The janitor is the one that has to clean up that mess that he just made.....why would he \"like\" this video?",
                            "parentId": "UgwCoAEfjS0ZVvFHwox4AaABAg",
                            "authorDisplayName": "Cass Thompson",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJV0WQVLVFFkit47iBvJ2FSKLySbN_ArEiwL9jHDjQ=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCUSIO14GNOC76eaG_aWp_Dg",
                            "authorChannelId": {
                                "value": "UCUSIO14GNOC76eaG_aWp_Dg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-03T01:56:37Z",
                            "updatedAt": "2023-03-03T01:56:37Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "bwUHssCjk3qfZHWE6kWYUEnZ-5s",
            "id": "Ugzr1u-oI_JcGAKJx8J4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "8QpptY8kmojjlKzbRQDhv0svXjE",
                    "id": "Ugzr1u-oI_JcGAKJx8J4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "The fact that I have stomach cramps makes it even worse",
                        "textOriginal": "The fact that I have stomach cramps makes it even worse",
                        "authorDisplayName": "Wiam Zemani",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/6_Vcb1PAQp-SqWpdXxI9ZebJQOcrxkGV7Kd5xIg2Pn9lpuDUH0uR0HAXRgoBe7LTwG6wG_V6nw=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCSIACvU0VZW3kPbTcaDLgww",
                        "authorChannelId": {
                            "value": "UCSIACvU0VZW3kPbTcaDLgww"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 3,
                        "publishedAt": "2023-02-27T19:06:22Z",
                        "updatedAt": "2023-02-27T19:06:22Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "WPTYsbruHrs8lfLG7FYz_Qq85Xk",
            "id": "UgxJ4TcNMuuXUXO3kGN4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "2xFLPOwmmzdsQvuX_nYybpigmEE",
                    "id": "UgxJ4TcNMuuXUXO3kGN4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "\"you know what? screw you\"\n*unmelons your watermelon*",
                        "textOriginal": "\"you know what? screw you\"\n*unmelons your watermelon*",
                        "authorDisplayName": "Mike Oxmall",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/iDt_-DDPFF7kVahXITDSToWaXGlL2Z0WbRLyo8-v8cq1Eif8XAnabpfeUj7YURwyjaTdjpGjKT0=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC88OmX-JLUkLBSgr8ShoW_Q",
                        "authorChannelId": {
                            "value": "UC88OmX-JLUkLBSgr8ShoW_Q"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 2421,
                        "publishedAt": "2023-02-26T02:26:30Z",
                        "updatedAt": "2023-02-26T02:26:30Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 6,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "HI0v3LNFd7Op7cEadPRBVLZ1anI",
                        "id": "UgxJ4TcNMuuXUXO3kGN4AaABAg.9m_TUST1Ox59mlq6E858D-",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "Actually.. \nThey unwatered the melon 🤯🤯🤯",
                            "textOriginal": "Actually.. \nThey unwatered the melon 🤯🤯🤯",
                            "parentId": "UgxJ4TcNMuuXUXO3kGN4AaABAg",
                            "authorDisplayName": "🍵[Bxchie] 🍵",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/n-7QwSmCovabO6pU-8aohj1TkY4eEUhvCI0AvDyVnXeemwst1dT9aznPn3EJlV6elqlKc54BdQ=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCh-iXb6veG234ecHFE5UXUA",
                            "authorChannelId": {
                                "value": "UCh-iXb6veG234ecHFE5UXUA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T21:43:47Z",
                            "updatedAt": "2023-03-02T21:43:47Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "bsLn2gNVJbRkQsIpwhyRI8Ex8sQ",
                        "id": "UgxJ4TcNMuuXUXO3kGN4AaABAg.9m_TUST1Ox59mln6VRZxsG",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@Freelance Philosopher”my watermelons!” said the traveling watermelon merchant.",
                            "textOriginal": "@Freelance Philosopher”my watermelons!” said the traveling watermelon merchant.",
                            "parentId": "UgxJ4TcNMuuXUXO3kGN4AaABAg",
                            "authorDisplayName": "Mochi ツ",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/5LeXIr6zY4_S5E03MPHlqgk0ojHCK3Fn9YSBeuqV-T0_UaiCJ_xmW7RKOsaSJvYNkaxIGgfwTg=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCw3PtLF9JiOxUrn0zphG7bA",
                            "authorChannelId": {
                                "value": "UCw3PtLF9JiOxUrn0zphG7bA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-03-02T21:17:36Z",
                            "updatedAt": "2023-03-02T21:17:36Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "kZ_VNQt85N0U-sYF3_k7I_ZNcsc",
                        "id": "UgxJ4TcNMuuXUXO3kGN4AaABAg.9m_TUST1Ox59mlSH7ouNAh",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "water Moises",
                            "textOriginal": "water Moises",
                            "parentId": "UgxJ4TcNMuuXUXO3kGN4AaABAg",
                            "authorDisplayName": "Arusham Shafeeq",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJV2fl_j5s3PSZ8eag0b4df4yq48jFL2QPVknA=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCAx-9HhMnZ-dTKtnDTfT4uw",
                            "authorChannelId": {
                                "value": "UCAx-9HhMnZ-dTKtnDTfT4uw"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T18:06:49Z",
                            "updatedAt": "2023-03-02T18:06:49Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "hkTb1dt2CAqrZRI44umyW1Uvdi4",
                        "id": "UgxJ4TcNMuuXUXO3kGN4AaABAg.9m_TUST1Ox59ml8GDosGPE",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@that one screeming cat go REEE  *<vividly imagining the opening sequence from Avatar, but they're bending watermelons>*",
                            "textOriginal": "@that one screeming cat go REEE  *<vividly imagining the opening sequence from Avatar, but they're bending watermelons>*",
                            "parentId": "UgxJ4TcNMuuXUXO3kGN4AaABAg",
                            "authorDisplayName": "Freelance Philosopher",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJVCqyhXkvt56-QWkjJZUzLOHObV1y0a4jGEbW4t=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCvLX-_975jmnpvmPLZ6M3Kg",
                            "authorChannelId": {
                                "value": "UCvLX-_975jmnpvmPLZ6M3Kg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 5,
                            "publishedAt": "2023-03-02T15:11:56Z",
                            "updatedAt": "2023-03-02T18:16:13Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "PPjuAhHrdlbpS8FHZbmHYCbI-6s",
                        "id": "UgxJ4TcNMuuXUXO3kGN4AaABAg.9m_TUST1Ox59ml2I_jM83t",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@Lazymation It was all water, they removed the melon. They UNmeloned the watermelon",
                            "textOriginal": "@Lazymation It was all water, they removed the melon. They UNmeloned the watermelon",
                            "parentId": "UgxJ4TcNMuuXUXO3kGN4AaABAg",
                            "authorDisplayName": "SuicideAngel",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/a4dlhssIfvq50SldjX0putLIYp2VJaotwBkTnx8N4ck1I4zH0-VecriA3Y4PJLblCpPUbFrilcU=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCkHpCDjSeLiQEX5rkRJLAsg",
                            "authorChannelId": {
                                "value": "UCkHpCDjSeLiQEX5rkRJLAsg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 14,
                            "publishedAt": "2023-03-02T14:19:49Z",
                            "updatedAt": "2023-03-02T14:19:49Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "m6lTIjNUDWChJvFuc_jp7xwKBIA",
            "id": "UgzgrmGiViUoOLny5CN4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "-ZPPPXepONHGk4wquIhYyoS5TxY",
                    "id": "UgzgrmGiViUoOLny5CN4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I once had a rotten watermelon in the back of the fridge. the moldy greenish pulp and smell made me gag so much that I dropped it on the floor and was cleaning it up for the best part of an hour before deciding that the smell was there to stay. It was honestly awful and I don't think I've ever smelt anything worse in my life (unless it was an intentionally bad smell)",
                        "textOriginal": "I once had a rotten watermelon in the back of the fridge. the moldy greenish pulp and smell made me gag so much that I dropped it on the floor and was cleaning it up for the best part of an hour before deciding that the smell was there to stay. It was honestly awful and I don't think I've ever smelt anything worse in my life (unless it was an intentionally bad smell)",
                        "authorDisplayName": "Acc3",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUTTG8aBCh3nmnxB25ZBxWkZrSHknZvbmp1jfnS=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCIDR1DuV7wui0FsYm2SdklA",
                        "authorChannelId": {
                            "value": "UCIDR1DuV7wui0FsYm2SdklA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1,
                        "publishedAt": "2023-03-03T01:52:54Z",
                        "updatedAt": "2023-03-03T01:52:54Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "laQ2USgv5FiniFOcMkcW9wWggVs",
            "id": "Ugy9GPckpUY1qEN__7t4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "oVuiaALopuR_HaNikwFDwx57viM",
                    "id": "Ugy9GPckpUY1qEN__7t4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "That’s natural for water melons when they are old and ready to disperse their seeds. All watermelons do this",
                        "textOriginal": "That’s natural for water melons when they are old and ready to disperse their seeds. All watermelons do this",
                        "authorDisplayName": "Deanna Blake Showgirl AU",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUxPEPdGnA41LrG_8dJB93qr8Rqp0Orhtj9eTYuEQ=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCasvcYdfrx-8Ux70qBg2BDQ",
                        "authorChannelId": {
                            "value": "UCasvcYdfrx-8Ux70qBg2BDQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1,
                        "publishedAt": "2023-02-28T22:43:16Z",
                        "updatedAt": "2023-02-28T22:43:16Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "YXJ_if5k3CPV37oLkV2IMNjqx3w",
            "id": "UgyRGlJ1x9bJp7lw8aZ4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "X4c_3vBdwlBMMLKpy7GDxthYtUw",
                    "id": "UgyRGlJ1x9bJp7lw8aZ4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I worked at Publix for 5 years, mostly produce, and let me tell you that the smell of watermelons like that still haunt me. I’ve been a nurse now for several years if that is any indicator.",
                        "textOriginal": "I worked at Publix for 5 years, mostly produce, and let me tell you that the smell of watermelons like that still haunt me. I’ve been a nurse now for several years if that is any indicator.",
                        "authorDisplayName": "Nutrigrain01",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/6sZfIg9cw0TwgVS3EFevcEvWhgBaLRrUF4Ml9S1cPQmugt9v4yIN11wJ0Dx_F8Ut_0OVrV7Txxg=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCj9HFCvOqKQYUffMu9MTL7g",
                        "authorChannelId": {
                            "value": "UCj9HFCvOqKQYUffMu9MTL7g"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1351,
                        "publishedAt": "2023-02-25T03:01:25Z",
                        "updatedAt": "2023-02-25T03:01:25Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 19,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "Wz0umXdxiWoA9WiA4sZgxnYdDh8",
                        "id": "UgyRGlJ1x9bJp7lw8aZ4AaABAg.9mXxgKzJt--9mktPIi5QDr",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "I have no tolerance for spaghetti sauce and milk due to how many times it was dropped at the registers.",
                            "textOriginal": "I have no tolerance for spaghetti sauce and milk due to how many times it was dropped at the registers.",
                            "parentId": "UgyRGlJ1x9bJp7lw8aZ4AaABAg",
                            "authorDisplayName": "Lyra Plays",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJWQMpxr9NFIjrNwjf5GEesIqXtOcNyrUIR6VgDC=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCqdytma6-loeDdpzeXLcfrA",
                            "authorChannelId": {
                                "value": "UCqdytma6-loeDdpzeXLcfrA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T12:53:21Z",
                            "updatedAt": "2023-03-02T12:53:21Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "SZn04lyH0jsai1zdjRrY5BU4InY",
                        "id": "UgyRGlJ1x9bJp7lw8aZ4AaABAg.9mXxgKzJt--9mkkj4J68gN",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "I’m here with you, I worked produce at Food Lion for a year and the 3 deflated melons still haunt me since they’d fall apart as you try to pick them up and smell absolutely rancid",
                            "textOriginal": "I’m here with you, I worked produce at Food Lion for a year and the 3 deflated melons still haunt me since they’d fall apart as you try to pick them up and smell absolutely rancid",
                            "parentId": "UgyRGlJ1x9bJp7lw8aZ4AaABAg",
                            "authorDisplayName": "OmegaQ",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/G0Ab62d30Xx9xDz6aGErJGw_81PZ5fTpxYeUg8lz3dK5OHquN4utxIqLDP4IqK5ANMYJisHQSg=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCM4OnfMAB7vlDophLt4N-eg",
                            "authorChannelId": {
                                "value": "UCM4OnfMAB7vlDophLt4N-eg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 5,
                            "publishedAt": "2023-03-02T11:37:33Z",
                            "updatedAt": "2023-03-02T11:37:33Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "7EoxofJ8bPSXpTvrUfOt0ghbM-c",
                        "id": "UgyRGlJ1x9bJp7lw8aZ4AaABAg.9mXxgKzJt--9mk9aWBNFig",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@Maddie's Menagerie Yeast infection doesnt have a bad fishy smell that would be something else. That's my point.",
                            "textOriginal": "@Maddie's Menagerie Yeast infection doesnt have a bad fishy smell that would be something else. That's my point.",
                            "parentId": "UgyRGlJ1x9bJp7lw8aZ4AaABAg",
                            "authorDisplayName": "Ms. Valdez",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/npiotkn30NN1fIInXFim1bqQ34oTOANFSz8kvej3X018Tm1dGtCqQkdBbFRxrwq0Q8LXAY2QDA=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UC4bFzbyDpf2iCXdIdPvPQkw",
                            "authorChannelId": {
                                "value": "UC4bFzbyDpf2iCXdIdPvPQkw"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T06:04:20Z",
                            "updatedAt": "2023-03-02T06:04:20Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "TzmQIx-fHqs7F2wNs8S8UKy3Mn8",
                        "id": "UgyRGlJ1x9bJp7lw8aZ4AaABAg.9mXxgKzJt--9mk9AvrK4em",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@Ms. Valdez a yeast infection CAN produce a smell, it’s just rare and is described as sweet rather than the normal vaginal or BV fishy odor.",
                            "textOriginal": "@Ms. Valdez a yeast infection CAN produce a smell, it’s just rare and is described as sweet rather than the normal vaginal or BV fishy odor.",
                            "parentId": "UgyRGlJ1x9bJp7lw8aZ4AaABAg",
                            "authorDisplayName": "Maddie's Menagerie",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/q6T1oLMVumdh4d8PxXGOsl88UVw0P5_mkEMHV06UDxyDE3JcZ5i_KW0CukKFkFevUMrrYWc5oQ=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCQM8tFOUEzDOGjnSXKamKJg",
                            "authorChannelId": {
                                "value": "UCQM8tFOUEzDOGjnSXKamKJg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-03-02T06:00:42Z",
                            "updatedAt": "2023-03-02T06:01:20Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "lQhn5VU26TsR8Exgc1DSSh3Fbrs",
            "id": "Ugyr2ZbfqQGciA9FuiB4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "HgtzM_rcJgpWYp8uRINM9heyMgc",
                    "id": "Ugyr2ZbfqQGciA9FuiB4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "This video made me take a step back in real life",
                        "textOriginal": "This video made me take a step back in real life",
                        "authorDisplayName": "Answer",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ryq8yCUrfEtRtVT_BCtF-Aq4WpRFJBn44YAXHS9lt1q08GO53w_5Nq_392eFa9uAy1W1DQB4JQ=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCzd3gTovg4DslY_C65pkJ_A",
                        "authorChannelId": {
                            "value": "UCzd3gTovg4DslY_C65pkJ_A"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1,
                        "publishedAt": "2023-02-28T22:15:01Z",
                        "updatedAt": "2023-02-28T22:15:01Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "DFDhsWhrH4kg19wfD1_ONHyCCC4",
            "id": "UgwjcHcV4GABDbNfzYt4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "JOhWpI-ceoVpfWOys5H7upeRZPs",
                    "id": "UgwjcHcV4GABDbNfzYt4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Let me tell you, the smell of rotten watermelon is one of the worst I have ever encountered. I only had to deal with it once when I was a young child and it STILL TO THIS DAY haunts me.",
                        "textOriginal": "Let me tell you, the smell of rotten watermelon is one of the worst I have ever encountered. I only had to deal with it once when I was a young child and it STILL TO THIS DAY haunts me.",
                        "authorDisplayName": "Dr. Samuel Hayden",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJWMN6uxAUQiMLIn8LC3_b-Md2QcmLYRUOmjn-5QfA=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCOPnIrbFYatbDq41JZO2v3Q",
                        "authorChannelId": {
                            "value": "UCOPnIrbFYatbDq41JZO2v3Q"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-02T12:22:32Z",
                        "updatedAt": "2023-03-02T12:22:32Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "viOTxkRkIAa9ocx742uZQjJ0xVM",
            "id": "Ugw5MJl8_QXLZw9YEr14AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "bXxqPo1QAQ2SKOrANthqjgtdr3M",
                    "id": "Ugw5MJl8_QXLZw9YEr14AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I worked produce at Walmart, I can confirm this was the most rancid smells you can come across in the produce department",
                        "textOriginal": "I worked produce at Walmart, I can confirm this was the most rancid smells you can come across in the produce department",
                        "authorDisplayName": "Elijah Saenz",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJX852vmEl94DpVOojTDQmYX5lAzoDE3pl12kA=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCBkB5RmNWf92LAQsFXPzB3Q",
                        "authorChannelId": {
                            "value": "UCBkB5RmNWf92LAQsFXPzB3Q"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1542,
                        "publishedAt": "2023-02-26T16:36:41Z",
                        "updatedAt": "2023-02-26T16:36:41Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 17,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "-cuHmoZLKSHH-wGoZCT8r3qYUr4",
                        "id": "Ugw5MJl8_QXLZw9YEr14AaABAg.9mazmTeUYKH9mlzgYnqQxT",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "I agree, I’m also at Walmart, upstate ny any way watermelon 🍉 number 2 for me, the worst is potatoes 🥔",
                            "textOriginal": "I agree, I’m also at Walmart, upstate ny any way watermelon 🍉 number 2 for me, the worst is potatoes 🥔",
                            "parentId": "Ugw5MJl8_QXLZw9YEr14AaABAg",
                            "authorDisplayName": "Letsbereal",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUSmslgj51PCLy5jIOAw2RmX2B4RQTUknc9_jRiNArmiyroUxE3XSlCHRRO5xTx=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCKpd_mUivbW1roSCB1zJOtQ",
                            "authorChannelId": {
                                "value": "UCKpd_mUivbW1roSCB1zJOtQ"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T23:07:31Z",
                            "updatedAt": "2023-03-02T23:07:31Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "CMye4oiH_ZxA1xKNACdM02vh5Zc",
                        "id": "Ugw5MJl8_QXLZw9YEr14AaABAg.9mazmTeUYKH9mlyEl4hKd7",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@ExpressionalGecko I've never felt such stench in my life lol",
                            "textOriginal": "@ExpressionalGecko I've never felt such stench in my life lol",
                            "parentId": "Ugw5MJl8_QXLZw9YEr14AaABAg",
                            "authorDisplayName": "speedsolver_xd",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUCxijUKUdCmWeU62XmHRd6XqrLcdz7y5smkf-Wjg=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCiKJatthTUMK06bN2q_Wrxg",
                            "authorChannelId": {
                                "value": "UCiKJatthTUMK06bN2q_Wrxg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T22:54:51Z",
                            "updatedAt": "2023-03-02T22:54:51Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "h-8x_eoWIKRCc0RXysFlhuje5WQ",
                        "id": "Ugw5MJl8_QXLZw9YEr14AaABAg.9mazmTeUYKH9mlwa6iDjl7",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@speedsolver_xd LOL",
                            "textOriginal": "@speedsolver_xd LOL",
                            "parentId": "Ugw5MJl8_QXLZw9YEr14AaABAg",
                            "authorDisplayName": "ExpressionalGecko",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/Ww_bRHH2XyCgZ3f8riOy2XnuL7y9ijBNbO-NivEu_VieSua69FP3Xf9tzOUuKk7fr9je31SFQ_c=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCTLmAQ6nGXWy2eWl_F43L_Q",
                            "authorChannelId": {
                                "value": "UCTLmAQ6nGXWy2eWl_F43L_Q"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T22:40:26Z",
                            "updatedAt": "2023-03-02T22:40:26Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "kYrjwQAySEkY5IkwTlyL2qqLeVA",
                        "id": "Ugw5MJl8_QXLZw9YEr14AaABAg.9mazmTeUYKH9mlw-dSzn4Z",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "Eww",
                            "textOriginal": "Eww",
                            "parentId": "Ugw5MJl8_QXLZw9YEr14AaABAg",
                            "authorDisplayName": "Everafterhighforever",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/J_eMiYmxATYR9pR0hV5-sFxnZCYi1aY6pU3V5WuNJ3RlKUjDXBSQP2ZuhioJtENHYDXzZggQEAk=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCtvamQ1mqfbXM6k_hAQBt0A",
                            "authorChannelId": {
                                "value": "UCtvamQ1mqfbXM6k_hAQBt0A"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T22:35:19Z",
                            "updatedAt": "2023-03-02T22:35:19Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "r9Ssi4yADvOvIiPEGpljur4XOcQ",
                        "id": "Ugw5MJl8_QXLZw9YEr14AaABAg.9mazmTeUYKH9mlkLNcAsAd",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "🤢",
                            "textOriginal": "🤢",
                            "parentId": "Ugw5MJl8_QXLZw9YEr14AaABAg",
                            "authorDisplayName": "ForeverDiamond",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/mX9crBzs7_4JVnyCIdjCQGclg92gcfOZWL7rCAdb-NPXGxSbMQHPzrC0QnsvjXXmActafex8iMs=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCxVQxYR4vYdoAeHeHV6zp8g",
                            "authorChannelId": {
                                "value": "UCxVQxYR4vYdoAeHeHV6zp8g"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T20:53:25Z",
                            "updatedAt": "2023-03-02T20:53:25Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "Pa5FoHtrPYJcfG5GXEKBtRkzh7Q",
            "id": "UgxQjnAvNx_g-f-2sKt4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "-e7rfvY7AeVXb7ebOQJctAnGfCU",
                    "id": "UgxQjnAvNx_g-f-2sKt4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "\"Sir, are you gonna pay for that?\"",
                        "textOriginal": "\"Sir, are you gonna pay for that?\"",
                        "authorDisplayName": "VitoX",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/PQUZE_I-ihYyeYF8xTYdSKwXUYigsO0-WSiaGbB_c_u6MFRXFVAvDQKSL7a3J0kvsRIoq5i15w=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCnbxhslvPqkXOc2roKJAaPA",
                        "authorChannelId": {
                            "value": "UCnbxhslvPqkXOc2roKJAaPA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 2,
                        "publishedAt": "2023-03-02T11:51:18Z",
                        "updatedAt": "2023-03-02T11:51:18Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "lXg-dcAOnoKDoRUsR78jByQ_g1A",
            "id": "UgwoaHLRTX7YLUziTXd4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "svwYV45q8fYH-LYaampbgjrNn7M",
                    "id": "UgwoaHLRTX7YLUziTXd4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I used to work in a produce department. We referred to these as Waterbombs because when they break they absolutely stink.",
                        "textOriginal": "I used to work in a produce department. We referred to these as Waterbombs because when they break they absolutely stink.",
                        "authorDisplayName": "MTRCYCLS",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUMfW5AXH8rRG3pGiicpYgJWCnjzAyyST1RAiNVXw=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC7oRrmfMEd3amtvxAi1iqTw",
                        "authorChannelId": {
                            "value": "UC7oRrmfMEd3amtvxAi1iqTw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-02T21:19:13Z",
                        "updatedAt": "2023-03-02T21:19:13Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "sjAUcP9im-8RzkC2rMSgepAH6yk",
            "id": "Ugx8-dbF3fneTx0qIgB4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "xTfCS5ti20ZbH3fnSr7_OP5TEJo",
                    "id": "Ugx8-dbF3fneTx0qIgB4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Who cleaned up that watermelon mess?  It had better have been YOU!",
                        "textOriginal": "Who cleaned up that watermelon mess?  It had better have been YOU!",
                        "authorDisplayName": "oksills",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJVuTaZsXv6HLfpbW2TtqSIVeFEEszpxxiBApw=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCaEAAw2i231mr8iD92_mIZA",
                        "authorChannelId": {
                            "value": "UCaEAAw2i231mr8iD92_mIZA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 468,
                        "publishedAt": "2023-02-24T22:28:36Z",
                        "updatedAt": "2023-02-24T22:28:36Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 15,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "lVWaLoHx9VoSiKdCpLCUz2C4tno",
                        "id": "Ugx8-dbF3fneTx0qIgB4AaABAg.9mXTTBvEe6a9mlAz_DgPDV",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@Noone might have been able to make it a lot less messy by trying to scoop it into a bucket or just letting it leak into the bucket. They probably had to get rid of all of those melons because of the ungodly smell a rotten one has lol.\n\nIt's not like I care now but if I worked there I wouldn't have allowed him to pop it like that.",
                            "textOriginal": "@Noone might have been able to make it a lot less messy by trying to scoop it into a bucket or just letting it leak into the bucket. They probably had to get rid of all of those melons because of the ungodly smell a rotten one has lol.\n\nIt's not like I care now but if I worked there I wouldn't have allowed him to pop it like that.",
                            "parentId": "Ugx8-dbF3fneTx0qIgB4AaABAg",
                            "authorDisplayName": "Rafox66",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/Io0wo8myiYp7b60Dwtmtmt_pVpbuhyuGks7bQ5Khx46WbdLr-8oaKzbIE-IMSIO5jCcfOl5I=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UClCmSsFkcmWktoFCV4Xddog",
                            "authorChannelId": {
                                "value": "UClCmSsFkcmWktoFCV4Xddog"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T15:35:44Z",
                            "updatedAt": "2023-03-02T15:35:44Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "1pY12tU5SuvZ6pVOkv3p_kpFDQQ",
                        "id": "Ugx8-dbF3fneTx0qIgB4AaABAg.9mXTTBvEe6a9ml2dllRGTB",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@Rafox66 I mean even if employees had to deal with it , I don't think there is much u can do, it would spill anyways...",
                            "textOriginal": "@Rafox66 I mean even if employees had to deal with it , I don't think there is much u can do, it would spill anyways...",
                            "parentId": "Ugx8-dbF3fneTx0qIgB4AaABAg",
                            "authorDisplayName": "Noone",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJWsellKBTsJ3g94zuEZE5kP9ZciiXNsyMYH7GZZkF2S9A9tBD5fqL-CJZOXwuL-=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCAx4jWFAqJQyGZWuSxoIa9w",
                            "authorChannelId": {
                                "value": "UCAx4jWFAqJQyGZWuSxoIa9w"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-03-02T14:22:51Z",
                            "updatedAt": "2023-03-02T14:22:51Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "OT9C9PQoThar82X_YBY220Iamck",
                        "id": "Ugx8-dbF3fneTx0qIgB4AaABAg.9mXTTBvEe6a9mieK02NK5M",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "​@KittycatRittycatALT 1- cardboard does not contain water\n2- those giant produce boxes do not have a solid bottom, they are stapled to a wooden palette.",
                            "textOriginal": "​@KittycatRittycatALT 1- cardboard does not contain water\n2- those giant produce boxes do not have a solid bottom, they are stapled to a wooden palette.",
                            "parentId": "Ugx8-dbF3fneTx0qIgB4AaABAg",
                            "authorDisplayName": "Kip",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJVkmg0NlEiBfjcwQBcwXX-ysunEIYpPFVSvRHxTzg=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCrLPxbQp1hpa3K_dGsLkNMw",
                            "authorChannelId": {
                                "value": "UCrLPxbQp1hpa3K_dGsLkNMw"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 4,
                            "publishedAt": "2023-03-01T16:03:05Z",
                            "updatedAt": "2023-03-01T16:03:05Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "DNyW94qFycDAHrYrgO_bcv9O3ZE",
                        "id": "Ugx8-dbF3fneTx0qIgB4AaABAg.9mXTTBvEe6a9mhHwfZixc4",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@A Serious Wolf FRRRR what happened to our humanities mindsets💀",
                            "textOriginal": "@A Serious Wolf FRRRR what happened to our humanities mindsets💀",
                            "parentId": "Ugx8-dbF3fneTx0qIgB4AaABAg",
                            "authorDisplayName": "2splatteredblood",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/I6y-CGwuxKGRYcbo12ghhUjf9LizANZokgkNvnWPDiSvpi1A9oVcdDJDfYp0v9sNjx0FeInasiE=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCmq0mWYO2aedm-hmhzZYU_Q",
                            "authorChannelId": {
                                "value": "UCmq0mWYO2aedm-hmhzZYU_Q"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-03-01T03:19:33Z",
                            "updatedAt": "2023-03-01T03:19:33Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "nrfNpREHuECJM0ZBHDMUorwpbKQ",
                        "id": "Ugx8-dbF3fneTx0qIgB4AaABAg.9mXTTBvEe6a9mh6C5eM0jB",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "The person recording didn’t leave out expired produce. ? \nThis was bound to happen with that store not maintaining its stock. \nI’d assume watermelons don’t turn into THAT in a matter of a day without someone being aware?\n(This is assuming the camera person is NOT an employee)",
                            "textOriginal": "The person recording didn’t leave out expired produce. ? \nThis was bound to happen with that store not maintaining its stock. \nI’d assume watermelons don’t turn into THAT in a matter of a day without someone being aware?\n(This is assuming the camera person is NOT an employee)",
                            "parentId": "Ugx8-dbF3fneTx0qIgB4AaABAg",
                            "authorDisplayName": "Minty",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/h9XQCvcW2T2OtRcYFLcOU6jbFkoTjdxmTYCLDtKcy3YTyZ0pXb9oJF1V5LbJXUhsDJ9ek7tl=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCbCY5eyazq5_hkMbKinXltQ",
                            "authorChannelId": {
                                "value": "UCbCY5eyazq5_hkMbKinXltQ"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 2,
                            "publishedAt": "2023-03-01T01:36:56Z",
                            "updatedAt": "2023-03-01T01:36:56Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "PxGng27-wRx7vGMv71zaxwatuok",
            "id": "UgyONAI-nYRBxgwIA6h4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "ys7hcLia5kjFRNdkFZeF_mduV28",
                    "id": "UgyONAI-nYRBxgwIA6h4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "That watermelon definitley died for our sins.",
                        "textOriginal": "That watermelon definitley died for our sins.",
                        "authorDisplayName": "Rock Lee",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJV10zpdRL65Rn2Ot6EdkgOwif6GvZqotaT2_g=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCLeuKlFPAc4mb_91wmMhhpw",
                        "authorChannelId": {
                            "value": "UCLeuKlFPAc4mb_91wmMhhpw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1,
                        "publishedAt": "2023-03-01T05:09:31Z",
                        "updatedAt": "2023-03-01T05:09:31Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "Baqo0o5W6aSxNFNRX0RprnK6E0Y",
            "id": "UgxXW9VDxgWuNKli6Kh4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "mRg4HgEqXz_v4Klc9ADtfI6OY5s",
                    "id": "UgxXW9VDxgWuNKli6Kh4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Just realized the guy from the other guy’s dream is the same image from the “This man keeps mysteriously appearing in people’s dreams” thing.",
                        "textOriginal": "Just realized the guy from the other guy’s dream is the same image from the “This man keeps mysteriously appearing in people’s dreams” thing.",
                        "authorDisplayName": "Cardinal Ham'N'Eggs",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJU0TB3-HRFdmrHz-7_e6fiUAW6brbLGc_RrUN8CFg=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCx7-jtnp-LrFbZEuapfL_Zg",
                        "authorChannelId": {
                            "value": "UCx7-jtnp-LrFbZEuapfL_Zg"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 2,
                        "publishedAt": "2023-03-01T09:35:49Z",
                        "updatedAt": "2023-03-01T09:35:49Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "nV_EV-BEV4k7t8X0-GRPC6VpDd0",
            "id": "UgwfFdZ-6Fv6xiwqvDd4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "GcpwWnjvr9uAtN1eKqwspUktaj8",
                    "id": "UgwfFdZ-6Fv6xiwqvDd4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "As someone who has worked in the produce section of a grocery store I know exactly how that would smell. I'm sorry for everyone within a mile of that place.",
                        "textOriginal": "As someone who has worked in the produce section of a grocery store I know exactly how that would smell. I'm sorry for everyone within a mile of that place.",
                        "authorDisplayName": "Crazyknight3847",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUS-VQZ7I4oEkepoqkbgBcp0hObHdfztjSo2IHblQ=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCyFdUsEW6CwDrtdj5R5Ogzw",
                        "authorChannelId": {
                            "value": "UCyFdUsEW6CwDrtdj5R5Ogzw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1521,
                        "publishedAt": "2023-02-27T15:05:35Z",
                        "updatedAt": "2023-02-27T15:05:35Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 16,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "ReuPm7eHo79KqHtaEl4MhEiWojU",
                        "id": "UgwfFdZ-6Fv6xiwqvDd4AaABAg.9mdP92EawH59mmEzfrWug_",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "​@Your Drinking Buddy  is it really bad? The only worst smell i have ever smelt is rotten egg",
                            "textOriginal": "​@Your Drinking Buddy  is it really bad? The only worst smell i have ever smelt is rotten egg",
                            "parentId": "UgwfFdZ-6Fv6xiwqvDd4AaABAg",
                            "authorDisplayName": "Smeeze",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/vamQuNtQ7Uv5yqLEO-Ce-0X3A4WZO28IygXm72VQWH-GHv8Te_Emka07Y5KrK4Xw33FtFR3LOg=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCfEQx5Wt9ETbZj4OygsWAPQ",
                            "authorChannelId": {
                                "value": "UCfEQx5Wt9ETbZj4OygsWAPQ"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-03T01:29:56Z",
                            "updatedAt": "2023-03-03T01:29:56Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "RFjXcjX0-0fxWYxmiRu2wChNKns",
                        "id": "UgwfFdZ-6Fv6xiwqvDd4AaABAg.9mdP92EawH59mmEzfnrD4f",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "​@Your Drinking Buddy  is it really bad? The only worst smell i have ever smelt is rotten egg",
                            "textOriginal": "​@Your Drinking Buddy  is it really bad? The only worst smell i have ever smelt is rotten egg",
                            "parentId": "UgwfFdZ-6Fv6xiwqvDd4AaABAg",
                            "authorDisplayName": "Smeeze",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/vamQuNtQ7Uv5yqLEO-Ce-0X3A4WZO28IygXm72VQWH-GHv8Te_Emka07Y5KrK4Xw33FtFR3LOg=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCfEQx5Wt9ETbZj4OygsWAPQ",
                            "authorChannelId": {
                                "value": "UCfEQx5Wt9ETbZj4OygsWAPQ"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-03-03T01:29:56Z",
                            "updatedAt": "2023-03-03T01:29:56Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "k_Ne48t9D__KwS3vGQE6xI4kesM",
                        "id": "UgwfFdZ-6Fv6xiwqvDd4AaABAg.9mdP92EawH59mmD9z0_2im",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "That's what I was gonna say",
                            "textOriginal": "That's what I was gonna say",
                            "parentId": "UgwfFdZ-6Fv6xiwqvDd4AaABAg",
                            "authorDisplayName": "Mellifluous",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUejL671X6nF1vgQLz8eQJd6aYks9qk0SO3yyDM_w=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCDsRJmLH_4fgtBZ17v4IyrQ",
                            "authorChannelId": {
                                "value": "UCDsRJmLH_4fgtBZ17v4IyrQ"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-03T01:14:00Z",
                            "updatedAt": "2023-03-03T01:14:00Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "QCh9gXysXOhDcxeTusp6S-NXjmk",
                        "id": "UgwfFdZ-6Fv6xiwqvDd4AaABAg.9mdP92EawH59mm76kib1dL",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "I worked in produce too when I was younger. It's not a typical shht or onion/cheese stink instead it has a weird chemical funk+mildew smell. Very discomforting.",
                            "textOriginal": "I worked in produce too when I was younger. It's not a typical shht or onion/cheese stink instead it has a weird chemical funk+mildew smell. Very discomforting.",
                            "parentId": "UgwfFdZ-6Fv6xiwqvDd4AaABAg",
                            "authorDisplayName": "Sean Gonzalez",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJV9JeAh1iwT-62aVKSbqVisNoSzq4S1z4pHZg=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UC-OniZriH21iJb7n5jBSneg",
                            "authorChannelId": {
                                "value": "UC-OniZriH21iJb7n5jBSneg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-03-03T00:21:08Z",
                            "updatedAt": "2023-03-03T00:21:08Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "Lbdv-F8KSmC3hyg3LWq-3FXWc98",
                        "id": "UgwfFdZ-6Fv6xiwqvDd4AaABAg.9mdP92EawH59mm5OS5Rk3_",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "I cleaned out half a melon after two weeks in the fridge, i spilled out the liquid on the floor and its the worst thing ive ever smelled",
                            "textOriginal": "I cleaned out half a melon after two weeks in the fridge, i spilled out the liquid on the floor and its the worst thing ive ever smelled",
                            "parentId": "UgwfFdZ-6Fv6xiwqvDd4AaABAg",
                            "authorDisplayName": "Audun Holmen",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJV_7EvNmxB5FYruaDq8vEmqgIFGvQOqwOdDqvnB0Q=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCxNHhVNEg0hKcSIQH6zDMRA",
                            "authorChannelId": {
                                "value": "UCxNHhVNEg0hKcSIQH6zDMRA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-03-03T00:06:05Z",
                            "updatedAt": "2023-03-03T00:06:05Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "ZUpvKdUKG44NqyR7e3xIk9u4t7I",
            "id": "UgzRyMhuOmQU5hNgKt94AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "5hdbDGsqqZ_X81mc5hQvOdgSBys",
                    "id": "UgzRyMhuOmQU5hNgKt94AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I'm pretty sure the janitor quit",
                        "textOriginal": "I'm pretty sure the janitor quit",
                        "authorDisplayName": "꧁T̷h̷e̷_̷G̷r̷e̷a̷t̷ ̷A̷p̷p̷l̷e̷꧂",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/4jLPpYNGvmi-kqn9Yl21nS06qXpCuv-5IQoipjnNS3nRqN0Z2sQ7jh8Ne3yHuHyMcKoc1bUJ8Q=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCUW8_4id_kfttIrIDuIT9mw",
                        "authorChannelId": {
                            "value": "UCUW8_4id_kfttIrIDuIT9mw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1,
                        "publishedAt": "2023-02-27T21:36:54Z",
                        "updatedAt": "2023-02-27T21:36:54Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "hq26OW_k3oJHHf1Dwa0s8hbYCjI",
            "id": "UgyvR5yvh_fZXAoTRZt4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "X6m86_XwIPCp1vVDwm7NF5zujsE",
                    "id": "UgyvR5yvh_fZXAoTRZt4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "i work in produce, i would be so done that someone squeezed a rotten watermelon all in the bin, also trying to rip the bin from the pallet is like lifting thor's hammer, those staples be strong",
                        "textOriginal": "i work in produce, i would be so done that someone squeezed a rotten watermelon all in the bin, also trying to rip the bin from the pallet is like lifting thor's hammer, those staples be strong",
                        "authorDisplayName": "Ballz",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUn5TJFMtg1ix080vfCrmGcbDI4nhEch4YcsA=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCddx2cL2dgoghN58SUR9HKQ",
                        "authorChannelId": {
                            "value": "UCddx2cL2dgoghN58SUR9HKQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1,
                        "publishedAt": "2023-03-03T01:03:04Z",
                        "updatedAt": "2023-03-03T01:03:04Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "3d_5MF_oo4rSQPPurvkSuPeIvwQ",
            "id": "UgxhfZlkCoqSt0f6Epp4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "-UdR-OPs7hok6FpoX4K6T4sTaN4",
                    "id": "UgxhfZlkCoqSt0f6Epp4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Little story here lol I was at my friends house and she had to go take care of a neighbors house that was out of town. We saw one of these watermelons that had rotted on the inside, and it leaked all over the countertop.  Words cannot Describe how terrible it smelled. If you see one of these do not pop it it will smell so so bad.",
                        "textOriginal": "Little story here lol I was at my friends house and she had to go take care of a neighbors house that was out of town. We saw one of these watermelons that had rotted on the inside, and it leaked all over the countertop.  Words cannot Describe how terrible it smelled. If you see one of these do not pop it it will smell so so bad.",
                        "authorDisplayName": "Amelia",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/rW9QfYFCqoLOnRZGRS-d3tgV7n_84Vq6bMJAdiTrz1b7mhKXp9IYX80_4MjPjrXbodQC47W2fw=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC8Ao0qwFz_8E3s--Bx2W-oA",
                        "authorChannelId": {
                            "value": "UC8Ao0qwFz_8E3s--Bx2W-oA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 385,
                        "publishedAt": "2023-02-24T23:05:06Z",
                        "updatedAt": "2023-02-24T23:05:16Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 7,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "oxqymhsoOrIYkR8BTijqfaHYPJ0",
                        "id": "UgxhfZlkCoqSt0f6Epp4AaABAg.9mXXdb1tfQy9mkTKnDlf9D",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@DinoSword1 watermelon in particular probably smells so bad because it’s such a huge fruit too so there’s way more stuff to rot and ferment",
                            "textOriginal": "@DinoSword1 watermelon in particular probably smells so bad because it’s such a huge fruit too so there’s way more stuff to rot and ferment",
                            "parentId": "UgxhfZlkCoqSt0f6Epp4AaABAg",
                            "authorDisplayName": "Dell12 16",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJWc6jtYOHEMsnzq2_oliRHudWBphRmnZX17-g=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCqqpHAtCVYSX9JZsJdBIdmw",
                            "authorChannelId": {
                                "value": "UCqqpHAtCVYSX9JZsJdBIdmw"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-03-02T08:56:49Z",
                            "updatedAt": "2023-03-02T08:56:49Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "WzQo3vUxhmd7YESQdMwGhthpSeg",
                        "id": "UgxhfZlkCoqSt0f6Epp4AaABAg.9mXXdb1tfQy9miiaY8_5Tu",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@DinoSword1 bro said probably 💀💀 yes the reason rotten fruit stinks is because it's rotten on the inside",
                            "textOriginal": "@DinoSword1 bro said probably 💀💀 yes the reason rotten fruit stinks is because it's rotten on the inside",
                            "parentId": "UgxhfZlkCoqSt0f6Epp4AaABAg",
                            "authorDisplayName": "w SoaR w",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/TULBYAJ8YviINSD1D_hka-O7ZiBWF9doEqYb1e61y3kgWR3lUlrzJGK-xpFuYncmbufxC0Xc4VI=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UC9hbghU09Z3cifmXrNacV5w",
                            "authorChannelId": {
                                "value": "UC9hbghU09Z3cifmXrNacV5w"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-01T16:40:26Z",
                            "updatedAt": "2023-03-01T16:40:26Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "TwS3RSOZcKBVkdAoY2Az_LjSuik",
                        "id": "UgxhfZlkCoqSt0f6Epp4AaABAg.9mXXdb1tfQy9mZQv3J7XbH",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "yeah rotten melon just that bad. worst part is it's smell linger around for while",
                            "textOriginal": "yeah rotten melon just that bad. worst part is it's smell linger around for while",
                            "parentId": "UgxhfZlkCoqSt0f6Epp4AaABAg",
                            "authorDisplayName": "PO1995",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/qsMyTO3ONS-zaw09-7V6P4P6eG_MhJoEln4uLjlnDbDZe19ltXjNl_U-gMAEfJoQ-Sh4Uv2IWg=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UC8yUe5amIeNkB_X8AjTcaEA",
                            "authorChannelId": {
                                "value": "UC8yUe5amIeNkB_X8AjTcaEA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 15,
                            "publishedAt": "2023-02-25T16:44:48Z",
                            "updatedAt": "2023-02-25T16:44:48Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "0rHRo9b2eIAmFn7di0b8Uv_hkfg",
                        "id": "UgxhfZlkCoqSt0f6Epp4AaABAg.9mXXdb1tfQy9mZMW-XYssq",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@Amelia oh I see. I bet the smell was extremely strong and sharp huh. Weird that rotten fruits can smell so bad (prob from the rotting insides)",
                            "textOriginal": "@Amelia oh I see. I bet the smell was extremely strong and sharp huh. Weird that rotten fruits can smell so bad (prob from the rotting insides)",
                            "parentId": "UgxhfZlkCoqSt0f6Epp4AaABAg",
                            "authorDisplayName": "DinoSword1",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/YbDQyBR6BxAZl1YiC2cQPd3qJD4WWBq-tWyU-V5IeQEIAcogEy6-YSvsKG6-jjv6KWVLrNY5Uy0=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCyib1gEbFsxotmzOutuvX7A",
                            "authorChannelId": {
                                "value": "UCyib1gEbFsxotmzOutuvX7A"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 9,
                            "publishedAt": "2023-02-25T16:06:17Z",
                            "updatedAt": "2023-02-25T16:06:17Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "CEq-OIZRh8xmx1uAbQF2UELw7q4",
                        "id": "UgxhfZlkCoqSt0f6Epp4AaABAg.9mXXdb1tfQy9mZDNDSXGke",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@DinoSword1it’s really hard to describe but it kinda stung my nose and it was not stinky but it was “ripe” and kinda smelled like smelling salts lol",
                            "textOriginal": "@DinoSword1it’s really hard to describe but it kinda stung my nose and it was not stinky but it was “ripe” and kinda smelled like smelling salts lol",
                            "parentId": "UgxhfZlkCoqSt0f6Epp4AaABAg",
                            "authorDisplayName": "Amelia",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/rW9QfYFCqoLOnRZGRS-d3tgV7n_84Vq6bMJAdiTrz1b7mhKXp9IYX80_4MjPjrXbodQC47W2fw=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UC8Ao0qwFz_8E3s--Bx2W-oA",
                            "authorChannelId": {
                                "value": "UC8Ao0qwFz_8E3s--Bx2W-oA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 20,
                            "publishedAt": "2023-02-25T14:46:27Z",
                            "updatedAt": "2023-02-25T14:46:27Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "jBNMmIa07mozdQnlgi6xtSxvqfM",
            "id": "UgxqqrtoRKB2CmPqEvJ4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "eKypYfiZOGHdpB75xRPTm47vBDU",
                    "id": "UgxqqrtoRKB2CmPqEvJ4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "The shop keeper wants to know your location",
                        "textOriginal": "The shop keeper wants to know your location",
                        "authorDisplayName": "RayRSD",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/7bEG_GyufnezZu-5A7nn1mWehdw1MkAT-KKDCuuwKWVu7v9YZLxv0aNr5JEE_usSBpD1lOu_bQ=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCgihoh4kn4CYR_ES03FpWnw",
                        "authorChannelId": {
                            "value": "UCgihoh4kn4CYR_ES03FpWnw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 2,
                        "publishedAt": "2023-03-02T06:17:27Z",
                        "updatedAt": "2023-03-02T06:17:27Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "_QeyrdaJ9YoKhVMnXm8pyrN0dio",
            "id": "Ugw17PD6DbYCZykEsp14AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "VLsoYTIBYlRQWHNYI7Z98FqhptU",
                    "id": "Ugw17PD6DbYCZykEsp14AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "an accurate description of a watermelon",
                        "textOriginal": "an accurate description of a watermelon",
                        "authorDisplayName": "FIПП ƬΉΣ ΛПƬI FЦЯЯY",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/SmzzcMgJQRu1lTwHVgKxpbnQ34a58DX_UQIyDv1VoU13TjcbDXkTeeLphc-Ax_ajhlslM3lm=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCWGy-x-hvL4g_9wpdIdT1MA",
                        "authorChannelId": {
                            "value": "UCWGy-x-hvL4g_9wpdIdT1MA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-03T02:37:47Z",
                        "updatedAt": "2023-03-03T02:37:47Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "WsINUibukvdteRVb2sClt36IMvI",
            "id": "Ugzt1ZEFJxLvmItcTrV4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "hJm0CVbyxuD1oThWTxqcL3dwXLg",
                    "id": "Ugzt1ZEFJxLvmItcTrV4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I once had a whole bin of those. It flooded the store backroom. My god the stench.",
                        "textOriginal": "I once had a whole bin of those. It flooded the store backroom. My god the stench.",
                        "authorDisplayName": "AzureKaioshin",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJWi1CytBF-q68-ks5gCRfIna6POPDQwFiataNKK=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCuFJocSUPOKfeTPWdzlVKdw",
                        "authorChannelId": {
                            "value": "UCuFJocSUPOKfeTPWdzlVKdw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 96,
                        "publishedAt": "2023-02-25T20:28:43Z",
                        "updatedAt": "2023-02-25T20:28:43Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 1,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "f_OCVkqjXxtkaJ6nY15YW1trKQE",
                        "id": "Ugzt1ZEFJxLvmItcTrV4AaABAg.9mZpY4GL2d29ml2vPSIDYK",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "Bro I wouldn't know where to start",
                            "textOriginal": "Bro I wouldn't know where to start",
                            "parentId": "Ugzt1ZEFJxLvmItcTrV4AaABAg",
                            "authorDisplayName": "Joshua Rayfield",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUQzWWZtXDJ3gsCU3G-c5Psy7s_8mdG36TNhw=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCLclkxJwFhRhztpm77zfhaA",
                            "authorChannelId": {
                                "value": "UCLclkxJwFhRhztpm77zfhaA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 4,
                            "publishedAt": "2023-03-02T14:25:16Z",
                            "updatedAt": "2023-03-02T14:25:16Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "NQum-gT4sTbo1nqxtnw32yHNXVs",
            "id": "UgzymUoZ0iXKBGR7Mtd4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "ENlVqG7t0nN-vzeOj3c25sjIR2o",
                    "id": "UgzymUoZ0iXKBGR7Mtd4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Me in the morning after I drank a whole bottle of water before bed.",
                        "textOriginal": "Me in the morning after I drank a whole bottle of water before bed.",
                        "authorDisplayName": "PurpleDevil R",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/lZ21KAIbmSLmX-tL4MMxs242W60FEGQAJsff90k7hsj-A-rNUollV9d70blS6DgM81xNAunU=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCD_VkzUK5o4H3_t7ODBuaUQ",
                        "authorChannelId": {
                            "value": "UCD_VkzUK5o4H3_t7ODBuaUQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1,
                        "publishedAt": "2023-03-02T20:19:11Z",
                        "updatedAt": "2023-03-02T20:19:11Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "NV9vO4BIhMkp2n1g6_dEONm-aoY",
            "id": "UgzqmiUZOUcbPQFDnsB4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "xXk1yQGFzmFfXgDw05SXmYxuy4M",
                    "id": "UgzqmiUZOUcbPQFDnsB4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "when she says she's on her period but u a menace!",
                        "textOriginal": "when she says she's on her period but u a menace!",
                        "authorDisplayName": "Cá se vai andando!",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJXnFKe4aTcdBRMGnM28PlU_XrFqhAtbZZ5BjGOhPQ=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCZ5MRyXrrCtsyDiUnhmZRmw",
                        "authorChannelId": {
                            "value": "UCZ5MRyXrrCtsyDiUnhmZRmw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 2,
                        "publishedAt": "2023-03-01T04:26:34Z",
                        "updatedAt": "2023-03-01T04:26:34Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "O49gnQ7xnJ-XjSQyAeTox2vetn8",
            "id": "UgyHlFWQruB7SsyZoe94AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "Nd9pkR2drJ8TRvZl7Im1R7sI-LE",
                    "id": "UgyHlFWQruB7SsyZoe94AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "That's not a watermelon, that's a water 💀",
                        "textOriginal": "That's not a watermelon, that's a water 💀",
                        "authorDisplayName": "Tigers4Life",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/Pu4ECXA20rPDbFN0uuwV5FnLvsj3hyvF4dqG2SSJBTL8FNaYyA1-FIuBVtwHnpCiknm3sujfKg=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCSyPH2mZy0ezcP7o74TaXnA",
                        "authorChannelId": {
                            "value": "UCSyPH2mZy0ezcP7o74TaXnA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 208,
                        "publishedAt": "2023-02-25T06:04:53Z",
                        "updatedAt": "2023-02-25T06:04:53Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 8,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "HGWOnMlNdXTa291_JL5YL9RflA0",
                        "id": "UgyHlFWQruB7SsyZoe94AaABAg.9mYHg4MdIMo9mmTAlb3QhU",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@Bot The Skitarii peasant I like my water with the organs still intact. Eating Bone water is for cavemen. *_I am a Trojan Warrior excuse me_*",
                            "textOriginal": "@Bot The Skitarii peasant I like my water with the organs still intact. Eating Bone water is for cavemen. *_I am a Trojan Warrior excuse me_*",
                            "parentId": "UgyHlFWQruB7SsyZoe94AaABAg",
                            "authorDisplayName": "that one screeming cat go REEE",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/cCWTk-2VxDJRLITwPBqTmO4eObLT7AXeb2FphDCs97nOlcs1w-4FVx6ad2Up_XmrwQGC4ky6Ng=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCOurSARfd5OgApO_y7yZKUA",
                            "authorChannelId": {
                                "value": "UCOurSARfd5OgApO_y7yZKUA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-03T03:33:55Z",
                            "updatedAt": "2023-03-03T03:34:15Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "3CBly_3LlwqRDj4x3rixh9RvpA0",
                        "id": "UgyHlFWQruB7SsyZoe94AaABAg.9mYHg4MdIMo9mmSG7D2q75",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "​@that one screeming cat go REEEI like my water  with the bones",
                            "textOriginal": "​@that one screeming cat go REEEI like my water  with the bones",
                            "parentId": "UgyHlFWQruB7SsyZoe94AaABAg",
                            "authorDisplayName": "Bot The Skitarii",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/pb7pirAg5AdehYHVRhoedjrwg_J0_H4JyRZyXSC09Gy0E4GlYyu1239Oo8U5vGEOgRtYahH4Wg=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UC7USHWcn4xIQt81X9-gEf7w",
                            "authorChannelId": {
                                "value": "UC7USHWcn4xIQt81X9-gEf7w"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-03T03:25:55Z",
                            "updatedAt": "2023-03-03T03:25:55Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "-RSQL6_Xf5ThREMSCfYTgit73Sg",
                        "id": "UgyHlFWQruB7SsyZoe94AaABAg.9mYHg4MdIMo9mlD9v6VxoX",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "Hahahahahahahaha ROFL",
                            "textOriginal": "Hahahahahahahaha ROFL",
                            "parentId": "UgyHlFWQruB7SsyZoe94AaABAg",
                            "authorDisplayName": "Michael Bucuresteanu",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJX0z3beS0zYldVa3h2KlKTCRAl36V8aiMlEsFAE=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCpIv06Uo8J8boqjZ4g6GILQ",
                            "authorChannelId": {
                                "value": "UCpIv06Uo8J8boqjZ4g6GILQ"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T15:54:45Z",
                            "updatedAt": "2023-03-02T15:54:45Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "raIPUQ-RcogO5otCfFK5Jvz2xEY",
                        "id": "UgyHlFWQruB7SsyZoe94AaABAg.9mYHg4MdIMo9mias5p-OEu",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "😂😂",
                            "textOriginal": "😂😂",
                            "parentId": "UgyHlFWQruB7SsyZoe94AaABAg",
                            "authorDisplayName": "Faze RICH",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ZNr0-PWJeOzLU2r-M_zGQCs_ohejd2aQWhYkOzCotR0GYNcgR4pSFft-1yVnL383FinMxhib=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCCiyh-zkJ3SYWVW2Jz2pNOg",
                            "authorChannelId": {
                                "value": "UCCiyh-zkJ3SYWVW2Jz2pNOg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-03-01T15:32:55Z",
                            "updatedAt": "2023-03-01T15:32:55Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "QT3F6pI9nXh3oDLQ7vph0ZOJmPI",
                        "id": "UgyHlFWQruB7SsyZoe94AaABAg.9mYHg4MdIMo9mhWDJ9-_Tw",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@Cinema *_hMmMmmMMm strange, I thought you said you liked your water deep-fried like breaded crispy rotisserie chicken, but moist?_*",
                            "textOriginal": "@Cinema *_hMmMmmMMm strange, I thought you said you liked your water deep-fried like breaded crispy rotisserie chicken, but moist?_*",
                            "parentId": "UgyHlFWQruB7SsyZoe94AaABAg",
                            "authorDisplayName": "that one screeming cat go REEE",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/cCWTk-2VxDJRLITwPBqTmO4eObLT7AXeb2FphDCs97nOlcs1w-4FVx6ad2Up_XmrwQGC4ky6Ng=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCOurSARfd5OgApO_y7yZKUA",
                            "authorChannelId": {
                                "value": "UCOurSARfd5OgApO_y7yZKUA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-03-01T05:24:17Z",
                            "updatedAt": "2023-03-01T05:24:17Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "2EYOoi5FK3lACLt3ILHtLIqtMHU",
            "id": "UgxxOkY61zxi_haJSj54AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "6EOCagntv-6mhll6o89_9N5ditE",
                    "id": "UgxxOkY61zxi_haJSj54AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I really hope that you went and got an employee and helped to clean it up because otherwise that's not cool bro squeezing all the water out of that watermelon onto the floor.",
                        "textOriginal": "I really hope that you went and got an employee and helped to clean it up because otherwise that's not cool bro squeezing all the water out of that watermelon onto the floor.",
                        "authorDisplayName": "First Name Last Name",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJXHLRxmLqr6poE1a3xQ420Y6TNSw5XzlP9HOA=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC6bUvUILeEcrk5bXO_-dxZQ",
                        "authorChannelId": {
                            "value": "UC6bUvUILeEcrk5bXO_-dxZQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1,
                        "publishedAt": "2023-03-02T09:44:19Z",
                        "updatedAt": "2023-03-02T09:44:19Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "kfOvtOvy2HMvXOTnOX9OxvItdZ8",
            "id": "Ugy1g9akKS2WArHxV7F4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "3gV7LU1D1A9Y3A-9EPuRMwG5x0Q",
                    "id": "Ugy1g9akKS2WArHxV7F4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I think that store probably LOVES you",
                        "textOriginal": "I think that store probably LOVES you",
                        "authorDisplayName": "yesmanyesyesyesi",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/Bh5NZdeq4SGxPvWGiouLiCARzaLKage1iQK0hSaPIVoJ-4FFL6Sxdy8Rrs83PMrLLVAvzcmeCSc=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCyCLBOq7uatkyzKml7iNFpQ",
                        "authorChannelId": {
                            "value": "UCyCLBOq7uatkyzKml7iNFpQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-02T09:29:14Z",
                        "updatedAt": "2023-03-02T09:29:14Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "upkWsP8N1PZI-ywFU0ZxVqZa6Ts",
            "id": "UgzTy3vsd47igUri09V4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "l_GiG071sPaF1LWksvdGk-VIWGw",
                    "id": "UgzTy3vsd47igUri09V4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I had this happen to a watermelon I bought once. We didn't cut into it before it went bad, which is what happened here. The smell is unbelievable",
                        "textOriginal": "I had this happen to a watermelon I bought once. We didn't cut into it before it went bad, which is what happened here. The smell is unbelievable",
                        "authorDisplayName": "Rich2300",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJVSO34feOg6unKpuC2xCNITHVQRv2JkWZTJnsg2WIBhHj7A2sR1X2_RaIugByJs=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UChtRdsJ0M_IyloQLroTBzUg",
                        "authorChannelId": {
                            "value": "UChtRdsJ0M_IyloQLroTBzUg"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 163,
                        "publishedAt": "2023-02-24T22:14:42Z",
                        "updatedAt": "2023-02-24T22:14:42Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 6,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "7cEYZLo7UAWqtq09MChkHlh8t0w",
                        "id": "UgzTy3vsd47igUri09V4AaABAg.9mXRsMqsQNo9m_I_rKnBK2",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@Invasion Animation One of the worst things I've ever experienced",
                            "textOriginal": "@Invasion Animation One of the worst things I've ever experienced",
                            "parentId": "UgzTy3vsd47igUri09V4AaABAg",
                            "authorDisplayName": "Rich2300",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJVSO34feOg6unKpuC2xCNITHVQRv2JkWZTJnsg2WIBhHj7A2sR1X2_RaIugByJs=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UChtRdsJ0M_IyloQLroTBzUg",
                            "authorChannelId": {
                                "value": "UChtRdsJ0M_IyloQLroTBzUg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 7,
                            "publishedAt": "2023-02-26T00:51:14Z",
                            "updatedAt": "2023-02-26T00:51:14Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "oNiSmXTooluJO2pbsDSJf3r-pX0",
                        "id": "UgzTy3vsd47igUri09V4AaABAg.9mXRsMqsQNo9mXhQYp1Bfl",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@DrThop Oh my.",
                            "textOriginal": "@DrThop Oh my.",
                            "parentId": "UgzTy3vsd47igUri09V4AaABAg",
                            "authorDisplayName": "Invasion Animation",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/CShGEGJqr2kRbmh7r19zPRNkmKCSsXsoAcMINReMow9YZteKYG-PSDtoyRRgYPuccBVJv20P0L4=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCNlvrj3DPRUmfNJ7jwC0g1Q",
                            "authorChannelId": {
                                "value": "UCNlvrj3DPRUmfNJ7jwC0g1Q"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-02-25T00:39:18Z",
                            "updatedAt": "2023-02-25T00:39:18Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "HhchMF6_rrlcVh59E_SNU-6WpBA",
                        "id": "UgzTy3vsd47igUri09V4AaABAg.9mXRsMqsQNo9mXczRHhKhb",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@Invasion Animation horrible",
                            "textOriginal": "@Invasion Animation horrible",
                            "parentId": "UgzTy3vsd47igUri09V4AaABAg",
                            "authorDisplayName": "DrThop",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/jYi0dwrwSgeef7bWNsfTr9oVOrWU4oj-BA60XXJLGEtDXt0KW_z6fnE8UQOzsRKIedDQo7ETBkw=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCGAHDLhB7BfBreGqXufIjBQ",
                            "authorChannelId": {
                                "value": "UCGAHDLhB7BfBreGqXufIjBQ"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 14,
                            "publishedAt": "2023-02-25T00:00:31Z",
                            "updatedAt": "2023-02-25T00:00:31Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "SYXcuI8wY_-E9ak5-6YzXnGW1LE",
                        "id": "UgzTy3vsd47igUri09V4AaABAg.9mXRsMqsQNo9mXXYt8x32A",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "Good or bad smell?",
                            "textOriginal": "Good or bad smell?",
                            "parentId": "UgzTy3vsd47igUri09V4AaABAg",
                            "authorDisplayName": "Invasion Animation",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/CShGEGJqr2kRbmh7r19zPRNkmKCSsXsoAcMINReMow9YZteKYG-PSDtoyRRgYPuccBVJv20P0L4=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCNlvrj3DPRUmfNJ7jwC0g1Q",
                            "authorChannelId": {
                                "value": "UCNlvrj3DPRUmfNJ7jwC0g1Q"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 4,
                            "publishedAt": "2023-02-24T23:04:19Z",
                            "updatedAt": "2023-02-24T23:04:19Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "QpK-QKBVF8jwEbBtaMxqTN9X1k4",
            "id": "UgwuYJg6RSWmMuM-9tR4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "Ydn-d0vcxytVbJ08sMwOqmdC7fQ",
                    "id": "UgwuYJg6RSWmMuM-9tR4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "POV: every toilet in that one gas station bathroom:",
                        "textOriginal": "POV: every toilet in that one gas station bathroom:",
                        "authorDisplayName": "BlitzTF",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/wy8Pu8XGRrg3ZFr31tpqBKcDjKm4L6F7MQoqH8UfusxTbc1i4RXRzZlxD-OC0Xeh3RrOy1mB=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCLFpSTlB1s6aRI3R2g5oW_Q",
                        "authorChannelId": {
                            "value": "UCLFpSTlB1s6aRI3R2g5oW_Q"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1,
                        "publishedAt": "2023-02-28T14:44:27Z",
                        "updatedAt": "2023-02-28T14:44:27Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "gCU6fOMouSsNrXif9Uq5JOsYNNk",
            "id": "Ugz2MsqsWyT3QAT5YEB4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "kWO9zOspmFlZekhijHAXEYoXsNI",
                    "id": "Ugz2MsqsWyT3QAT5YEB4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "when Jacob started drawing the missiles I legit almost screamed. You can't just DO that, Jacob Drawfee. Smh.",
                        "textOriginal": "when Jacob started drawing the missiles I legit almost screamed. You can't just DO that, Jacob Drawfee. Smh.",
                        "authorDisplayName": "FreshCupOfAngst",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/zXhIhX7BxdqdN3qUoL1K_jYH-Jx2gd25mOeprk1fZqaxA28fQOrF3ygBuAMVfghF1GJg6wG0kbk=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC3_8I3ryOBIlOv6nukZNPPA",
                        "authorChannelId": {
                            "value": "UC3_8I3ryOBIlOv6nukZNPPA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-02T20:31:09Z",
                        "updatedAt": "2023-03-02T20:31:20Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "2HIsKxhsjiMhaAU702NqVGpTl0A",
            "id": "UgxZmbh7NcF3wT6VwP94AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "BtSEp6NWuWRG9UWs1mOUhp_PnpA",
                    "id": "UgxZmbh7NcF3wT6VwP94AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I wonder if it tastes like watermelon flavored water or water flavored watermelon",
                        "textOriginal": "I wonder if it tastes like watermelon flavored water or water flavored watermelon",
                        "authorDisplayName": "chonk",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/1wUlvW4brpNnX5BMU1P_X55NJdc-i7S95eXogQDSp8MvCH2Olw52wFYLa5It8VcGRCyHWSXowA=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCMOyPsWUa22v099U_WX1UGA",
                        "authorChannelId": {
                            "value": "UCMOyPsWUa22v099U_WX1UGA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 134,
                        "publishedAt": "2023-02-24T22:02:06Z",
                        "updatedAt": "2023-02-24T22:02:06Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 13,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "4riFGkih5DNc1ppcNsY6YzrsIQU",
                        "id": "UgxZmbh7NcF3wT6VwP94AaABAg.9mXQR9Llsco9ml3JNhUR4C",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "Im sure it tastes like amoxicillin, which you will need in no more than 2 days.",
                            "textOriginal": "Im sure it tastes like amoxicillin, which you will need in no more than 2 days.",
                            "parentId": "UgxZmbh7NcF3wT6VwP94AaABAg",
                            "authorDisplayName": "Joshua Rayfield",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUQzWWZtXDJ3gsCU3G-c5Psy7s_8mdG36TNhw=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCLclkxJwFhRhztpm77zfhaA",
                            "authorChannelId": {
                                "value": "UCLclkxJwFhRhztpm77zfhaA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T14:28:40Z",
                            "updatedAt": "2023-03-02T14:28:40Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "OBYNK6k9t1uMo75U_8Kfjclze4I",
                        "id": "UgxZmbh7NcF3wT6VwP94AaABAg.9mXQR9Llsco9mhzsI6BFW_",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "It tastes and smells like death\n\nI'm not lying",
                            "textOriginal": "It tastes and smells like death\n\nI'm not lying",
                            "parentId": "UgxZmbh7NcF3wT6VwP94AaABAg",
                            "authorDisplayName": "Masao Kakihara",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJXGWFtumRp7bELGggAaFDixAKZL_DOEzIgVURIk=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCpupv39nQJJLcvG-J10wMbw",
                            "authorChannelId": {
                                "value": "UCpupv39nQJJLcvG-J10wMbw"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 4,
                            "publishedAt": "2023-03-01T09:52:10Z",
                            "updatedAt": "2023-03-01T09:52:10Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "SIBuahJm3hXiT3rEHMsoYTGjAbo",
                        "id": "UgxZmbh7NcF3wT6VwP94AaABAg.9mXQR9Llsco9mh_AOk98LM",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "I imagine it's a lot more like garbage flavored water",
                            "textOriginal": "I imagine it's a lot more like garbage flavored water",
                            "parentId": "UgxZmbh7NcF3wT6VwP94AaABAg",
                            "authorDisplayName": "kiraPh1234k",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJWzWjna5J54YQuf84ZGdYuhrzoWKgNrLbpIiQ=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCRoA8QDuryAsehTLuxoYKyg",
                            "authorChannelId": {
                                "value": "UCRoA8QDuryAsehTLuxoYKyg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 4,
                            "publishedAt": "2023-03-01T05:58:50Z",
                            "updatedAt": "2023-03-01T05:58:50Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "4TeyrH4hcziiYtKAmWiIakDw4Ew",
                        "id": "UgxZmbh7NcF3wT6VwP94AaABAg.9mXQR9Llsco9mhNcWMYv0q",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "​@Figment Well, what does that taste like?",
                            "textOriginal": "​@Figment Well, what does that taste like?",
                            "parentId": "UgxZmbh7NcF3wT6VwP94AaABAg",
                            "authorDisplayName": "Corey Henderson",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJXxcG8BCycuuNF0BRlHPEPPkcW8x0kaS85trdrV=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCj1GdG749zeFsT8i6LZfpJw",
                            "authorChannelId": {
                                "value": "UCj1GdG749zeFsT8i6LZfpJw"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 1,
                            "publishedAt": "2023-03-01T04:09:13Z",
                            "updatedAt": "2023-03-01T04:09:13Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "cwYTxO9BZesjY3tM0S6sD22ALb8",
                        "id": "UgxZmbh7NcF3wT6VwP94AaABAg.9mXQR9Llsco9mgAlpi9l8S",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "It tastes like death. A rotted melon is so gross and I live in rural farm country, few things gross me out",
                            "textOriginal": "It tastes like death. A rotted melon is so gross and I live in rural farm country, few things gross me out",
                            "parentId": "UgxZmbh7NcF3wT6VwP94AaABAg",
                            "authorDisplayName": "Legend Owl",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJX1iwCB_nwsclU9UhxaHYEe9CDKMXizpFLBabqh=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCjswem1_hXpneiwFB_BXGlA",
                            "authorChannelId": {
                                "value": "UCjswem1_hXpneiwFB_BXGlA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 27,
                            "publishedAt": "2023-02-28T16:57:39Z",
                            "updatedAt": "2023-02-28T16:57:39Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "mOAK4qPXPt6V6TnNS6HKGHksuEA",
            "id": "Ugx48ouMFbUx20nFMvN4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "oXr7jvhrG9HGawbYbI5R-jxo_pw",
                    "id": "Ugx48ouMFbUx20nFMvN4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Watermelon from school lunch be like:",
                        "textOriginal": "Watermelon from school lunch be like:",
                        "authorDisplayName": "Roradee",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/9Txav_8mOVD0akBjpjEh8jed231utqfiBYHJ_BMYAi7R3vu1ZXeEI9cbXPqPgrQPTR2IHLiH6g=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCv2jB5CDkGrVv8j_5rjy-xw",
                        "authorChannelId": {
                            "value": "UCv2jB5CDkGrVv8j_5rjy-xw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-02-27T22:36:45Z",
                        "updatedAt": "2023-02-27T22:36:45Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "f9yt5mFthhC6JQlmE_A5JfT7Kaw",
            "id": "UgyxOob-VkTiKzRdDJl4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "7AJz9CFkTbORX3wmf3fJqCCBmPM",
                    "id": "UgyxOob-VkTiKzRdDJl4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Now that is a true Walla melon",
                        "textOriginal": "Now that is a true Walla melon",
                        "authorDisplayName": "Storm trooper",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/DwQaHSmOjRa9O2GjZ9g7lX21yW-s8MqAC6OnVYe5mA63ALJbP1IGwp7n8TDMKXqD9nzoMSnAhg=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCmGGfh9jlls3jdKFThefmYg",
                        "authorChannelId": {
                            "value": "UCmGGfh9jlls3jdKFThefmYg"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1,
                        "publishedAt": "2023-02-27T19:27:52Z",
                        "updatedAt": "2023-02-27T19:27:52Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "lck9BvF5MHvNjrSLweghdTx5-uE",
            "id": "Ugzo4yyFc2SfsWCvuct4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "Jme3ekj-FiD7k9Fqb9EsJggU2W8",
                    "id": "Ugzo4yyFc2SfsWCvuct4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "*watermelon with diarrhea be like*",
                        "textOriginal": "*watermelon with diarrhea be like*",
                        "authorDisplayName": "EasyKidsReading 读书乐",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/tN1Qp1446ho2j3xJi3art9jqS6b0iY4ju02w0b8FRVAxKdt15phucNNunpj4spDJmMKx-rbpZZc=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC5yAB45nesgm_uXBTCjmPbQ",
                        "authorChannelId": {
                            "value": "UC5yAB45nesgm_uXBTCjmPbQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 73,
                        "publishedAt": "2023-02-26T05:34:58Z",
                        "updatedAt": "2023-02-26T05:34:58Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 1,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "GZCXL3j3ZACK8woMMw7TLDdvjmA",
                        "id": "Ugzo4yyFc2SfsWCvuct4AaABAg.9m_o2o9WeC-9mjXa2zTMD4",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "I was wondering why this looked sus to me",
                            "textOriginal": "I was wondering why this looked sus to me",
                            "parentId": "Ugzo4yyFc2SfsWCvuct4AaABAg",
                            "authorDisplayName": "J",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/p9FjTHCWfMknVykVL_rbtrUXf_GF7SUGOCxqiYcU112hobYEkQBzEcs_ZMT4s9QBzbwM-xk6=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCjOZkvfR4AUMzBNoT5KIvXg",
                            "authorChannelId": {
                                "value": "UCjOZkvfR4AUMzBNoT5KIvXg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T00:14:45Z",
                            "updatedAt": "2023-03-02T00:14:45Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "ZiqKQQIycRtoYryye1pLTtvO55c",
            "id": "UgxX7NdYiIZkCDg8GIx4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "SO3N5Fl-UzPwRdVBjAbJ5b8QDvw",
                    "id": "UgxX7NdYiIZkCDg8GIx4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I remember when I was younger I accidentally toppled a whole pyramid of watermelons over and ran away from the aisle 😅",
                        "textOriginal": "I remember when I was younger I accidentally toppled a whole pyramid of watermelons over and ran away from the aisle 😅",
                        "authorDisplayName": "Shark",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUol_DWdUBc8YxupRCgjpNSOlw2akgWQLSm68Bt=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCAB8p5Wm6KHsfgGw2ItqzcQ",
                        "authorChannelId": {
                            "value": "UCAB8p5Wm6KHsfgGw2ItqzcQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-03T02:25:17Z",
                        "updatedAt": "2023-03-03T02:25:17Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "ej-sdtSB2zPAiAxaYIDPs6W4FRQ",
            "id": "UgwQOSFVKwZ71IubQ9h4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "khTikCeLXndg3GwBlT-FdyEeSRU",
                    "id": "UgwQOSFVKwZ71IubQ9h4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Yeah that's just the smell of pure mildew and mold released into a nice perfume for you to enjoy store wide 😂",
                        "textOriginal": "Yeah that's just the smell of pure mildew and mold released into a nice perfume for you to enjoy store wide 😂",
                        "authorDisplayName": "Mellifluous",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUejL671X6nF1vgQLz8eQJd6aYks9qk0SO3yyDM_w=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCDsRJmLH_4fgtBZ17v4IyrQ",
                        "authorChannelId": {
                            "value": "UCDsRJmLH_4fgtBZ17v4IyrQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1,
                        "publishedAt": "2023-03-03T01:15:56Z",
                        "updatedAt": "2023-03-03T01:15:56Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "eoBX6wFQ-gtPhSfbWk2S8foOXm8",
            "id": "UgxNFFltMYqIbtDjjBJ4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "UiPsnnkA99uc0rtcJk9Xu_P0Vl4",
                    "id": "UgxNFFltMYqIbtDjjBJ4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "\"Dude, really?\" - Store employee",
                        "textOriginal": "\"Dude, really?\" - Store employee",
                        "authorDisplayName": "Jason Wall",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUIfTN-7afSGZpT3mBBrO4g0NvzN3xnjAOcciAolw=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC5D33sPYw2XsLTE_SYeqXfw",
                        "authorChannelId": {
                            "value": "UC5D33sPYw2XsLTE_SYeqXfw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 59,
                        "publishedAt": "2023-02-27T01:15:01Z",
                        "updatedAt": "2023-02-27T01:15:01Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 1,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "SlEBZsK-rdyZcumLamW1YJ6vNu8",
                        "id": "UgxNFFltMYqIbtDjjBJ4AaABAg.9mbv5majGGw9mm1asNSJoT",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "I would be murderous",
                            "textOriginal": "I would be murderous",
                            "parentId": "UgxNFFltMYqIbtDjjBJ4AaABAg",
                            "authorDisplayName": "gracesreadsalot ayy",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJX1XtnGKrrM3HXSO4yBK1KptreCRF_0p24o5-B-=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCW0SLUvMatUHjwyZQIOmOpg",
                            "authorChannelId": {
                                "value": "UCW0SLUvMatUHjwyZQIOmOpg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T23:32:58Z",
                            "updatedAt": "2023-03-02T23:32:58Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "ug4X4fIWctJtRM1CI5L3RYvXBIk",
            "id": "UgzJ81tltc9aIGQJJTZ4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "OBAs5STRa6Lv0FJyojklRw6PZRA",
                    "id": "UgzJ81tltc9aIGQJJTZ4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "it looks like the water melon is taking a sheeett💀",
                        "textOriginal": "it looks like the water melon is taking a sheeett💀",
                        "authorDisplayName": "muzairy muhammad",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJX3zGCGamY5abD_xYhetzqXnmM50Je1ZPVvHbsVrQ=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCGPL5XqGagAip2nh6CDemSA",
                        "authorChannelId": {
                            "value": "UCGPL5XqGagAip2nh6CDemSA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1,
                        "publishedAt": "2023-03-02T05:46:15Z",
                        "updatedAt": "2023-03-02T05:46:15Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "RysolKFNLRSJaI5NyqRwfN8tJt4",
            "id": "UgxSCHozo6IvC53rEK94AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "skbsY_wrqgmaS3Hh8PdB3Qdi0bQ",
                    "id": "UgxSCHozo6IvC53rEK94AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "And now I know what happens to watermelon when it rots.\n\n\nI wouldn't even know how to get that thing out without it popping-",
                        "textOriginal": "And now I know what happens to watermelon when it rots.\n\n\nI wouldn't even know how to get that thing out without it popping-",
                        "authorDisplayName": "CarlytheWolf23",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/dWyn9vwyvtKdeHEoae7HuZnM_Ji06WGDxFh3XkePg0ZtWHGJ-f1uwga5vlKHepvj6533-rVxag=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCckYR4Fud_NjuWXzhSowNsA",
                        "authorChannelId": {
                            "value": "UCckYR4Fud_NjuWXzhSowNsA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-02T16:13:53Z",
                        "updatedAt": "2023-03-02T16:14:51Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "T-jISD5txa5JNeSq8lFpU1vQYPk",
            "id": "UgxMCt5AHyfAsntCBYJ4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "_3adrFsGsm3PLE0ieQ807_UZJMw",
                    "id": "UgxMCt5AHyfAsntCBYJ4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "That little bit of red watermelon that came out felt like insurance fraud.",
                        "textOriginal": "That little bit of red watermelon that came out felt like insurance fraud.",
                        "authorDisplayName": "sPongebItch bObface",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJX7v9hCWejXkeaZGVTnCYODgGxBZ2SjkrnJrrqn=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCsTIcmcjJUbll4C2USAQp8w",
                        "authorChannelId": {
                            "value": "UCsTIcmcjJUbll4C2USAQp8w"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 36,
                        "publishedAt": "2023-02-25T14:11:12Z",
                        "updatedAt": "2023-02-25T14:11:12Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "fcgJNVD0_oPNX5sN2SBVsPPhc2Q",
            "id": "UgyUQ_keYIiBOAQojoZ4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "xS6tNshDl2GC__QDJlr57keGYZc",
                    "id": "UgyUQ_keYIiBOAQojoZ4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I've seen something like that once at Aldi. I will admit Aldis produce quality has gotten a little better.",
                        "textOriginal": "I've seen something like that once at Aldi. I will admit Aldis produce quality has gotten a little better.",
                        "authorDisplayName": "Shekhar Moona",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUPGCztJlLFCINn5sIGmIy-n6mvAjOU_HYs-GMgKg=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCifjR-8cwNYkEaSB-MDtqGg",
                        "authorChannelId": {
                            "value": "UCifjR-8cwNYkEaSB-MDtqGg"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-02T22:15:06Z",
                        "updatedAt": "2023-03-02T22:15:06Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "W6YMF68qlcdFzVy4hFjd3CMAo1U",
            "id": "UgxA47--lLaxF99fP794AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "SQeyW1axc8wLYsp28-WlyJUdayU",
                    "id": "UgxA47--lLaxF99fP794AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Reminds me of when my son was born.😂 I looked ready to have twins and just had one 6lb baby.. and lots of water😂",
                        "textOriginal": "Reminds me of when my son was born.😂 I looked ready to have twins and just had one 6lb baby.. and lots of water😂",
                        "authorDisplayName": "Mercedes Marie",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJWzuFU-HED-NH9HGAU2i41yIGs7KsyRcZkW51e_7w=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCGmQFssWETiJOuzILUuua2w",
                        "authorChannelId": {
                            "value": "UCGmQFssWETiJOuzILUuua2w"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-03T03:13:21Z",
                        "updatedAt": "2023-03-03T03:13:21Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "UBPl7__7i9vFgu2pARZ-4WowkqE",
            "id": "UgwqTf9Z7cc3rRDPM4l4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "asLT7Ubxua1RO9eFXPXZloPOCTw",
                    "id": "UgwqTf9Z7cc3rRDPM4l4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "You can’t have shit in Detroit man 😭 💀",
                        "textOriginal": "You can’t have shit in Detroit man 😭 💀",
                        "authorDisplayName": "randomness overload",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUkfKAsXs1oMHhMmMozxD-xUQ7D_tEIcXBlwQgtow=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCXQWsH3tze4ZgNDpBoxqR0w",
                        "authorChannelId": {
                            "value": "UCXQWsH3tze4ZgNDpBoxqR0w"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 44,
                        "publishedAt": "2023-02-24T23:11:59Z",
                        "updatedAt": "2023-02-24T23:11:59Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 9,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "kGhGnpulf2xHZVEcppa_Kn5Kp8k",
                        "id": "UgwqTf9Z7cc3rRDPM4l4AaABAg.9mXYQvWggSh9mlBBvKK7-2",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "​@C. Writer *Taco Bell",
                            "textOriginal": "​@C. Writer *Taco Bell",
                            "parentId": "UgwqTf9Z7cc3rRDPM4l4AaABAg",
                            "authorDisplayName": "Jack",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/Mpm9gHL09h0fZgyvZRJnBLG8DDPiwd-VIpI5j-9bMHVgU6ptxlVZGefZw5O-JEpP_AAsiV1VZw=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UC__IkvdzBsEDZY_lLSleP0A",
                            "authorChannelId": {
                                "value": "UC__IkvdzBsEDZY_lLSleP0A"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T15:37:33Z",
                            "updatedAt": "2023-03-02T15:37:33Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "ZEQ-8MlkxGNv8x9m0Yqz1h19_iI",
                        "id": "UgwqTf9Z7cc3rRDPM4l4AaABAg.9mXYQvWggSh9mk-NtxtHBW",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "@Teresa Granic *doody / poo poo / #2",
                            "textOriginal": "@Teresa Granic *doody / poo poo / #2",
                            "parentId": "UgwqTf9Z7cc3rRDPM4l4AaABAg",
                            "authorDisplayName": "C. Writer",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJVLpbr8Sd1hTXAbkAbl_NzEqqOGxIiHKxwzuj4YOu3P9FGZfR7_BNGK4rwSjmkR=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCDMAtjqBSvVnaouOJfzr9xg",
                            "authorChannelId": {
                                "value": "UCDMAtjqBSvVnaouOJfzr9xg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T04:35:06Z",
                            "updatedAt": "2023-03-02T04:36:55Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "-eTPoL5saj-a-1oSxiRkgVh_DJY",
                        "id": "UgwqTf9Z7cc3rRDPM4l4AaABAg.9mXYQvWggSh9mhVNmL6e4C",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "Only in Ohio, New York, Detroit, Florida, Wyoming\n\n\n\nPeople really like making states memes",
                            "textOriginal": "Only in Ohio, New York, Detroit, Florida, Wyoming\n\n\n\nPeople really like making states memes",
                            "parentId": "UgwqTf9Z7cc3rRDPM4l4AaABAg",
                            "authorDisplayName": "Cinema",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/lH91_icTfQA4wSZEXWlVh2eLzaWw1SSYU1oHGUMOS_B5W_s48eX4bPZgiwyWiIxDQ9ajf5_Zkg=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCMkzigIv1oRh4tZSYDerkIA",
                            "authorChannelId": {
                                "value": "UCMkzigIv1oRh4tZSYDerkIA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-01T05:16:59Z",
                            "updatedAt": "2023-03-01T05:16:59Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "JGyIuJu7oSYMA17bxNQ4P2iJB34",
                        "id": "UgwqTf9Z7cc3rRDPM4l4AaABAg.9mXYQvWggSh9mhSnoJTFHx",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "​@• Muin • *caca",
                            "textOriginal": "​@• Muin • *caca",
                            "parentId": "UgwqTf9Z7cc3rRDPM4l4AaABAg",
                            "authorDisplayName": "Teresa Granic",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/L7LQSONhW7eonDK72Yl19X64h1h_vSD_UOj_9tFA6D-MUpcjlth-NjKF1d-1K1q65mjFWzYhX-U=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UC2PMS9VA7GhjG7BvxyFjlqA",
                            "authorChannelId": {
                                "value": "UC2PMS9VA7GhjG7BvxyFjlqA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-01T04:54:27Z",
                            "updatedAt": "2023-03-01T04:54:27Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "tAfXuwzmpSXZnYZyuSxXpnw2mfo",
            "id": "Ugz_OPR4AgNObmBHq4t4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "HTmARE3ElW_sb5DHWeMZZ4OCD54",
                    "id": "Ugz_OPR4AgNObmBHq4t4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Now that’s what I call, a -water-melon",
                        "textOriginal": "Now that’s what I call, a -water-melon",
                        "authorDisplayName": "JASONIC15",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/5X6BL4FQWK3dzlsE1pKt3kXCiq-rkQ102-7-I8B2UE-BO-nWUMK7HP19a-zfuuCp-MA9t7mnVg=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCJINq_ohXSZm4Ztyf1C2Kow",
                        "authorChannelId": {
                            "value": "UCJINq_ohXSZm4Ztyf1C2Kow"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-02T13:00:18Z",
                        "updatedAt": "2023-03-02T13:00:18Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "lXt02sQcGmUNbWluCYo0Vf6H3XA",
            "id": "UgyNci0G-8_AKGYhkk14AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "RUig4qAspNRQoDqg89jfWeWRymE",
                    "id": "UgyNci0G-8_AKGYhkk14AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Everyone talking about the rotten watermelon smell being the worst. I can't imagine how that smells then, because worse I could handle was dipping the top of my tongue into slightly rotten coconut, and it was the taste of death to me.",
                        "textOriginal": "Everyone talking about the rotten watermelon smell being the worst. I can't imagine how that smells then, because worse I could handle was dipping the top of my tongue into slightly rotten coconut, and it was the taste of death to me.",
                        "authorDisplayName": "nowonmetube",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJWNWeHdGTDvq3kyxE7F-0JzNT3Mbn6-lydccdIO=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCQMLW5hNrSmHC7F1DoqCh7w",
                        "authorChannelId": {
                            "value": "UCQMLW5hNrSmHC7F1DoqCh7w"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-02T19:20:41Z",
                        "updatedAt": "2023-03-02T19:20:41Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "k0Sax5CspZ4r1oydej8fOcBmG8Y",
            "id": "UgzL79nocel7mzIxWtF4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "vRYsxO1oB673R-rdZudSX9etFDU",
                    "id": "UgzL79nocel7mzIxWtF4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "He's amazed that he found a rotten watermelon 🤣.",
                        "textOriginal": "He's amazed that he found a rotten watermelon 🤣.",
                        "authorDisplayName": "Jose",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJW6bgLOwelsRuiDxHqUhV6XDMzvcnHmlEVRD7AG9jRn2wrz0NkqFqmrnEsm8kfE=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCNI81JBHwmBHhRYv8eHwj-A",
                        "authorChannelId": {
                            "value": "UCNI81JBHwmBHhRYv8eHwj-A"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 31,
                        "publishedAt": "2023-02-25T06:33:59Z",
                        "updatedAt": "2023-02-25T06:33:59Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "JZ9dWMfvBGYU-OjjFgZfZZt2EOs",
            "id": "UgyHG9bJHwwET1CxbuV4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "SkCLPDwZE_pRaZQBFlHt-Q8bCh4",
                    "id": "UgyHG9bJHwwET1CxbuV4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Plot twist: he’s just super strong and crushed the life water out of jt.",
                        "textOriginal": "Plot twist: he’s just super strong and crushed the life water out of jt.",
                        "authorDisplayName": "OFFPLAYSRBX",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/PgtuKmOIEsWi8JqrOqHWIFS7CoYE3KkwbUYts-wpEhgkduO3NnK9k0j1fj4e-mFabgDgNM37=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC1O4KT2pKcQIgJpxDvwwKYw",
                        "authorChannelId": {
                            "value": "UC1O4KT2pKcQIgJpxDvwwKYw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-01T20:45:47Z",
                        "updatedAt": "2023-03-01T20:45:47Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "GLHnHKj4yiE0CY6eOz-BaWveXzc",
            "id": "UgyyF0K6etgbK3k9HfF4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "wjoRlDJsm1cWRRiW9cnDit5TjF4",
                    "id": "UgyyF0K6etgbK3k9HfF4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Someone definitely had TOO much fun with that watermelon",
                        "textOriginal": "Someone definitely had TOO much fun with that watermelon",
                        "authorDisplayName": "ReasonableQuit75",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/jchMufXCpgWt5UzQSVjGGDu1Uz7gdQ46uaWs8tBsKmexmDexic5puJSFQ73FjJnF8Ua79mDA3w=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCZsUGcAl8BS26U_agrsXmLQ",
                        "authorChannelId": {
                            "value": "UCZsUGcAl8BS26U_agrsXmLQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-01T23:53:11Z",
                        "updatedAt": "2023-03-01T23:53:11Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "jS951HGoHbiAoradSso9xGyUym4",
            "id": "UgwlMDL2gKOp9hWqL6J4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "jxE3NpyR31on3nnfovwoHDkR4LQ",
                    "id": "UgwlMDL2gKOp9hWqL6J4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Aw hell nah they done up ‘n’ took the melon from my watermelon- can’t have shit in Detroit",
                        "textOriginal": "Aw hell nah they done up ‘n’ took the melon from my watermelon- can’t have shit in Detroit",
                        "authorDisplayName": "Geckuo",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJX5alaOxJu_UjkFquvHUatBMe7Fq8v4ah43CIsu=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC0-d3kCTj_FTvq-1FpNmqxw",
                        "authorChannelId": {
                            "value": "UC0-d3kCTj_FTvq-1FpNmqxw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 13,
                        "publishedAt": "2023-02-27T10:00:08Z",
                        "updatedAt": "2023-02-27T10:00:08Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "790zF_5WZY5W7rf6QUGESJ3IQZA",
            "id": "UgxHNcJZaulmRHODd3p4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "9cpfJjMz_8eG00DPkmgRpq2kjwA",
                    "id": "UgxHNcJZaulmRHODd3p4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Plot twist: he’s just super strong and crushed the life water out of it.",
                        "textOriginal": "Plot twist: he’s just super strong and crushed the life water out of it.",
                        "authorDisplayName": "OFFPLAYSRBX",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/PgtuKmOIEsWi8JqrOqHWIFS7CoYE3KkwbUYts-wpEhgkduO3NnK9k0j1fj4e-mFabgDgNM37=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC1O4KT2pKcQIgJpxDvwwKYw",
                        "authorChannelId": {
                            "value": "UC1O4KT2pKcQIgJpxDvwwKYw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-01T20:45:53Z",
                        "updatedAt": "2023-03-01T20:45:53Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "2Oj-CCTeCFD5tSnTptN0m8yrbgQ",
            "id": "UgzSGq6SH0JetJiDkYl4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "9KsfrOHgmZnbUvBlCRXnp9OB_KE",
                    "id": "UgzSGq6SH0JetJiDkYl4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "“Babe , would you also like some watermelon s k i n?”",
                        "textOriginal": "“Babe , would you also like some watermelon s k i n?”",
                        "authorDisplayName": "Uknown",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/PjM4hTS5tO4Ic8rWkLOXrtnPl9Fr9wjVEJotj6dsOxMxW9yd6SCD3m7u8QHKC4YFLpzX3RJs=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCT0UK_bXhyU-oOpK6pes1Hw",
                        "authorChannelId": {
                            "value": "UCT0UK_bXhyU-oOpK6pes1Hw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-02T04:12:47Z",
                        "updatedAt": "2023-03-02T04:12:47Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "yTHNXpGl0eBDp8xhfc9Wvw0Y0sQ",
            "id": "UgzbDZme1Oi5DHrBkaB4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "aFQ3Snr0pvfUBEVuHosBmAIBlXY",
                    "id": "UgzbDZme1Oi5DHrBkaB4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "That happened once to me. My sister-in-law bought a melon and no-one touched it in two weeks. The smell was horrible, and the clean up was a nightmare.",
                        "textOriginal": "That happened once to me. My sister-in-law bought a melon and no-one touched it in two weeks. The smell was horrible, and the clean up was a nightmare.",
                        "authorDisplayName": "William T.",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJWQtl26MhNJykhpi3p4yyhkPdPUk4HItrV1mA=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCuz_UIDOLUE1NGcW73YzJhQ",
                        "authorChannelId": {
                            "value": "UCuz_UIDOLUE1NGcW73YzJhQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 7,
                        "publishedAt": "2023-02-27T09:57:19Z",
                        "updatedAt": "2023-02-27T09:57:19Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "fKmJEpykdt0PGSpgb62_A9zpnF4",
            "id": "UgxIxcyg4sSiRtjbCIB4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "ZBX-D3vSa3hSu0PJPcY5gibfTLk",
                    "id": "UgxIxcyg4sSiRtjbCIB4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I imagine that daily dose just barges into places and starts rummaging around until he can find something to make a video about",
                        "textOriginal": "I imagine that daily dose just barges into places and starts rummaging around until he can find something to make a video about",
                        "authorDisplayName": "Milobusterz",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ta8inWu9faz1qijxepbKDTxe3bGafqhfWqlY2PtMpvm7oIMpemwbRM_gyZJVDvXKTG-q0Rwp58s=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCJZcc9gT-yBo-fuiRPcI1kA",
                        "authorChannelId": {
                            "value": "UCJZcc9gT-yBo-fuiRPcI1kA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-02T01:48:39Z",
                        "updatedAt": "2023-03-02T01:48:39Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "-q1HRq7lZiw_8td6v8CPkLYs5kE",
            "id": "Ugyd23Ab_3z2IAYBwH14AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "FMmbJzjOy_tJtgGwfkqhYLqRA3I",
                    "id": "Ugyd23Ab_3z2IAYBwH14AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "the employee that has to clean this up:",
                        "textOriginal": "the employee that has to clean this up:",
                        "authorDisplayName": "clayton",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/6W0s67z_jqOeaF5SHcotLYUVN07IJo36MYnNgKJRwFFVEy_RI0Gb_VDAvipOoeA0Ic2QI8k_hg=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCwrmvnGMaN11ZHV7pJ1yI3A",
                        "authorChannelId": {
                            "value": "UCwrmvnGMaN11ZHV7pJ1yI3A"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-02T18:15:29Z",
                        "updatedAt": "2023-03-02T18:15:29Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "6KzeIF3o7P4J_BIhxBgIiBXhZcE",
            "id": "Ugzl6LQd-tfNotzR67h4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "frXbrxMq99NDVO67kJLmcEkInJ8",
                    "id": "Ugzl6LQd-tfNotzR67h4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Behold! Nature’s very own stink bomb in disguise 🍈 💣",
                        "textOriginal": "Behold! Nature’s very own stink bomb in disguise 🍈 💣",
                        "authorDisplayName": "Huggo",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/c4CQwQD9XT_SgkDHG6H2qN6hVU5-K0rr10_neu04as_BCfestj96dUkt1QuNOazVfnl1qDAc=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCSKf1aw_jsY5stfgVBLlHUw",
                        "authorChannelId": {
                            "value": "UCSKf1aw_jsY5stfgVBLlHUw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 15,
                        "publishedAt": "2023-02-25T03:18:11Z",
                        "updatedAt": "2023-02-25T03:18:11Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "MPNPpsWkgaK54rvxyt_49DN-W94",
            "id": "UgyUoTYOizgHdZ5kJ6R4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "eDTDitfGS2TVoFGR_mtYjv0tFHM",
                    "id": "UgyUoTYOizgHdZ5kJ6R4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Normal watermelon in kentucky💀💀💀💀",
                        "textOriginal": "Normal watermelon in kentucky💀💀💀💀",
                        "authorDisplayName": "Toniro01",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/XxcEQQTjBujwX971kKmw3cQqu-8m_SEI9s8tkAeHcOr-dmXbRpzbh5tGfZZ3mdCtNjrsMtw69A=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCHb7AE1HisJ6ueIEDThHzVw",
                        "authorChannelId": {
                            "value": "UCHb7AE1HisJ6ueIEDThHzVw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1,
                        "publishedAt": "2023-03-01T18:51:45Z",
                        "updatedAt": "2023-03-01T18:51:45Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "CqlZwgAgnzrzCP8VBnJ_oczgt9Q",
            "id": "UgzSsBTOWxF7xNzAoNd4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "c37_CB8JvzFtQ8HWnyVV7WOgJOE",
                    "id": "UgzSsBTOWxF7xNzAoNd4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Watermelon in Ohio be like:",
                        "textOriginal": "Watermelon in Ohio be like:",
                        "authorDisplayName": "Jadan Pernell",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJXIaDHNnV-kPqVY7UCwkYkC28rZUepPu1IEwuuetWVykchEW-KqiTcRGc5nesVO=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC-tTKh5QJoPFMzs8J1SVOtA",
                        "authorChannelId": {
                            "value": "UC-tTKh5QJoPFMzs8J1SVOtA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-02T05:21:10Z",
                        "updatedAt": "2023-03-02T05:22:00Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "Ty2pUsiR1CKO78JNXA_qGZHdkZs",
            "id": "UgzOu9vZ2Z2CnAQmjwV4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "Y7ePlyIpDoS_zRXd1JJDXGmtcgg",
                    "id": "UgzOu9vZ2Z2CnAQmjwV4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "\"No, I will NOT hear you out.\"",
                        "textOriginal": "\"No, I will NOT hear you out.\"",
                        "authorDisplayName": "KarpL1keK0rn",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/IeDbjP8ymEhiOOTYKCE80alL4sFSlHhjV4QysF_L_Ec3mgDj7AKpFQmyoVIu7MJCXI9-xfWoiw=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCx5eFLTXcAZb0CdeF__pBXQ",
                        "authorChannelId": {
                            "value": "UCx5eFLTXcAZb0CdeF__pBXQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 5,
                        "publishedAt": "2023-02-25T01:28:22Z",
                        "updatedAt": "2023-02-25T01:28:22Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "Vyls7BwPKA1ba74hn7_DggBDVFE",
            "id": "UgwFmuaYa4z7ZJv3HKR4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "f5R3oZD4dLTezucbJI1HqCPKl8c",
                    "id": "UgwFmuaYa4z7ZJv3HKR4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I can barley smell, yet I can tell this smells like death incarnated",
                        "textOriginal": "I can barley smell, yet I can tell this smells like death incarnated",
                        "authorDisplayName": "TheOmegaSeal",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/o9B1lZt1mw6-4oApMbFClM37ubLg_rlLWmVx3qlpTxKDopKCeo7zcwc3VYbhWLHcWZSESzzdE0Q=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCW2mc0dWpDE6GiFAxCmZ6ww",
                        "authorChannelId": {
                            "value": "UCW2mc0dWpDE6GiFAxCmZ6ww"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-02T22:09:48Z",
                        "updatedAt": "2023-03-02T22:09:48Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "P2Lg8yWc8zy6Btu74jwyj2vh8AE",
            "id": "UgyD12wdSquV5b5fEh14AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "w_HS-Q58J7LGPKj3miRx3QHs2PU",
                    "id": "UgyD12wdSquV5b5fEh14AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Only once we had a rotten Watermelon. It was incredible sticky everywhere and the worst part: it got under the kirting board",
                        "textOriginal": "Only once we had a rotten Watermelon. It was incredible sticky everywhere and the worst part: it got under the kirting board",
                        "authorDisplayName": "Hummelbrumm",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/XHGv2wktNjHBhh-XOeNvVLpoFYGfycPpLmRpjZWRfQHa2adZ1INF7BcKdlZ8NChUqqXu9AOi=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCP9vHniEhXgoKTxtbsp_lsw",
                        "authorChannelId": {
                            "value": "UCP9vHniEhXgoKTxtbsp_lsw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 8,
                        "publishedAt": "2023-02-25T06:38:31Z",
                        "updatedAt": "2023-02-25T06:38:31Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "TP-_AEj6DkeBDSxAQezA9QEUcGM",
            "id": "UgznypOpDHEWdUu5Dud4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "pyC-zdkU01QMNzPGrTPoe9SuEZU",
                    "id": "UgznypOpDHEWdUu5Dud4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "And kids that's what happens when a pregnant woman's water breaks.",
                        "textOriginal": "And kids that's what happens when a pregnant woman's water breaks.",
                        "authorDisplayName": "jpablo",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/qi3mt34SyPY2SRJHUaDitXeGYuz1Q7J-u-Uouqr8-Col2p_chVjHSa4gT8aDg-GAD1dWvniD=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCYqIGinY3d-a3VY_dysM3IA",
                        "authorChannelId": {
                            "value": "UCYqIGinY3d-a3VY_dysM3IA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-01T12:49:55Z",
                        "updatedAt": "2023-03-01T12:49:55Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "T8m24Vn8zXKXuAFdtBmxyH0CeVI",
            "id": "Ugy3Kvmbkb7zJUJZyZR4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "OTQkgOby9xVbR7rmgzc3L_AEbMQ",
                    "id": "Ugy3Kvmbkb7zJUJZyZR4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "That one kid during every test",
                        "textOriginal": "That one kid during every test",
                        "authorDisplayName": "Park the car",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/GwgCgnmFyXFdsh5AOnxFhtQc1uhWgYud01pujY6nujsyw6aJ9R5FyONpxC2BgOWlQ6hcqJkd=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCnT1OIqCV742cDo9ImdWixA",
                        "authorChannelId": {
                            "value": "UCnT1OIqCV742cDo9ImdWixA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-02-28T04:37:21Z",
                        "updatedAt": "2023-02-28T04:37:21Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "4R2Hf4K4Tk7z2bxl_eSVLyhXtnw",
            "id": "UgwmlfT1DThdNao5eFJ4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "tHSMunsaIWfKOpQCTnchVAXzeqA",
                    "id": "UgwmlfT1DThdNao5eFJ4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Everyone getting angry at him, this isn't him in the video. He literally credits someone else in the description.",
                        "textOriginal": "Everyone getting angry at him, this isn't him in the video. He literally credits someone else in the description.",
                        "authorDisplayName": "Audrey Graham",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUMTb8IlkofH3mWw0j8yK5_V3vx_EBILdAwxfnZnBk=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCIPNJktteBBdXWmFbF4_jYQ",
                        "authorChannelId": {
                            "value": "UCIPNJktteBBdXWmFbF4_jYQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 4,
                        "publishedAt": "2023-02-26T19:14:01Z",
                        "updatedAt": "2023-02-26T19:14:01Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "3ycbWfpREEeM9U09y7ctkisdQdY",
            "id": "Ugy-jUMFW4zvpaP3h5Z4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "TEuTjg_wgsuJIsneWJIAUuey5sE",
                    "id": "Ugy-jUMFW4zvpaP3h5Z4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "That watermelon soil must have had some taco bell in it, because it has the runs",
                        "textOriginal": "That watermelon soil must have had some taco bell in it, because it has the runs",
                        "authorDisplayName": "[C]",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJXouicXL7fby_6O_5vK3ZEVJZfcjycG0HP4YJi5xg=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCEO3kcjHUht5qRePvzUGzvQ",
                        "authorChannelId": {
                            "value": "UCEO3kcjHUht5qRePvzUGzvQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-02-28T13:21:30Z",
                        "updatedAt": "2023-02-28T13:21:30Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "FXHWDS7jLRZlRgtdMLArFPTU3UM",
            "id": "UgwefzyKey5YkaCQJNB4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "ZhptcErRlD8pUptFVYQjX6M1WIA",
                    "id": "UgwefzyKey5YkaCQJNB4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "The color of the water tells you all you need to know about the smell lol\ndefinitely not the worst smell, but far from a pleasant one XD",
                        "textOriginal": "The color of the water tells you all you need to know about the smell lol\ndefinitely not the worst smell, but far from a pleasant one XD",
                        "authorDisplayName": "LilithTheLizard",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/OePxKgCDeP8l93M-dfcsQiIMm6IPoIreB-7yRxomzOHTdozoaM-ozdSs0DRtUXki1dVyGJW1kw=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCi94fSDmGOQyIzAQoYMG2zQ",
                        "authorChannelId": {
                            "value": "UCi94fSDmGOQyIzAQoYMG2zQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-02-27T23:07:57Z",
                        "updatedAt": "2023-02-27T23:07:57Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "HJdV4azqthpK-hTq6QbCBLtKEY8",
            "id": "Ugzyq9lhTJc3X19uAWl4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "ViLIewQ_1ib0LqDFN226P6oKQPI",
                    "id": "Ugzyq9lhTJc3X19uAWl4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "this is a gif on discord lol, I use it often.",
                        "textOriginal": "this is a gif on discord lol, I use it often.",
                        "authorDisplayName": "DenseMelon",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/j0jY6hpbOg3KiQPfk3tQmdyBhSvpP4LU4QPu7UNcDxEAFKpcz4xMiPmQWoWtPIPU-FY0ENpboQ=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC7K0_0vKHTjnEjLOuvVoS5Q",
                        "authorChannelId": {
                            "value": "UC7K0_0vKHTjnEjLOuvVoS5Q"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 19,
                        "publishedAt": "2023-02-24T22:23:09Z",
                        "updatedAt": "2023-02-24T22:23:09Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "_yVSQg4RE8RMXLnCbq9i71boF8Q",
            "id": "UgzX00ZqjcfBXz_tJ7p4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "ZGYrJhIPJRhfBbuu7dS9EfQWsIg",
                    "id": "UgzX00ZqjcfBXz_tJ7p4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Behold the *✨w  a t e r✨*",
                        "textOriginal": "Behold the *✨w  a t e r✨*",
                        "authorDisplayName": "serviceable guy",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/1e3Ko_JrhcpLGeAV7Y_Ktq_wKIFLaLmPKG9QR3lYHHd9Zowqutg9IrX9W3fbQO9XByN_X1b6SQ=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCtbfLpGHgLmtLR9aD8ajlhg",
                        "authorChannelId": {
                            "value": "UCtbfLpGHgLmtLR9aD8ajlhg"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-01T16:09:35Z",
                        "updatedAt": "2023-03-01T16:09:35Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "4eg6gfIiCeI0d6hJz8-qZmHnsl8",
            "id": "Ugyjafq4jXTkPb1z8oV4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "XtFOEVlZ15T3HBUF0o5L71uVmbs",
                    "id": "Ugyjafq4jXTkPb1z8oV4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "I was almost choking in disgust through the screen, really need a warning for that lol, that's just super rotten watermelon\n\n* Also, this might be an employee, I don't know if there's a way to get rid of it without it popping open",
                        "textOriginal": "I was almost choking in disgust through the screen, really need a warning for that lol, that's just super rotten watermelon\n\n* Also, this might be an employee, I don't know if there's a way to get rid of it without it popping open",
                        "authorDisplayName": "Literary Landslide",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/DS6GkoQecQ4Xpvhhie-QiixkKpGXWFQhIPXyO_DlG9xwIo16u34qKkW5gyXMPsGXRoCMOOSiqw=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCng9a0E7C02kzkQcKwO8h4Q",
                        "authorChannelId": {
                            "value": "UCng9a0E7C02kzkQcKwO8h4Q"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-01T11:10:47Z",
                        "updatedAt": "2023-03-01T11:14:56Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "-AWuma3jC_82RlpPg6Iqs6QlMO8",
            "id": "UgzOBMP1d3vr5EKKYxN4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "fh2GNGJuhDcYEO3Pov-WGrteZ88",
                    "id": "UgzOBMP1d3vr5EKKYxN4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Everything makes me think of her",
                        "textOriginal": "Everything makes me think of her",
                        "authorDisplayName": "Silian Frische",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUfDi2DGiUYtzVK53-PNr981JtHN2oO56IcNw=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCIFtkaI0EUJsPIoweskVC9Q",
                        "authorChannelId": {
                            "value": "UCIFtkaI0EUJsPIoweskVC9Q"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 19,
                        "publishedAt": "2023-02-24T22:23:12Z",
                        "updatedAt": "2023-02-24T22:23:12Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 3,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "PumtiYXmcYsESoKk4tpuLCSLgmA",
                        "id": "UgzOBMP1d3vr5EKKYxN4AaABAg.9mXSq_R-ftG9mioM3iCNr9",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "Thank god I'm not the only perv",
                            "textOriginal": "Thank god I'm not the only perv",
                            "parentId": "UgzOBMP1d3vr5EKKYxN4AaABAg",
                            "authorDisplayName": "Garli Cohen",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUdILzpLnw28pwoQmFP0CdvlXoan36t3QTD5mZkjvl1lfkVnuLtj2LiAa5SKAe8=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCcaCtA9PRYh7-4IU-UcwTmg",
                            "authorChannelId": {
                                "value": "UCcaCtA9PRYh7-4IU-UcwTmg"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-01T17:30:45Z",
                            "updatedAt": "2023-03-01T17:30:45Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "rrcLK3THFTwaN6ifpDGsAIGxxAA",
                        "id": "UgzOBMP1d3vr5EKKYxN4AaABAg.9mXSq_R-ftG9mi-6iptDrd",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "Underrated comment right there ^",
                            "textOriginal": "Underrated comment right there ^",
                            "parentId": "UgzOBMP1d3vr5EKKYxN4AaABAg",
                            "authorDisplayName": "Masao Kakihara",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJXGWFtumRp7bELGggAaFDixAKZL_DOEzIgVURIk=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCpupv39nQJJLcvG-J10wMbw",
                            "authorChannelId": {
                                "value": "UCpupv39nQJJLcvG-J10wMbw"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-01T09:54:16Z",
                            "updatedAt": "2023-03-01T09:54:16Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "ReQVohywl1faD9s2zFH7jc6EviI",
            "id": "UgyZ2CJCZhHRakxqgPl4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "ymIXgTYsQRdC9CaCKvhNqqIYzSQ",
                    "id": "UgyZ2CJCZhHRakxqgPl4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "When a kid spits out their orange juice because they thought there was a seed  or hair in it:",
                        "textOriginal": "When a kid spits out their orange juice because they thought there was a seed  or hair in it:",
                        "authorDisplayName": "Sylveon!",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/mB6SLJcdLqTH5SZ4v4fnrIItkaLCV0M9bXrVAPZRmfM543ZXbmQ9zY5u4EkmOP-KOmu9ttVRFQ=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCb_ZPKxv6owt480-wwBqFPQ",
                        "authorChannelId": {
                            "value": "UCb_ZPKxv6owt480-wwBqFPQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-03T03:42:05Z",
                        "updatedAt": "2023-03-03T03:42:05Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "BuNSz0l0fcCtjhKhoeRB--HpSLM",
            "id": "Ugw4SJAu4qj2MI_uLXl4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "U7fRC_xs8hygZjnlnFV7npNZaAo",
                    "id": "Ugw4SJAu4qj2MI_uLXl4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "my grandma telling me that this food isn't expired",
                        "textOriginal": "my grandma telling me that this food isn't expired",
                        "authorDisplayName": "Oreni",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/eM1bW-5ftHlrhJ1t_AgzvYal3zK_qXLtVDhEVwarRszWKS7-bzd5BLpjsL9i20uncSM2VWKCvw=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCh69hKCWCwtyKkNoJo7PPGA",
                        "authorChannelId": {
                            "value": "UCh69hKCWCwtyKkNoJo7PPGA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-02-28T20:32:11Z",
                        "updatedAt": "2023-02-28T20:32:11Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "F1HS2V2kUDO3KLDqsqC__qFtoVQ",
            "id": "UgwXJAyEEnWx0jTLt6J4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "Sz3Db0UG6NU0l5g_8DjU5gZr0uE",
                    "id": "UgwXJAyEEnWx0jTLt6J4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "guys, pray for my homie. hes having MAJOR diarrhea",
                        "textOriginal": "guys, pray for my homie. hes having MAJOR diarrhea",
                        "authorDisplayName": "itstipo",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/MmZtx4K1-IZllzgs3tJWAOlEB7ng5nPGo-r_wnc97YHdQhaktiZm8T5pc6o9yTq3ppuQB3OQ8g=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCAj4fifk5gmVTKwCkvTedbQ",
                        "authorChannelId": {
                            "value": "UCAj4fifk5gmVTKwCkvTedbQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 8,
                        "publishedAt": "2023-02-25T03:48:18Z",
                        "updatedAt": "2023-02-25T03:48:33Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "D4s-eDInCGnHON2qWPWqKwRZnT4",
            "id": "UgyKZo0kT07K9ztUSCV4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "PAxU7_Nbuc88E-eoFqY35ZgmVoI",
                    "id": "UgyKZo0kT07K9ztUSCV4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "A literal WATER melon",
                        "textOriginal": "A literal WATER melon",
                        "authorDisplayName": "Celeste Rodriguez",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJUE6KVeYQibtHjbn7Hz1D2oppARx8XXjbmDLAkD-sc=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCmthbs9EdQUzHQSsi87zhxg",
                        "authorChannelId": {
                            "value": "UCmthbs9EdQUzHQSsi87zhxg"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1,
                        "publishedAt": "2023-03-02T02:46:49Z",
                        "updatedAt": "2023-03-02T02:46:49Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "EOzL6ishvWHlxY8iMG9-U4LiiMI",
            "id": "Ugzkd3vhrUwYsgae_ZN4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "wCwRR-1KshbRmqNeAxjjHms9bSA",
                    "id": "Ugzkd3vhrUwYsgae_ZN4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Transplant be like:",
                        "textOriginal": "Transplant be like:",
                        "authorDisplayName": "Marshall bobby",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/UUf7jVQRtMPymEScFCVuLBRvn53xfc2nwop2yrrLAhD9IguQduQoftzB9NrxgEJCtRSPsef7Uw=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCKFbnuMjHUCdYYWVxJ663RA",
                        "authorChannelId": {
                            "value": "UCKFbnuMjHUCdYYWVxJ663RA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1,
                        "publishedAt": "2023-02-28T19:24:05Z",
                        "updatedAt": "2023-02-28T19:24:05Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "OW-17EV3cb-r4Kr6l98_kqYZaEs",
            "id": "UgwW_9uaqzs5Lqt_ujJ4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "k2E6Z_zOQ_-CrT3yCdc-ly9Cj-Y",
                    "id": "UgwW_9uaqzs5Lqt_ujJ4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "\"He lived up to his name\" 😭",
                        "textOriginal": "\"He lived up to his name\" 😭",
                        "authorDisplayName": "Light Ahead!",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/II25Qnh1Z7xjRwSymC3w0uII2r6CjY_A0UBy4yRTTfxAVBVwGs3GbNMDNvZfJaHR-38a5tDw=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC6UIsrwGnsucZclesi_nceA",
                        "authorChannelId": {
                            "value": "UC6UIsrwGnsucZclesi_nceA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 7,
                        "publishedAt": "2023-02-25T15:38:55Z",
                        "updatedAt": "2023-02-25T15:38:55Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "YJ3QxXPoO6UtW-iJJNSvqThwSEU",
            "id": "UgznJ3-LAxSKowbKu4R4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "W1TtyS0oqcMg0GucTBv0lzXuP2s",
                    "id": "UgznJ3-LAxSKowbKu4R4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "When you're poking at a pimple but didn't mean to...\n\n\n\nPop it, lock it, oop!",
                        "textOriginal": "When you're poking at a pimple but didn't mean to...\n\n\n\nPop it, lock it, oop!",
                        "authorDisplayName": "Pemy",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/jgh7gO1_f2CuAhbP8S0DM23UkXvXPL_66JVi5J3o2G8KrIZk4bGnYH7xCjM5LCdydiqOKMil=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCcMOH6c51waTddMVFDHfUHw",
                        "authorChannelId": {
                            "value": "UCcMOH6c51waTddMVFDHfUHw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-01T11:55:34Z",
                        "updatedAt": "2023-03-01T11:55:34Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "hRGrTNjPnnMGIlM6gTbwSY_qjWc",
            "id": "UgzMyNx7FZBgdHMKSkJ4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "-N1FiNIfA7zkqlFmiQE8_yWLhWU",
                    "id": "UgzMyNx7FZBgdHMKSkJ4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "You sir have officially won the jackass of the day award.",
                        "textOriginal": "You sir have officially won the jackass of the day award.",
                        "authorDisplayName": "Michael Lopez",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJU5deMrCdtR2v87zGdD_VfFoaU-ftVlYfPU7oCCsKgZpj5QK8MQw6PEseAgoZxU=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCzvuSn0_0-bPM4l_8kn9cxA",
                        "authorChannelId": {
                            "value": "UCzvuSn0_0-bPM4l_8kn9cxA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-02T03:18:05Z",
                        "updatedAt": "2023-03-02T03:18:05Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "1s-5Ui2thGenKekN7KzsCeeMNoo",
            "id": "UgzD5H5VaEQAl7EUK5J4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "5MK9zpSU4Uv1iqOeB1NxADvUexo",
                    "id": "UgzD5H5VaEQAl7EUK5J4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "In Japan we got square watermelon, this timr we have waterlessmelon.",
                        "textOriginal": "In Japan we got square watermelon, this timr we have waterlessmelon.",
                        "authorDisplayName": "Aang Dknight",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJURm8QeYGRrzkdLmQ13LRCQ3U9oW9J5eyr2AJ126Q=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCowEjyZi3JHt2W0rUDKmfoA",
                        "authorChannelId": {
                            "value": "UCowEjyZi3JHt2W0rUDKmfoA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 15,
                        "publishedAt": "2023-02-25T00:16:12Z",
                        "updatedAt": "2023-02-25T00:16:12Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 3,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "TOGxJwphBQe8Gcriu83m3QVyvAk",
                        "id": "UgzD5H5VaEQAl7EUK5J4AaABAg.9mXemH_S1PB9mlePgXrWcI",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "Its melon-less watermelon",
                            "textOriginal": "Its melon-less watermelon",
                            "parentId": "UgzD5H5VaEQAl7EUK5J4AaABAg",
                            "authorDisplayName": "mountain_hills",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJW49Yy6W6D9gOp35nidB4Kq6vveDkrPpg0KBgoavA=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCOxsZpWsiavzyKiZmZ_lj4w",
                            "authorChannelId": {
                                "value": "UCOxsZpWsiavzyKiZmZ_lj4w"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-02T20:01:35Z",
                            "updatedAt": "2023-03-02T20:01:35Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "A02RNWn6kCWOdlmTrXSwPGP4q1s",
                        "id": "UgzD5H5VaEQAl7EUK5J4AaABAg.9mXemH_S1PB9mi-XhdVleI",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "どこからきましたか？",
                            "textOriginal": "どこからきましたか？",
                            "parentId": "UgzD5H5VaEQAl7EUK5J4AaABAg",
                            "authorDisplayName": "Masao Kakihara",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJXGWFtumRp7bELGggAaFDixAKZL_DOEzIgVURIk=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UCpupv39nQJJLcvG-J10wMbw",
                            "authorChannelId": {
                                "value": "UCpupv39nQJJLcvG-J10wMbw"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-03-01T09:57:57Z",
                            "updatedAt": "2023-03-01T09:57:57Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "kOhKQve_Slxle-8DWXOG_zojdLw",
                        "id": "UgzD5H5VaEQAl7EUK5J4AaABAg.9mXemH_S1PB9magg1Czv5o",
                        "snippet": {
                            "videoId": "XYAe15w39LQ",
                            "textDisplay": "So it’s a dry melon, like a dry sponge or... I’m so 😐 all fruit has some moisture in it.",
                            "textOriginal": "So it’s a dry melon, like a dry sponge or... I’m so 😐 all fruit has some moisture in it.",
                            "parentId": "UgzD5H5VaEQAl7EUK5J4AaABAg",
                            "authorDisplayName": "Angela Bay-Jespersen",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJXsRu02Hjg6SVMRwkgbmWc19k325BmarJnYoA=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UC9FQI0oLumIBCX5q292HI0w",
                            "authorChannelId": {
                                "value": "UC9FQI0oLumIBCX5q292HI0w"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-02-26T13:49:47Z",
                            "updatedAt": "2023-02-26T13:49:47Z"
                        }
                    }
                ]
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "wovTuoo-MQo9Hzr35Cm8g8CNn2Q",
            "id": "UgxDZq2r9V0tRAp301F4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "ewjBHzZjaRiWRrEV7nt3rBtY9So",
                    "id": "UgxDZq2r9V0tRAp301F4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "Bro said \"if there's a hole\" 💀💀💀💀",
                        "textOriginal": "Bro said \"if there's a hole\" 💀💀💀💀",
                        "authorDisplayName": "Toaster Dio.",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/x5VmB1j_uZjHtmQPnC7Lk0Gjd4YZx87zskWs7Bmv2oVVEHaokJMxxu7MU6xGSCXzrL7gMqAsyg=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC2tTc6bbBMXsuxh3c2eZOFQ",
                        "authorChannelId": {
                            "value": "UC2tTc6bbBMXsuxh3c2eZOFQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-02T12:39:32Z",
                        "updatedAt": "2023-03-02T12:39:32Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "QTqZT8jYNXSR-MNIkG908U3UcQA",
            "id": "Ugzj-Bp1_QDX4p5vFjF4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "Q_juPsFpbIAJfBpSHPkU5TZUPdw",
                    "id": "Ugzj-Bp1_QDX4p5vFjF4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "That watermelon is like a night after eating spicy food.",
                        "textOriginal": "That watermelon is like a night after eating spicy food.",
                        "authorDisplayName": "DREW",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/d7mukDwbRmNPFnOC1RSCMsZlArwVK5iG5OCHKtBr-5qtmOoxcRUrfiEA7g4b5MPCWxFdBUf3=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCY2Hm7hnl45so6JfbQarE2A",
                        "authorChannelId": {
                            "value": "UCY2Hm7hnl45so6JfbQarE2A"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-02-28T08:32:49Z",
                        "updatedAt": "2023-02-28T08:32:49Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "PmoCgNDSH_u4aPuQpT3nLd2EHMk",
            "id": "UgxR0ho7ttrE9Tk_-Hp4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "LdJhZkowypKidwLA7NaLHPw7y_I",
                    "id": "UgxR0ho7ttrE9Tk_-Hp4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "We used to sell watermelons and this happens when they are rotten.",
                        "textOriginal": "We used to sell watermelons and this happens when they are rotten.",
                        "authorDisplayName": "William Borja",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/9LnEdpREbzAOm7yBtFsj5XypAw3mopFPmwgsKslTqcSynyOnF2P3j-ALo-IlPftDRiyhcAStYg=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCrwN54Ct8i6_SH67IzwQPDQ",
                        "authorChannelId": {
                            "value": "UCrwN54Ct8i6_SH67IzwQPDQ"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 11,
                        "publishedAt": "2023-02-25T01:05:33Z",
                        "updatedAt": "2023-02-25T01:05:33Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "oNu4S_2VPFTQCEWUKglFsF7_KBo",
            "id": "UgxeHbtGiOnCBSUZrvZ4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "xBV4jf-f0aJhlVinh8jOQIoqssY",
                    "id": "UgxeHbtGiOnCBSUZrvZ4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "The moan he makes right before it breaks makes me feel weird lol",
                        "textOriginal": "The moan he makes right before it breaks makes me feel weird lol",
                        "authorDisplayName": "Syphex",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJVbV5BioeosNxiHefEMdYc8pMByZrS5kD95qMFv=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCId_MJgiNNIsKrjDFphvXjw",
                        "authorChannelId": {
                            "value": "UCId_MJgiNNIsKrjDFphvXjw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-03-02T17:52:47Z",
                        "updatedAt": "2023-03-02T17:52:47Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "Zi3YoFGmnj9bWMII6kXik9COWxQ",
            "id": "UgwsNt3o3x61rp2Wz3d4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "fFB_kbhrnwZ4NqAmT1JibgWBw2w",
                    "id": "UgwsNt3o3x61rp2Wz3d4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "“Ay you gotta pay for that mAn 🙄”",
                        "textOriginal": "“Ay you gotta pay for that mAn 🙄”",
                        "authorDisplayName": "Duck Wu",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJWx7BT8OXvQBz-Hd8BfvXH-6dSWu4n0YITl4oB3_7f0zaNxO4OinDjDqNmNloLZ=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC6ble5mdTKjRNpTklxPlDhg",
                        "authorChannelId": {
                            "value": "UC6ble5mdTKjRNpTklxPlDhg"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 1,
                        "publishedAt": "2023-03-01T23:43:36Z",
                        "updatedAt": "2023-03-01T23:43:36Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        },
        {
            "kind": "youtube#commentThread",
            "etag": "eH_fWYmo3U7zbBXWeuemwQcygEs",
            "id": "UgyIZ54muMDA9xU4n1J4AaABAg",
            "snippet": {
                "videoId": "XYAe15w39LQ",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "hCdgvQKxfyGt7Cn3vEvttgRZBB0",
                    "id": "UgyIZ54muMDA9xU4n1J4AaABAg",
                    "snippet": {
                        "videoId": "XYAe15w39LQ",
                        "textDisplay": "And this is where sugar baby melons come from",
                        "textOriginal": "And this is where sugar baby melons come from",
                        "authorDisplayName": "JDA 88",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/AL5GRJXFtN8c4cnSWvvCUZz5OEg9N9Z3RPGuuSfZQg=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UCg6YrmC6RmtcVq6IZxIAiGw",
                        "authorChannelId": {
                            "value": "UCg6YrmC6RmtcVq6IZxIAiGw"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 7,
                        "publishedAt": "2023-02-24T23:10:23Z",
                        "updatedAt": "2023-02-24T23:10:23Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 0,
                "isPublic": true
            }
        }
    ]
}
  end
end

private

def playlist_params
  params.permit(:id, :video_id, :search, :channel_id)
end
