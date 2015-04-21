precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;
uniform vec3 diffuse;
uniform vec3 lightDirection;

varying vec3 surfaceNormal;

void main() {
  float brightness = max(dot(normalize(surfaceNormal), normalize(lightDirection)), 0.0);
  vec3 color = ambient + diffuse * brightness;
  gl_FragColor = vec4(color, 1.0);
}
