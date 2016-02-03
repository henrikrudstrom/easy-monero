import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.1
import QtGraphicalEffects 1.0
import "Window"
//import QuickFlux 1.0

//import "Global/TorrentActions" 1.0
FramelessWindowUnity{
    minimumWidth: 750
    minimumHeight: 250

    height: 400
    width: 900
    dragArea: dragArea
    MouseArea{
        id: dragArea
        anchors.fill: parent
    }
    Rectangle{
        color: "#DDE"
        anchors.fill: parent
    }


}
