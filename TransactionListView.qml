import QtQuick 2.0
import Material 0.1
import Material.ListItems 0.1 as ListItem
import QtQuick.Controls 1.3 as QuickControls
import QtQuick.Layouts 1.1
Item {
    id: list
    ListModel {
        id: testModel
        ListElement {
            paymentId:
"
faef56b9
acf67a7d
ba75ec01
f4034970
49d7cff1
11628edf
e7b57278
554dc798"; address: "faef56b9acf67a7dba75ec01f403497049d7cff111628edfe7b57278554dc798"; date: "Jan 12, 2014"; time: "12:23 AM"; amount: "0.000709159241"; balance: "19301.870709159241"; description: "Client from Australia"; out: false }
        ListElement { paymentId: "faef56b9acf67a7dba75ec01f403497049d7cff111628edfe7b57278554dc798"; address: "faef56b9acf67a7dba75ec01f403497049d7cff111628edfe7b57278554dc798"; date: "Jan 12, 2014"; time: "12:23 AM"; amount: "0.000709159241"; balance: "19301.870709159241"; description: ""; out: true }
        ListElement { paymentId: "faef56b9acf67a7dba75ec01f403497049d7cff111628edfe7b57278554dc798"; address: "faef56b9acf67a7dba75ec01f403497049d7cff111628edfe7b57278554dc798"; date: "Jan 12, 2014"; time: "12:23 AM"; amount: "0.000709159241"; balance: "19301.870709159241"; description: ""; out: true }
        ListElement { paymentId: ""; address: "faef56b9acf67a7dba75ec01f403497049d7cff111628edfe7b57278554dc798"; date: "Jan 12, 2014"; time: "12:23 AM"; amount: "0.000709159241"; balance: "19301.870709159241"; description: ""; out: false }
        ListElement { paymentId: ""; address: "faef56b9acf67a7dba75ec01f403497049d7cff111628edfe7b57278554dc798"; date: "Jan 12, 2014"; time: "12:23 AM"; amount: "0.000709159241"; balance: "19301.870709159241"; description: "Client from Australia"; out: false }
        ListElement { paymentId: "faef56b9acf67a7dba75ec01f403497049d7cff111628edfe7b57278554dc798"; address: "faef56b9acf67a7dba75ec01f403497049d7cff111628edfe7b57278554dc798"; date: "Jan 12, 2014"; time: "12:23 AM"; amount: "0.000709159241"; balance: "19301.870709159241"; description: ""; out: false }
        ListElement { paymentId: ""; address: "faef56b9acf67a7dba75ec01f403497049d7cff111628edfe7b57278554dc798"; date: "Jan 12, 2014"; time: "12:23 AM"; amount: "0.000709159241"; balance: "19301.870709159241"; description: ""; out: false }
        ListElement { paymentId: "faef56b9acf67a7dba75ec01f403497049d7cff111628edfe7b57278554dc798"; address: "faef56b9acf67a7dba75ec01f403497049d7cff111628edfe7b57278554dc798"; date: "Jan 12, 2014"; time: "12:23 AM"; amount: "0.000709159241"; balance: "19301.870709159241"; description: ""; out: false }
        ListElement { paymentId: "faef56b9acf67a7dba75ec01f403497049d7cff111628edfe7b57278554dc798"; address: "faef56b9acf67a7dba75ec01f403497049d7cff111628edfe7b57278554dc798"; date: "Jan 12, 2014"; time: "12:23 AM"; amount: "0.000709159241"; balance: "19301.870709159241"; description: "Client from Australia"; out: false }
        ListElement { paymentId: "faef56b9acf67a7dba75ec01f403497049d7cff111628edfe7b57278554dc798"; address: "faef56b9acf67a7dba75ec01f403497049d7cff111628edfe7b57278554dc798"; date: "Jan 12, 2014"; time: "12:23 AM"; amount: "0.000709159241"; balance: "19301.870709159241"; description: ""; out: false }
    }

    ListView{
        anchors.fill: parent
        model: testModel
        spacing: Units.dp(8)
        delegate: TransactionListItem {
            width: list.width
        }
    }

}
