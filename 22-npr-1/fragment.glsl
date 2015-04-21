precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 diffuse;
uniform vec3 lightDirection;
uniform float numBands;

varying vec3 surfaceNormal;

float lambertIntensity(vec3 surfaceNormal, vec3 lightDirection) {
  return max(dot(surfaceNormal, lightDirection), 0.0);
}

float celShade(float intensity, float numBands) {
  return ceil(intensity * numBands) / numBands;
}

void main() {
  vec3 light = normalize(lightDirection);
  float lambert = lambertIntensity(surfaceNormal, light);
  vec3 color = diffuse * celShade(lambert, numBands);
  gl_FragColor = vec4(color, 1);
}
