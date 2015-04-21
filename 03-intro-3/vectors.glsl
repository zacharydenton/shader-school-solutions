highp vec2 func(highp vec2 a, highp vec2 b) {
  return normalize(length(a) * b + length(b) * a);
}

//Do not change this line
#pragma glslify: export(func)
