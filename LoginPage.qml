import QtQuick 2.9
import QtQuick.Controls 2.4

Rectangle {
    id:loginPage

    signal loginClicked()

    //property alias backgroundImage: bgImage
    color:"#00F8FCFF"
    anchors.fill: parent
//        visible:  false

    //background image
    Image {
        id: bgImage
        visible: false
        anchors.fill: parent
        source: "qrc:/images/login.png"
    }
    ShaderEffectSource{
        id:theSource
        sourceItem: bgImage
    }
//    ShaderEffect{
//        width: loginPage.width
//        height: loginPage.height
//        property variant source: theSource
//        property real redChannel: 0.3
//        visible: root.step>3
//        NumberAnimation on redChannel {
//            id:redChannelAnima
//            from:0.0;to:Math.PI * 2;
//            duration: 1000
//        }
//        fragmentShader: "
//        varying highp vec2 qt_TexCoord0;
//        uniform sampler2D source;
//        uniform lowp float qt_Opacity;
//        uniform lowp float redChannel;
//        void main(){
//            gl_FragColor = texture2D(source,qt_TexCoord0)*vec4(0.5*(sin(redChannel)+1.0),1.0,1.0,1.0)*qt_Opacity;
//        }"
////        fragmentShader: "
////            varying highp vec2 qt_TexCoord0;
////            uniform sampler2D source;
////            uniform lowp float qt_Opacity;
////            uniform highp
////"

//    }

    ShaderEffect {
                width: loginPage.width
                height: loginPage.height
        property variant source: theSource
        property real amplitude: 0.04 * 0.5
        property real frequency: 20
                property real redChannel: 0.3
        property real time: 0
        NumberAnimation on time { loops: Animation.Infinite; from: 0; to: Math.PI * 2; duration: 1600 }
        NumberAnimation on redChannel {
            id:redChannelAnima
            from:1.0;to:0.0;
            duration: 1000
            running: false
        }
//        ! [fragment]
        fragmentShader:
           "uniform lowp float qt_Opacity;
            uniform highp float amplitude;
            uniform highp float frequency;
            uniform highp float time;
            uniform sampler2D source;
            uniform lowp float redChannel;
            varying highp vec2 qt_TexCoord0;
            void main() {
                highp vec2 p = sin(time + frequency * qt_TexCoord0);
                gl_FragColor = texture2D(source, qt_TexCoord0 + amplitude * p) * vec4(redChannel,1.0,1.0,1.0) * qt_Opacity;
            }"


//        ! [fragment]
    }

    //title
    Label{
        id:title
        anchors.top:parent.top
        anchors.topMargin: 94
        anchors.horizontalCenter: parent.horizontalCenter

        text:"互动课堂遥控器"
        color: "#FFFFFF"
        font.pixelSize:28
        //font.family: "微软雅黑"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    //decorate
    Rectangle{
        id:decorateLine
        anchors.top:title.bottom
        anchors.topMargin: 4
        anchors.horizontalCenter: parent.horizontalCenter
        width: title.width
        height: 3.52
        Row{
            anchors.fill: parent
            Repeater{
                model:["#FF7700","#F8C44F","#3497FD","#3ACCE1"]
                Rectangle{
                    width:decorateLine.width/4
                    height: decorateLine.height
                    color:modelData
                }
            }
        }
    }

    //userNam
    TextField{
        id:userName
        anchors.top:title.bottom
        anchors.topMargin: 48
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 15
        //font.family: "微软雅黑"
        color:"#FFFFFF"
        placeholderText: "<font color='#A0FFFFFF'>用户名</font>"
        verticalAlignment: TextInput.AlignVCenter
        leftPadding: 20
//        text: "lambo"
        text: ""

        background: Rectangle{
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -3
            implicitWidth: 327
            implicitHeight: 52
            radius: 12
            color:"#33FFFFFF"
            border.color: "#A0FFFFFF"
            border.width: 1
        }
    }

    //passWord
    TextField{
        id:passWord
        anchors.top:userName.bottom
        anchors.topMargin: 24
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 15
       //font.family: "微软雅黑"
        color:"#FFFFFF"
        echoMode: TextInput.Password
        placeholderText: "<font color='#A0FFFFFF'>密码</font>"
        verticalAlignment: TextInput.AlignVCenter
        leftPadding: 20
//        text: "1023fulan"
        text:""

        background: Rectangle{
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -3
            implicitWidth: 327
            implicitHeight: 52
            radius: 12
            color:"#33FFFFFF"
            border.color: "#A0FFFFFF"
            border.width: 1
        }
    }

    //loginBtn
    Button{
        id:loginBtn
        anchors.top:passWord.bottom
        anchors.topMargin: 44
        anchors.horizontalCenter: parent.horizontalCenter
        implicitWidth: 327
        implicitHeight:52

        contentItem: Text {
            text: "登录"
            font.pixelSize: 15
            //font.family: "微软雅黑"
            color:"#FFFFFF"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle{
            radius: 55
            color: "#FF7141"
        }
        onClicked:{
            redChannelAnima.start()
        loginClicked()
        }
    }

}
