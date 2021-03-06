import QtQuick 2.0

Rectangle {
    id: r
    border.width: showBorders?2:0
    border.color: 'red'
    color: 'transparent'
    property int s: 0
    property bool showBorders
    property bool showingPeriApo
    property bool showTags
    property bool showingFromSouthPole
    property bool forcingPeriApo
    property bool runRotation
    property real velocity: 1.0
    antialiasing: true

    onVelocityChanged: {
        numAnN1.duration=1000*r.velocity
        numAnN2.duration=1000*r.velocity
        numAnN3.duration=2000*r.velocity
        numAnN4.duration=2000*r.velocity

        numAn3N1.duration=1000*r.velocity
        numAn3N2.duration=1000*r.velocity
        numAn3N3.duration=2000*r.velocity
        numAn3N4.duration=2000*r.velocity

        numAn2N1.duration=1000*r.velocity
        numAn2N2.duration=750*r.velocity
        numAn2N3.duration=500*r.velocity
        numAn2N4.duration=250*r.velocity
        numAn2N5.duration=250*r.velocity
        numAn2N6.duration=500*r.velocity
        numAn2N7.duration=750*r.velocity
        numAn2N8.duration=1000*r.velocity

        numAn4N1.duration=250*r.velocity
        numAn4N2.duration=500*r.velocity
        numAn4N3.duration=750*r.velocity
        numAn4N4.duration=1000*r.velocity
        numAn4N5.duration=1000*r.velocity
        numAn4N6.duration=750*r.velocity
        numAn4N7.duration=500*r.velocity
        numAn4N8.duration=250*r.velocity

        if(anRot.running){
            anRot.restart()
        }
        if(anRot2.running){
            anRot2.restart()
        }
        if(anRot3.running){
            anRot3.restart()
        }
        if(anRot4.running){
            anRot4.restart()
        }
    }
    onRunRotationChanged: {
        if(!runRotation&&!forcingPeriApo){
            nal1.duration=100
            l1.opacity=0.0
        }
    }
    Rectangle{
        border.width: app.fs*0.05
        border.color: 'white'
        anchors.fill: r
        radius: width*0.5
        color: "transparent"
        antialiasing: true
    }
    Item{
        id:rLuna
        anchors.fill: r
        L1{
            id:l1
            anchors.top: rLuna.top
            anchors.topMargin: 0-width/2
            anchors.horizontalCenter: rLuna.horizontalCenter
            Behavior on opacity {NumberAnimation{id:nal1;duration: 1000}}

            onOpacityChanged: {
                if(opacity===0.0){
                    rLuna.rotation=0
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
            running: r.runRotation&&!r.showingPeriApo&&!r.showingFromSouthPole
            loops: Animation.Infinite
            onStarted: rLuna.rotation=0
            NumberAnimation {
                id:numAn2N1
                target: rLuna
                property: "rotation"
                from: 90
                to: 45
                duration: 1000*r.velocity
                //easing.type: Easing.InOut
            }
            NumberAnimation {
                id: numAn2N2
                target: rLuna
                property: "rotation"
                from: 45
                to: 0
                duration: 750*r.velocity
                //easing.type: Easing.InOut
            }
            NumberAnimation {
                id: numAn2N3
                target: rLuna
                property: "rotation"
                from: 0
                to:-45
                duration: 500*r.velocity
                //easing.type: Easing.InOut
            }
            NumberAnimation {
                id: numAn2N4
                target: rLuna
                property: "rotation"
                from: -45
                to:-90
                duration: 250*r.velocity
                //easing.type: Easing.InOut
            }
            NumberAnimation {
                id: numAn2N5
                target: rLuna
                property: "rotation"
                from: -90
                to:-135
                duration: 250*r.velocity
                //easing.type: Easing.InOut
            }
            NumberAnimation {
                id: numAn2N6
                target: rLuna
                property: "rotation"
                from: -135
                to:-180
                duration: 500*r.velocity
                //easing.type: Easing.InOut
            }
            NumberAnimation {
                id: numAn2N7
                target: rLuna
                property: "rotation"
                from: -180
                to:-225
                duration: 750*r.velocity
                //easing.type: Easing.InOut
            }
            NumberAnimation {
                id: numAn2N8
                target: rLuna
                property: "rotation"
                from: -225
                to:-270
                duration: 1000*r.velocity
                //easing.type: Easing.InOut
            }
        }
        SequentialAnimation{
            id: anRot4
            running: r.runRotation&&!r.showingPeriApo&&r.showingFromSouthPole
            loops: Animation.Infinite
            onStarted: rLuna.rotation=0
            NumberAnimation {
                id: numAn4N1
                target: rLuna
                property: "rotation"
                from: -90
                to: -45
                duration: 250*r.velocity
                //easing.type: Easing.InOut
            }
            NumberAnimation {
                id: numAn4N2
                target: rLuna
                property: "rotation"
                from: -45
                to: 0
                duration: 500*r.velocity
                //easing.type: Easing.InOut
            }
            NumberAnimation {
                id: numAn4N3
                target: rLuna
                property: "rotation"
                from: 0
                to:45
                duration: 750*r.velocity
                //easing.type: Easing.InOut
            }
            NumberAnimation {
                id: numAn4N4
                target: rLuna
                property: "rotation"
                from: 45
                to:90
                duration: 1000*r.velocity
                //easing.type: Easing.InOut
            }
            NumberAnimation {
                id: numAn4N5
                target: rLuna
                property: "rotation"
                from: 90
                to:135
                duration: 1000*r.velocity
                //easing.type: Easing.InOut
            }
            NumberAnimation {
                id: numAn4N6
                target: rLuna
                property: "rotation"
                from: 135
                to:180
                duration: 750*r.velocity
                //easing.type: Easing.InOut
            }
            NumberAnimation {
                id: numAn4N7
                target: rLuna
                property: "rotation"
                from: 180
                to:225
                duration: 500*r.velocity
                //easing.type: Easing.InOut
            }
            NumberAnimation {
                id: numAn4N8
                target: rLuna
                property: "rotation"
                from: 225
                to:270
                duration: 250*r.velocity
                //easing.type: Easing.InOut
            }
        }
        SequentialAnimation{
            id: anRot
            running: r.runRotation&&r.showingPeriApo&&r.showingFromSouthPole
            loops: Animation.Infinite
            //onStarted: r.rotation=-90
            ScriptAction{
                script: {
                    r.s=0
                    rLuna.rotation=0
                }
            }
            NumberAnimation {
                id: numAnN1
                target: rLuna
                property: "rotation"
                to:90
                duration: 1000*r.velocity
            }
            ScriptAction{
                script: {
                    r.s=1
                }
            }
            PauseAnimation {
                duration: 3000
            }
            NumberAnimation {
                id: numAnN2
                target: rLuna
                property: "rotation"
                to:180
                duration: 1000*r.velocity
            }
            NumberAnimation {
                id: numAnN3
                target: rLuna
                property: "rotation"
                to:270
                duration: 2000*r.velocity
            }
            ScriptAction{
                script: {
                    r.s=2
                    //r.rotation=90
                }
            }
            PauseAnimation {
                duration: 3000
            }
            NumberAnimation {
                id: numAnN4
                target: rLuna
                property: "rotation"
                to:360
                duration: 2000*r.velocity
            }
        }
        SequentialAnimation{
            id: anRot3
            running: r.runRotation&&r.showingPeriApo&&!r.showingFromSouthPole
            loops: Animation.Infinite
            //onStarted: r.rotation=-90
            ScriptAction{
                script: {
                    r.s=0
                    rLuna.rotation=0
                }
            }
            NumberAnimation {
                id: numAn3N1
                target: rLuna
                property: "rotation"
                to:-90
                duration: 1000*r.velocity
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
                id: numAn3N2
                target: rLuna
                property: "rotation"
                to:-180
                duration: 1000*r.velocity
            }
            NumberAnimation {
                id: numAn3N3
                target: rLuna
                property: "rotation"
                to:-270
                duration: 2000*r.velocity
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
                id: numAn3N4
                target: rLuna
                property: "rotation"
                to:-360
                duration: 2000*r.velocity
            }
        }

    }    
    Xtag{
        text: 'Velocidad\nMáxima\n1,08 Km/s'
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: app.fs*2
        anchors.right: r.left
        anchors.horizontalCenterOffset: 0-r.width/2
        opacity: rLuna.rotation<-45&&rLuna.rotation>-135?1.0:0.5
        visible: r.showTags&&!r.showingPeriApo
        Behavior on opacity {NumberAnimation {duration: 250}}
    }
    Xtag{
        text: 'Velocidad\nMínima\n0,96 Km/s'
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0-app.fs*2
        anchors.left: r.right
        anchors.horizontalCenterOffset: 0-r.width/2
        opacity: (rLuna.rotation<-225)||rLuna.rotation>45?1.0:0.5
        visible: r.showTags&&!r.showingPeriApo
        Behavior on opacity {NumberAnimation {duration: 250}}
    }
    Xtag{
        text: 'Órbita Lunar\nelipse de baja excentricidad'
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0-app.fs*4
        anchors.right: r.left
        anchors.horizontalCenterOffset: 0-r.width/2
        visible: r.showTags&&!r.showingPeriApo
        Rectangle{
            width: app.fs*1.4
            height: 2
            anchors.left: parent.right
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
        }
    }
}

