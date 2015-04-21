precision mediump float;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 surfaceNormal;
varying vec3 eyeDirection;

float lambert(vec3 lightDirection, vec3 surfaceNormal) {
  return dot(surfaceNormal, lightDirection);
}

float phong(vec3 lightDirection, vec3 surfaceNormal, vec3 eyeDirection, float shininess) {
  vec3 rlight = reflect(lightDirection, surfaceNormal);
  float eyeLight = max(dot(rlight, eyeDirection), 0.0);
  return pow(eyeLight, shininess);
}

void main() {
  vec3 light = normalize(lightDirection);
  vec3 normal = normalize(surfaceNormal);
  vec3 eye = normalize(eyeDirection);
  vec3 color =
    ambient +
    diffuse * lambert(light, normal) +
    specular * phong(light, normal, eye, shininess);
  gl_FragColor = vec4(color, 1);
}
