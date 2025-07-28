varying vec2 vUv;
varying vec3 vPosition;
varying vec3 pos;
varying float vSlope;
varying vec3 vNormal;
varying vec3 vCameraVector;
uniform float uTime;
uniform float uAmplitude;
uniform float uFrequency;


int numWaves = 3;

struct derivative{
  float dHdx;
  float dHdy;
};

struct wavedata{
  float height;
  vec3 normal;
};
float rand(float n) {
    return fract(sin(n) * 43758.5453123) * 2.0 - .5;
}
vec3 getNormal(float vPosition, float frequency, float phase, float amplitude){
  float x = (vPosition * frequency) + phase;
  float cosTerm = amplitude * frequency * cos(x);

  float dHdX = cosTerm;
  float dHdY = cosTerm;
  return vec3(-dHdX, 1.0, -dHdY);
}
wavedata SumOfSins(vec3 vPosition, float frequency, float phase, float amplitude){
  wavedata data;
  float sum = 0.0;
  float ampMult = .5;
  float frequencyMult = 1.7;
  float phaseMult = 1.3;
  frequency = frequency * 0.01;
  for(int i = 0; i < numWaves; i++) {
    float index = float(i);
    float x = (vPosition.y * (rand(index))) + vPosition.x * (rand(index + 11.0));

    sum += sin((x * frequency) + phase) * amplitude;
    data.normal += getNormal(x, frequency, phase, amplitude);

    frequency *= frequencyMult;
    amplitude *= ampMult;
  }
  data.height = sum;
  data.normal = normalize(data.normal);
  return data;
}
void main() {
  
  pos = position;
  wavedata wave = SumOfSins(pos, uFrequency, uTime, uAmplitude);
  pos.z = wave.height;
  vNormal = wave.normal;
  vec4 modelPosition = modelMatrix * vec4(pos, 1.0);
  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectedPosition = projectionMatrix * viewPosition;
  vCameraVector = normalize(cameraPosition - modelPosition.xyz);
  gl_Position = projectedPosition;
  vPosition = (modelMatrix * vec4(pos, 1.0)).xyz;

}


