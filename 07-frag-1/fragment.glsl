precision highp float;

#define CIRCLE_COLOR    vec4(1.0, 0.4313, 0.3411, 1.0)
#define OUTSIDE_COLOR   vec4(0.3804, 0.7647, 1.0, 1.0)

const float radius = 128.0;
const vec2 center = vec2(256.5, 256.5);

bool inCircle(vec2 pos) {
  return length(pos - center) < radius;
}

void main() {
  if(inCircle(gl_FragCoord.xy)) {
    gl_FragColor = CIRCLE_COLOR;
  } else {
    gl_FragColor = OUTSIDE_COLOR;
  }
}
