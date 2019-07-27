import QtQuick 2.0

Item {
    id: r
    F1{
        id: f1
        width: app.fs*14
        height: app.fs
    }
    F2{
        id: f2
        width: app.fs*28
        height: app.fs
        c:10
        anchors.top: f1.bottom
            Rectangle{
                width: lF.contentWidth*1.2
                height: lF.contentHeight+app.fs
                color: 'black'
                border.width: 2
                border.color: 'yellow'
                anchors.left: parent.right
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    id: lF
                    font.pixelSize: app.fs
                    color: 'white'
                    horizontalAlignment: Text.AlignHCenter
                    text: 'A Centro<br>de Galaxia'
                    textFormat: Text.RichText
                    anchors.centerIn: parent
                }
            }

    }
    Rectangle{
        width: 2
        height: app.fs*6
        color: 'yellow'
        anchors.right: f1.left
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
                text: 'Doble Atracción\n<b>1 sentido</b>'
                textFormat: Text.RichText
                anchors.centerIn: parent
            }
        }
    }

}
