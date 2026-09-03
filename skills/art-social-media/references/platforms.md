# Social Media Platforms Reference Guide

## Platform Overview

### Instagram
- **Primary Content**: Photos, Reels, Stories
- **Audience**: 18-34, visual-focused
- **Best For**: Lifestyle, fashion, food, travel, business
- **Algorithm**: Engagement, relevance, timeliness

### TikTok
- **Primary Content**: Short-form video
- **Audience**: 16-30, trend-driven
- **Best For**: Entertainment, education, trends
- **Algorithm**: Watch time, engagement, shares

### YouTube
- **Primary Content**: Long-form video, Shorts
- **Audience**: All ages, search-driven
- **Best For**: Education, tutorials, entertainment
- **Algorithm**: Watch time, CTR, engagement

### Twitter/X
- **Primary Content**: Text, images, short video
- **Audience**: 25-45, news-focused
- **Best For**: Tech, news, opinions, business
- **Algorithm**: Engagement, relevance

### Facebook
- **Primary Content**: Mixed media
- **Audience**: 25-55, community-focused
- **Best For**: Local business, community, news
- **Algorithm**: Engagement, meaningful interactions

## Content Strategies

### Instagram Strategy
1. **Feed Aesthetic**: Maintain consistent visual style
2. **Reels**: Short, engaging, trending audio
3. **Stories**: Behind-the-scenes, polls, Q&A
4. **Carousel**: Educational, step-by-step content

### TikTok Strategy
1. **Hook**: First 3 seconds crucial
2. **Trends**: Use trending sounds/format
3. **Authenticity**: Raw, unpolished works
4. **Duets/Stitches**: Engage with community

### YouTube Strategy
1. **Thumbnail**: Eye-catching, clear text
2. **Title**: Keyword-rich, compelling
3. **Watch Time**: Keep viewers engaged
4. **Consistency**: Regular upload schedule

### Twitter/X Strategy
1. **Thread**: Break down complex topics
2. **Visuals**: Images get more engagement
3. **Timing**: Post during peak hours
4. **Engagement**: Reply, retweet, interact

## Hashtag Strategies

### Instagram
```
#DigitalWise #TechEducation #Learning #Reels 
#Explore #Tutorial #TechTips #Indonesia
```

### TikTok
```
#FYP #LearnOnTikTok #TechTok #Viral 
#DigitalWise #Education #Tutorial
```

### YouTube
```
#Shorts #Tutorial #Education #Tech 
#DigitalWise #Learning #HowTo
```

### Twitter/X
```
#Tech #Education #DigitalWise #Tutorial
```

## Posting Times

### General Best Times
- **Morning**: 7-9 AM (commute)
- **Lunch**: 12-2 PM (break)
- **Evening**: 6-9 PM (relax)
- **Weekend**: 10 AM - 2 PM

### Platform-Specific
- **Instagram**: 11 AM - 1 PM, 7 PM - 9 PM
- **TikTok**: 7 AM - 9 AM, 12 PM - 3 PM, 7 PM - 11 PM
- **YouTube**: 2 PM - 4 PM, 8 PM - 11 PM
- **Twitter/X**: 8 AM - 10 AM, 12 PM - 1 PM, 6 PM - 9 PM

## Content Calendar

### Weekly Schedule
| Day | Platform | Content Type |
|-----|----------|--------------|
| Monday | Instagram | Reel + Story |
| Tuesday | TikTok | Trending video |
| Wednesday | YouTube | Tutorial/Short |
| Thursday | Twitter/X | Thread |
| Friday | Instagram | Carousel |
| Saturday | TikTok | Behind-scenes |
| Sunday | YouTube | Long-form |

### Content Mix
- **40% Educational**: Tips, tutorials, how-to
- **30% Entertaining**: Trends, fun, engaging
- **20% Promotional**: Products, services
- **10% Personal**: Behind-the-scenes, team

## Engagement Tactics

### Comments
- Reply to all comments
- Ask questions to encourage discussion
- Use heart reactions

### DMs
- Respond quickly
- Personalize messages
- Build relationships

### Collaborations
- Partner with creators
- Cross-promote content
- Joint live sessions

## Analytics Metrics

### Instagram
- Reach
- Impressions
- Engagement Rate
- Saves
- Shares

### TikTok
- Views
- Watch Time
- Shares
- Comments
- Likes

### YouTube
- Watch Time
- CTR (Click-Through Rate)
- Average View Duration
- Subscribers gained
- Revenue (if monetized)

### Twitter/X
- Impressions
- Engagement Rate
- Retweets
- Link Clicks
- Profile Visits

## FFmpeg for Social Media

### Batch Convert for Platform
```bash
# Convert all videos to Instagram Reel format
for f in *.mp4; do
  ffmpeg -i "$f" -vf "crop=ih*9/16:ih,scale=1080:1920" "reel_${f}"
done
```

### Add Captions
```bash
ffmpeg -i input.mp4 -vf "subtitles=subs.srt:force_style='FontSize=24'" output.mp4
```

### Create Preview GIF
```bash
ffmpeg -i input.mp4 -vf "fps=10,scale=480:-1,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" preview.gif
```

## Tools and Resources

### Design
- **Canva**: Templates, easy design
- **Figma**: Professional design
- **Adobe Creative Suite**: Advanced editing

### Video Editing
- **CapCut**: Free, TikTok integration
- **Premiere Pro**: Professional
- **DaVinci Resolve**: Free, powerful

### Analytics
- **Instagram Insights**: Native analytics
- **TikTok Analytics**: Native analytics
- **YouTube Studio**: Native analytics
- **Hootsuite**: Cross-platform

### Scheduling
- **Buffer**: Multi-platform
- **Later**: Visual planning
- **Hootsuite**: Enterprise
