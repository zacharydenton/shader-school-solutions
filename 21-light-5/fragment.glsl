precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;

uniform PointLight lights[4];

varying vec3 surfacePosition;
varying vec3 surfaceNormal;

float lambertBrightness(vec3 surfaceNormal, vec3 lightDirection) {
  return dot(surfaceNormal, lightDirection);
}

float phongBrightness(vec3 surfaceNormal, vec3 lightDirection, vec3 eyeDirection, float shininess) {
  vec3 reflectDirection = reflect(lightDirection, surfaceNormal);
  float reflectBrightness = max(dot(reflectDirection, eyeDirection), 0.0);
  return pow(reflectBrightness, shininess);
}

void main() {
  vec3 eyeDirection = normalize(surfacePosition);
  vec3 color = ambient;
  vec4 viewLight;
  vec3 lightDirection;
  float lambert;
  float phong;
  for (int i = 0; i < 4; i++) {
    viewLight = view * vec4(lights[i].position, 1);
    lightDirection = normalize(viewLight.xyz - surfacePosition);
    lambert = lambertBrightness(surfaceNormal, lightDirection);
    color += lambert * lights[i].diffuse;
    phong = phongBrightness(surfaceNormal, lightDirection, eyeDirection, lights[i].shininess);
    color += phong * lights[i].specular;
  }
  gl_FragColor = vec4(color, 1);
}
