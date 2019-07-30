import QtQuick 2.0

Rectangle{
    property alias text: l1.text
    property alias lineLength: line.height
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
    }
    Text {
        id: l1
        font.pixelSize: app.fs*0.5
        anchors.centerIn: parent
        color: 'white';
        horizontalAlignment: Text.AlignHCenter
    }
}