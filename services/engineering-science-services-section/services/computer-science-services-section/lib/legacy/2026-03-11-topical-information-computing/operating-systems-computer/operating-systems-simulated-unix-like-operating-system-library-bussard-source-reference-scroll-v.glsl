uniform float offset;

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
  return color*texture2D(texture, vec2(texture_coords.x, texture_coords.y - offset));
}
