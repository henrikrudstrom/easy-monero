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



//        SendForm{
//            anchors{
//                fill: parent
//            }

//        }
    }

    TransactionListView{
        anchors.fill: parent
    }
}
