import QtQuick 2.4
import Material 0.1
import Material.ListItems 0.1 as ListItem
import QtQuick.Controls 1.3 as QuickControls
import QtQuick.Layouts 1.1
import QtQml.Models 2.2
import "Stores"
import "Actions"
import QuickFlux 1.0
Item {
    id: list
    ListModel{
        id: store
    }

    DelegateModel {
        id: visualModel
        model: TransactionStore.model

        groups: [
            DelegateModelGroup { name: "sent" },
            DelegateModelGroup { name: "received" },
            DelegateModelGroup { name: "draft" },
            DelegateModelGroup { name: "unconfirmed" }
        ]

        delegate: TransactionListItem {
            width: parent.width - Units.dp(24)
            anchors.horizontalCenter: parent.horizontalCenter
            Component.onCompleted: {
                DelegateModel.inSent = direction == 1 && !draft
                DelegateModel.inReceived = direction == 0 && !draft
                DelegateModel.inDraft = draft
                DelegateModel.inUnconfirmed = confirmations < 5
            }
        }
    }

    AppListener {
        filter: ViewActionTypes.openView
        onDispatched: {

            visualModel.filterOnGroup = message.name
        }
    }

    ListView{
        id: listView
        anchors {
            fill: parent
            topMargin: Units.dp(16)
        }

        model: visualModel

        spacing: Units.dp(8)

    }
    Scrollbar {
        flickableItem: listView
    }
    ActionButton {
        anchors {
            right: parent.right
            bottom: parent.bottom
            margins: Units.dp(32)
        }

        iconName: "content/add"
    }

}
