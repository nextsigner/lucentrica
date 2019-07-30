import QtQuick 2.0

Rectangle{
    id: r
    property int t: 0
    color: 'transparent'
    border.color: 'white'
    border.width: 2
    radius: 4
    width: l3.contentWidth+app.fs
    height: app.fs*1.5
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.horizontalCenterOffset: r.t===0?0-r.parent.width/2-r.width/2-app.fs*2:r.parent.width/2+r.width/2+app.fs*2
    Xbg1{}
    Rectangle{
        //anchors.horizontalCenter: parent.horizontalCenter;
        //anchors.horizontalCenterOffset: r.t===0?r.width-app.fs:0-r.width+app.fs
        anchors.left: r.t===0?r.right:undefined
        anchors.right: r.t!==0?r.left:undefined
        width: app.fs*2
        height: 1
        anchors.verticalCenter: r.verticalCenter
        //anchors.left: r.right
        color: 'white'
    }
    Text {
        id: l3
        text: r.t===0?'Perigeo':'Apogeo'
        font.pixelSize: app.fs
        anchors.centerIn: parent
        color: 'white';
    }
}
