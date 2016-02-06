import QtQuick 2.4
import Material 0.2
import Material.ListItems 0.1 as ListItem
import QtQuick.Layouts 1.1
Page {
    View{
        elevation: 2
        visible: false
        anchors {
            fill: parent
            margins: Units.dp(16)
        }



    }

//    ListModel{
//        id: navigationModel

//    }
    property var components: ["Home", "Send Monero", "History", "Contact"]
    property string selectedComponent: components[0]
    Sidebar {

        id: sidebar

        //expanded: !navDrawer.enabled

        Column {
            width: parent.width

            Repeater {
                model: page.components
                delegate: ListItem.Standard {
                    text: modelData
                    selected: modelData == page.selectedComponent
                    onClicked: selectedComponent = modelData
                }
            }
        }
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
        contentHeight: Math.max(example.implicitHeight + 40, height)
        Loader {
            id: example
            anchors.fill: parent
            asynchronous: true
            visible: status == Loader.Ready
            // selectedComponent will always be valid, as it defaults to the first component
            source: {

                return Qt.resolvedUrl("TransactionListView.qml").arg(selectedComponent.replace(" ", ""))

            }
        }

        ProgressCircle {
            anchors.centerIn: parent
            visible: example.status == Loader.Loading
        }
    }
    Scrollbar {
        flickableItem: flickable
    }
//    TransactionListView{
//        anchors.fill: parent
//    }
}
