uniform vec2 u_resolution;

void main(){
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(.0);

    vec2 pos = st-vec2(.5);

    float r = length(pos)*2.0;
    float a = atan(pos.y,pos.x);

    float f = sin(a*3.0);

    color = vec3(1.0-smoothstep(f,f+0.02,r));

    //color = vec3(step(0.99,r));

    color = vec3(pos.x,pos.y,0.0);

    color = vec3(smoothstep(f,f+0.02,r));

    gl_FragColor = vec4(color,1.0);

}
