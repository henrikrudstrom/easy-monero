import QtQuick 2.0
import QtGraphicalEffects 1.0
Item {
    id : shadow
    property real blur : 3
    property alias color : dark.color
    property real horizontalOffset : 3
    property real verticalOffset : 3

    Rectangle {
        id: container
        color : "#00000000"
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: shadow.verticalOffset

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: shadow.horizontalOffset

        width: shadow.width + blur * 4
        height: shadow.height + blur * 4
        visible : false

        Rectangle {
            id : dark
            anchors.centerIn: container
            width: shadow.width
            height: shadow.height
            radius: 5
        }
    }

    GaussianBlur {
        anchors.fill: container
        source: container
        radius: shadow.blur * 1.414 * 2
        samples: Math.min(32,radius * 2);
    }
}
