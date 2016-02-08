pragma Singleton
import QtQuick 2.0
import QuickFlux 1.0
import "./"
Item {
    function openView(name, query) {
        AppDispatcher.dispatch(ViewActionTypes.openView,{name: name, query: query });
    }
}
