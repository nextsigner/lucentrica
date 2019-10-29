import QtQuick 2.0

Rectangle{
    id: r
    property alias text: l1.text
    property alias lineLength: line.height
    property int lineDir: 0
    color: 'transparent'
    border.color: 'white'
    border.width: 2
    radius: 4
    width: l1.contentWidth+app.fs
    height: l1.contentHeight+app.fs*0.5
    Xbg1{}
    Rectangle{
        id: line
        anchors.horizontalCenter: parent.horizontalCenter;
        width: 2;
        anchors.top: parent.bottom
        color: 'white'
        visible: r.lineDir===0
    }
    Rectangle{
        id: line2
        anchors.horizontalCenter: parent.horizontalCenter;
        width: 2;
        height: r.lineLength
        anchors.bottom: parent.top
        color: 'white'
        visible: r.lineDir===1
    }
    Text {
        id: l1
        font.pixelSize: app.fs*0.5
        anchors.centerIn: parent
        color: 'white';
        horizontalAlignment: Text.AlignHCenter
    }
}
