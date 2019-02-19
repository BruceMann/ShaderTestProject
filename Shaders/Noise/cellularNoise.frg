#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    st.x *= u_resolution.x/u_resolution.y;

    vec3 color = vec3(.0);

    // Cell positions
    vec2 point[3];
   point[0] = vec2(0.83,0.75);
   point[1] = vec2(0.60,0.07);
   //point[2] = vec2(0.28,0.64);
   //point[3] =  vec2(0.31,0.26);
    point[2] = u_mouse/u_resolution;

    float m_dist = 1.;  // minimun distance

    // Iterate through the points positions
    for (int i = 0; i < 3; i++) {
        float dist = distance(st, point[i]);

        // Keep the closer distance
        m_dist = min(m_dist, dist);
    }

    // Draw the min distance (distance field)
    color += m_dist;

    // Show isolines
    // color -= step(.7,abs(sin(50.0*m_dist)))*.3;

    vec3 out_color = vec3(0.7-color*2.0)*vec3(255,193,193)/vec3(255);

    gl_FragColor = vec4(out_color,1.0);
}
