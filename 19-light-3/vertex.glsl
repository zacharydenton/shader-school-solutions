precision mediump float;

attribute vec3 position, normal;
uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 surfaceNormal;
varying vec3 eyeDirection;

void main() {
  vec4 viewPosition = view * model * vec4(position, 1);
  gl_Position = projection * viewPosition;
  surfaceNormal = (vec4(normal, 0) * inverseModel * inverseView).xyz;
  eyeDirection = viewPosition.xyz;
}
