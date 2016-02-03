import QtQuick 2.0
import QtQuick.Window 2.2
FramelessWindow {
    id: window
    flags: Qt.FramelessWindowHint |
           Qt.WindowMinimizeButtonHint |
           Qt.WindowSystemMenuHint |
           Qt.Popup |
           Qt.NoDropShadowWindowHint |
           Qt.Window
    radius: 5
    shadowSize: 10
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
