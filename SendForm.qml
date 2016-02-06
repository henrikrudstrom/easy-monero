import QtQuick 2.4
import Material 0.1
import Material.ListItems 0.1 as ListItem
import QtQuick.Controls 1.3 as QuickControls
import QtQuick.Layouts 1.1
View {
    ColumnLayout {
        id: column

        anchors {
            fill: parent
            topMargin: Units.dp(16)
            bottomMargin: Units.dp(16)
        }

        Label {
            id: titleLabel

            anchors {
                left: parent.left
                right: parent.right
                margins: Units.dp(16)
            }

            style: "headline"
            text: "Send"
        }

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: Units.dp(8)
        }

        ListItem.Standard {

            action: Icon {
                anchors.centerIn: parent
                name: "action/account_circle"
            }

            content: TextField {
                anchors.centerIn: parent
                width: parent.width

                text: "Amount"
            }
        }


        RowLayout {
            Layout.alignment: Qt.AlignCenter
            spacing: Units.dp(16)

            Label {
                id: speedLabel

                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Units.dp(16)
                }

                style: "subheading"
                text: "priority"
            }
            QuickControls.ExclusiveGroup { id: optionGroup }


            RadioButton {
                checked: false
                text: "Fast"
                darkBackground: index == 1
                canToggle: true
                exclusiveGroup: optionGroup
            }

            RadioButton {
                checked: true
                text: "Faster"
                //darkBackground: index == 1
                canToggle: true
                exclusiveGroup: optionGroup
            }

            RadioButton {
                checked: false
                text: "Fastest"
                //darkBackground: index == 1
                canToggle: true
                exclusiveGroup: optionGroup
            }


        }



        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: Units.dp(8)
        }

        RowLayout {
            Layout.alignment: Qt.AlignRight
            spacing: Units.dp(8)

            anchors {
                right: parent.right
                margins: Units.dp(16)
            }

            Button {
                text: "Cancel"
                textColor: Theme.primaryColor
            }

            Button {
                text: "Done"
                textColor: Theme.primaryColor
            }
        }


    }

}
