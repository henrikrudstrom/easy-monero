import QtQuick 2.4
import Material 0.2
import Material.ListItems 0.1 as ListItem
import QtQuick.Layouts 1.1
Sidebar {

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
        }
        SidebarItem{
            text: "Incoming"
            iconName: "content/inbox"

        }
        SidebarItem{
            text: "Outgoing"
            iconName: "content/inbox"

        }
        SidebarItem{
            text: "Unconfirmed"
            iconName: "content/flag"

        }
        SidebarItem{
            text: "Drafts"
            iconName: "content/drafts"

        }
        ListItem.Divider{

        }
        SidebarItem{
            text: "Contacts"
            iconName: "social/groups"
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
    }
}
