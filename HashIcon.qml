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
        //property var golGrid: []
        property var origGrid: []

        onHashChanged: {
            grid = []
            var l = resolution * resolution
            var size = Math.floor(hash.length / l)
            var max = Math.pow(16, size);
            var maxIndex = -1
            var maxVal = -1
            for(var i = 0; i < l; i += 1){
                var str = hash.substring(i, i+size)
                var val = parseInt(str, 16)
                if(val > maxVal) {
                    maxVal = val
                    maxIndex = i
                }
                var include = val > (2 * max / 5.0) ? val > (4 * max / 5.0) ? 1 : 1 : 0
                grid.push(include)

            }
            origGrid = grid
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
            for(var i = 0; i < canvas.resolution * canvas.resolution; i++){
                //ctx.fillStyle =
                var x = Math.round((i % canvas.resolution) * size)
                var y = Math.round(Math.floor(i / canvas.resolution) * size)
                drawRect(ctx, x,y,Math.round(size), colors[canvas.grid[i]])
            }
        }


    }

    MouseArea{
        anchors.fill: canvas
        hoverEnabled: true
        onEntered:{
            console.log(entered)
            timer.start()
        }
        onExited: {
            canvas.grid = canvas.origGrid
            timer.stop()
            canvas.requestPaint()
        }
    }

    Timer{
        id: timer
        interval: 125; running: false; repeat: true
        onTriggered: {
            //console.log("triggered")
            //console.log(canvas.grid)
            canvas.grid = tickGameOfLife(canvas.grid)
            //console.log(canvas.grid)
            canvas.requestPaint()
        }
    }

    function tickGameOfLife(grid){
        var newGrid = []
        for(var i = 0; i < resolution * resolution; i++){
            var x = Math.round((i % resolution))
            var y = Math.round(Math.floor(i / resolution))
            var n = neighbors(grid, x, y)
            //console.log("N", n)
            if(grid[i] === 1){
                if(n < 2) newGrid.push(0)
                else if(n > 3) newGrid.push(0)
                else newGrid.push(1)
            }
            else{
                if(n === 3) newGrid.push(1)
                else newGrid.push(0)
            }
        }
        return newGrid
    }

    function getValue(grid, x, y){
        x = (x + resolution) % resolution
        y = (y + resolution) % resolution
        var i = x + y * resolution
        //console.log(x, y, i)
        return grid[i];
    }

    function neighbors(grid, x, y){
        return  getValue(grid, x - 1, y) +
                getValue(grid, x - 1, y + 1) +
                getValue(grid, x, y + 1) +
                getValue(grid, x + 1, y + 1) +
                getValue(grid, x + 1, y) +
                getValue(grid, x + 1, y - 1) +
                getValue(grid, x, y - 1) +
                getValue(grid, x - 1, y - 1)

    }
    function getGridValue(grid, i){
        console.log(i)
        return grid[(i + grid.length) % grid.length]
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
