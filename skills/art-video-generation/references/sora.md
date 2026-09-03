# Sora Reference Guide

## Overview

Sora is OpenAI's video generation model, known for high quality and complex scene handling.

## Capabilities

### Strengths
- **High Quality**: Best-in-class output quality
- **Complex Scenes**: Handles many elements well
- **Long Duration**: Up to 20 seconds
- **Photorealistic**: Realistic output
- **Text Understanding**: Good prompt comprehension

### Limitations
- **Cost**: More expensive than alternatives
- **Speed**: Slower generation
- **Availability**: Limited access
- **NSFW**: Strict content filtering

## Prompt Structure

### Basic Structure
```
[Cinematic Description] + [Subject] + [Action] + [Environment] + [Lighting] + [Quality]
```

### Example
```
Cinematic establishing shot of a modern Indonesian tech campus at sunset, 
students walking between buildings, warm golden lighting reflecting off 
glass facades, drone slowly ascending to reveal the full campus, 
photorealistic, 4K quality, 15 seconds
```

## Prompt Tips

### Do's
1. **Be detailed** - Sora handles complexity well
2. **Use cinematic language** - Professional terminology
3. **Specify duration** - Up to 20 seconds
4. **Describe lighting precisely** - Sets the mood
5. **Add quality keywords** - 4K, photorealistic, etc.

### Don'ts
1. **Avoid vague descriptions** - Be specific
2. **Avoid rapid changes** - Keep scenes consistent
3. **Avoid text** - Still limited
4. **Avoid violence** - Content restrictions

## Common Use Cases

### Cinematic Establishing Shot
```
Cinematic aerial shot slowly revealing a sprawling modern city at golden hour, 
warm sunlight reflecting off glass skyscrapers, 
cars moving on streets below, birds flying, 
photorealistic, 4K, 15 seconds
```

### Character Study
```
Close-up shot of an elderly craftsman working in his workshop, 
warm lamplight illuminating his weathered hands, 
dust particles floating in the air, 
intimate, documentary style, 10 seconds
```

### Nature Documentary
```
Slow tracking shot following a deer through a misty forest at dawn, 
soft morning light filtering through trees, 
steam rising from the ground, 
BBC documentary quality, 20 seconds
```

### Product Commercial
```
Smooth dolly shot approaching a luxury car in a showroom, 
dramatic studio lighting with blue accent lights, 
camera slowly rising to reveal the full vehicle, 
commercial quality, 10 seconds
```

## Duration Options

| Duration | Use Case |
|----------|----------|
| 5s | Quick clips |
| 10s | Standard sequences |
| 15s | Extended scenes |
| 20s | Maximum length |

## Resolution Options

| Resolution | Aspect Ratio | Use Case |
|------------|--------------|----------|
| 1920x1080 | 16:9 | Full HD |
| 1280x720 | 16:9 | HD |
| 1080x1920 | 9:16 | Vertical |

## API Parameters

```json
{
  "model": "sora",
  "prompt": "Your prompt here",
  "duration": 15,
  "resolution": "1920x1080",
  "quality": "high"
}
```

### Parameters
- `model`: sora
- `prompt`: Detailed scene description
- `duration`: Length in seconds (1-20)
- `resolution`: Output resolution
- `quality`: low, medium, high

## Cinematic Techniques

### Camera Movements
- **Dolly**: Moving toward/away from subject
- **Pan**: Rotating horizontally
- **Tilt**: Rotating vertically
- **Tracking**: Following subject
- **Crane**: Rising/falling
- **Drone**: Aerial perspective

### Lighting
- **Golden Hour**: Warm, soft, sunrise/sunset
- **Blue Hour**: Cool, twilight
- **Studio**: Controlled, professional
- **Natural**: Ambient, outdoor
- **Dramatic**: High contrast, moody

### Composition
- **Rule of Thirds**: Subject off-center
- **Leading Lines**: Guide eye to subject
- **Framing**: Natural frame within frame
- **Depth**: Foreground, midground, background

## Tips for Best Results

1. **Think cinematically** - Use film terminology
2. **Describe the shot** - Camera angle, movement
3. **Set the scene** - Environment, time, weather
4. **Specify lighting** - Mood and atmosphere
5. **Add quality markers** - 4K, cinematic, etc.

## Common Issues & Solutions

### Issue: Uncanny valley
**Solution**: Use slightly stylized or distant shots

### Issue: Physics errors
**Solution**: Keep movements realistic, avoid extremes

### Issue: Inconsistent lighting
**Solution**: Be very specific about light sources

### Issue: artifacts
**Solution**: Simplify complex scenes

## Content Guidelines

### Allowed
- Most scenes with people, animals, nature
- Urban environments
- Abstract/artistic content
- Product showcases

### Restricted
- Violence
- Adult content
- Real public figures (limited)
- Dangerous activities

### Prohibited
- Explicit content
- Hate speech promotion
- Misinformation
- Illegal activities
