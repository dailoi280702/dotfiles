// --- SETTINGS ---
const float GRID_SIZE         = 40.0;
const float GRID_THICKNESS    = 1.0;
const float GRID_OPACITY      = 0.35;
const vec3  GRID_COLOR        = vec3(0.6, 0.8, 0.6); 

const float VIGNETTE_STR      = 0.15;
const float VIGNETTE_SIZE     = 1.0;
const float GRAIN_STR         = 0.05;
const float CENTER_GLOW       = 0.05;
const float TEXT_THRESHOLD    = 0.6; // Sensitivity for hiding effects under text

// Stable hash function to prevent geometric artifacts (triangles)
float hash(vec2 p) {
    return fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    vec4 terminal = texture(iChannel0, uv);

    // 1. Text Masking (Luminance)
    float brightness = dot(terminal.rgb, vec3(0.299, 0.587, 0.114));
    float isBackground = brightness < TEXT_THRESHOLD ? 0.0 : 1.0;

    // 2. Grid Geometry
    vec2 gridPos = mod(fragCoord.xy, GRID_SIZE);
    float lineMask = (gridPos.x < GRID_THICKNESS || gridPos.y < GRID_THICKNESS) ? 1.0 : 0.0;

    // 3. Coordinate Math for Vignette/Glow
    vec2 centralUv = uv * 2.0 - 1.0;
    float dist = length(centralUv); 

    // 4. Composition
    // Start with original terminal colors
    vec3 outRGB = terminal.rgb;

    // Apply Grid
    outRGB = mix(outRGB, GRID_COLOR, lineMask * GRID_OPACITY * isBackground);

    // Apply Vignette
    float vignette = smoothstep(VIGNETTE_SIZE, VIGNETTE_SIZE + 1.0, dist);
    outRGB *= 1.0 - (vignette * VIGNETTE_STR);

    // Apply Stable Grain
    float noise = hash(fragCoord * 0.1234);
    outRGB += (noise - 0.5) * GRAIN_STR * isBackground;

    // Apply Center Glow
    float glow = (1.0 - smoothstep(0.0, 1.2, dist)) * CENTER_GLOW;
    outRGB += glow * isBackground;

    fragColor = vec4(outRGB, 1.0);
}
