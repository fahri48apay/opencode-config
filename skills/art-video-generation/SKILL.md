---
name: art-video-generation
description: Video generation using Luma, Kling, Sora, Veo, and more. Use when user wants to create videos, animations, motion graphics, or any video content. Supports text-to-video, image-to-video, and video editing via AceDataCloud API.
---

# Art: Video Generation

## When to Use
- User asks to create/generate a video
- User needs animations or motion graphics
- User mentions Luma, Kling, Sora, Veo, or video generation
- User wants Instagram Reels, TikTok, or YouTube Shorts

## Available Models

### Luma Dream Machine
- **Best for**: General purpose, smooth motion
- **Duration**: 5 seconds
- **Resolution**: 1280x720, 720x1280
- **Prompt style**: Natural language, cinematic

### Kling (Kuaishou)
- **Best for**: Motion control, cinematic
- **Duration**: 5-10 seconds
- **Resolution**: 1280x720, 720x1280
- **Prompt style**: Detailed scene description

### Sora (OpenAI)
- **Best for**: High quality, complex scenes
- **Duration**: Up to 20 seconds
- **Resolution**: 1920x1080
- **Prompt style**: Detailed, natural language

### Veo (Google)
- **Best for**: Audio sync, photorealistic
- **Duration**: Up to 8 seconds
- **Resolution**: 1280x720, 720x1280
- **Prompt style**: Scene + audio description

### Seedance (ByteDance)
- **Best for**: Dance, stylized motion
- **Duration**: 5 seconds
- **Resolution**: 1280x720, 720x1280
- **Prompt style**: Motion-focused

### Hailuo MiniMax
- **Best for**: Fast generation
- **Duration**: 5 seconds
- **Resolution**: 1280x720
- **Prompt style**: Simple, direct

### Pika
- **Best for**: Creative, experimental
- **Duration**: 3-5 seconds
- **Resolution**: 1280x720
- **Prompt style**: Creative, artistic

### Wan (Alibaba)
- **Best for**: Open source, customizable
- **Duration**: 5 seconds
- **Resolution**: 1280x720
- **Prompt style**: Technical

## API Usage

### Base URL
```
https://api.acedata.cloud/v1
```

### Endpoints
- `POST /videos/generations` - Text to video
- `POST /videos/image-to-video` - Image to video
- `GET /videos/status/{id}` - Check generation status

### Example Request
```json
{
  "model": "luma-dream-machine",
  "prompt": "Smooth tracking shot of a student studying in a modern library, warm lighting, cinematic",
  "duration": 5,
  "resolution": "1280x720"
}
```

## Prompt Engineering

### Structure
```
[Camera Movement] + [Subject] + [Action] + [Environment] + [Lighting] + [Style]
```

### Camera Movements
- `tracking shot` - Camera follows subject
- `pan shot` - Camera rotates horizontally
- `tilt shot` - Camera rotates vertically
- `dolly shot` - Camera moves toward/away
- `aerial shot` - Bird's eye view
- `handheld` - Natural, slightly shaky
- `static` - Camera doesn't move

### Best Practices
1. Start with camera movement
2. Be specific about subject and action
3. Describe environment clearly
4. Specify lighting and time of day
5. Add style keywords

### Example Prompts

**Cinematic (Luma)**:
```
Slow dolly shot approaching a young Indonesian student studying at a 
modern university library, golden hour sunlight streaming through 
large windows, cinematic depth of field, 5 seconds
```

**Motion Control (Kling)**:
```
Smooth tracking shot following a student walking through a futuristic 
campus, holographic displays floating in the air, neon accents, 
cyberpunk aesthetic, 8 seconds
```

**High Quality (Sora)**:
```
Cinematic establishing shot of a modern Indonesian tech campus at sunset, 
students walking between buildings, warm golden lighting reflecting off 
glass facades, drone slowly ascending to reveal the full campus, 
photorealistic, 4K quality, 15 seconds
```

## Post-Processing with FFmpeg

### Basic Operations
```bash
# Cut video (start at 10s, duration 5s)
ffmpeg -i input.mp4 -ss 10 -t 5 -c copy output.mp4

# Merge videos
ffmpeg -f concat -safe 0 -i list.txt -c copy output.mp4

# Convert format
ffmpeg -i input.mp4 -c:v libx264 -c:a aac output.webm

# Add audio
ffmpeg -i video.mp4 -i audio.mp3 -c:v copy -c:a aac output.mp4
```

### Advanced Operations
```bash
# Resize to 1080p
ffmpeg -i input.mp4 -vf "scale=1920:1080" -c:a copy output.mp4

# Add text overlay
ffmpeg -i input.mp4 -vf "drawtext=text='Hello':fontsize=24:x=10:y=10" output.mp4

# Create GIF from video
ffmpeg -i input.mp4 -vf "fps=15,scale=480:-1" output.gif

# Speed up video (2x)
ffmpeg -i input.mp4 -filter:v "setpts=0.5*PTS" -filter:a "atempo=2.0" output.mp4
```

### Beat-Synced Editing
```bash
# Detect beats in audio
ffmpeg -i audio.mp3 -af "silencedetect=n=-30dB:d=0.5" -f null -

# Cut on beats (manual)
ffmpeg -i video.mp4 -ss 0 -t 2 -c copy clip1.mp4
ffmpeg -i video.mp4 -ss 2 -t 2 -c copy clip2.mp4
```

## Penpot Integration

### Export to Penpot
```bash
# Export video frames for design
ffmpeg -i video.mp4 -vf "fps=1" frame_%04d.png

# Import to Penpot via MCP
penpot_import_image frame_0001.png <page_id> <board_id>
```

## Platform-Specific Formats

### Instagram Reels (9:16)
```bash
ffmpeg -i input.mp4 -vf "crop=ih*9/16:ih" -c:v libx264 -c:a aac reel.mp4
```

### TikTok (9:16)
```bash
ffmpeg -i input.mp4 -vf "scale=1080:1920:force_original_aspect_ratio=decrease,pad=1080:1920:(ow-iw)/2:(oh-ih)/2" tiktok.mp4
```

### YouTube Shorts (9:16)
```bash
ffmpeg -i input.mp4 -vf "scale=1080:1920:force_original_aspect_ratio=decrease,pad=1080:1920:(ow-iw)/2:(oh-ih)/2" youtube_short.mp4
```
