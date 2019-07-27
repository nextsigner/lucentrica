import QtQuick 2.0

Rectangle {
    id: r
    border.width: showBorders?2:0
    border.color: 'red'
    color: 'transparent'
    property bool showBorders
    property int solXOffSet: 0
    Behavior on solXOffSet{
        NumberAnimation{duration: 250}
    }
    Rectangle{
        border.width: app.fs*0.1
        border.color: 'white'
        anchors.fill: r
        radius: width*0.5
        color: "transparent"
    }
    S1{
        width: app.fs*18
        height: width
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: r.solXOffSet
        Rectangle{
            color: 'transparent'
            border.color: 'white'
            border.width: 2
            radius: 4
            width: l2.contentWidth+app.fs
            height: l2.contentHeight+app.fs*1.5
            anchors.bottom: parent.top
            anchors.bottomMargin: 0-app.fs*2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: app.fs*8
            Rectangle{
                anchors.fill: parent
                color: 'black'
                opacity: 0.5

            }
            Rectangle{
                width: app.fs*2;
                height: 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.left
                color: 'white'
                Rectangle{
                    anchors.left: parent.left
                    width: 2;
                    height: app.fs*6
                    anchors.top: parent.bottom
                    color: 'white'

                }
            }

            Text {
                id: l2
                text: r.solXOffSet===0?r.t1:r.t2
                width: app.fs*12
                anchors.centerIn: parent
                textFormat: Text.RichText
                wrapMode: Text.WordWrap
                font.pixelSize: app.fs*0.75
                color: 'white'
            }
        }
    }
    property string t1
    property string t2
    Component.onCompleted: {
        t1='<b>Solticio de Verano</b><br>El Sol está a una distancia de<br>147 Millones de Km de la Tierra.<br>Esto sucede aproximadamente entre el 21/12 y el 04/01.'
        t2='<b>Solticio de Invierno</b><br>El Sol está a una distancia de<br>152 Millones de Km de la Tierra.<br>Esto sucede aproximadamente entre el 21/06 y el 04/07.'
    }
}
