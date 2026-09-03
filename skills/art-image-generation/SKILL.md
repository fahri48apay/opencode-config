---
name: art-image-generation
description: Image generation using FLUX, Stable Diffusion, and Seedream. Use when user wants to create images, illustrations, photos, posters, or any visual content. Supports text-to-image, image-to-image, inpainting, and upscaling via AceDataCloud API.
---

# Art: Image Generation

## When to Use
- User asks to create/generate/draw an image
- User needs illustrations, photos, or graphics
- User wants to edit existing images (inpainting, img2img)
- User mentions FLUX, Stable Diffusion, SDXL, or Seedream

## Available Models

### FLUX.1 (Black Forest Labs)
- **Best for**: Photorealism, text in images, high detail
- **Variants**: FLUX.1 [pro], FLUX.1 [dev], FLUX.1 [schnell]
- **Prompt style**: Detailed, natural language
- **Resolution**: 1024x1024, 1024x768, 768x1024

### Stable Diffusion XL (Stability AI)
- **Best for**: Artistic, stylized, creative
- **Prompt style**: Tags + description
- **Resolution**: 1024x1024

### Stable Diffusion 3.5 Large
- **Best for**: Versatile, balanced quality/speed
- **Prompt style**: Natural language
- **Resolution**: 1024x1024

### Seedream (ByteDance)
- **Best for**: Anime, illustration, stylized
- **Prompt style**: Tags + description
- **Resolution**: 1024x1024

## API Usage

### Base URL
```
https://api.acedata.cloud/v1
```

### Endpoints
- `POST /images/generations` - Text to image
- `POST /images/edits` - Image editing/inpainting
- `POST /images/variations` - Image variations

### Authentication
```bash
Header: Authorization: Bearer $ACEDATA_API_KEY
```

### Example Request
```json
{
  "model": "flux-1-schnell",
  "prompt": "A beautiful sunset over Jakarta skyline, golden hour, cinematic",
  "n": 1,
  "size": "1024x1024"
}
```

## Prompt Engineering

### Structure
```
[Subject] + [Action/Pose] + [Environment] + [Lighting] + [Style] + [Quality]
```

### Best Practices
1. Be specific about what you want
2. Use natural language for FLUX
3. Use tags for SDXL/Seedream
4. Specify lighting and mood
5. Add quality keywords (4K, detailed, professional)

### Example Prompts

**Photorealism (FLUX)**:
```
Professional headshot of an Indonesian woman in her 20s, confident smile, 
modern office background, soft studio lighting, Canon EOS R5, 85mm lens, 
shallow depth of field, 4K quality
```

**Artistic (SDXL)**:
```
digital art, cyberpunk city at night, neon lights, rain reflections, 
futuristic buildings, anime style, vibrant colors, detailed, masterpiece
```

**Illustration (Seedream)**:
```
cute cat character, chibi style, pastel colors, kawaii, simple background, 
clean lines, vector illustration style
```

## Post-Processing

### Using ImageMagick
```bash
# Resize
convert input.png -resize 1920x1080 output.png

# Crop
convert input.png -crop 800x600+100+50 output.png

# Format conversion
convert input.png output.webp

# Batch process
mogrify -resize 50% *.png
```

### Using Canvas API (Node.js)
```javascript
const { createCanvas, loadImage } = require('canvas');

async function addWatermark(imagePath, text) {
  const img = await loadImage(imagePath);
  const canvas = createCanvas(img.width, img.height);
  const ctx = canvas.getContext('2d');
  
  ctx.drawImage(img, 0, 0);
  ctx.font = 'bold 24px Arial';
  ctx.fillStyle = 'rgba(255, 255, 255, 0.5)';
  ctx.fillText(text, 20, 40);
  
  return canvas.toBuffer('image/png');
}
```

## Penpot Integration

### Export to Penpot
```bash
# Via Penpot MCP
penpot_import_image <file_path> <page_id> <board_id>
```

### Design System
- Maintain consistent colors from `tokens.css`
- Use brand fonts
- Follow DigitalWise style guide
