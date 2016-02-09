import QtQuick 2.4
import Material 0.1
import Material.ListItems 0.1 as ListItem
import QtQuick.Controls 1.3 as QuickControls
import QtQuick.Layouts 1.1
import QtQml.Models 2.2
import "../Stores"
import "../Actions"
import ".."
import QuickFlux 1.0
import com.cutehacks.gel 1.0
Item {
    id: view
    property alias filter: collection.filter
    property alias comparator: collection.comparator
    property alias descendingSort: collection.descendingSort
    property alias delegate: visualModel.delegate

    Collection{
        id: collection
        model: TransactionStore.model
        comparator: "date"

        filter: function(item) {
            //console.log(item.date)
            return true
        }
    }

    DelegateModel {
        id: visualModel
        model: collection

        delegate: TransactionListItem {
            width: parent.width - Units.dp(24)
            anchors.horizontalCenter: parent.horizontalCenter
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
