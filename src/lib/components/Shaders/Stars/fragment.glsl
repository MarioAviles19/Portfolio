// Credit: https://madebyevan.com/shaders/grid/

varying vec2 vUv;
varying vec4 vPosition;
varying vec4 mPosition;
uniform vec3 pulsePosition;
uniform float pulseTimer;


void main() {


    vec3 point = vec3(0,0,0);

    float maxDistance = float(15);
    // Calculate the distance from the pixel to the point
    float distance = length(mPosition.xyz - point);

    // Normalize the distance to [0, 1]
    float t = clamp(distance / maxDistance, 0.0, 1.0);

    // Interpolate between two colors based on the normalized distance
    vec4 colorA = vec4(0.73, 0.32, 1.0, 1.0); // Color at the point (e.g., red)
    vec4 colorB = vec4(1.0, 0.91, 0.66, 1.0); // Color at max distance (e.g., blue)

    
    gl_FragColor = mix(colorA, colorB, t); // Linear interpolation

}