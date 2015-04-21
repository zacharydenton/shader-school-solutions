precision mediump float;

uniform sampler2D prevState;
uniform vec2 stateSize;
uniform float kdiffuse;
uniform float kdamping;

float state(vec2 x) {
  return texture2D(prevState, fract(x / stateSize)).r;
}

float laplace(vec2 coord) {
  return (
    state(coord + vec2(-1, 0)) +
    state(coord + vec2(1, 0)) +
    state(coord + vec2(0, -1)) +
    state(coord + vec2(0, 1))
  ) - 4.0 * state(coord);
}

void main() {
  vec2 coord = gl_FragCoord.xy;
  float next = (1.0 - kdamping) * (kdiffuse * laplace(coord) + state(coord));
  gl_FragColor = vec4(next);
}
