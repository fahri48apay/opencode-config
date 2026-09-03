# Seedream Reference Guide

## Overview

Seedream is ByteDance's image generation model, specialized in stylized, anime, and illustration content.

## Capabilities

### Strengths
- **Anime/Illustration**: Excellent for anime-style art
- **Stylized Content**: Great for creative, artistic styles
- **Speed**: Fast generation
- **Cost**: Generally affordable
- **Style Control**: Good at maintaining consistent style

### Limitations
- **Photorealism**: Not ideal for realistic photos
- **Text Rendering**: Limited text capabilities
- **Detail**: Less detail than FLUX
- **Western Styles**: Better at Asian styles

## Prompt Structure

Seedream uses tag-based prompts similar to SD.

### Basic Structure
```
[Style], [Subject], [Details], [Quality], [Background]
```

### Example
```
anime, 1girl, long flowing hair, blue eyes, 
white dress, cherry blossom garden, 
masterpiece, best quality, 
soft lighting, detailed, vibrant colors
```

## Prompt Tips

### Do's
1. **Specify style first** - anime, illustration, etc.
2. **Use detailed descriptions** - More tags = better
3. **Add quality tags** - masterpiece, best quality
4. **Describe background** - Setting matters
5. **Mention colors** - Specific color descriptions

### Don'ts
1. **Avoid realistic terms** - photo, realistic, etc.
2. **Avoid complex scenes** - Keep it simple
3. **Avoid Western styles** - Not its strength
4. **Avoid text requests** - Poor text rendering

## Common Use Cases

### Anime Character
```
anime, 1girl, school uniform, 
long black hair, brown eyes, smile, 
school background, cherry blossoms, 
masterpiece, best quality, detailed
```

### Fantasy Illustration
```
illustration, fantasy, elf mage, 
pointed ears, magic staff, glowing aura, 
magical forest, ethereal lighting, 
highly detailed, vibrant colors, concept art
```

### Chibi/Cute
```
chibi, cute, kawaii, 
small cat girl, cat ears, tail, 
pastel colors, simple background, 
adorable, soft shading
```

### Concept Art
```
concept art, character design, 
warrior armor, medieval, 
detailed metalwork, cape, 
dramatic lighting, dark background
```

## Style Keywords

### Art Styles
```
anime, illustration, digital art, concept art, 
oil painting, watercolor, pencil sketch, 
pixel art, vector art, flat design
```

### Quality Modifiers
```
masterpiece, best quality, highly detailed, 
sharp focus, professional, award-winning,
vibrant colors, dynamic composition
```

### Lighting
```
soft lighting, dramatic lighting, golden hour, 
studio lighting, natural light, rim lighting, 
backlit, volumetric lighting
```

## Resolution Options

| Resolution | Aspect Ratio | Use Case |
|------------|--------------|----------|
| 1024x1024 | 1:1 | Default |
| 1024x768 | 4:3 | Landscape |
| 768x1024 | 3:4 | Portrait |
| 512x512 | 1:1 | Quick generation |

## API Parameters

```json
{
  "model": "seedream",
  "prompt": "Your prompt here",
  "n": 1,
  "size": "1024x1024",
  "style": "anime",
  "guidance_scale": 7.0,
  "num_inference_steps": 25
}
```

### Parameters
- `model`: seedream
- `prompt`: Tag-based prompt
- `n`: Number of images
- `size`: Resolution
- `style`: Style preset (anime, illustration, etc.)
- `guidance_scale`: Prompt adherence
- `num_inference_steps`: Quality vs speed

## Style Presets

### Anime
- Clean lines
- Vibrant colors
- Exaggerated features
- Japanese aesthetic

### Illustration
- Hand-drawn feel
- Artistic shading
- Creative composition
- Storytelling focus

### Concept Art
- Detailed designs
- Dramatic lighting
- Professional quality
- Portfolio-ready

## Tips for Best Results

1. **Start with style** - Always begin with anime/illustration/etc.
2. **Be specific about character** - Hair, eyes, clothing, pose
3. **Describe setting** - Background and environment
4. **Add mood/lighting** - Sets the atmosphere
5. **Use quality tags** - Ensures good output
