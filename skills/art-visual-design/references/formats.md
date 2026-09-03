# Platform Formats Reference Guide

## Instagram

### Feed Post
| Type | Size | Aspect Ratio | Notes |
|------|------|--------------|-------|
| Square | 1080x1080 | 1:1 | Safe default |
| Portrait | 1080x1350 | 4:5 | More screen real estate |
| Landscape | 1080x566 | 1.91:1 | Less engagement |

### Stories/Reels
| Type | Size | Aspect Ratio | Duration |
|------|------|--------------|----------|
| Story | 1080x1920 | 9:16 | 15s max |
| Reel | 1080x1920 | 9:16 | 15-90s |

### Carousel
- Up to 10 slides
- 1080x1080 (1:1) or 1080x1350 (4:5)
- First slide is most important

### Best Practices
- Use high-contrast images
- Text should be large and readable
- Keep important content centered (safe zone)
- Avoid bottom 250px (UI overlay)

## TikTok

### Video
| Type | Size | Aspect Ratio | Duration |
|------|------|--------------|----------|
| Standard | 1080x1920 | 9:16 | 15s-10min |
| Photo | 1080x1920 | 9:16 | N/A |

### Best Practices
- Hook in first 3 seconds
- Use trending sounds
- Keep text in safe zone
- Avoid top 150px and bottom 270px

## YouTube

### Shorts
| Type | Size | Aspect Ratio | Duration |
|------|------|--------------|----------|
| Short | 1080x1920 | 9:16 | ≤60s |

### Regular Videos
| Type | Size | Aspect Ratio | Notes |
|------|------|--------------|-------|
| Standard | 1920x1080 | 16:9 | Minimum recommended |
| 4K | 3840x2160 | 16:9 | Higher quality |

### Thumbnail
| Type | Size | Aspect Ratio |
|------|------|--------------|
| Thumbnail | 1280x720 | 16:9 |

### Best Practices
- Thumbnail should be eye-catching
- Use bright colors and clear text
- Face close-ups work well
- Avoid cluttered designs

## Twitter/X

### Post Image
| Type | Size | Aspect Ratio |
|------|------|--------------|
| Single | 1600x900 | 16:9 |
| Multiple | 1600x900 | 16:9 |

### Header
| Type | Size | Aspect Ratio |
|------|------|--------------|
| Header | 1500x500 | 3:1 |

### Best Practices
- Images should be high contrast
- Text should be readable at small sizes
- Avoid thin borders

## Facebook

### Feed Post
| Type | Size | Aspect Ratio |
|------|------|--------------|
| Shared Image | 1200x630 | 1.91:1 |
| Link Image | 1200x630 | 1.91:1 |

### Stories
| Type | Size | Aspect Ratio |
|------|------|--------------|
| Story | 1080x1920 | 9:16 |

### Cover
| Type | Size | Aspect Ratio |
|------|------|--------------|
| Profile Cover | 820x312 | 2.63:1 |
| Page Cover | 820x312 | 2.63:1 |

### Best Practices
- Avoid too much text (20% rule)
- Use bright, vibrant colors
- Face close-ups get more engagement

## LinkedIn

### Post Image
| Type | Size | Aspect Ratio |
|------|------|--------------|
| Square | 1080x1080 | 1:1 |
| Landscape | 1200x628 | 1.91:1 |

### Banner
| Type | Size | Aspect Ratio |
|------|------|--------------|
| Profile Banner | 1584x396 | 4:1 |

### Best Practices
- Professional tone
- Clean, minimal designs
- Avoid overly casual content

## Pinterest

### Pin
| Type | Size | Aspect Ratio |
|------|------|--------------|
| Standard | 1000x1500 | 2:3 |
| Square | 1000x1000 | 1:1 |

### Best Practices
- Vertical images perform best
- Use text overlays
- High-quality, aspirational imagery

## Discord

### Avatar
| Type | Size | Aspect Ratio |
|------|------|--------------|
| Avatar | 512x512 | 1:1 |

### Banner
| Type | Size | Aspect Ratio |
|------|------|--------------|
| Profile Banner | 800x200 | 4:1 |

### Server Icon
| Type | Size | Aspect Ratio |
|------|------|--------------|
| Server Icon | 512x512 | 1:1 |

## Cross-Platform Tips

### Safe Zones
Always keep important content (text, faces) in the center:
- **Instagram**: Avoid bottom 250px
- **TikTok**: Avoid top 150px, bottom 270px
- **YouTube**: Standard safe zones

### Text Size
- Minimum 24pt for mobile viewing
- Large, bold fonts work best
- High contrast with background

### Color
- Bright colors get more attention
- Avoid low contrast
- Test on different screens

### File Formats
- **Images**: PNG (quality), JPEG (size)
- **Video**: MP4 (H.264) for most platforms
- **GIF**: For short animations

## FFmpeg Commands

### Resize for Instagram Square
```bash
ffmpeg -i input.mp4 -vf "crop=min(iw\,ih):min(iw\,ih),scale=1080:1080" output.mp4
```

### Resize for TikTok/Reels (9:16)
```bash
ffmpeg -i input.mp4 -vf "crop=ih*9/16:ih,scale=1080:1920" output.mp4
```

### Resize for YouTube (16:9)
```bash
ffmpeg -i input.mp4 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" output.mp4
```

### Add Safe Zone Guide
```bash
ffmpeg -i input.mp4 -vf "drawbox=x=0:y=0:w=iw:h=ih:color=red@0.3:t=fill,drawbox=x=0:y=270:w=iw:h=ih-540:color=red@0.3:t=fill" output.mp4
```
