import QtQuick 2.0

Item {
    id: r
    width: app.fs*2
    height: width
    Image {
        id: img1
        source: "file:./img/sol1.png"
        anchors.fill: r
        antialiasing: true
    }
}

