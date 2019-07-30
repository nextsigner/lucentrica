import QtQuick 2.0

Rectangle {
    id: r
    width: app.fs*2
    height: width
    border.width: apps.showBorders?2:0
    border.color: 'green'
    color: 'transparent'
    Image {
        id: img1
        source: "file:./img/luna1.png"
        anchors.fill: r
    }
}
