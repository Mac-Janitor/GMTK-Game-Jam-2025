// Varyings
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Uniform
uniform float u_time;

void main()
{
    float glow = 0.5 + 0.5 * sin(u_time * 4.0); // pulse between 0.0 - 1.0
    gl_FragColor = v_vColour * vec4(vec3(glow), 1.0);
}