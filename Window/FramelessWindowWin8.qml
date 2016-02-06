import QtQuick 2.4
import QtQuick.Window 2.2
FramelessWindow {
    id: window
    flags: Qt.FramelessWindowHint |
           Qt.WindowMinimizeButtonHint |
           Qt.WindowSystemMenuHint |
           Qt.Window
    radius: 0
    shadowSize: 0
    property string myProp: "Hello"

    WindowButtons{
        z: 100
        id: windowButtons
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.topMargin: 10
    }
    Connections{
        target: windowButtons
        onClose:{
            Qt.quit()
        }
        onMinimize: {
            window.showMinimized()
        }
    }
}
