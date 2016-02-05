import QtQuick 2.0
import Material 0.1
import Material.ListItems 0.1 as ListItem
import QtQuick.Controls 1.3 as QuickControls
import QtQuick.Layouts 1.1
Item {
    id: list
    TransactionStore{
        id: store
    }
//    Rectangle{
//    color: "orange"
//    anchors.fill: parent
//    }
    Component.onCompleted: {
        console.log("Done")
        store
    }

    ListView{
        anchors.fill: parent
        anchors.topMargin: Units.dp(8)
        model: store.model
        spacing: Units.dp(8)
        delegate: TransactionListItem {
            width: list.width
        }
    }

}
