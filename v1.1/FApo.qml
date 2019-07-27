import QtQuick 2.0

Item {
    id: r
    F1{
        id: f1
        width: app.fs*7
        height: app.fs
        rotation: -180
        anchors.right: r.left
    }
    Row{
        anchors.top: f1.bottom
        Repeater{
            model: 1
            F2{
                id: f2
                width: app.fs*8
                height: app.fs
                c:6
            }
        }
    }
    Rectangle{
        width: 2
        height: app.fs*6
        color: 'yellow'
        //anchors.right: f1.left
        anchors.top: f1.top
        Rectangle{
            width: lFPeri.contentWidth*1.2
            height: lFPeri.contentHeight+app.fs
            color: 'black'
            border.width: 2
            border.color: 'yellow'
            anchors.left: parent.right
            anchors.top: parent.bottom
            Text {
                id: lFPeri
                font.pixelSize: app.fs
                color: 'white'
                horizontalAlignment: Text.AlignHCenter
                text: 'Doble Atracción\n<b>2 sentidos</b>'
                textFormat: Text.RichText
                anchors.centerIn: parent
            }
        }
    }

}
