precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 warm;
uniform vec3 cool;
uniform vec3 lightDirection;

varying vec3 surfaceNormal;

float goochIntensity(vec3 surfaceNormal, vec3 lightDirection) {
  return 0.5 * (1.0 + dot(surfaceNormal, lightDirection));
}

void main() {
  vec3 light = normalize(lightDirection);
  float gooch = goochIntensity(surfaceNormal, light);
  vec3 color = (1.0 - gooch) * cool + gooch * warm;
  gl_FragColor = vec4(color, 1);
}
