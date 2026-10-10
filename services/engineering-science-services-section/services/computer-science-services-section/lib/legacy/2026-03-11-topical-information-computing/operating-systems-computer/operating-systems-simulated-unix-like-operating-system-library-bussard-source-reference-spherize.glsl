//[22:49:35]	Shviller: So, what kind of black magic do I need to be able to use `textureGrad` in a shader?
//[23:45:23]	slime_: use love 0.11 and use GLSL 3
//[23:45:32]	slime_: (#pragma language glsl3, at the top of the shader)

uniform Image day;
uniform Image night;
uniform float rotation;
uniform float tilt;
uniform vec3 light;
uniform vec4 shade;

number PI = 3.1415926535897932384626433832795;

vec4 effect(vec4 color, Image texture, vec2 xy, vec2 screen_coords) {
  float l = length(xy);
  float delta = fwidth(l);
  if (l <= 1) {
    float z = sqrt(1-l*l);
    float yrot = sin(tilt)*z - cos(tilt)*xy.y;
    float zrot = cos(tilt)*z + sin(tilt)*xy.y;
    vec2 uv = vec2(0.5*(1+atan(zrot,-xy.x))/PI + rotation, acos(yrot)/PI);
    float weight = 0.5+0.5*dot(vec3(xy, z), light);
    weight = smoothstep(0.4, 0.6, weight);
    float alpha = clamp((1-l)/delta, 0, 1);
    return alpha*(color*(texture2D(day, uv)*weight + shade*texture2D(night, uv)*(1-weight)));
  } else {
    return vec4(0,0,0,0);
  }
}
