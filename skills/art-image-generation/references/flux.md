# FLUX.1 Reference Guide

## Model Variants

### FLUX.1 [pro]
- Highest quality
- Best for professional work
- Slower generation
- Commercial license required

### FLUX.1 [dev]
- Good balance quality/speed
- Research/non-commercial use
- Open weights available

### FLUX.1 [schnell]
- Fastest generation
- Good for iteration
- Lower quality than pro
- Open weights available

## Capabilities

### Strengths
- **Text Rendering**: Excellent at rendering text in images
- **Photorealism**: High-quality realistic images
- **Detail**: Fine details and textures
- **Consistency**: Stable outputs across runs
- **Prompt Following**: Accurately follows complex prompts

### Limitations
- **Speed**: Slower than other models (except schnell)
- **Cost**: More expensive per generation
- **NSFW**: Strict content filtering

## Prompt Structure

FLUX uses natural language prompts. No special syntax required.

### Basic Structure
```
[Subject] [Action] [Environment] [Lighting] [Style] [Quality]
```

### Example
```
A young Indonesian woman studying at a modern cafe with large windows, 
warm afternoon sunlight streaming in, soft bokeh background, 
professional photography style, 4K quality
```

## Prompt Tips

### Do's
1. **Be descriptive** - More details = better results
2. **Specify lighting** - "golden hour", "studio lighting", "natural light"
3. **Mention style** - "photorealistic", "cinematic", "professional"
4. **Add quality keywords** - "4K", "high detail", "sharp focus"
5. **Use natural language** - Write like you're describing to a photographer

### Don'ts
1. **Avoid overloading** - Don't cram too many subjects
2. **Avoid contradictions** - Don't mix incompatible styles
3. **Avoid vague terms** - Be specific about what you want
4. **Avoid excessive keywords** - Natural flow works better

## Common Use Cases

### Portrait Photography
```
Professional headshot of a [demographic] in their [age]s, 
[expression] expression, [clothing], [background], 
[lighting], [camera lens], 4K quality
```

### Landscape
```
Breathtaking [landscape type] during [time of day], 
[weather/atmosphere], [foreground elements], 
[lighting direction], cinematic composition, 8K quality
```

### Product Photography
```
Professional product photography of [product], 
[background/surface], [lighting setup], 
[angle], commercial quality, studio shot
```

### Architecture
```
Modern [building type] with [architectural features], 
[time of day] lighting, [weather], 
[viewing angle], architectural photography
```

## Resolution Options

| Resolution | Aspect Ratio | Use Case |
|------------|--------------|----------|
| 1024x1024 | 1:1 | Social media, thumbnails |
| 1024x768 | 4:3 | Landscape, presentations |
| 768x1024 | 3:4 | Portrait, posters |
| 1360x768 | 16:9 | Widescreen, banners |
| 768x1360 | 9:16 | Vertical, stories/reels |

## Quality Keywords

Add these to improve output quality:
- `4K quality`
- `highly detailed`
- `sharp focus`
- `professional photography`
- `award-winning`
- `masterpiece`
- `best quality`
- `ultra-realistic`

## Negative Prompting

FLUX doesn't support traditional negative prompts. Instead:
- Describe what you DO want
- Avoid mentioning unwanted elements
- Use positive framing

## API Parameters

```json
{
  "model": "flux-1-pro",
  "prompt": "Your prompt here",
  "n": 1,
  "size": "1024x1024",
  "guidance_scale": 7.5,
  "num_inference_steps": 50
}
```

### Parameters
- `model`: flux-1-pro, flux-1-dev, flux-1-schnell
- `prompt`: Text description
- `n`: Number of images (1-4)
- `size`: Resolution
- `guidance_scale`: How closely to follow prompt (7.5 default)
- `num_inference_steps`: Quality vs speed (50 default)
