precision highp float;

attribute vec4 position;
attribute vec3 color;

varying vec3 fragColor;

void main() {
  gl_Position = position;
  fragColor = color;
}
