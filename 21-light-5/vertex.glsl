precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

attribute vec3 position;
attribute vec3 normal;

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

void main() {
  vec4 viewPosition = view * model * vec4(position, 1);
  vec4 viewNormal = vec4(normal, 0) * inverseModel * inverseView;
  gl_Position = projection * viewPosition;
  surfacePosition = viewPosition.xyz;
  surfaceNormal = normalize(viewNormal.xyz);
}
