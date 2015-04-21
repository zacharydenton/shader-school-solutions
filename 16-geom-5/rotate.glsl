highp mat4 rotation(highp vec3 n, highp float theta) {
  n = normalize(n);
  float s = sin(theta);
  float c = cos(theta);
  float oc = 1.0 - c;

  return mat4(c + pow(n.x, 2.0) * oc, n.x * n.y * oc + n.z * s, n.x * n.z * oc - n.y * s, 0,
              n.y * n.x * oc - n.z * s, c + pow(n.y, 2.0) * oc, n.y * n.z * oc + n.x * s, 0, 
              n.z * n.x * oc + n.y * s, n.z * n.y * oc - n.x * s, c + pow(n.z, 2.0) * oc, 0,
              0, 0, 0, 1);
}

#pragma glslify: export(rotation)
