import QtQuick 2.4
import Material 0.2
import Material.ListItems 0.1 as ListItem
import QtQuick.Layouts 1.1
import "Actions"

NavigationDrawer {
    enabled: true
    id: sidebar

    //expanded: !navDrawer.enabled

    Column {
        width: parent.width
        ListItem.Subtitled {
            text: "Wallet"
            subText: "2331.22 XMR"
            itemLabel.style: "dialog"
            action: Icon {
                anchors.centerIn: parent
                name: "action/account_balance_wallet"
                size: Units.dp(32)
            }
        }
        ListItem.Divider{

        }

        SidebarItem{
            text: "Overview"
            iconName: "action/view_module"
            onClicked: ViewActions.openView("all", {})
        }
        SidebarItem{
            text: "Incoming"
            iconName: "content/inbox"
            onClicked: ViewActions.openView("recieved", {})
        }
        SidebarItem{
            text: "Outgoing"
            iconName: "content/inbox"
            onClicked: ViewActions.openView("sent", {})

        }
        SidebarItem{
            text: "Unconfirmed"
            iconName: "content/flag"
            onClicked: ViewActions.openView("unconfirmed", {})

        }
        SidebarItem{
            text: "Drafts"
            iconName: "content/drafts"
            onClicked: ViewActions.openView("draft", {})

        }
        ListItem.Divider{

        }
        SidebarItem{
            text: "Contacts"
            iconName: "social/group"
        }
        SidebarItem{
            text: "Favorites"
            iconName: "toggle/star_border"
        }
        SidebarItem{
            text: "Unknown"
            iconName: "social/people_outline"
        }
        ListItem.Divider{

        }

        ListItem.Subtitled {
            text: "Miner"
            subText: "Mining at 5.22GH/s"
            itemLabel.style: "dialog"
            action: Icon {
                anchors.centerIn: parent
                name: "device/brightness_high"
                size: Units.dp(32)
            }
        }
        ListItem.Divider{

        }
        ListItem.Subtitled {
            text: "Network"
            subText: "Connected to 27 peers"
            itemLabel.style: "dialog"
            action: Icon {
                anchors.centerIn: parent
                name: "hardware/device_hub"
                size: Units.dp(32)
            }
        }
    }
}
