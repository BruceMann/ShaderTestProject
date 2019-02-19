uniform vec2 u_resolution;
uniform float u_time;

// Plot a line on Y using a value between 0.0-1.0
float plot(vec2 st, float pct){
  return smoothstep( pct,pct+0.02,st.y);
}

float plot_half(vec2 st,float pct){
    return smoothstep(pct-0.02,pct,st.y);
}

void main() {

    vec2 st = gl_FragCoord.xy/u_resolution;
    float x = st.x;
    float y = x;
    vec3 color = vec3(0.0);

    float pct = plot(st,y);
    float pct_half = plot_half(st,y);

    color = pct_half*vec3(0.0,0.0,1.0);
    color = (1.0-pct)*color ;

    gl_FragColor = vec4(color,1.0);
}
