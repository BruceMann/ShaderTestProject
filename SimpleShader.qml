import QtQuick 2.11

ShaderEffect {
    property double u_time:0.0
    property point u_resolution
    property point u_mouse
    property string frg_Shader

    Timer{
        id:timer

        property double timeSpan: 0.0
        interval: 30
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: {
            timeSpan+=0.01
//            if(timeSpan>1.0){
//                timeSpan = 0.0
//            }

            u_time = timeSpan
        }
    }

    fragmentShader:frg_Shader
}
