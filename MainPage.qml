import QtQuick 2.4
import Material 0.2
import Material.ListItems 0.1 as ListItem
import QtQuick.Layouts 1.1
import "Views"
import QuickFlux 1.0
import "Actions"

Page {
    id: page

    actionBar.customContent: Item {
        anchors.fill: parent

        Label{
            id: title
            text: "MONERO"
            style: "title"
            color: Theme.dark.textColor
            anchors.verticalCenter: parent.verticalCenter
        }

        Item{
            anchors{
                fill: parent
                leftMargin: sidebar.width
                rightMargin: Units.dp(8)
                topMargin: Units.dp(8)
                bottomMargin: Units.dp(8)
            }
            TextField {
                id: searchField
                anchors{

                    left: parent.left
                    right: icon.left
                    leftMargin: Units.dp(16)
                    rightMargin: Units.dp(4)
                }

                text: "search"
                color: Palette.colors["grey"]["400"]
                textColor: Palette.colors["grey"]["400"]
            }
            Icon {
                id: icon
                anchors{
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    rightMargin: Units.dp(16)
                }
                name: "action/search"
                size: Units.dp(24)
                color: "white"

            }

        }
    }

    MainSideBar {
        id: sidebar
    }

    Flickable {
        id: flickable
        anchors {
            left: sidebar.right
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        clip: true
        contentHeight: Math.max(viewLoader.implicitHeight + 40, height)
        Component{
            id: transactionView
            TransactionView{
                modelGroup: "sent"
            }
        }
        Component{
            id: sentView
            TransactionView{
                modelGroup: "received"
            }
        }

        Loader {
            id: viewLoader
            anchors.fill: parent
            asynchronous: true
            visible: status == Loader.Ready
            // selectedComponent will always be valid, as it defaults to the first component
            sourceComponent: transactionView
        }
        Loader {
            id: sentLoader
            anchors.fill: parent
            asynchronous: true
            visible: status == Loader.Ready
            // selectedComponent will always be valid, as it defaults to the first component
            sourceComponent: sentView
            active: false
        }

        ProgressCircle {
            anchors.centerIn: parent
            visible: viewLoader.status == Loader.Loading || sentLoader.status == Loader.Loading
        }
    }
    Scrollbar {
        flickableItem: flickable
    }

    AppListener{
        filter: ViewActionTypes.openView
        onDispatched: {
            console.log("send")
//            if(message.name === "sent"){
//                sentLoader.active = true
//                viewLoader.visible = false
//                sentLoader.visible = true
//            } else {
//                sentLoader.visible = false
//                viewLoader.visible = true
//            }

        }
    }

}
