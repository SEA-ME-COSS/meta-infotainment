import QtQuick 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

CircularGaugeStyle {

    property real xCenter: outerRadius
    property real yCenter: outerRadius
    property real labelStepSize: 0
    property real labelInset: 0
    property real needleLength: 0
    property real needleTipWidth: 0
    property real needleBaseWidth: 0
    property bool halfGauge: false

    tickmarkLabel: Text {
        FontLoader {
            id: font
            source: "../font/Nebula-Regular.otf"
        }
        font.family: font.name
        font.pixelSize: 20
        text: styleData.value
        color: styleData.index === 8 || styleData.index === 9 ? "red" : "black"
        antialiasing: true
    }

    needle: Canvas {
        implicitWidth: needleBaseWidth
        implicitHeight: needleLength

        property real xCenter: width / 2
        property real yCenter: height / 2

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            ctx.beginPath();
            ctx.moveTo(xCenter, height);
            ctx.lineTo(xCenter - needleBaseWidth / 2, height - needleBaseWidth / 2);
            ctx.lineTo(xCenter - needleTipWidth / 2, 0);
            ctx.lineTo(xCenter, yCenter - needleLength);
            ctx.lineTo(xCenter, 0);
            ctx.closePath();
            ctx.fillStyle = "red";
            ctx.fill();

            ctx.beginPath();
            ctx.moveTo(xCenter, height)
            ctx.lineTo(width, height - needleBaseWidth / 2);
            ctx.lineTo(xCenter + needleTipWidth / 2, 0);
            ctx.lineTo(xCenter, 0);
            ctx.closePath();
            ctx.fillStyle = "red";
            ctx.fill();
        }
    }

    foreground: null
}
