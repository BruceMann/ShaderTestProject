import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11
Window {
    id:rootWindow
    visible: true
    width: 900
    height: 900
    color:"#1e1e1e"

    SimpleShader{
        id:spShader_1
        x:0
        y:0
        //anchors.right: rootWindow.right
        width: parent.width
        height: parent.height
        u_resolution: Qt.point(width,height)
        frg_Shader: "qrc:/Shaders/Noise/tiling_iteration_1.frg"

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onPositionChanged:{
//                console.log(mouseX,mouseY)
                spShader_1.u_mouse = Qt.point(mouseX,rootWindow.height - mouseY)

            }
        }
    }

//    SimpleShader{
//        id:spShader_2
//        x:rootWindow.width/2
//        y:rootWindow.height/2
//        width: parent.width/2
//        height: parent.height/2
//        u_resolution: Qt.point(spShader_2.width,spShader_2.height)
//        frg_Shader: "qrc:/rotation.frg"
//    }

//    Component.onCompleted: {
//        console.log(spShader_1.x,spShader_1.y)
//        console.log(spShader_2.x,spShader_2.y+480)
////        spShader_2.u_resolution = Qt.point(spShader_2.width,spShader_2.height)
//    }







//    Image{
//        id:sourceImage
//        anchors.fill: parent
//        source: "./images/600px-NGC7293_(2004).jpg"
//        //visible: false
//    }
//    Text {
//        anchors.centerIn: parent
//        font.pixelSize: 48
//        color: '#efefef'
//        text: 'Qt5 Cadaques'
//    }
//    CurtainEffect {
//        id: curtain
//        anchors.fill: parent
//    }
//    MouseArea {
//        anchors.fill: parent
//        onClicked: curtain.open = !curtain.open
//    }


//    Rectangle{
//        anchors.fill: parent
//        color:"#333333"

//        GenieEffect{
//            source: sourceImage
//            anchors.fill: parent
//            MouseArea{
//                anchors.fill: parent
//                onClicked: parent.minimized = !parent.minimized
//            }
//        }
//    }


//    LoginPage{
//        id:loginPage
//        anchors.fill: parent
////        visible: false

//        onLoginClicked: {
//            anima.start()
//        }
//    }

//    ShaderEffectSource{
//        id:pageSource
//        sourceItem: loginPage
//    }

//    ShaderEffect {
//        width: rootWindow.width
//        height: rootWindow.height
//        //! [properties]
//        property variant source: pageSource
//        property real bend: 1
//        property real side: 0
//        NumberAnimation on bend {id:anima;
//            to: 0;
//            duration: 700;
//            easing.type: Easing.InOutSine
//            running: false
//        }
//            //loops: Animation.Infinite
//            NumberAnimation { to: 0; duration: 700; easing.type: Easing.InOutSine }
////            PauseAnimation { duration: 1600 }
////            NumberAnimation { to: 0; duration: 700; easing.type: Easing.InOutSine }
////            PauseAnimation { duration: 1000 }
////        }

//        //! [properties]
//        //! [vertex]
//        mesh: Qt.size(10, 10)
//        vertexShader: "
//            uniform highp mat4 qt_Matrix;
//            uniform highp float bend;

//            uniform highp float side;
//            uniform highp float width;
//            uniform highp float height;
//            attribute highp vec4 qt_Vertex;
//            attribute highp vec2 qt_MultiTexCoord0;
//            varying highp vec2 qt_TexCoord0;
//            void main() {
//                qt_TexCoord0 = qt_MultiTexCoord0;
//                highp vec4 pos = qt_Vertex;
//                pos.x = mix(qt_Vertex.x, -width, bend);
//                gl_Position = qt_Matrix * pos;
//            }"
//        //! [vertex]

//    }

//    ShaderEffectSource{
//        id:pageSource
//        sourceItem: loginPage
//    }

//    ShaderEffect {
//        width: rootWindow.width
//        height: rootWindow.height
//        //! [properties]
//        property variant source: pageSource
//        property real bend: 0
//        property real minimize: 0
//        property real side: 0
//        SequentialAnimation on bend {
//            loops: Animation.Infinite
//            NumberAnimation { to: 1; duration: 700; easing.type: Easing.InOutSine }
//            PauseAnimation { duration: 1600 }
//            NumberAnimation { to: 0; duration: 700; easing.type: Easing.InOutSine }
//            PauseAnimation { duration: 1000 }
//        }
//        SequentialAnimation on minimize {
//            loops: Animation.Infinite
//            PauseAnimation { duration: 300 }
//            NumberAnimation { to: 1; duration: 700; easing.type: Easing.InOutSine }
//            PauseAnimation { duration: 1000 }
//            NumberAnimation { to: 0; duration: 700; easing.type: Easing.InOutSine }
//            PauseAnimation { duration: 1300 }
//        }
//        //! [properties]
//        //! [vertex]
//        mesh: Qt.size(10, 10)
//        vertexShader: "
//            uniform highp mat4 qt_Matrix;
//            uniform highp float bend;
//            uniform highp float minimize;
//            uniform highp float side;
//            uniform highp float width;
//            uniform highp float height;
//            attribute highp vec4 qt_Vertex;
//            attribute highp vec2 qt_MultiTexCoord0;
//            varying highp vec2 qt_TexCoord0;
//            void main() {
//                qt_TexCoord0 = qt_MultiTexCoord0;
//                highp vec4 pos = qt_Vertex;
//                pos.y = mix(qt_Vertex.y, height, minimize);
//                highp float t = pos.y / height;
//                t = (3. - 2. * t) * t * t;
//                pos.x = mix(qt_Vertex.x, side * width, t * bend);
//                gl_Position = qt_Matrix * pos;
//            }"
//        //! [vertex]

//    }

}
