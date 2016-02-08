import QtQuick 2.4
import QtGraphicalEffects 1.0
import Material 0.2
Item{
    property int size: Units.gu(1)
    property alias hash: canvas.hash
    property alias resolution: canvas.resolution
    width: size
    height: size

    Canvas {
        id: canvas

        property string hash
        property int resolution: 5
        anchors.fill: parent
        antialiasing: true
        visible: false
        property var grid: []

        onHashChanged: {
            grid = []
            var l = resolution * resolution
            var size = Math.floor(hash.length / l)
            var max = Math.pow(16, size);
            //console.log("L: " + l, size, max)
            var maxIndex = -1
            var maxVal = -1
            for(var i = 0; i < l; i += 1){
                var str = hash.substring(i, i+size)
                var val = parseInt(str, 16)
                if(val > maxVal) {
                    maxVal = val
                    maxIndex = i
                }

                //console.log()
                var include = val > (2 * max / 5.0) ? val > (4 * max / 5.0) ? 1 : 1 : 0
                //console.log(str, val, (max / 2.0), include)
                grid.push(include)

            }
            //grid[maxIndex] = 2


        }

        property var colors: ["#B40", "#9CA", "#682"]

        //TODO: implement conways game of life.
        onPaint: {
            var ctx = canvas.getContext('2d');
            ctx.save();
            ctx.clearRect(0, 0, canvas.width, canvas.height);

            ctx.globalAlpha = canvas.alpha;
            ctx.strokeStyle = canvas.strokeStyle;
            ctx.fillStyle = canvas.fillStyle;
            var size = 1.0 * canvas.width / canvas.resolution
            //console.log(size, canvas.width, canvas.resolution)
            for(var i = 0; i < canvas.resolution * canvas.resolution; i++){
                //ctx.fillStyle =
                var x = Math.round((i % canvas.resolution) * size)
                var y = Math.round(Math.floor(i / canvas.resolution) * size)
                //console.log(ctx.fillStyle)


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
        anchors.fill: parent
        radius: 0.5 * size / 5
        visible: false
    }


    OpacityMask{
        id: mask
        anchors.fill: parent
        source: canvas
        maskSource: maskRect

        //opacity: 1
        smooth: true

    }

}
