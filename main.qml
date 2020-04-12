import QtQuick 2.12
import QtQuick.Controls 2.0
import "qrc:/"

ApplicationWindow {
    id: app
    visible: true
    visibility: "Maximized"
    color: app.c1
    property int fs: width*0.03
    property color c1
    property color c2
    property color c3
    property color c4

    USettings{
        id: unikSettings
        property color c1
        property color c2
        property color c3
        property color c4
        url: './lucentrica.json'
        Component.onCompleted: {
            unikSettings.currentNumColor=0
            var tcs=unikSettings.defaultColors.split('|')
            var c=tcs[unikSettings.currentNumColor].split('-')
            app.c1=c[0]
            app.c2=c[1]
            app.c3=c[2]
            app.c4=c[3]
        }
    }
    Column{
        anchors.centerIn: parent
        spacing: app.fs*0.5
        Text{
            text: unikSettings.lang==='es'?'<b>Teorìa Lucèntrica</b>':'<b>Theory Lucèntrica</b>'
            font.pixelSize: app.fs
            color: app.c2
        }
        Text{
            text: unikSettings.lang==='es'?'Lenguaje actual Español':'Current Languaje English'
            font.pixelSize: app.fs
            color: app.c2
        }
        Row{
            spacing: app.fs
            Text{
                text: unikSettings.lang==='es'?'Select Languaje':'Seleccionar Idioma'
                font.pixelSize: app.fs
                color: app.c2
            }
            Button{
                text: unikSettings.lang==='es'?'Español':'Spanish'
                font.pixelSize: app.fs
                onClicked: unikSettings.lang==='es'?unikSettings.lang='en':unikSettings.lang='es'
                opacity: unikSettings.lang==='es'?1.0:0.65
            }
            Button{
                text: unikSettings.lang==='es'?'Ingles':'English'
                font.pixelSize: app.fs
                onClicked: unikSettings.lang==='en'?unikSettings.lang='es':unikSettings.lang='en'
                opacity: unikSettings.lang==='en'?1.0:0.65
            }
        }
        Text{
            text: unikSettings.lang==='es'?'<b>Seleccionar versión</b>':'<b>Select version</b>'
            font.pixelSize: app.fs
            color: app.c2
        }
        Repeater{
            model: ["v1.0", "v1.1"]
            Button{
                text: '<b>'+modelData+'</b>'
                font.pixelSize: app.fs
                onClicked: {
                    opacity=0.65
                    run(modelData)
                }
            }
        }
    }
    UWarnings{}
    Shortcut{
        sequence: 'Esc'
        onActivated: Qt.quit()
    }
    Component.onCompleted: {
        //engine.clearComponentCache()
    }
    function run(folder){
        unik.cd(unik.currentFolderPath()+'/'+folder)
        engine.load('./main.qml')
    }
}
