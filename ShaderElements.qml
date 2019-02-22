import QtQuick 2.5

Rectangle {
    width: 480; height: 240
    color: '#001e1e1e'

    Row {
        anchors.centerIn: parent
        spacing: 20
        Image {
            id: sourceImage
            width: 80; height: width
            source: 'qrc:/images/tulip.jpg'
        }
        ShaderEffect {
            id: effect
            width: 80; height: width
            property variant source: sourceImage
        }
        ShaderEffect {
            id: effect2
            width: 80; height: width
            // the source where the effect shall be applied to
            //property variant source: sourceImage
            // default vertex shader code
            vertexShader: "qrc:/Shaders/OriginalShaders/vertex_shader.vtx"
            // default fragment shader code
            fragmentShader: "qrc:/Shaders/OriginalShaders/fragment_shader.frg"
        }
    }
}
