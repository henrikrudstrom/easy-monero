import QtQuick 2.0
import Material 0.1
import Material.ListItems 0.1 as ListItem
import QtQuick.Controls 1.3 as QuickControls
import QtQuick.Layouts 1.1
View {
    elevation: 1
    height: Units.gu(1.5)
    RowLayout{
        anchors.centerIn: parent
        width: parent.width - Units.gu(0.5)
        HashIcon{
            Layout.alignment: Qt.AlignVCenter
            width: Units.gu(1)
            height: Units.gu(1)
            hash: address
            //anchors.verticalCenter: parent.verticalCenter

        }

        Label {
            Layout.alignment: Qt.AlignVCenter
            text: "From: " + address
        }
//        Label {
//            //Layout.alignment: Qt.AlignRight
//            text: date
//        }
    }

}
