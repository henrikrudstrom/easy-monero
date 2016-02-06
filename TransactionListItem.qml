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
            //anchors.verticalCenter: parent.verticalCenter

        }
//        Icon {
//            Layout.alignment: Qt.AlignVCenter
//            source: Qt.resolvedUrl("Material/icons/navigation/arrow_forward.svg")
//            color: Theme.light.iconColor
//        }
        Label {
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: Units.gu(8)
            text: Math.round(amount * 100) / 100 + " XMR"

        }

        Label {
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: Units.gu(8)
            text: "From: " + address.slice(0,16)+"..."
        }

        Label {
            Layout.alignment: Qt.AlignVCenter
            text: {
                console.log(date)

                return Dateutils.friendlyTime(date)
            }
        }

//        Label {
//            //Layout.alignment: Qt.AlignRight
//            text: date
//        }
    }

}
