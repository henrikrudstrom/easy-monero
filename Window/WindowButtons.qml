import QtQuick 2.0

Item {
    width: 30
    height: 10
    signal close()
    signal minimize()
    Rectangle{
        id: minimizeButton
        color: "grey"
        width: 10
        height: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        MouseArea{
            anchors.fill: parent
            onClicked:{
                minimize()
            }
        }
    }
    Rectangle{
        id: closeButton
        color: "black"
        width: 10
        height: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right

        MouseArea{
            anchors.fill: parent
            onClicked:{
                close()
            }
        }
    }

}
