// Author @patriciogv ( patriciogonzalezvivo.com ) - 2015

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

vec2 movingTiles(vec2 _st,float _zoom,float _speed){
_st *= _zoom;
float time = u_time*_speed;
if( fract(time)>0.5 ){
    if (fract( _st.y * 0.5) > 0.5){
        _st.x += fract(time)*2.0;
    } else {
        _st.x -= fract(time)*2.0;
    }
} else {
    if (fract( _st.x * 0.5) > 0.5){
        _st.y += fract(time)*2.0;
    } else {
        _st.y -= fract(time)*2.0;
    }
}
return fract(_st);
}


vec2 brickTile(vec2 _st, float _zoom){
    _st *= _zoom;

    // Here is where the offset is happening
   _st.x += step(1., mod(_st.y,2.0)) * 0.5;

    return fract(_st);
}

float circle(in vec2 _st, in float _radius){
    vec2 l = _st-vec2(0.5);
    return smoothstep(_radius-(_radius*0.01),
                         _radius+(_radius*0.01),
                         dot(l,l)*4.0);
}

float box(vec2 _st, vec2 _size){
    _size = vec2(0.5)-_size*0.5;
    vec2 uv = smoothstep(_size,_size+vec2(1e-4),_st);
    uv *= smoothstep(_size,_size+vec2(1e-4),vec2(1.0)-_st);
    return uv.x*uv.y;
}

void main(void){
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(0.0);

    // Modern metric brick of 215mm x 102.5mm x 65mm
    // http://www.jaharrison.me.uk/Brickwork/Sizes.html
    // st /= vec2(2.15,0.65)/1.5;

    // Apply the brick tiling
    //st = brickTile(st,10.0);

    st = movingTiles(st,10.,0.5);

    color = vec3(box(st,vec2(0.9)));

    // Uncomment to see the space coordinates
    // color = vec3(st,0.0);

    // draw cricles
    color = vec3(circle(st,0.3));

    gl_FragColor = vec4(color,1.0);
}
