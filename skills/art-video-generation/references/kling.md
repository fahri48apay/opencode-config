# Kling Reference Guide

## Overview

Kling is Kuaishou's video generation model, known for motion control and cinematic quality.

## Capabilities

### Strengths
- **Motion Control**: Precise control over movement
- **Cinematic Quality**: Professional-looking output
- **Duration**: Up to 10 seconds
- **Multiple Angles**: Good at different camera perspectives

### Limitations
- **Complex Scenes**: May struggle with many elements
- **Text**: Poor text rendering
- **Faces**: Can have inconsistencies
- **Speed**: Slower than some alternatives

## Prompt Structure

### Basic Structure
```
[Camera] + [Subject] + [Action] + [Environment] + [Lighting] + [Style]
```

### Example
```
Smooth tracking shot following a student walking through a futuristic campus, 
holographic displays floating in the air, neon accents, 
cyberpunk aesthetic, 8 seconds
```

## Camera Movements

### Tracking Shot
```
tracking shot following [subject] as they move through [environment]
```

### Orbit Shot
```
orbit shot circling around [subject/object]
```

### Crane Shot
```
crane shot rising from [ground level] to [aerial view]
```

### Handheld
```
handheld shot following [subject], natural movement
```

### FPV
```
FPV drone shot flying through [environment]
```

## Prompt Tips

### Do's
1. **Be specific about motion** - Exact movements
2. **Describe environment clearly** - Setting matters
3. **Specify camera movement** - Kling excels at this
4. **Add time reference** - Duration in prompt
5. **Use cinematic terms** - Professional language

### Don'ts
1. **Avoid too many subjects** - Focus on one
2. **Avoid fast cuts** - Single continuous shot
3. **Avoid text** - Poor rendering
4. **Avoid complex interactions** - Keep it simple

## Common Use Cases

### Character Movement
```
Smooth tracking shot following a warrior walking through a medieval castle, 
torches flickering on stone walls, dramatic shadows, 
cinematic lighting, 8 seconds
```

### Product Reveal
```
Orbit shot slowly revealing a luxury watch on a black pedestal, 
studio lighting with dramatic rim light, 
clean background, commercial quality, 5 seconds
```

### Landscape Flythrough
```
FPV drone shot flying through a canyon at sunset, 
warm golden light, dramatic shadows, 
epic scale, cinematic, 10 seconds
```

### Dance/Motion
```
Tracking shot following a dancer performing in an empty warehouse, 
dramatic backlighting, dust particles in air, 
slow motion, artistic, 8 seconds
```

## Duration Options

| Duration | Use Case |
|----------|----------|
| 5s | Standard clips |
| 8s | Extended sequences |
| 10s | Maximum length |

## Resolution Options

| Resolution | Aspect Ratio | Use Case |
|------------|--------------|----------|
| 1280x720 | 16:9 | Landscape |
| 720x1280 | 9:16 | Vertical |
| 1280x1280 | 1:1 | Square |

## API Parameters

```json
{
  "model": "kling",
  "prompt": "Your prompt here",
  "duration": 8,
  "resolution": "1280x720",
  "motion_strength": 0.7
}
```

### Parameters
- `model`: kling
- `prompt`: Scene description
- `duration`: Length in seconds
- `resolution`: Output resolution
- `motion_strength`: How much motion (0-1)

## Motion Control Tips

### High Motion
- Action scenes
- Fast movement
- Dynamic camera

### Medium Motion
- Walking
- Gentle movements
- Smooth transitions

### Low Motion
- Subtle animations
- Still scenes with minor movement
- Atmospheric content

## Tips for Best Results

1. **Focus on single motion** - One main movement
2. **Describe environment** - Setting is important
3. **Use camera terminology** - Kling understands cinematic terms
4. **Specify lighting** - Sets the mood
5. **Keep duration reasonable** - 5-8 seconds optimal

## Common Issues & Solutions

### Issue: Uncanny valley faces
**Solution**: Use distant shots or focus on body movement

### Issue: Inconsistent motion
**Solution**: Simplify the action, reduce elements

### Issue: Poor lighting
**Solution**: Be very specific about light sources

### Issue: artifacts
**Solution**: Reduce scene complexity
