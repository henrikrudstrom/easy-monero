import QtQuick 2.4

Item {

    property ListModel model: ListModel {
        Component.onCompleted: {
            for(var i = 0; i < 100; i++){
                append(randomTransaction())
            }
        }

    }

    function randomTransaction(){
        var tx = {
            "id": randomBytes(64),
            "address": randomBytes(64),
            "date": Date.now() - Math.pow(Math.random() * 10000, 2),
            "amount": Math.pow(Math.random() * 100, 2)
            }
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
