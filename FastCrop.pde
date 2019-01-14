PImage img;
PShader shader_crop;

void setup() {
  size(640, 540, P2D);
  pixelDensity(2);
  img = loadImage("test.jpg");
  shader_crop = loadShader("crop.glsl");
  
  shader_crop.set("tex0", img);
  shader_crop.set("iResolution", float(width), float(height), 1.0);
  shader_crop.set("imgRes", float(img.width), float(img.height));
  shader_crop.set("offset", 0.0, 0.0);
  shader_crop.set("brCorner", 960.0, 540.0);
}

void draw() {

  filter(shader_crop);
}
