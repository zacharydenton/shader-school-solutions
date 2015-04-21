bool inBox(highp vec2 lo, highp vec2 hi, highp vec2 p) {
  return all(greaterThanEqual(p, lo)) && all(lessThanEqual(p, hi));
}


//Do not change this line or the name of the above function
#pragma glslify: export(inBox)
