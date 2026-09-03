# Luma Dream Machine Reference Guide

## Overview

Luma Dream Machine is a video generation model known for smooth motion and general-purpose video creation.

## Capabilities

### Strengths
- **Smooth Motion**: Natural, fluid movement
- **General Purpose**: Good for many video types
- **Quick Generation**: Fast turnaround
- **Easy to Use**: Simple prompts work well

### Limitations
- **Duration**: 5 seconds max
- **Resolution**: 720p max
- **Complexity**: Struggles with complex scenes
- **Consistency**: May vary between generations

## Prompt Structure

### Basic Structure
```
[Camera] + [Subject] + [Action] + [Environment] + [Style]
```

### Example
```
Slow dolly shot approaching a young student studying in a modern library, 
golden hour sunlight streaming through large windows, 
cinematic depth of field
```

## Camera Movements

### Tracking Shot
```
tracking shot following [subject] as they [action]
```

### Pan Shot
```
pan shot revealing [environment/scene]
```

### Dolly Shot
```
dolly shot moving toward [subject/object]
```

### Aerial Shot
```
aerial shot showing [landscape/scene]
```

### Static
```
static shot of [subject/scene]
```

## Prompt Tips

### Do's
1. **Start with camera** - Camera movement sets the tone
2. **Be specific about motion** - What moves and how
3. **Describe lighting** - Sets the mood
4. **Keep it simple** - One main subject/action
5. **Specify duration** - If needed

### Don'ts
1. **Avoid complex scenes** - Too many elements
2. **Avoid fast motion** - May be jarring
3. **Avoid text** - Poor text rendering
4. **Avoid multiple subjects** - Focus on one

## Common Use Cases

### Cinematic Establishing Shot
```
Slow dolly shot revealing a modern city skyline at sunset, 
warm golden lighting, cinematic composition, 
professional cinematography
```

### Character Movement
```
Tracking shot following a person walking through a park, 
autumn leaves falling, soft natural lighting, 
shallow depth of field
```

### Product Showcase
```
Smooth orbit shot around a product on a pedestal, 
studio lighting, clean background, 
commercial quality
```

### Nature
```
Aerial shot flying over a mountain landscape, 
morning mist, golden hour lighting, 
cinematic, epic scale
```

## Duration Options

| Duration | Use Case |
|----------|----------|
| 5s | Quick clips, social media |
| 4s | Short transitions |
| 3s | GIF-like content |

## Resolution Options

| Resolution | Aspect Ratio | Use Case |
|------------|--------------|----------|
| 1280x720 | 16:9 | Landscape |
| 720x1280 | 9:16 | Vertical/Stories |
| 1280x1280 | 1:1 | Square |

## API Parameters

```json
{
  "model": "luma-dream-machine",
  "prompt": "Your prompt here",
  "duration": 5,
  "resolution": "1280x720"
}
```

### Parameters
- `model`: luma-dream-machine
- `prompt`: Scene description
- `duration`: Length in seconds (1-5)
- `resolution`: Output resolution

## Tips for Best Results

1. **Focus on motion** - What moves in the scene
2. **Describe lighting** - Sets the mood
3. **Keep subjects simple** - One main focus
4. **Use cinematic language** - Camera terms help
5. **Specify time of day** - Morning, afternoon, night

## Common Issues & Solutions

### Issue: Jerky motion
**Solution**: Use "smooth" or "fluid" in prompt

### Issue: Inconsistent lighting
**Solution**: Be very specific about light source

### Issue: Blurry output
**Solution**: Add "sharp focus" or "high detail"

### Issue: Weird artifacts
**Solution**: Simplify the scene, reduce elements
