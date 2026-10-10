uniform vec3 light;

vec4 effect(vec4 color, Image texture, vec2 xy, vec2 screen_coords) {
  float r = length(xy);
  vec4 c = texture2D(texture, vec2(r,0));
  xy = xy/r;
  float l = 0.5+0.5*dot(vec3(xy, 0), light);
  c.a *= l;
  return c*color;
}
