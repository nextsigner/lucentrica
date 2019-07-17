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
        //anchors.centerIn: r
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: app.fs
        spacing: app.fs*2
        Row{
            spacing: app.fs
            Text {
                id: t1
                text: '<b>Teoría Lucéntrica</b>'
                font.pixelSize: app.fs*2
                color: 'white'
                anchors.verticalCenter: parent.verticalAlignment
            }
            Text {
                id: t4
                font.pixelSize: app.fs*0.75
                color: 'white'
                //anchors.left: parent.right
                //anchors.leftMargin: app.fs
                anchors.verticalCenter: parent.verticalAlignment
            }
        }
        Item{
            width: 1;
            height: app.fs
            anchors.horizontalCenter: parent.horizontalCenter
            Rectangle{
                width: app.fs*20
                height: 2
                anchors.horizontalCenter: parent.horizontalCenter
                //anchors.centerIn: parent
            }
        }
        Text {
            id: t2
            width: r.width*0.7
            font.pixelSize: app.fs
            wrapMode: Text.WordWrap
            textFormat: Text.RichText
            color: 'white'
        }
    }
    Button{
        text: 'Siguiente'
        anchors.right: parent.right
        anchors.rightMargin: app.fs
        anchors.bottom: parent.bottom
        anchors.bottomMargin: app.fs
        onClicked: {
            mp.stop()
            apps.up++
        }
    }
    Timer{
        running: r.visible
        repeat: false
        interval: 300*1000
        onTriggered: {
            terminado()
        }
    }
    Component.onCompleted: {
        var fsp=parseInt(app.fs*0.85)
        var tt1 = '<p style="font-size:'+fsp+'px;"><b>Teoría creada por: </b> Ricardo Martín Pizarro</p><p style="font-size:'+fsp+'px;"><b>Nacido en: </b>Malargue Mendoza República Argentina</p>
<p style="font-size:'+fsp+'px;"><b>Fecha de Nacimiento:</b> 20/06/1975</p>
<p style="font-size:'+fsp+'px;"><b>D.N.I:</b> 24.545.472</p>
<p style="font-size:'+fsp+'px;"><b><b>Fecha de Publicación:</b> 16/07/2019</p>
'

        t4.text=tt1

        var tt2 = 'Nombre de la Teoria:
<b>Fuerza de Atracción Gravitatoria Lucéntrica</b><br>

<p style="font-size:'+fsp+'px;">En principio esta teoría está basada las leyes de la termodinámica y en una afirmación propia de esta misma teoría, dicha afirmación concluye lo siguiente.</p>

<p style="font-size:'+fsp+'px;">Las materias en estado plasmático, de distintas densidades, de distintas temperaturas, son luces que se rechazan o se atraen por dichas diferncias o similitudes.</p>

<p style="font-size:'+fsp+'px;">En tal sentido la materia en un estado no plasmático es atraido por el campo magnético, electromagnético o magnetricidad de los diferentes tipos de plasmas.</p>

<p style="font-size:'+fsp+'px;">Esto explica el funcionamiento de las fuerzas gravitatorias en general.</p>

<p style="font-size:'+fsp+'px;">La llamada fuerza de gravedad planetaria es producto de la atracción de la materia en estado no plasmático hacia el centro del cada esfera, esto sucede por la atracción de la materia hacia el núcleo de luz que se encuentra en el interior de cada esfera o cuerpo celeste de similares características.</p>

<p style="font-size:'+fsp+'px;">Esto explica el desplazamiento de las órbitas entre su centro y el cuerpo sobre el cuál se realiza la rotación.</p>

<p style="font-size:'+fsp+'px;">También explica cuáles son las fuerzas que intervienen y que provocan la rotación de nuestro mundo sobre su propio eje.</p>
'
        t2.text=tt2
    }
}
/*
  Fuente: https://www.thierry-corp.com/mx/plasma/conceptos-fundamentales/que-es-la-densidad-de-plasma/

¿Qué es la densidad de plasma?
La densidad de plasma es una medida del grado de ionización de un plasma. Se genera un plasma cuando a un gas se le suministra la energía suficiente para que sus partículas comiencen a ionizarse: los átomos del gas comienzan a perder electrones. Al ionizarse el gas y convertirse en un plasma se modifican las propiedades físicas de la sustancia. La densidad de plasma es una medida del porcentaje de partículas del gas que se han ionizado; más específicamente, es una medida del número de electrones libres por unidad de volumen.
Densidad de plasma: plasmas fríos y calientes
Debido a que la densidad de plasma puede variar, también lo hacen las propiedades del plasma en función de dicha densidad. Incluso un gas débilmente ionizado con una densidad de plasma muy baja es considerado un plasma, pues exhibe propiedades características de esta fase. El plasma que se produce en la industria de modificación de superficies generalmente es un plasma frío, ya que es generado a baja temperatura y tiene una densidad de plasma baja, generalmente menor a 1 % o alrededor de cien millones de electrones por centímetro cúbico. El plasma caliente, que es el tipo de plasma asociado a la astrofísica, está completamente ionizado, por lo que tiene una densidad de plasma muy elevada, alrededor de un billón de electrones por centímetro cúbico.
*/
