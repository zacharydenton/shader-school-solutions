precision highp float;

varying vec3 pointColor;

bool inCircle(vec2 pos, float radius) {
  return length(pos) < radius;
}

void main() {
  if (inCircle(gl_PointCoord.xy - vec2(0.5), 0.5)) {
    gl_FragColor = vec4(pointColor, 1.0);
  } else {
    discard;
  }
}
