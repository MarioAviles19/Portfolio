varying vec4 vPosition;
varying vec4 mPosition;
varying vec2 vUv;



void main() {
  vec4 modelPosition = modelMatrix * vec4(position, 1.0);
  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectedPosition = projectionMatrix * viewPosition;
  vPosition = viewPosition;
  mPosition = modelPosition;
  
  gl_Position = projectedPosition;

  #ifdef USE_INSTANCING
	// Note that modelViewMatrix is not set when rendering an instanced model,
	// but can be calculated from viewMatrix * modelMatrix.
	//
	// Basic Usage:

  mPosition =  instanceMatrix * vec4(position, 1.0);
	gl_Position = projectionMatrix * viewMatrix * modelMatrix * instanceMatrix * vec4(position, 1.0);
	
#endif

}