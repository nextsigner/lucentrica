import QtQuick 2.0

Rectangle {
    id: r
    border.width: showBorders?2:0
    border.color: 'red'
    color: 'transparent'
    property int s: 0
    property bool showBorders
    property bool showingPeriApo
    property bool forcingPeriApo
    property bool runRotation
    onRunRotationChanged: {
        if(!runRotation&&!forcingPeriApo){
            nal1.duration=100
            l1.opacity=0.0
        }
    }
    Rectangle{
        border.width: app.fs*0.1
        border.color: 'white'
        anchors.fill: r
        radius: width*0.5
        color: "transparent"
    }
    L1{
        id:l1
        anchors.top: r.top
        anchors.topMargin: 0-width/2
        anchors.horizontalCenter: r.horizontalCenter
        Behavior on opacity {NumberAnimation{id:nal1;duration: 1000}}
        onOpacityChanged: {
            if(opacity===0.0){
                r.rotation=0
                r.s=0
                tl1.start()
            }

        }
        Timer{
            id:tl1
            repeat: false
            interval: 1000
            onTriggered: {
                nal1.duration=1000
                l1.opacity=1.0
            }
        }
    }
    SequentialAnimation{
        id: anRot2
        running: r.runRotation&&!r.showingPeriApo
        loops: Animation.Infinite
        onStarted: r.rotation=0
        NumberAnimation {
            target: r
            property: "rotation"
            from: 0
            to:-360
            duration: 8000
        }
    }
    SequentialAnimation{
        id: anRot
        running: r.runRotation&&r.showingPeriApo
        loops: Animation.Infinite
        //onStarted: r.rotation=-90
        ScriptAction{
            script: {
                r.s=0
                r.rotation=0
            }
        }
        NumberAnimation {
            target: r
            property: "rotation"
            to:-90
            duration: 2000
        }
        ScriptAction{
            script: {
                r.s=2
            }
        }
        PauseAnimation {
            duration: 3000
        }
        NumberAnimation {
            target: r
            property: "rotation"
            to:-180
            duration: 2000
        }
        NumberAnimation {
            target: r
            property: "rotation"
            to:-270
            duration: 2000
        }
        ScriptAction{
            script: {
                r.s=1
                //r.rotation=90
            }
        }
        PauseAnimation {
            duration: 3000
        }
        NumberAnimation {
            target: r
            property: "rotation"
            to:-360
            duration: 2000
        }
    }
}
