pragma Singleton
import QtQuick 2.4
import QuickFlux 1.0
import com.cutehacks.gel 1.0
Item {

    property JsonListModel model: JsonListModel {
        Component.onCompleted: {
            randomIds(24)
            var date = Date.now()
            for(var i = 0; i < 100; i++){
                var tx = randomTransaction(date)
                date = tx.date
                add(tx)
            }
        }
    }





    property var ids: []

    function randomIds(n){
        for(var i = 0; i < n; i++){
            ids.push(randomBytes(64))
        }
    }

    function randomTransaction(lastDate){

        var idi = Math.floor(Math.sqrt(Math.random() * Math.pow(ids.length - 1, 2)))

        //console.log(idi)
        var date =  lastDate - Math.random() * 1000 * 60 * 60 * 12
        var tx = {
            id: randomBytes(64),
            address: ids[idi],
            date: date,
            direction: Math.random() > 0.5 ? 0 : 1,
            draft: Math.random() > 0.90,
            confirmations: (Date.now() - date) / (1000 * 60 * 3),
            amount: Math.pow(Math.random() * 100, 2)
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
