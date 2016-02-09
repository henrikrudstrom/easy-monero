import QtQuick 2.4
import Material 0.2
import Material.ListItems 0.1 as ListItem
import QtQuick.Layouts 1.1
import "Views"
import QuickFlux 1.0
import "Actions"

Item{
    id: view
    property string name
    property alias active: viewLoader.active
    property var filter
    Loader {
        id: viewLoader
        anchors.fill: parent
        asynchronous: true
        active: false
        visible: status == Loader.Ready
        sourceComponent: Component{
            //id: allTransactions
            TransactionView{
                filter: view.filter
                Component.onCompleted: {
                    console.log("loaded: ", view.text)
                }
            }

        }
    }


    ProgressCircle {
        anchors.centerIn: parent
        visible: viewLoader.status == Loader.Loading
    }

}


