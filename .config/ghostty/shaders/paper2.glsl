// --- SETTINGS ---
// Primary Grid (Fine Green)
const float GRID_SIZE         = 40.0;
const float GRID_THICKNESS    = 1.0;
const float GRID_OPACITY      = 0.35;
const vec3  GRID_COLOR        = vec3(0.6, 0.8, 0.6); 

// Secondary Grid (Major Blue)
const float GRID_2_SIZE       = 200.0;
const float GRID_2_THICKNESS  = 2.0;
const float GRID_2_OPACITY    = 0.15;
const vec3  GRID_2_COLOR      = vec3(0.6, 0.7, 0.8); 

// Atmospheric Effects
const float VIGNETTE_STR      = 0.15;
const float VIGNETTE_SIZE     = 1.0;
const float GRAIN_STR         = 0.05;
const float CENTER_GLOW       = 0.05;
const float TEXT_THRESHOLD    = 0.6; 

// --- UTILS ---
float hash(vec2 p) {
    return fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    // 1. COORDINATES & TEXTURE
    vec2 uv = fragCoord / iResolution.xy;
    vec2 centralUv = uv * 2.0 - 1.0;
    float dist = length(centralUv);
    vec4 terminal = texture(iChannel0, uv);

    // 2. TEXT MASKING
    // Filters out effects where text is present to maintain legibility
    float brightness = dot(terminal.rgb, vec3(0.299, 0.587, 0.114));
    float isBackground = brightness < TEXT_THRESHOLD ? 0.0 : 1.0;

    // 3. GRID CALCULATIONS
    // Primary Grid Logic
    vec2 gridPos1 = mod(fragCoord.xy, GRID_SIZE);
    float mask1 = (gridPos1.x < GRID_THICKNESS || gridPos1.y < GRID_THICKNESS) ? 1.0 : 0.0;

    // Secondary Grid Logic
    vec2 gridPos2 = mod(fragCoord.xy, GRID_2_SIZE);
    float mask2 = (gridPos2.x < GRID_2_THICKNESS || gridPos2.y < GRID_2_THICKNESS) ? 1.0 : 0.0;

    // 4. FINAL COMPOSITION
    vec3 outRGB = terminal.rgb;

    // Layer 1: Primary Grid (Green)
    outRGB = mix(outRGB, GRID_COLOR, mask1 * GRID_OPACITY * isBackground);
    
    // Layer 2: Secondary Grid (Blue) - Overlays on top
    outRGB = mix(outRGB, GRID_2_COLOR, mask2 * GRID_2_OPACITY * isBackground);

    // Layer 3: Vignette (Edges)
    float vignette = smoothstep(VIGNETTE_SIZE, VIGNETTE_SIZE + 1.0, dist);
    outRGB *= 1.0 - (vignette * VIGNETTE_STR);

    // Layer 4: Stable Grain (Texture)
    float noise = hash(fragCoord * 0.1234);
    outRGB += (noise - 0.5) * GRAIN_STR * isBackground;

    // Layer 5: Center Glow (Focus)
    float glow = (1.0 - smoothstep(0.0, 1.2, dist)) * CENTER_GLOW;
    outRGB += glow * isBackground;

    fragColor = vec4(outRGB, 1.0);
}
