import QtQuick 2.0
import Material.ListItems 0.1 as ListItem
import Material 0.2
ListItem.Standard {

        property alias iconName: icon.name
        property alias iconColor: icon.color
        text: "Subtitled list item"
        itemLabel.style: "dialog"

        action: Icon {
            id: icon
            anchors.centerIn: parent
            name: "device/access_alarm"
            size: Units.dp(32)

        }
}
