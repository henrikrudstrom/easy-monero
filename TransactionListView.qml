import QtQuick 2.4
import Material 0.1
import Material.ListItems 0.1 as ListItem
import QtQuick.Controls 1.3 as QuickControls
import QtQuick.Layouts 1.1
Item {
    id: list
    TransactionStore{
        id: store
    }
    ListView{
        id: listView
        anchors {
            fill: parent
            topMargin: Units.dp(16)
        }

        model: store.model
        spacing: Units.dp(8)
        delegate: TransactionListItem {
            width: parent.width - Units.dp(24)
            anchors.horizontalCenter: parent.horizontalCenter
        }
        section{

        }
    }
    Scrollbar {
        flickableItem: listView
    }

}
