varying vec2 vUv;
varying float vSlope;
varying vec3 vNormal;
varying vec3 vPosition;
varying vec3 vCameraVector;
varying vec3 pos;
uniform float size;
uniform float uAmplitude;

vec3 lightDir = normalize(vec3(-1.0, 0.7, 0));

void main() {
  vec4 color = vec4(0.19, 0.2, 0.39, 1.0);
  vec4 sunColor = vec4(1.0);
  
  float lighting = max(dot(vNormal, lightDir), 0.0);

  // View and light directions
  vec3 viewDir = normalize(cameraPosition - vPosition);

  // Halfway vector for Blinn-Phong
  vec3 halfwayDir = normalize(lightDir + viewDir);

  // Specular
  float specularStrength = 1.0;
  float shininess = 256.0;
  
  float ndotl = max(dot(vNormal, lightDir), 0.0);
  float specAngle = max(dot(vNormal, halfwayDir), 0.0);
  float spec = pow(specAngle, shininess) * ndotl;
  vec4 specular = sunColor * spec * specularStrength;

  vec4 finalColor = color * lighting + specular;
  gl_FragColor =  finalColor;

}