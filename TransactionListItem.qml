import QtQuick 2.0
import Material 0.1
import Material.ListItems 0.1 as ListItem
import QtQuick.Controls 1.3 as QuickControls
import QtQuick.Layouts 1.1
View {
    elevation: 1
    implicitHeight: Units.gu(1)
    RowLayout{

        HashIcon{
            width: Units.gu(1)
            height: Units.gu(1)
            hash: address

        }

        Label {
            //Layout.alignment: Qt.AlignLeft
            text: "From: " + address
        }
        Label {
            //Layout.alignment: Qt.AlignRight
            text: time
        }
    }

}
