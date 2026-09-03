# Stable Diffusion Reference Guide

## Model Variants

### Stable Diffusion XL (SDXL)
- **Base model**: 1024x1024 native
- **Best for**: Artistic, stylized, creative
- **Community**: Large, many fine-tunes available

### Stable Diffusion 3.5 Large
- **Base model**: 1024x1024 native
- **Best for**: Versatile, balanced
- **Improvements**: Better text, hands, anatomy

## Capabilities

### Strengths
- **Artistic Style**: Excellent for creative, stylized art
- **Community Models**: Thousands of fine-tunes available
- **Control**: High control with LoRA, ControlNet
- **Cost**: Generally cheaper than FLUX
- **Speed**: Faster generation

### Limitations
- **Text Rendering**: Struggles with text in images
- **Anatomy**: Can have issues with hands, faces
- **Consistency**: Less consistent than FLUX
- **Prompt Following**: May deviate from complex prompts

## Prompt Structure

SD uses tag-based prompts with optional natural language.

### Basic Structure
```
[Subject], [Style], [Quality Tags], [Lighting], [Details]
```

### Example
```
beautiful woman, asian, long hair, smiling, 
cafe interior, warm lighting, 
masterpiece, best quality, highly detailed,
soft focus, bokeh, professional photography
```

## Prompt Tips

### Do's
1. **Use tags** - Comma-separated keywords work well
2. **Start with subject** - Main subject first
3. **Add quality tags** - masterpiece, best quality, etc.
4. **Use parentheses for emphasis** - (keyword:1.2)
5. **Specify style clearly** - digital art, oil painting, photo

### Don'ts
1. **Avoid natural language** - Tags work better
2. **Avoid long sentences** - Keep it keyword-focused
3. **Avoid contradictions** - Don't mix incompatible styles
4. **Avoid overly complex** - Simple, clear prompts

## Quality Tags

### Positive Quality Tags
```
masterpiece, best quality, highly detailed, 
sharp focus, professional, award-winning,
4K, 8K, ultra-realistic, photorealistic
```

### Negative Prompt (for models that support it)
```
lowres, bad anatomy, bad hands, text, error, 
missing fingers, extra digit, fewer digits, cropped, 
worst quality, low quality, normal quality, 
jpeg artifacts, signature, watermark, username, blurry
```

## Common Use Cases

### Anime/Illustration
```
anime style, 1girl, long hair, blue eyes, 
school uniform, cherry blossoms, 
masterpiece, best quality, vibrant colors
```

### Digital Art
```
digital art, fantasy landscape, dragon, 
magical forest, glowing mushrooms, 
ethereal lighting, highly detailed, concept art
```

### Oil Painting
```
oil painting, portrait, classical style, 
dramatic lighting, rich colors, 
museum quality, masterful brushwork
```

### Photorealistic
```
photo, realistic, 8k uhd, film grain, 
Fujifilm XT3, 50mm lens, 
soft lighting, detailed skin texture
```

## LoRA and ControlNet

### LoRA (Low-Rank Adaptation)
- Fine-tune for specific styles
- Lightweight modifications
- Stack multiple LoRAs

### ControlNet
- Control composition
- Pose guidance
- Edge/depth maps
- Style transfer

## Resolution Options

| Resolution | Aspect Ratio | Use Case |
|------------|--------------|----------|
| 1024x1024 | 1:1 | Default, social media |
| 768x1024 | 3:4 | Portrait |
| 1024x768 | 4:3 | Landscape |
| 512x512 | 1:1 | Quick generation |
| 512x768 | 2:3 | Portrait (SD 1.5) |
| 768x512 | 3:2 | Landscape (SD 1.5) |

## API Parameters

```json
{
  "model": "sdxl",
  "prompt": "Your prompt here",
  "negative_prompt": "Things to avoid",
  "n": 1,
  "size": "1024x1024",
  "guidance_scale": 7.5,
  "num_inference_steps": 30,
  "seed": 42
}
```

### Parameters
- `model`: sdxl, sd3.5-large
- `prompt`: Positive prompt
- `negative_prompt`: Negative prompt (if supported)
- `n`: Number of images
- `size`: Resolution
- `guidance_scale`: Prompt adherence (7.5 default)
- `num_inference_steps`: Quality vs speed
- `seed`: Random seed for reproducibility
