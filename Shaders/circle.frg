uniform vec2 u_resolution;
uniform float u_time;

float circle(in vec2 _st,float _radius){
    vec2 dist = _st-vec2(0.5);
    return 1.-smoothstep(_radius-(_radius*0.01),
                     _radius+(_radius*0.01),
                     dot(dist,dist)*4.0);
}

void main(){
    vec2 st = gl_FragCoord.xy/u_resolution;
    float pct = 0.0;

    //a. The DISTANCE from the pixel to the center
    pct = min(distance(st,vec2(0.4,0.6)),distance(st,vec2(0.6)));

    //b. the LENTH of the vector
    //vec2 toCenter = vec2(0.5)-st;
    //pct = length(toCenter);


    pct = step(pct,0.4);

    vec3 color = vec3(circle(st,0.9));

    gl_FragColor = vec4( color, 1.0 );

}

