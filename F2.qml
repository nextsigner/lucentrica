import QtQuick 2.0

Rectangle {
    id: r
    border.width: showBorders?2:0
    border.color: 'yellow'
    color: 'transparent'
    property bool showBorders: false
    property int c:4
    Row{
        id: row
        spacing: app.fs*0.25
        Repeater{
            id:rep
            model: r.c
            Item{
                id:f
                width: r.width/r.c-row.spacing
                height: r.height
                //border.width: 2
                //border.color: 'red'
                //color: 'transparent'
                Image {
                    id: img1
                    source: "file:./img/f1.png"
                    anchors.fill: parent
                    anchors.centerIn: parent
                }
                SequentialAnimation{
                    id: an
                    loops: Animation.Infinite
                    NumberAnimation {
                        target: f
                        property: "opacity"
                        from:0.0
                        to:1.0
                        duration: 800
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }
    }
    Timer{
        running: true
        repeat: true
        interval: 150
        //onTriggered: an.start()
        property int v: 0
        onTriggered: {
            row.children[v].children[0].visible=!row.children[v].children[0].visible
            if(v<r.c-1){
                v++
            }else{
                v=0
            }
        }
    }
}
