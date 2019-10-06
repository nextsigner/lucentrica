import QtQuick 2.0
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0
import QtQuick.Window 2.0

Rectangle {
    id: r
    anchors.fill: parent
    color: 'black'
    opacity: 0.0
    antialiasing: true
    property string moduleName: 'x2'
    signal terminado
    Behavior on opacity{NumberAnimation{duration: 1500}}
    Settings{
        id: ms
        category: 'lc-'+r.moduleName
        property bool showBorders
        property bool showL1
        property bool showPeriApo
        property bool showEje1
        property bool showFS1
        property bool showFS2
        property int view
        property bool runOl
        property bool velGiroRap: false
    }
    onVisibleChanged: {
        if(visible)opacity=1.0
    }
    onOpacityChanged: {
        if(opacity===1.0){
            //mp.source='x1.m4a'
        }
    }
    Column{
        width: r.width-app.fs
        height: r.height-app.fs
        anchors.centerIn: r
        spacing: app.fs*0.5
        Item{
            id:xTit
            width: parent.width
            height: app.fs*1.5
            Text {
                id: t1
                text: '<b>Teoría Lucéntrica</b>'
                font.pixelSize: app.fs*2
                color: 'white'
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: app.fs*0.1
            }
        }
        Row{
            height: xOl.height
            Item{
                id:xOl
                width: r.width*0.5
                height: r.height-xTit.height-app.fs*2-rowBtns.children[0].height
                Os1{
                    id:os1
                    width: app.fs*32
                    height: width
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.horizontalCenter
                    showBorders: ms.showBorders
                    showSoltDes: modo.checked
                }
                Rectangle{
                    id:xDes
                    width: parent.width-app.fs
                    height: (parent.height-ol1.height)/2-app.fs*2
                    anchors.horizontalCenter: ol1.horizontalCenter
                    //anchors.horizontalCenterOffset: app.fs
                    color: 'transparent'
                    border.width: 2
                    border.color: 'white'
                    visible: ol1.s===1&&ms.showPeriApo||ol1.s===2&&ms.showPeriApo||setPeri.checked||setApo.checked
                    radius: app.fs*0.25
                    antialiasing: true
                    Xbg1{

                    }
                    Text {
                        id: des
                        text: 'Modelo explicativo fuera de escala'
                        width: parent.width-app.fs
                        anchors.centerIn: parent
                        color: 'white'
                        wrapMode: Text.WordWrap
                        textFormat: Text.RichText
                    }
                    Rectangle{
                        id: lin1
                        width: 2
                        height: parent.parent.height/2-app.fs*0.75-parent.height
                        anchors.top: parent.bottom
                        visible: ol1.s===2
                        antialiasing: true
                    }
                    Rectangle{
                        id: lin2
                        width: 2
                        height: parent.parent.height/2-app.fs*0.75-parent.height
                        anchors.top: parent.bottom
                        anchors.right: parent.right
                        visible: ol1.s===1
                        antialiasing: true
                    }
                }

                Eje1{
                    width: r.width
                    anchors.verticalCenter: ol1.verticalCenter
                    visible: ms.showEje1
                }
                Ol1{
                    id: ol1
                    anchors.centerIn: parent
                    width: app.fs*12
                    height: width
                    anchors.horizontalCenterOffset: app.fs*1.5
                    showBorders: ms.showBorders
                    showingPeriApo: ms.showPeriApo
                    showTags: !modo.checked
                    runRotation: ms.runOl
                    showingFromSouthPole: ms.view===0
                    visible: !modo.checked
                    velocity: tierra1.velocity
                }
                T1{
                    id:tierra1
                    width: app.fs*4
                    height: width
                    anchors.centerIn: parent                    
                    showingFromSouthPole: ms.view===0
                    rotationEnable: ms.runOl
                    velocity: ms.velGiroRap?2.0:6.0
                    MouseArea{
                        width: app.fs*3
                        height: width
                        anchors.centerIn: parent
                        onClicked: {
                            if(ms.view==0){
                                ms.view=1
                                return
                            }
                            if(ms.view==1){
                                ms.view=0
                                return
                            }
                        }
                    }
                }
                TempTierra{
                    id: tempTierra
                    width: tierra1.width
                    height: width
                    anchors.centerIn: tierra1
                    visible: btnShowTempTierra.checked
                }
                Item{
                    width: tierra1.width*0.8
                    height: width
                    opacity: ms.showL1?1.0:0.0
                    Behavior on opacity{
                        NumberAnimation{duration: 2000}
                    }
                    Rectangle{
                        color: 'black'
                        anchors.fill: parent
                        radius: width*0.5
                        antialiasing: true
                    }

                    anchors.centerIn: parent
                    Image {
                        id: img2
                        source: "file:./img/sol1.png"
                        width: app.fs*2
                        height: width*0.75
                        anchors.centerIn: parent
                        antialiasing: true
                        SequentialAnimation{
                            running: true
                            loops: Animation.Infinite
                            ScriptAction{
                                script: {
                                    naw1.to=app.fs*2
                                    naw2.to=app.fs*4
                                }
                            }
                            NumberAnimation {
                                id:naw1
                                target: img2
                                property: "width"
                                to:Screen.width*0.06
                                duration: 2000
                            }
                            NumberAnimation {
                                id:naw2
                                target: img2
                                property: "width"
                                to:Screen.width*0.03
                                duration: 2000
                            }
                        }
                        SequentialAnimation{
                            running: true
                            loops: Animation.Infinite

                            NumberAnimation {
                                target: img2
                                property: "opacity"
                                from: 0.75
                                to:1.0
                                duration: 2000
                                //easing.type: Easing.InOutQuad
                            }
                            NumberAnimation {
                                target: img2
                                property: "opacity"
                                from: 1.0
                                to:0.75
                                duration: 2000
                                //easing.type: Easing.InOutQuad
                            }
                        }
                    }
                }
                FSoltVer{
                    anchors.verticalCenter: tierra1.verticalCenter
                    anchors.verticalCenterOffset: 0-app.fs
                    anchors.horizontalCenter: tierra1.horizontalCenter
                    visible: btnShowFSolt.checked&&modo.checked&&!btnSolt.checked
                }
                FSoltInv{
                    anchors.verticalCenter: tierra1.verticalCenter
                    anchors.verticalCenterOffset: 0-app.fs
                   anchors.horizontalCenter: tierra1.horizontalCenter
                    visible: btnShowFSolt.checked&&modo.checked&&btnSolt.checked
                }
                Item{
                    anchors.horizontalCenter: ol1.horizontalCenter
                    anchors.verticalCenter: ol1.verticalCenter
                    width: ol1.width
                    height: ol1.height
                    ApoPeriLabel{
                        id:peri
                        t:0
                        opacity: ol1.s===2||setPeri.checked?1.0:0.5
                        visible: ol1.s===1&&ms.showPeriApo||ol1.s===2&&ms.showPeriApo||setPeri.checked
                        onOpacityChanged: {
                            if(opacity===1.0)des.text=desPeri
                        }
                    }
                    FPeri{
                        anchors.verticalCenter: peri.verticalCenter
                        anchors.verticalCenterOffset: 0-height/2-app.fs
                        visible: botShowFPeri.checked
                    }
                    ApoPeriLabel{
                        id:apo
                        t:1
                        opacity: ol1.s===1||setApo.checked?1.0:0.5
                        visible: ol1.s===1&&ms.showPeriApo||ol1.s===2&&ms.showPeriApo||setApo.checked
                        onOpacityChanged: {
                            if(opacity===1.0)des.text=desApo
                        }
                    }
                    FApo{
                        anchors.verticalCenter: peri.verticalCenter
                        anchors.verticalCenterOffset: 0-height/2-app.fs
                        anchors.right: apo.left
                        anchors.rightMargin: app.fs*2
                        visible: botShowFApo.checked
                    }
                }
            }
            Item{
                width: r.width*0.5
                height: r.height-xTit.height-app.fs
            }
        }
        Row{
            id:rowBtns
            spacing: app.fs*0.5
            Button{
                text: '<<'
                onClicked: {
                    apps.up=0
                }
            }
            Button{
                id:modo
                text: !checked?'Luna/Tierra':'Tierra/Sol'
                checkable:true
            }
            Button{
                text: ms.showL1?'Ocultar Luz 1':'Mostrar Luz 1'
                checkable: true
                checked: ms.showL1
                onCheckedChanged: {
                    ms.showL1=checked
                }
            }
            Button{
                id:btnGl
                visible:!modo.checked
                text: !ms.runOl?'Girar Luna':'Detener Luna'
                checkable: true
                checked: ms.runOl
                onCheckedChanged: {
                    //ol1.runRotation=ms.runOl
                    ms.runOl=checked
                }
            }
            Button{
                id:btnGlVel
                visible:!modo.checked
                text: !ms.velGiroRap?'Velocidad de Giro: <b>Lento</b>':'Velocidad de Giro: <b>Ràpido</b>'
                checkable: true
                checked: ms.velGiroRap
                onCheckedChanged: {
                    ms.velGiroRap=checked
                }
            }
            Button{
                id:setPeri
                visible:!modo.checked
                text: 'Perigeo'
                checkable: true
                property bool btnGlPrevS
                onCheckedChanged: {
                    btnGlPrevS=btnGl.checked
                    ol1.forcingPeriApo=checked
                    ms.showPeriApo=checked
                    if(checked){
                        if(setApo.checked)setApo.checked=false
                        btnGl.enabled=false
                        btnGl.checked=false
                        ms.runOl=false
                        ol1.rotation=-90
                        ol1.s=2
                    }else{
                        botShowFPeri.checked=false
                        btnGl.enabled=true
                        btnGl.checked=btnGlPrevS
                        ol1.rotation=0
                        //ol1.s=0
                        ms.runOl=btnGl.checked
                    }

                }
            }
            Button{
                id:botShowFPeri
                text: 'Fuerzas Perigeo'
                checkable: true
                visible: setPeri.checked&&!modo.checked
                onCheckedChanged: {
                    ms.showPeriApo=checked
                }
            }
            Button{
                id:setApo
                visible:!modo.checked
                text: 'Apogeo'
                checkable: true
                property bool btnGlPrevS
                onCheckedChanged: {
                    //setPeri.checked=!checked
                    btnGlPrevS=btnGl.checked
                    ol1.forcingPeriApo=checked
                    ms.showPeriApo=checked
                    if(checked){
                        if(setPeri.checked)setPeri.checked=false
                        btnGl.enabled=false
                        btnGl.checked=false
                        ms.runOl=false
                        ol1.rotation=90
                        ol1.s=1
                    }else{
                        botShowFApo.checked=false
                        btnGl.enabled=true
                        btnGl.checked=btnGlPrevS
                        ol1.rotation=0
                        //ol1.s=0
                        ms.runOl=btnGl.checked
                    }

                }
            }
            Button{
                id:botShowFApo
                text: 'Fuerzas Apo'
                checkable: true
                visible: setApo.checked&&!modo.checked
                onCheckedChanged: {
                    ms.showPeriApo=checked
                }
            }
            Button{
                visible:!modo.checked
                text: ms.showPeriApo?'Ocultar Perigeo/Apogeo':'Mostrar Perigeo/Apogeo'
                checkable: true
                checked: ms.showPeriApo
                onCheckedChanged: {
                    ms.showPeriApo=checked
                }
            }
            //Btns Solticio
            Button{
                id:btnSolt
                visible:modo.checked
                text: !checked?'Solticio Verano':'Solticio Invierno'
                checkable: true
                checked: ms.runOl
                onCheckedChanged: {
                    os1.solXOffSet=checked?app.fs*4:0
                }
            }
            Button{
                id:btnShowFSolt
                visible:modo.checked
                text: !checked?'Mostrar Atracción':'Ocultar Atracción'
                checkable: true
                //                onCheckedChanged: {
                //                    os1.solXOffSet=checked?app.fs*4:0
                //                }
            }
            Button{
                id: btnShowTempTierra
                text: 'Mostrar Temperatura Tierra'
                checkable: true
            }
            Item{width: app.fs*2; height: 1}
            Button{
                text: checked?'Ocultar Eje':'Mostrar Eje'
                checkable: true
                checked: ms.showEje1
                onCheckedChanged: {
                    ms.showEje1=!ms.showEje1
                }
            }
            Button{
                text: 'Mostrar Bordes'
                checkable: true
                checked: ms.showBorders
                onCheckedChanged: {
                    ms.showBorders=checked
                }
            }
        }
    }

    Timer{
        running: r.visible
        repeat: false
        interval: 30*1000
        onTriggered: {
            terminado()
        }
    }
    property string desPeri
    property string desApo
    onWidthChanged: {

    }
    Component.onCompleted: {
        var fs=''+parseInt(app.fs*0.5)
        desPeri='<h1 style="line-height:20%">Perigeo</h1><br><span style="line-height:10%; font-size:'+fs+'px;">La distancia entre la Tierra y la Luna es de <b>362.600 Km</b></span><br><span style="line-height:10%; font-size:'+fs+'px;">La fuerza en 1 sentido provoca la <b>Velocidad Máxima</b>: 1,08 km/s</span>'
        desApo='<h1 style="line-height:20%">Apogeo</h1><br><span style="line-height:10%; font-size:'+fs+'px;">La distancia entre la Tierra y la Luna es de <b>405.400 Km</b></span><br><span style="line-height:10%; font-size:'+fs+'px;">La fuerza en 2 sentidos provoca la <b>Velocidad Mínima</b>: 0,96 km/s</span>'

        //La velocidad media a la que recorre su órbita es de 1,02 km/s, siendo la velocidad máxima en el perigeo de 1,08 km/s y la mínima en el apogeo de 0,96 km/s.
    }
}
