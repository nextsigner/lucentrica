import QtQuick 2.0

Item {
    id: r
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
    }

}
