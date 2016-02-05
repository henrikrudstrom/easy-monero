import QtQuick 2.0

Canvas {
    id: canvas
    property string hash
    property int resolution: 8

    property color strokeStyle:  Qt.darker(fillStyle, 1.4)
    property color fillStyle: "#b40000" // red
    //property int lineWidth: lineWidthCtrl.value
    property bool fill: true
    property bool stroke: true
    property real alpha: 1.0

    antialiasing: true

//    onLineWidthChanged:requestPaint();
//    onFillChanged:requestPaint();
//    onStrokeChanged:requestPaint();
//    onScaleChanged:requestPaint();
    property var grid: []
    onHashChanged: {
        grid = []
        var l = resolution * resolution
        for(var i = 0; i < l; i++){
            var str = hash.substring(i, i+1)
            var val = parseInt(str, 16)
            console.log(str, val)
            grid.push(val > 8)

        }


    }

    onPaint: {
        var ctx = canvas.getContext('2d');
        var originX = 85
        var originY = 75
        ctx.save();
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        ctx.globalAlpha = canvas.alpha;
        ctx.strokeStyle = canvas.strokeStyle;
        ctx.fillStyle = canvas.fillStyle;
        var size = 1.0 * canvas.width / canvas.resolution
        console.log(size, canvas.width, canvas.resolution)
        for(var i = 0; i < canvas.resolution * canvas.resolution; i++){
            if(!canvas.grid[i]) continue;
            var x = i % canvas.resolution
            var y = Math.floor(i / canvas.resolution)
            //console.log(x, y)
            drawRect(ctx, x*size,y*size,size)
        }
    }

//    {
//        var ctx = canvas.getContext('2d');
//        var originX = 85
//        var originY = 75
//        ctx.save();
//        ctx.clearRect(0, 0, canvas.width, canvas.height);
//        ctx.translate(originX, originX);
//        ctx.globalAlpha = canvas.alpha;
//        ctx.strokeStyle = canvas.strokeStyle;
//        ctx.fillStyle = canvas.fillStyle;
//        ctx.lineWidth = canvas.lineWidth;

//        ctx.translate(originX, originY)
//        ctx.scale(canvas.scale, canvas.scale);
//        ctx.rotate(canvas.rotate);
//        ctx.translate(-originX, -originY)

//        ctx.beginPath();
//        ctx.moveTo(75,40);
//        ctx.bezierCurveTo(75,37,70,25,50,25);
//        ctx.bezierCurveTo(20,25,20,62.5,20,62.5);
//        ctx.bezierCurveTo(20,80,40,102,75,120);
//        ctx.bezierCurveTo(110,102,130,80,130,62.5);
//        ctx.bezierCurveTo(130,62.5,130,25,100,25);
//        ctx.bezierCurveTo(85,25,75,37,75,40);
//        ctx.closePath();
//        if (canvas.fill)
//            ctx.fill();
//        if (canvas.stroke)
//            ctx.stroke();
//        ctx.restore();
//    }

    function drawRect(ctx, x,y,size){
        //console.log(x, y)
        ctx.moveTo(x,y)
        ctx.lineTo(x + size, y)
        ctx.lineTo(x + size, y + size)
        ctx.lineTo(x, y + size)
        ctx.lineTo(x, y)
        ctx.closePath()
        ctx.fill()
    }
}

