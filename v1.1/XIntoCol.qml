import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    id: r
    anchors.fill: parent
    opacity: 0.0
    color: 'black'
    property string moduleName: 'x1'
    signal terminado
    Behavior on opacity{NumberAnimation{duration: 1500}}
    onOpacityChanged: {
        if(opacity===1.0){
            //mp.source='./audio/'+apps.lang+'/'+r.moduleName+'.m4a'
        }
    }
    Column{
        anchors.centerIn: r
        spacing: app.fs
        Text {
            id: t1
            text: '<b>Teoría Lucéntrica</b><br><b style="font-size:'+parseInt(app.fs)+'px;">Lenguaje Castelleno - Versión '+app.version+'</b>'
            textFormat: Text.RichText
            font.pixelSize: app.fs*2
            color: 'white'
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            id: t2
            width: r.width*0.7
            font.pixelSize: app.fs
            wrapMode: Text.WordWrap
            textFormat: Text.RichText
            color: 'white'
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            id: t3
            width: r.width*0.7
            font.pixelSize: app.fs
            wrapMode: Text.WordWrap
            textFormat: Text.RichText
            color: 'white'
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    Button{
        text: 'Siguiente'
        anchors.right: parent.right
        anchors.rightMargin: app.fs
        anchors.bottom: parent.bottom
        anchors.bottomMargin: app.fs
        onClicked: {
            if(mp) mp.stop()
            apps.up++
        }
    }
    Component.onCompleted: {
        var fsp=parseInt(app.fs*1.5)
        var fsp2=parseInt(app.fs*0.75)
        var tt2 = '<span style="font-size:'+fsp+'px;">Necesito tu Ayuda</span><br>
        <span style="font-size:'+fsp2+'px;">Puedes colaborar donando dinero en</span>'
        t2.text=tt2

        var fsp3=parseInt(app.fs*2)
        var tt3 = '<span style="font-size:'+fsp3+'px;">paypal.me/lucentrica</span>'
        t3.text=tt3
    }
}
