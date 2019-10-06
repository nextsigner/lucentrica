import QtQuick 2.0

Item {
    id: r
    property bool showingFromSouthPole
    property real velocity: 1.0
    property bool rotationEnable: false
    onVelocityChanged: {
        console.log('Velociy: '+velocity)
        numAn1.duration=5000/28*r.velocity
        numAn2.duration=5000/28*r.velocity
        numAn3.duration=5000/28*r.velocity
        if(anRot0.running){
            anRot0.restart()
        }
        if(anRot1.running){
            anRot1.restart()
        }
        if(anACero1.running){
            anACero1.restart()
        }
    }
    Xtag{
        text: 'Planeta Tierra'
        lineLength: app.fs
        anchors.bottom: parent.top
        anchors.bottomMargin: app.fs
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Image {
        id: img1
        source: r.showingFromSouthPole?"file:./img/t1.png":"file:./img/t2.png"
        anchors.fill: r
        antialiasing: true
        SequentialAnimation{
            id:anRot0
            running: r.showingFromSouthPole&&r.rotationEnable
            loops: Animation.Infinite
            NumberAnimation {
                id: numAn1
                target: img1
                property: "rotation"
                from:0
                to:360
                duration: 5000/28*r.velocity
                //easing.type: Easing.InOutQuad
            }
        }
        SequentialAnimation{
            id:anRot1
            running: !r.showingFromSouthPole&&r.rotationEnable
            loops: Animation.Infinite

            NumberAnimation {
                id: numAn2
                target: img1
                property: "rotation"
                from:0
                to:-360
                duration: 5000/28*r.velocity
                //easing.type: Easing.InOutQuad
            }
        }
        SequentialAnimation{
            id: anACero1
            running: !r.rotationEnable
            NumberAnimation {
                id:numAn3
                target: img1
                property: "rotation"
                from:img1.rotation
                to:0
                duration: 5000/28*r.velocity
            }
        }
    }

}
