import QtQuick 2.0

Item {

    property ListModel model: ListModel {
        Component.onCompleted: {
            console.log("hello")
            var tx = randomTransaction()
            append(randomTransaction())
            append(randomTransaction())
            append(randomTransaction())
            console.log(count)
        }

    }

    function randomTransaction(){
        console.log("TX")
        var tx = {
            "id": randomBytes(64),
            "address": randomBytes(64),
            "datetime": Date.now(),
            "amount": Math.random(0,100)
            }
        console.log("get tx")
        console.log(tx)
        return tx

    }
    function randomBytes(n)
    {
        var text = "";
        var possible = "0123456789ABCDEF";

        for( var i=0; i < n; i++ )
            text += possible.charAt(Math.floor(Math.random() * possible.length));


        return text;
    }


}
