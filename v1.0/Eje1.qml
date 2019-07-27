import QtQuick 2.0

Item {
    id: r
    height: 2
    property alias spacing: r1.spacing
    Row{
        id: r1
        spacing: app.fs*0.25
        Repeater{
            model: 30
            Row{
                spacing: r1.spacing
                Rectangle{width: app.fs; height: r.height}
                Rectangle{width: app.fs*2.5; height: r.height}
            }
        }
    }
}
