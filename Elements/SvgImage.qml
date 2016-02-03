import QtQuick 2.0
import QtGraphicalEffects 1.0
Item {
    id: svgImage
    property alias sourceWidth: svg.sourceSize.width
    property alias sourceHeight: svg.sourceSize.height
    property alias color: rect.color
    //property alias opacity: mask.opacity
    property string source: ""

    property int originalWidth: -1
    property int originalHeight: -1
    property double aspect: originalWidth / originalHeight
    width: height * svgImage.aspect

    Rectangle{
       id: rect
       anchors.fill: parent
       color: "black"
       visible: false

    }
    Image{
        id: svg
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
//        sourceSize.width: 64
//        sourceSize.height: 64
        source: "../../res/" + svgImage.source
        visible: false
        //smooth: true
        Component.onCompleted: {
//            console.log(sourceSize.width)
//            console.log(sourceSize.height)
            originalWidth = sourceSize.width
            originalHeight = sourceSize.height
        }

    }


    OpacityMask{
        id: mask
        anchors.fill: svg
        source: rect
        maskSource: svg
        //opacity: 1
        //smooth: true
    }


}
