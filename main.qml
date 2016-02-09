import QtQuick 2.4
//import QtQuick.Window 2.2
import QtQuick.Dialogs 1.1
import QtGraphicalEffects 1.0
import Material 0.2
import Material.ListItems 0.1 as ListItem
import "Window"

ApplicationWindow{
    id: root
    minimumWidth: 750
    minimumHeight: 250
    visible: true
    height: 800
    width: 1000
    theme {
        primaryColor: Palette.colors["grey"]["900"]
        accentColor:Palette.colors["orange"]["800"]

    }

    initialPage: MainPage{
        id: page
        anchors {
            fill: parent
        }

        actions: [
            Action {
                iconName: "action/settings"
                name: "Settings"
                hoverAnimation: true
            }
        ]
    }
}
