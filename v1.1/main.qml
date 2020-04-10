import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Window 2.0
import QtMultimedia 5.12
import Qt.labs.settings 1.1
ApplicationWindow{
    id: app
    visible: true
    visibility: "FullScreen"//"Maximized"
    property int fs: Screen.width*0.018
    property color c1
    property color c2
    property color c3
    property color c4

    property int p: apps.up
    property string version: '1.1'
    Settings{
        id: apps
        property string lang
        property int up
        onUpChanged: setP()
        Component.onCompleted: {
            if(!lang)lang='es'
        }
    }
    USettings{
        id: unikSettings
        url:'conflucentrica'
        Component.onCompleted: {
            unikSettings.currentNumColor=0
            var tcs=unikSettings.defaultColors.split('|')
            var c=tcs[unikSettings.currentNumColor].split('-')
            c1=c[0]
            c2=c[1]
            c3=c[2]
            c4=c[3]
        }
    }
    MediaPlayer{
        id:mp
        autoPlay: true
    }
    Item{
        id: xApp
        anchors.fill: parent
        XIntoCol{
            id: xIntroCol
            visible: apps.up===0
            onTerminado: apps.up=0
        }
        X1{
            id: x1
            visible: apps.up===1
            onTerminado: apps.up=2
        }
        X2{id: x2; visible: apps.up===2}
        //UWarnings{}
    }



    Timer{
        running: true
        repeat: false
        interval: 1000
        onTriggered: {
            setP()
        }
    }
    Shortcut{
        sequence: 'Esc'
        onActivated: Qt.quit()
    }
    Shortcut{
        sequence: 'Ctrl+1'
        onActivated: apps.up=0
    }
    Shortcut{
        sequence: 'Ctrl+2'
        onActivated: apps.up=1
    }
    Shortcut{
        sequence: 'Right'
        onActivated: {
            if(apps.up<xApp.children.length-1){
                apps.up++
            }
        }
    }
    Shortcut{
        sequence: 'Left'
        onActivated: {
            if(apps.up>0){
                apps.up--
            }
        }
    }
    function setP(){
        if(apps.up===0){
            xIntroCol.opacity=1.0
            x1.opacity=0.0
            x2.opacity=0.0
        }
        if(apps.up===1){
            xIntroCol.opacity=0.0
            x1.opacity=1.0
            x2.opacity=0.0
        }
        if(apps.up===2){
            xIntroCol.opacity=0.0
            x1.opacity=0.0
            x2.opacity=1.0
        }
    }
}
