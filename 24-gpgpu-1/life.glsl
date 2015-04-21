precision highp float;

uniform sampler2D prevState;
uniform vec2 stateSize;

float state(vec2 uv) {
  return texture2D(prevState, uv).r;
}

float numNeighbors(vec2 uv) {
  float num = 0.0;
  vec2 ncoord;
  for (int dx = -1; dx <= 1; dx++) {
    for (int dy = -1; dy <= 1; dy++) {
      if (dx == 0 && dy == 0) continue;
      ncoord = fract(uv + vec2(dx, dy) / stateSize);
      num += state(ncoord);
    }
  }
  return num;
}

void main() {
  vec2 uv = gl_FragCoord.xy / stateSize;
  float s = state(uv);
  float neighbors = numNeighbors(uv);
  gl_FragColor = vec4(float((s == 0.0 && neighbors == 3.0) || (s > 0.0 && (neighbors == 2.0) || (neighbors == 3.0))));
}
