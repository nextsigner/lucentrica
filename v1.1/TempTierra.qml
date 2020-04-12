import QtQuick 2.7
import QtGraphicalEffects 1.0

Rectangle {
    id: r
    width: 500
    height: 500
    radius: width*0.5
    rotation: 45
    color: 'red'
    SequentialAnimation{
        running: true
        loops: Animation.Infinite

        NumberAnimation {
            target: r
            property: "rotation"
            duration: 2500
            from:0
            to:85
        }
    }

    Image {
        id: img1
        source: "file:./img/f1.png"
        width: r.width*0.2
        height: width
        anchors.right: parent.right
        rotation: 45
    }

    Rectangle{
        color: 'transparent'
        width: txt2.contentWidth*1.2
        height: width//txt2.contentHeight*1.2
        anchors.left: r.right
        anchors.rightMargin: app.fs*4
        radius: width*0.5
        Rectangle{
            anchors.fill: parent
            color:'black'
            radius: parent.radius
            border.width: 2
            border.color: 'white'

        }
        Rectangle{
            width: app.fs*0.5
            height: 2
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.left
        }
        Text {
            rotation: 0-r.rotation
            id: txt2
            text: 'Calor\nRechazado\npor el\nsol'
            font.pixelSize: parent.width*0.15
            color: 'white'
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
        }
    }
    Rectangle{
        width: r.width*0.75
        height: width*1.075
        radius: width*0.5
        color: 'blue'
        anchors.verticalCenter: r.verticalCenter
        Image {
            id: img2
            source: "file:./img/f1.png"
            width: r.width*0.2
            height: width
            rotation: -60-r.rotation+70
            Rectangle{
                width: app.fs*6
                height: 2
                anchors.left: parent.right
                anchors.verticalCenter: parent.verticalCenter
                antialiasing: true
                color: 'transparent'
                F1{
                    width: parent.width
                    height: app.fs
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
        Text {
            id: txt1
            text: 'Frío\nAtraido\npor el\nsol'
            font.pixelSize: parent.width*0.25
            color: 'white'
            anchors.centerIn: parent
            rotation: 0-r.rotation
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
