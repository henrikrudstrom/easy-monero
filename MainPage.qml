import QtQuick 2.4
import Material 0.2
import Material.ListItems 0.1 as ListItem
import QtQuick.Layouts 1.1
import "Views"
import QuickFlux 1.0
import QtQuick.Controls 1.4 as Controls
import "Actions"

Page {
    id: page
    anchors.fill: parent

    actionBar.customContent: Item {
        height: 0

        anchors.fill: parent

        Label{
            id: title
            text: "MONERO"
            style: "title"
            color: Theme.dark.textColor
            anchors.verticalCenter: parent.verticalCenter
        }

        Item{
            id: titlebarCenterContent
            anchors {
                fill: parent
                leftMargin: 250//sidebar.width
                rightMargin: Units.dp(8)
                topMargin: Units.dp(8)
                bottomMargin: Units.dp(8)
            }
        }
    }

    property list<BaseView> views: [
        BaseView{
            name: "all"; active: true;
        },
        BaseView{
            name: "recieved"; active: false;
            filter: function(item){ return item.direction === 0 }
        },
        BaseView{
            name: "sent"; active: false
            filter: function(item){ return item.direction === 1 }
        },
        BaseView{
            name: "draft"; active: false
            filter: function(item){ return item.draft}
        },
        BaseView{
            name: "unconfirmed"; active: false
            filter: function(item){ return item.confirmations < 5 }
        }

    ]



    property BaseView allTransactions: BaseView{ active: true }
    property BaseView incomingTransactions: BaseView{}

    Controls.StackView{
        id: stack
        clip: true
        anchors{
            left: sidebar.right
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        initialItem: allTransactions


//        delegate: Controls.StackViewDelegate {
//                function transitionFinished(properties)
//                {
//                    properties.exitItem.opacity = 1
//                }

//                pushTransition: Controls.StackViewTransition {
//                    PropertyAnimation {
//                        target: enterItem
//                        property: "opacity"
//                        from: 0
//                        to: 1
//                    }
//                    PropertyAnimation {
//                        target: exitItem
//                        property: "opacity"
//                        from: 1
//                        to: 0
//                    }
//                }
//            }
    }

    MainSideBar {
        id: sidebar
        showing: true

    }

    AppListener{
        filter: ViewActionTypes.openView
        onDispatched: {
            if(stack.currentItem.name === message.name) return;
            for(var i in page.views){

                if(views[i].name === message.name){
                    var activeView = views[i]
                    activeView.active = true
                    stack.push({item: activeView, replace: true})
                    return
                }
            }
        }
    }
}

