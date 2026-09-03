# Veo Reference Guide

## Overview

Veo is Google's video generation model, known for audio sync and photorealistic output.

## Capabilities

### Strengths
- **Audio Sync**: Can sync video with audio
- **Photorealistic**: High-quality realistic video
- **Long Duration**: Up to 8 seconds
- **Good Understanding**: Accurate prompt following

### Limitations
- **Duration**: 8 seconds max
- **Availability**: Limited access
- **Cost**: Premium pricing
- **Speed**: Slower generation

## Prompt Structure

### Basic Structure
```
[Scene Description] + [Audio/Sound] + [Lighting] + [Style]
```

### Example
```
A bustling Indonesian market at midday, vendors calling out, 
ambient market sounds, warm natural lighting, 
documentary style, 8 seconds
```

## Audio Integration

### Sound Description
```
[ambient sounds] + [specific sounds] + [music style]
```

### Example
```
gentle rain on a tin roof, distant thunder, 
soft ambient music, peaceful atmosphere
```

## Prompt Tips

### Do's
1. **Describe audio** - Veo handles audio well
2. **Be specific about sound** - Types of sounds
3. **Specify duration** - Up to 8 seconds
4. **Describe lighting** - Sets the mood
5. **Add style keywords** - Documentary, cinematic, etc.

### Don'ts
1. **Avoid silent scenes** - Use audio descriptions
2. **Avoid complex audio** - Keep it simple
3. **Avoid text** - Limited rendering
4. **Avoid fast cuts** - Single continuous shot

## Common Use Cases

### Ambient Scene
```
Quiet coffee shop interior, soft jazz playing, 
espresso machine sounds, warm morning light, 
customers chatting in background, 8 seconds
```

### Nature with Audio
```
Ocean waves crashing on rocky shore, seagulls calling, 
wind blowing, dramatic sunset lighting, 
cinematic, 8 seconds
```

### Urban Scene
```
Busy city intersection at night, traffic sounds, 
honking, people talking, neon lights reflecting on wet streets, 
atmospheric, 8 seconds
```

### Music Video Style
```
Dancer performing in empty warehouse, 
echoing footsteps, ambient reverb, 
dramatic backlighting, dust particles, 
artistic, 8 seconds
```

## Duration Options

| Duration | Use Case |
|----------|----------|
| 4s | Quick clips |
| 6s | Standard |
| 8s | Maximum |

## Resolution Options

| Resolution | Aspect Ratio | Use Case |
|------------|--------------|----------|
| 1280x720 | 16:9 | Landscape |
| 720x1280 | 9:16 | Vertical |

## API Parameters

```json
{
  "model": "veo",
  "prompt": "Your prompt here",
  "audio_description": "Audio elements",
  "duration": 8,
  "resolution": "1280x720"
}
```

### Parameters
- `model`: veo
- `prompt`: Visual description
- `audio_description`: Sound elements
- `duration`: Length in seconds
- `resolution`: Output resolution

## Audio Types

### Ambient
- Wind, rain, thunder
- Ocean waves
- Forest sounds
- City ambiance

### Specific
- Footsteps
- Door opening
- Birds chirping
- Traffic

### Music
- Instrumental styles
- Mood descriptions
- Genre references

## Tips for Best Results

1. **Always include audio** - Veo's strength
2. **Describe sounds clearly** - Be specific
3. **Match audio to visuals** - Cohesive experience
4. **Use ambient sounds** - Sets the scene
5. **Keep duration reasonable** - 6-8 seconds

## Common Issues & Solutions

### Issue: Audio doesn't match
**Solution**: Be more specific about sound timing

### Issue: Poor lip sync
**Solution**: Use non-speaking scenes

### Issue: Inconsistent audio
**Solution**: Keep audio simple, fewer elements

### Issue: artifacts
**Solution**: Simplify the scene

## Audio Best Practices

### Layer Sounds
```
primary sound + background ambiance + occasional details
```

Example:
```
footsteps on gravel + birds chirping + distant wind
```

### Match Environment
- Indoor: Room tone, specific sounds
- Outdoor: Nature, weather, ambient
- Urban: Traffic, people, city sounds

### Set Mood
- Peaceful: Soft, gentle sounds
- Tense: Sharp, irregular sounds
- Joyful: Upbeat, pleasant sounds
- Sad: Slow, melancholic sounds
