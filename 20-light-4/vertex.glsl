precision mediump float;

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 lightPosition;

varying vec3 surfacePosition;
varying vec3 surfaceNormal;
varying vec3 lightDirection;

void main() {
  vec4 viewPosition = view * model * vec4(position, 1);
  vec4 viewNormal = vec4(normal, 0) * inverseModel * inverseView;
  vec4 viewLight = view * vec4(lightPosition, 1);

  gl_Position = projection * viewPosition;
  surfacePosition = viewPosition.xyz;
  surfaceNormal = normalize(viewNormal.xyz);
  lightDirection = normalize(viewLight.xyz - surfacePosition);
}
