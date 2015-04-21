precision mediump float;

const float tileSize = 16.0;

bool inTile(vec2 pos) {
  vec2 tilePos = step(0.5, fract(0.5 * pos / tileSize));
  return tilePos.x == tilePos.y;
}

void main() {
  if (inTile(gl_FragCoord.xy)) {
    gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
  } else {
    discard;
  }
}
