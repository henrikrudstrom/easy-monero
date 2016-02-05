import QtQuick 2.0
import QtGraphicalEffects 1.0
import Material 0.2
Item{
    property int size: Units.gu(1)
    property alias hash: canvas.hash
    Canvas {
        id: canvas
        width: size
        height: size
        anchors.centerIn: parent
        property string hash
        property int resolution: 5

        property color strokeStyle:  Qt.darker(fillStyle, 1.4)
        property color fillStyle: "#b40000" // red
        //property int lineWidth: lineWidthCtrl.value
        property bool fill: true
        property bool stroke: true
        property real alpha: 1.0

        antialiasing: true
        visible: false
        property var grid: []

        onHashChanged: {
            grid = []
            var l = resolution * resolution
            var size = Math.floor(hash.length / l)
            var max = Math.pow(16, size);
            console.log("L: " + l, size, max)
            var maxIndex = -1
            var maxVal = -1
            for(var i = 0; i < l; i += 1){
                var str = hash.substring(i, i+size)
                var val = parseInt(str, 16)
                if(val > maxVal) {
                    maxVal = val
                    maxIndex = i
                }

                console.log()
                var include = val > (2 * max / 5.0) ? val > (4 * max / 5.0) ? 1 : 1 : 0
                console.log(str, val, (max / 2.0), include)
                grid.push(include)

            }
            //grid[maxIndex] = 2


        }

        property var colors: ["#B40", "#9CA", "#682"]

        onPaint: {
            var ctx = canvas.getContext('2d');
            ctx.save();
            ctx.clearRect(0, 0, canvas.width, canvas.height);

            ctx.globalAlpha = canvas.alpha;
            ctx.strokeStyle = canvas.strokeStyle;
            ctx.fillStyle = canvas.fillStyle;
            var size = 1.0 * canvas.width / canvas.resolution
            console.log(size, canvas.width, canvas.resolution)
            for(var i = 0; i < canvas.resolution * canvas.resolution; i++){
                //ctx.fillStyle =
                var x = Math.round((i % canvas.resolution) * size)
                var y = Math.round(Math.floor(i / canvas.resolution) * size)
                console.log(ctx.fillStyle)


                drawRect(ctx, x,y,Math.round(size), colors[canvas.grid[i]])

            }
        }

        function drawRect(ctx, x,y,size,color){
            ctx.beginPath()
            ctx.fillStyle =color
            //console.log(x, y)
            ctx.moveTo(x,y)
            ctx.lineTo(x + size, y)
            ctx.lineTo(x + size, y + size)
            ctx.lineTo(x, y + size)
            ctx.lineTo(x, y)
            ctx.closePath()
            ctx.fill("#FAA")
        }
    }

    Rectangle{
        id: maskRect
        color: "black"
        anchors.fill: canvas
        radius: 0.5 * size / 5
        visible: false
    }


    OpacityMask{
        id: mask
        anchors.fill: canvas
        source: canvas
        maskSource: maskRect

        //opacity: 1
        smooth: true

    }

}
