---
name: art-social-media
description: Social media content creation for Instagram, TikTok, YouTube, and more. Use when user wants to create content for social platforms, including videos, posts, stories, and reels. Handles platform-specific formatting, trending styles, and viral content strategies.
---

# Art: Social Media Content

## When to Use
- User asks to create Instagram Reels, TikTok, or YouTube Shorts
- User needs social media content or viral videos
- User mentions trending content or social media strategy
- User wants platform-specific formatting

## Platform Formats

### Instagram
| Format | Duration | Aspect Ratio | Resolution |
|--------|----------|--------------|------------|
| Reel | 15-90s | 9:16 | 1080x1920 |
| Story | 15s | 9:16 | 1080x1920 |
| Post | N/A | 1:1 or 4:5 | 1080x1080 / 1080x1350 |
| Carousel | N/A | 1:1 | 1080x1080 |

### TikTok
| Format | Duration | Aspect Ratio | Resolution |
|--------|----------|--------------|------------|
| Video | 15s-10min | 9:16 | 1080x1920 |
| Photo | N/A | 9:16 | 1080x1920 |

### YouTube
| Format | Duration | Aspect Ratio | Resolution |
|--------|----------|--------------|------------|
| Short | ≤60s | 9:16 | 1080x1920 |
| Video | Any | 16:9 | 1920x1080 |
| Thumbnail | N/A | 16:9 | 1280x720 |

## Content Creation Workflow

### 1. Strategy
- Define target platform
- Identify trending format
- Set duration and style
- Plan hooks and CTA

### 2. Script/Storyboard
```
Hook (0-3s) → Content (3-80%) → CTA (final 20%)
```

### 3. Asset Generation
- Generate images/illustrations
- Create video clips
- Add text overlays
- Include music/sound

### 4. Editing
- Cut on beats
- Add transitions
- Apply effects
- Sync audio

### 5. Export
- Platform-specific format
- Optimize file size
- Add captions/subtitles
- Include hashtags

## Video Generation for Social Media

### Quick Reel (15s)
```
Model: Luma Dream Machine
Prompt: [Hook scene] + [Main content] + [CTA]
Duration: 15s
Resolution: 1080x1920 (9:16)
```

### TikTok Trend
```
Model: Kling or Seedance
Prompt: [Trending concept] + [Unique twist]
Duration: 15s
Resolution: 1080x1920 (9:16)
```

### YouTube Short
```
Model: Luma or Sora
Prompt: [Educational content] + [Visual demonstration]
Duration: 30-60s
Resolution: 1080x1920 (9:16)
```

## FFmpeg for Social Media

### Convert to 9:16
```bash
ffmpeg -i input.mp4 \
  -vf "crop=ih*9/16:ih,scale=1080:1920" \
  -c:v libx264 -c:a aac \
  output_vertical.mp4
```

### Add Text Overlay
```bash
ffmpeg -i input.mp4 \
  -vf "drawtext=text='Your Text':fontsize=48:fontcolor=white:x=(w-text_w)/2:y=100:enable='between(t,0,5)'" \
  output_with_text.mp4
```

### Create GIF Preview
```bash
ffmpeg -i input.mp4 \
  -vf "fps=15,scale=480:-1,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
  preview.gif
```

### Add Music
```bash
ffmpeg -i video.mp4 -i music.mp3 \
  -c:v copy -c:a aac -shortest \
  output_with_music.mp4
```

## Trending Styles (2026)

### Visual Trends
- **Kinetic Typography** - Moving text
- **Split Screen** - Before/after, comparisons
- **Zoom Transitions** - Quick zoom in/out
- **Color Grading** - Cinematic look
- **Glitch Effects** - Retro/digital feel

### Content Trends
- **Micro-Tutorials** - Quick how-to
- **Behind the Scenes** - Authentic content
- **User-Generated Style** - Raw, authentic
- **AI-Generated Art** - Unique visuals
- **Nostalgia** - Retro aesthetics

## Hashtag Strategy

### General
```
#DigitalWise #TechEducation #Learning
```

### Platform-Specific
```
Instagram: #Reels #Explore #Tutorial #TechTips
TikTok: #FYP #LearnOnTikTok #TechTok #Viral
YouTube: #Shorts #Tutorial #Education #Tech
```

## Penpot Integration

### Export Social Media Assets
```bash
# Generate and export to Penpot
penpot_import_image <generated_image> <page_id> <board_id>
```

### Design System
- Maintain brand consistency
- Use DigitalWise colors
- Apply brand fonts
