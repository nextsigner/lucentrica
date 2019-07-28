import QtQuick 2.0

Item {
    id: r
    property bool showingFromSouthPole
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
        SequentialAnimation{
            running: r.showingFromSouthPole
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
        SequentialAnimation{
            running: !r.showingFromSouthPole
            loops: Animation.Infinite

            NumberAnimation {
                target: img1
                property: "rotation"
                from:0
                to:-360
                duration: 4000
                //easing.type: Easing.InOutQuad
            }
        }
    }

}
