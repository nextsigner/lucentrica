import QtQuick 2.12
import QtQuick.Controls 2.0

ApplicationWindow {
    id: app
    visible: true
    visibility: "Maximized"
    color: 'black'
    property int fs: width*0.03
    property string moduleName: 'lucentrica-master'
    Column{
        anchors.centerIn: parent
        spacing: app.fs
        Text{
            text: '<b>Seleccionar versión</b>'
            font.pixelSize: app.fs
            color: 'white'
        }
        Repeater{
            model: ["v1.0", "v1.1"]
            Button{
                text: '<b>'+modelData+'</b>'
                font.pixelSize: app.fs
                onClicked: run(modelData)
            }
        }
    }
    Shortcut{
        sequence: 'Esc'
        onActivated: Qt.quit()
    }
    function run(folder){
        var params='-folder='+pws+'/'+app.moduleName+'/'+folder
        unik.setUnikStartSettings(params)
        if(Qt.platform.os==='android'){
		unik.restartApp()
	}else{
		unik.restartApp("")
    	}
   }
}
