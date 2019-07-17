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
            duration: 1500
            from:45
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
        height: txt2.contentHeight*1.2
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
            font.pixelSize: app.fs*0.5
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
        //anchors.centerIn: r
        anchors.verticalCenter: r.verticalCenter
        //anchors.horizontalCenterOffset: 0-r.width*0.1
        Text {
            id: txt1
            text: 'Frío\nAtraido\npor el\nsol'
            font.pixelSize: app.fs*0.5
            color: 'white'
            anchors.centerIn: parent
            rotation: 0-r.rotation
            horizontalAlignment: Text.AlignHCenter
        }
    }
//    Rectangle{
//        width: app.fs*20
//        height: 4
//        anchors.verticalCenter: r.verticalCenter
//        rotation: -45
//    }
    /*F1{
        width: r.width*2
        height: app.fs
        transform: Rotation { id: rot1; origin.x: 0; origin.y: app.fs*0.5; axis { x: 0; y: 1; z: 0 } angle: 54 }
        SequentialAnimation{
            running: true
            loops: Animation.Infinite

            NumberAnimation {
                target: rot1
                property: "angle"
                duration: 1500
                from:0
                to:85
            }
        }
    }*/
}
