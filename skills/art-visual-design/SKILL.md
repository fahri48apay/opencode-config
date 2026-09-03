---
name: art-visual-design
description: Visual design for posters, banners, thumbnails, and graphics. Use when user wants to create design assets, posters, social media graphics, or any visual content. Combines image generation with design principles and platform specifications.
---

# Art: Visual Design

## When to Use
- User asks to create a poster, banner, or thumbnail
- User needs social media graphics
- User wants design assets for DigitalWise
- User mentions graphic design or visual assets

## Design Workflow

1. **Understand requirements** - Platform, size, style, message
2. **Choose approach** - Generate new vs edit existing
3. **Select model** - Based on style requirements
4. **Generate base image** - Using image generation
5. **Apply design principles** - Typography, layout, color
6. **Post-process** - Resize, optimize, export
7. **Export to Penpot** - If needed for design system

## Platform Specifications

### Instagram
| Type | Size | Aspect Ratio |
|------|------|--------------|
| Post (Square) | 1080x1080 | 1:1 |
| Post (Portrait) | 1080x1350 | 4:5 |
| Story/Reel | 1080x1920 | 9:16 |
| Carousel | 1080x1080 | 1:1 |

### Facebook
| Type | Size | Aspect Ratio |
|------|------|--------------|
| Post | 1200x630 | 1.91:1 |
| Story | 1080x1920 | 9:16 |
| Cover | 820x312 | 2.63:1 |

### Twitter/X
| Type | Size | Aspect Ratio |
|------|------|--------------|
| Post | 1200x675 | 16:9 |
| Header | 1500x500 | 3:1 |

### YouTube
| Type | Size | Aspect Ratio |
|------|------|--------------|
| Thumbnail | 1280x720 | 16:9 |
| Banner | 2560x1440 | 16:9 |
| Shorts | 1080x1920 | 9:16 |

## Design Principles

### Color Palette (DigitalWise)
```css
--primary: #4A90E2;      /* Blue */
--secondary: #50E3C2;    /* Teal */
--accent: #F5A623;       /* Orange */
--dark: #1A1A2E;         /* Dark Navy */
--light: #FFFFFF;        /* White */
```

### Typography
```css
--font-heading: 'Inter', sans-serif;
--font-body: 'Inter', sans-serif;
--font-mono: 'JetBrains Mono', monospace;
```

### Layout Grid
```
Margin: 20px
Padding: 16px
Column gutter: 16px
Row gutter: 8px
```

## Templates

### Poster Template
```
┌─────────────────────────┐
│      HEADER (20%)       │
│    [Title / Headline]   │
├─────────────────────────┤
│                         │
│      MAIN IMAGE (60%)   │
│    [Generated Image]    │
│                         │
├─────────────────────────┤
│      FOOTER (20%)       │
│   [CTA / Logo / Info]   │
└─────────────────────────┘
```

### Social Media Post
```
┌─────────────────────┐
│                     │
│   [Image/Graphic]   │
│                     │
├─────────────────────┤
│ [Text Overlay/CTA]  │
└─────────────────────┘
```

## ImageMagick Commands

### Resize for Platform
```bash
# Instagram Square
convert input.png -resize 1080x1080 -gravity center -extent 1080x1080 instagram_square.png

# Instagram Portrait
convert input.png -resize 1080x1350 -gravity center -extent 1080x1350 instagram_portrait.png

# YouTube Thumbnail
convert input.png -resize 1280x720 -gravity center -extent 1280x720 youtube_thumbnail.png
```

### Add Background
```bash
# Solid color background
convert -size 1080x1080 xc:#4A90E2 -gravity center input.png -composite output.png

# Gradient background
convert -size 1080x1080 gradient:#4A90E2-#50E3C2 -gravity center input.png -composite output.png
```

### Add Text Overlay
```bash
convert input.png \
  -gravity south \
  -fill white \
  -font "Inter-Bold" \
  -pointsize 48 \
  -annotate +0+100 "Your Text Here" \
  output.png
```

## Canvas API (Node.js)

### Create Composite Image
```javascript
const { createCanvas, loadImage } = require('canvas');

async function createPost(imagePath, text, outputPath) {
  const canvas = createCanvas(1080, 1080);
  const ctx = canvas.getContext('2d');
  
  // Background
  ctx.fillStyle = '#4A90E2';
  ctx.fillRect(0, 0, 1080, 1080);
  
  // Image
  const img = await loadImage(imagePath);
  ctx.drawImage(img, 40, 40, 1000, 700);
  
  // Text
  ctx.fillStyle = '#FFFFFF';
  ctx.font = 'bold 64px Inter';
  ctx.textAlign = 'center';
  ctx.fillText(text, 540, 900);
  
  // Save
  const fs = require('fs');
  const buffer = canvas.toBuffer('image/png');
  fs.writeFileSync(outputPath, buffer);
}
```

## Penpot Integration

### Export Design
```bash
# Via Penpot MCP
penpot_export_shape <shape_id> png
```

### Import to Penpot
```bash
# Import generated design
penpot_import_image <file_path> <page_id> <board_id>
```

### Maintain Design System
- Use colors from `tokens.css`
- Apply brand fonts
- Follow DigitalWise style guide
