import QtQuick 2.7
import QtGraphicalEffects 1.0

Rectangle {
    id: r
    width: 500
    height: 500
    color: 'transparent'
    property color c1: 'red'
    property color c2: 'red'
    property color c3: 'red'
    property color c4: 'red'
    SequentialAnimation{
        //running: true
        loops: Animation.Infinite

        NumberAnimation {
            target: r
            property: "rotation"
            from: 0
            to:180
            duration: 5000
            //easing.type: Easing.InOutQuad
        }
    }

    Rectangle {
        id: background
        anchors.fill: parent
        radius: width*0.5
        color: 'blue'
        Rectangle {
            id: left
            height: parent.height/2
            anchors.left: parent.left
            width: parent.width / 2
            color: "red"
            opacity: 0.25
        }

        Item {
            id: r1
            height: parent.height/2
            anchors.bottom: parent.verticalCenter
            anchors.left: parent.left
            width: parent.width / 2
            Rectangle{
                anchors.fill: parent
                color: 'red'
                gradient: Gradient {
                    GradientStop {
                        position: 0.00;
                        color: "#ff0000";
                    }
                    GradientStop {
                        position: 1.00;
                        color: "#2e00ff";
                    }
                }
                opacity: 0.25
            }
            //border.width: 2
            //border.color: 'white'
            Text {
                text: '1'
                color: 'white'
                font.pixelSize: parent.width*0.5
                anchors.centerIn: parent
            }
        }

        Item {
            id: r2
            height: parent.height/2
            anchors.bottom: parent.verticalCenter
            anchors.right: parent.right
            width: parent.width / 2
            Rectangle{
                anchors.fill: parent
                color: 'red'
                gradient: Gradient {
                    GradientStop {
                        position: 0.00;
                        color: "#ff0000";
                    }
                    GradientStop {
                        position: 1.00;
                        color: "#c606ec";
                    }
                }
                opacity: 0.50
            }
            //border.width: 2
            //border.color: 'white'
            Text {
                text: '2'
                color: 'white'
                font.pixelSize: parent.width*0.5
                anchors.centerIn: parent
            }
        }
        Item {
            id: r3
            height: parent.height/2
            anchors.top: parent.verticalCenter
            anchors.right: parent.right
            width: parent.width / 2
            Rectangle{
                anchors.fill: parent
                color: 'red'
                gradient: Gradient {
                    GradientStop {
                        position: 0.00;
                        color: "#ff0000";
                    }
                    GradientStop {
                        position: 1.00;
                        color: "#2e00ff";
                    }
                }
                //opacity: 0.25
            }
            //border.width: 2
            //border.color: 'white'
            Text {
                text: '3'
                color: 'white'
                font.pixelSize: parent.width*0.5
                anchors.centerIn: parent
            }
        }
        Item {
            id: r4
            height: parent.height/2
            anchors.top: parent.verticalCenter
            anchors.left: parent.left
            width: parent.width/2
            Rectangle{
                anchors.fill: parent
                color: 'red'
                gradient: Gradient {
                    GradientStop {
                        position: 0.00;
                        color: "#ff0000";
                    }
                    GradientStop {
                        position: 1.00;
                        color: "#2e00ff";
                    }
                }
                opacity: 0.75
            }
            //border.width: 2
            //border.color: 'white'
            Text {
                text: '4'
                color: 'white'
                font.pixelSize: parent.width*0.5
                anchors.centerIn: parent
            }
        }

    }
    Rectangle {
        id: foreground
        anchors.fill: parent
        color: "black"
    }
    Rectangle{
        id: txt
        width: r.width
        height: width
        radius: r.width*0.5
        anchors.centerIn: parent

    }
    OpacityMask {
        anchors.fill: r
        source: background
        maskSource: txt
    }
}
/*import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: r
    Rectangle{
        id: r1
        width: r.width
        height: width
        radius: width*0.5
        anchors.centerIn: r
        border.width: 2
        border.color: 'red'
        clip: true
        color: "transparent"
        Grid{
            anchors.centerIn: parent
            columns: 2
            Rectangle{
                width: r.width
                height: r.height
                color: 'red'
            }
            Rectangle{
                width: r.width
                height: r.height
                color: 'blue'
            }
            Rectangle{
                width: r.width
                height: r.height
                color: 'blue'
            }
            Rectangle{
                width: r.width
                height: r.height
                color: 'red'
            }
        }
    }
    OpacityMask {
        anchors.fill: r1
        source: r1
        maskSource: Rectangle {
            width: r1.width
            height: r1.height
            radius: r1.width*0.5
            visible: false // this also needs to be invisible or it will cover up the image
        }
    }
    Image {
        id: img1
        source: "file:./img/t1.png"
        anchors.fill: r
        SequentialAnimation{
            running: true
            loops: Animation.Infinite

            NumberAnimation {
                target: img1
                property: "rotation"
                from:0
                to:360
                duration: 4000
                //easing.type: Easing.InOutQuad
            }
        }
    }*/


