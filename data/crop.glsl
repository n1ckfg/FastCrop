// https://forum.processing.org/one/topic/fast-cropping-of-a-gltexture.html

uniform sampler2D tex0;
uniform vec2 offset;
uniform vec2 tlCorner;
uniform vec2 brCorner;

void main(void) {
    // The s coordinate of the incoming pixel. We map to the
    // range of the cropped region.
    float s = gl_TexCoord[0].s; 
    float srange = (brCorner.x - tlCorner.x) * offset.s;
    float s0 = tlCorner.x * offset.s;
    float sc = srange * s + s0;
 
    // Same for the t coordinate. 
    float t = gl_TexCoord[0].t; 
    float trange = (brCorner.y - tlCorner.y) * offset.t;
    float t0 = tlCorner.y * offset.t;
    float tc = trange * t + t0;

    // We sample the tex0 texture with texture coordinates
    // contained int the crop area. 
    gl_FragColor = texture2D(tex0, vec2(sc, tc));
} 