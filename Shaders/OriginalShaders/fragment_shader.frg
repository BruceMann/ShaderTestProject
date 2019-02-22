varying highp vec2 qt_TexCoord0;
uniform sampler2D source;
uniform lowp float qt_Opacity;

void main() {
    //gl_FragColor = texture2D(source, qt_TexCoord0) * qt_Opacity;
    gl_FragColor = vec4(vec3(gl_FragCoord.x/500.0,gl_FragCoord.y/500.0,0.0),1.0);
}
