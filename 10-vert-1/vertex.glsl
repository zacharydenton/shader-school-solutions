precision highp float;

uniform float theta;

attribute vec2 position;

void main() {
  mat2 rotationMatrix = mat2(cos(theta), sin(theta), -sin(theta), cos(theta));
  gl_Position = vec4(rotationMatrix * position, 0, 1.0);
}
