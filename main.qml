import QtQuick 2.5
//import QtQuick.Window 2.2
import QtQuick.Dialogs 1.1
import QtGraphicalEffects 1.0
import Material 0.2
import Material.ListItems 0.1 as ListItem
import "Window"
//import QuickFlux 1.0

//import "Global/TorrentActions" 1.0
ApplicationWindow{
    minimumWidth: 750
    minimumHeight: 250
    visible: true
    height: 400
    width: 900
    theme {
        primaryColor: Palette.colors["grey"]["900"]
        accentColor:Palette.colors["orange"]["800"]

    }



    initialPage: TabbedPage {
        id: page
        anchors.fill: parent
        title: "MONERO"
        actionBar {
            //implicitHeight: Units.gu(2)

        }

        actions: [
            Action {
                iconName: "action/settings"
                name: "Settings"
                hoverAnimation: true
            }
        ]
        property var sections: ["Home", "Send Monero", "History", "Contact"]
        property string selectedSection: sections[0]
        Sidebar {
            expanded: wideAspect

            // Anchoring is automatic
            Flickable {
                anchors.fill: parent

                contentHeight: Math.max(content.implicitHeight, height)

                Column {
                    id: content
                    anchors.fill: parent
                    width: parent.width

                    ListItem.Subheader {
                        text: "accounts"
                    }

                    Repeater {
                        model: page.sections
                        delegate: ListItem.Standard {
                            text: page.sections[index]
                            selected: page.sections === page.selectedSection
                            onClicked: {
                                page.selectedSection = modelData
                                navDrawer.close()
                            }
                        }
                    }

                }
            }
        }
    }
}
