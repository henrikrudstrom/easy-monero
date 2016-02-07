import QtQuick 2.4
import Material 0.1
import Material.ListItems 0.1 as ListItem
import QtQuick.Controls 1.3 as QuickControls
import QtQuick.Layouts 1.1
import "qml-material/modules/Material/Extras/js/dateutils.js" as Dateutils
View {
    elevation: 1
    height: Units.gu(1)
    RowLayout{
        anchors.centerIn: parent
        width: parent.width - Units.gu(0.5)
        HashIcon{
            Layout.alignment: Qt.AlignVCenter

            size: Units.gu(0.75)

            hash: address
        }

        Item{
            Layout.preferredWidth: Units.dp(32)
        }

        Label {
            Layout.alignment: Qt.AlignVCenter
            text: Math.round(amount * 100) / 100 + " XMR"
            style: "subheading"

        }

        Label {
            Layout.alignment: Qt.AlignVCenter
            text: "recieved from "
            style: "subheading"
        }
        Label {
            Layout.alignment: Qt.AlignVCenter
            text: address.slice(0,32)
            style: "subheading"
            Layout.fillWidth: true

        }

        Label {
            Layout.alignment: Qt.AlignVCenter
            style: "subheading"
            text: {
                return Dateutils.friendlyTime(date)
            }
        }
    }

}
