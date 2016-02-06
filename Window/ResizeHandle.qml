import QtQuick 2.4

MouseArea{
    id:resizeHandle
    width: 15
    height: 15
    property int horizontalDrag: 0
    property int verticalDrag: 0
    property variant resizeItem: null
    hoverEnabled: true
    preventStealing: true

    cursorShape: Qt.SizeAllCursor

    property variant clickPos: null
    property bool dragging: false
    onPressed: {
        clickPos = globalCursor.getPosition()
        dragging =  true
    }
    onReleased: {
        dragging = false
    }

    onPositionChanged: {
        if(!dragging) return
        if(resizeItem == null) return
        var pos = globalCursor.getPosition();
        var delta = Qt.point(pos.x - clickPos.x, pos.y - clickPos.y)
        resizeItem.width += delta.x * horizontalDrag
        resizeItem.x += horizontalDrag < 0 ? delta.x : 0
        resizeItem.height += delta.y * verticalDrag
        resizeItem.y += verticalDrag < 0 ? delta.y : 0
        clickPos = pos
    }
}

