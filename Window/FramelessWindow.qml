import QtQuick 2.4
import QtQuick.Window 2.2
import "../Elements"
import QtGraphicalEffects 1.0
Window {
    id: window
    default property alias data: windowContent.data

    property MouseArea dragArea: null
    property int radius: 5
    property int shadowSize: 5

    color: "transparent"
    visible: true


    Shadow{
        anchors.fill: windowContainer
        color: "#66000000"
        blur: shadowSize / 4
    }

    Item{
        id: windowContainer
        property bool rounded: true
        property bool adapt: true
        anchors.margins: window.visibility === Window.Windowed ? shadowSize : 0


        anchors.fill: parent
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Item {
                width: windowContainer.width
                height: windowContainer.height
                Rectangle {
                    anchors.centerIn: parent
                    width: windowContainer.width
                    height: windowContainer.height
                    radius: window.radius
                }
            }
        }


        Item{
            anchors.fill: parent
            id: windowContent
        }
        ResizeHandle{
            resizeItem: window
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            horizontalDrag: -1
            verticalDrag: 1
            visible: window.visibility === Window.Windowed
        }
        ResizeHandle{
            resizeItem: window
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            horizontalDrag: 1
            verticalDrag: 1
            visible: window.visibility === Window.Windowed
        }

    }





    Connections{

        target: window.dragArea
        property variant clickPos: null
        property variant clickWindowPos: null
        onPressed: {
            clickPos = globalCursor.getPosition()//Qt.point(mouse.x, mouse.y)
        }
        onPositionChanged: {
            var pos = globalCursor.getPosition()
            var delta = Qt.point(pos.x - clickPos.x, pos.y - clickPos.y)
            window.x += delta.x
            window.y += delta.y
            clickPos = pos
        }
        onDoubleClicked: {
            if(window.visibility != Window.Maximized){
                window.visibility = Window.Maximized
            } else {
                window.visibility = Window.Windowed
            }
        }
    }
}
