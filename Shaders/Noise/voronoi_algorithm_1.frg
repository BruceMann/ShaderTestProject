uniform vec2 u_resolution;
uniform float u_time;

vec2 random2(vec2 p){
    return fract(sin(vec2(dot(p,vec2(127.1,331.7)),
                          dot(p,vec2(269.5,183.3))
                          )
                     )*43785.5443
                 );
}

void main(){
    vec2 st = gl_FragCoord.xy/u_resolution.xy;

    vec3 color = vec3(.0);

    st*=8.0;

    vec2 i_pos = floor(st);
    vec2 f_pos = fract(st);

   //vec2 pos = random2(i_pos);
   //
   //float dis = distance(pos,f_pos);
   //
   //vec3 color = vec3(dis);
   //
   //color +=1.0 - step(0.01,dis);

    float m_dist = 1.;    //minimun distance
    vec2 m_point;         //minimun point

    for(int y=-1;y<=1;++y){
        for(int x=-1;x<=1;++x){
            //Neighbor place in the grid
            vec2 neighbor = vec2(float(x),float(y));

            //Random position from current + neightbor place in the grid
            vec2 point = random2(neighbor+i_pos);

            //Animate the point
            point = 0.5 + 0.5*sin(u_time + 6.2831*point);

            //Vector between the pixel and point
            vec2 diff = neighbor + point - f_pos;

            //Distance the point
            float dist = length(diff);

            //Keep the close distance
            //m_dist = min(dist,m_dist);
            if(dist<m_dist){
                m_dist = dist;
                m_point = point;
            }
        }
    }

    //Assign a color using the closest point position
    color+=dot(m_point,vec2(.3,.6));

    color.g+=m_point.x;

    //draw the distance
    //color += m_dist;

    //Show isolines
    //color -= abs(sin(40.0*m_dist))*0.07;

    //draw the cell center
    //color += 1.0-step(0.01,m_dist);

    //draw the grid
    //color.r +=step(.98,f_pos.x)+step(.98,f_pos.y);

    //draw the ball
    //color = vec3(.9 - color*2.0)*vec3(255,193,193)/vec3(255);

    gl_FragColor = vec4(color,1.0);

}


