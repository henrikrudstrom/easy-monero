pragma Singleton
import QtQuick 2.0
import QuickFlux 1.0
Item {
    property string openView;


    Component.onCompleted:  {
        for (var prop in this) {
            if (typeof this[prop] === "string" &&
                prop !== "objectName") {
                // It is suggested to give a prefix to your ActionTypes
                this[prop] = "ViewActions." + prop;
            }
        }
    }
}
