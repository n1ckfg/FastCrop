// https://forum.processing.org/one/topic/fast-cropping-of-a-gltexture.html

uniform vec3 iResolution;
uniform vec2 imgRes;
uniform sampler2D tex0;
uniform vec2 offset;
uniform vec2 brCorner;

float map(float s, float a1, float a2, float b1, float b2) {
    return b1 + (s - a1) * (b2 - b1) / (a2 - a1);
}

void main() {
    // The s coordinate of the incoming pixel. We map to the
    // range of the cropped region.
    vec2 br = vec2(brCorner.x * ((imgRes.x/iResolution.x)/2.0), brCorner.y).xy / imgRes.xy;
    vec2 of = offset.xy / imgRes.xy;

    float s = map(gl_FragCoord.x, 0.0, imgRes.x, of.x, of.x + br.x); 
 
    // Same for the t coordinate. 
    float t = map(gl_FragCoord.y, 0.0, imgRes.y, of.y, of.y + br.y); 

    // We sample the tex0 texture with texture coordinates
    // contained in the crop area. 
    gl_FragColor = texture2D(tex0, vec2(s,t));
} 