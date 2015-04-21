precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;
uniform vec3 diffuse;
uniform vec3 specular;

uniform vec3 lightPosition;

uniform float shininess;

varying vec3 surfacePosition;
varying vec3 surfaceNormal;
varying vec3 lightDirection;

float lambertBrightness(vec3 lightDirection, vec3 surfaceNormal) {
  return dot(surfaceNormal, lightDirection);
}

float phongBrightness(vec3 lightDirection, vec3 surfaceNormal, vec3 eyeDirection, float shininess) {
  vec3 reflectDirection = reflect(lightDirection, surfaceNormal);
  float reflectBrightness = max(dot(reflectDirection, eyeDirection), 0.0);
  return pow(reflectBrightness, shininess);
}

void main() {
  vec3 eyeDirection = normalize(surfacePosition);
  float lambert = lambertBrightness(lightDirection, surfaceNormal);
  float phong = phongBrightness(lightDirection, surfaceNormal, eyeDirection, shininess);
  vec3 color = ambient + lambert * diffuse + phong * specular;
  gl_FragColor = vec4(color, 1);
}
