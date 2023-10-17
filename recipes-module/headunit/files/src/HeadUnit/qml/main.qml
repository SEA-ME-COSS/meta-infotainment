import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtMultimedia 5.15
import DataModule 1.0

Window {
    id: root
    title: "Head Unit"
    width: 1024
    height: 600
    //width: 600
    //height: 1024
    visible: true

    FontLoader {
        id: font
        source: "../font/Nebula-Regular.otf"
    }

    ValueSource {
        id: valueSource
    }

    HeadUnitQtClass {
        id: manager
    }

    Item {
        id: container
        width: 1024
        height: 600
        anchors.centerIn: parent
        rotation: 0
        scale: 0.5

        Rectangle {
            id: background
            width: 600
            height: 1024
            anchors.centerIn: parent
            rotation: 90
            gradient: Gradient {
                GradientStop { position: 0.0; color: valueSource.light }
                GradientStop { position: 0.4; color: "white" }
                GradientStop { position: 0.6; color: "white" }
                GradientStop { position: 1.0; color: valueSource.light }
            }
        }

        Rectangle {
            width: 130
            height: 130
            x: 20
            y: parent.height / 2 - height / 2 - 210
            color: (carinfo.sensorRpm === 0) ? "black" : "#555555"
            radius: 30

            Rectangle {
                width: 115
                height: 115
                anchors.centerIn: parent
                color: (valueSource.gear === 0) ? ((carinfo.sensorRpm === 0) ? "#555555" : "#B0B0B0") : "white"
                radius: 22

                Text {
                    text: "P"
                    font.family: font.name
                    font.pixelSize: 130
                    color: (valueSource.gear === 0) ? "white" : ((carinfo.sensorRpm === 0) ? "#555555" : "#B0B0B0")
                    x: 13
                    y: -20
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (carinfo.sensorRpm === 0) {
                        valueSource.gear = 0
                        manager.setGear(0)
                    }
                }
            }
        }

        Rectangle {
            width: 130
            height: 130
            x: 20
            y: parent.height / 2 - height / 2 - 70
            color: (carinfo.sensorRpm === 0) ? "black" : "#555555"
            radius: 30

            Rectangle {
                width: 115
                height: 115
                anchors.centerIn: parent
                color: (valueSource.gear === 1) ? ((carinfo.sensorRpm === 0) ? "#FF6868" : "#FFCECE") : "white"
                radius: 22

                Text {
                    text: "R"
                    font.family: font.name
                    font.pixelSize: 130
                    color: (valueSource.gear === 1) ? "white" : ((carinfo.sensorRpm === 0) ? "#FF6868" : "#FFCECE")
                    x: 13
                    y: -20
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (carinfo.sensorRpm === 0) {
                        valueSource.gear = 1
                        manager.setGear(1)
                    }
                }
            }
        }

        Rectangle {
            width: 130
            height: 130
            x: 20
            y: parent.height / 2 - height / 2 + 70
            color: (carinfo.sensorRpm === 0) ? "black" : "#555555"
            radius: 30

            Rectangle {
                width: 115
                height: 115
                anchors.centerIn: parent
                color: (valueSource.gear === 2) ? ((carinfo.sensorRpm === 0) ? "#35CA3D" : "#AEFFAE") : "white"
                radius: 22

                Text {
                    text: "N"
                    font.family: font.name
                    font.pixelSize: 130
                    color: (valueSource.gear === 2) ? "white" : ((carinfo.sensorRpm === 0) ? "#35CA3D" : "#AEFFAE")
                    x: 13
                    y: -20
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (carinfo.sensorRpm === 0) {
                        valueSource.gear = 2
                        manager.setGear(2)
                    }
                }
            }
        }

        Rectangle {
            width: 130
            height: 130
            x: 20
            y: parent.height / 2 - height / 2 + 210
            color: (carinfo.sensorRpm === 0) ? "black" : "#555555"
            radius: 30

            Rectangle {
                width: 115
                height: 115
                anchors.centerIn: parent
                color: (valueSource.gear === 3) ? ((carinfo.sensorRpm === 0) ? "#555555" : "#B0B0B0") : "white"
                radius: 22

                Text {
                    text: "D"
                    font.family: font.name
                    font.pixelSize: 130
                    color: (valueSource.gear === 3) ? "white" : ((carinfo.sensorRpm === 0) ? "#555555" : "#B0B0B0")
                    x: 13
                    y: -20
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (carinfo.sensorRpm === 0) {
                        valueSource.gear = 3
                        manager.setGear(3)
                    }
                }
            }
        }

        Rectangle {
            width: 5
            height: parent.height
            anchors.verticalCenter: parent.verticalCenter
            x: parent.width / 2 - width / 2 - 340
            color: (carinfo.sensorRpm === 0) ? "black" : "#555555"
        }

        Text {
            text: carinfo.sensorRpm
            font.family: font.name
            font.pixelSize: 70
            color: (carinfo.sensorRpm === 0) ? "black" : "#555555"
            x: 200
            y: 5
        }

        Image {
            source: "../image/turn-icon.png"
            width: 100
            height: 100
            rotation: -90
            fillMode: Image.PreserveAspectFit
            opacity: (valueSource.left_on_off) ? 0.2 : 1.0
            x: parent.width / 2 - width / 2 - 170
            y: 485

            Image {
                source: "../image/turn-icon.png"
                width: 80
                height: 80
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                y: 12
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (valueSource.direction === 1) {
                        manager.setDirection(0)
                        valueSource.direction = 0

                        valueSource.blink = false
                        valueSource.left_direction = false
                        valueSource.right_direction = false
                        valueSource.left_on_off = false
                        valueSource.right_on_off = false

                        valueSource.freeDirection = false
                    } else {
                        manager.setDirection(1)
                        valueSource.direction = 1

                        valueSource.blink = true
                        valueSource.left_direction = true
                        valueSource.right_direction = false
                        valueSource.left_on_off = true
                        valueSource.right_on_off = false

                        valueSource.freeDirection = false
                    }
                }
            }
        }

        Image {
            source: "../image/turn-icon.png"
            width: 100
            height: 100
            rotation: 90
            fillMode: Image.PreserveAspectFit
            opacity: (valueSource.right_on_off) ? 0.2 : 1.0
            x: parent.width / 2 - width / 2 + 170
            y: 485

            Image {
                source: "../image/turn-icon.png"
                width: 80
                height: 80
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                y: 12
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (valueSource.direction === 2) {
                        manager.setDirection(0)
                        valueSource.direction = 0

                        valueSource.blink = false
                        valueSource.left_direction = false
                        valueSource.right_direction = false
                        valueSource.left_on_off = false
                        valueSource.right_on_off = false

                        valueSource.freeDirection = false
                    } else {
                        manager.setDirection(2)
                        valueSource.direction = 2

                        valueSource.blink = true
                        valueSource.left_direction = false
                        valueSource.right_direction = true
                        valueSource.left_on_off = false
                        valueSource.right_on_off = true

                        valueSource.freeDirection = false
                    }
                }
            }
        }

        Image {
            source: "../image/warning-icon.png"
            width: 120
            height: 120
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
            y: 475

            Image {
                source: "../image/warning-icon.png"
                width: 90
                height: 90
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                y: 20

                Image {
                    source: "../image/warning-icon.png"
                    width: 65
                    height: 65
                    fillMode: Image.PreserveAspectFit
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 17
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (valueSource.direction === 3) {
                        manager.setDirection(0)
                        valueSource.direction = 0

                        valueSource.blink = false
                        valueSource.left_direction = false
                        valueSource.right_direction = false
                        valueSource.left_on_off = false
                        valueSource.right_on_off = false

                        valueSource.freeDirection = false
                    } else {
                        manager.setDirection(3)
                        valueSource.direction = 3

                        valueSource.blink = true
                        valueSource.left_direction = true
                        valueSource.right_direction = true
                        valueSource.left_on_off = true
                        valueSource.right_on_off = true

                        valueSource.freeDirection = false
                    }
                }
            }
        }

        Rectangle {
            width: 5
            height: parent.height
            anchors.verticalCenter: parent.verticalCenter
            x: parent.width / 2 - width / 2 + 340
            color: (carinfo.sensorRpm === 0) ? "black" : "#555555"
        }

        Image {
            source: "../image/logo.png"
            width: 320
            height: 320
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
            y: 80
        }

        Image {
            source: "../image/seame.png"
            width: 240
            height: 240
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
            y: 315
        }

        Image {
            source: "../image/wolfsberg.png"
            width: 220
            height: 220
            fillMode: Image.PreserveAspectFit
            x: 830
            y: -40
        }

        Item {
            width: 230
            height: 70
            x: 605
            y: 5

            Text {
                text: valueSource.clock
                font.family: font.name
                font.pixelSize: 70
                color: (carinfo.sensorRpm === 0) ? "black" : "#555555"
                anchors.right: parent.right
                y: 0
            }
        }

        Slider {
            id: redSlider
            width: 140
            x: 870
            y: 130
            minimumValue: 0
            maximumValue: 128
            stepSize: 16
            value: 128

            style: SliderStyle {
                groove: Rectangle {
                    implicitWidth: 140
                    implicitHeight: 8
                    color: "#FFCECE"
                    radius: 30
                }

                handle: Rectangle {
                    implicitWidth: 23
                    implicitHeight: 23
                    color: "#FF6868"
                    radius: 30
                }
            }

            onValueChanged: {
                valueSource.red = redSlider.value.toString(16)
                if (valueSource.red.length === 1) {
                    valueSource.red = "0" + valueSource.red
                }
                manager.setLight(valueSource.light)
            }
        }

        Slider {
            id: greenSlider
            width: 140
            x: 870
            y: 160
            minimumValue: 0
            maximumValue: 128
            stepSize: 16
            value: 128

            style: SliderStyle {
                groove: Rectangle {
                    implicitWidth: 140
                    implicitHeight: 8
                    color: "#AEFFAE"
                    radius: 30
                }

                handle: Rectangle {
                    implicitWidth: 23
                    implicitHeight: 23
                    color: "#35CA3D"
                    radius: 30
                }
            }

            onValueChanged: {
                valueSource.green = greenSlider.value.toString(16)
                if (valueSource.green.length === 1) {
                    valueSource.green = "0" + valueSource.green
                }
                manager.setLight(valueSource.light)
            }
        }

        Slider {
            id: blueSlider
            width: 140
            x: 870
            y: 190
            minimumValue: 0
            maximumValue: 128
            stepSize: 16
            value: 128

            style: SliderStyle {
                groove: Rectangle {
                    implicitWidth: 140
                    implicitHeight: 8
                    color: "#B1CAFF"
                    radius: 30
                }

                handle: Rectangle {
                    implicitWidth: 23
                    implicitHeight: 23
                    color: "#4D86FF"
                    radius: 30
                }
            }

            onValueChanged: {
                valueSource.blue = blueSlider.value.toString(16)
                if (valueSource.blue.length === 1) {
                    valueSource.blue = "0" + valueSource.blue
                }
                manager.setLight(valueSource.light)
            }
        }

        Rectangle {
            width: 140
            height: 60
            x: 870
            y: 240
            color: "black"
            radius: 20

            Rectangle {
                width: 130
                height: 50
                anchors.centerIn: parent
                color: (valueSource.mode === 1) ? "#555555" : "white"
                radius: 15

                Text {
                    text: "GPS"
                    font.family: font.name
                    font.pixelSize: 40
                    color: (valueSource.mode === 1) ? "white" : "555555"
                    x: 17
                    y: 1
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (valueSource.mode === 1) {
                        valueSource.mode = 0
                    } else {
                        valueSource.mode = 1
                        mp4Player.pause()
                    }
                }
            }
        }

        Rectangle {
            visible: (valueSource.mode === 1)
            width: 675
            height: 395
            color: "#555555"
            anchors.horizontalCenter: parent.horizontalCenter
            y: 75

            Image {
                source: "../image/gps.png"
                width: 645
                height: 650
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
            }
        }

        Rectangle {
            width: 140
            height: 60
            x: 870
            y: 310
            color: "black"
            radius: 20

            Rectangle {
                width: 130
                height: 50
                anchors.centerIn: parent
                color: (valueSource.mode === 2) ? "#555555" : "white"
                radius: 15

                Text {
                    text: "MP3"
                    font.family: font.name
                    font.pixelSize: 40
                    color: (valueSource.mode === 2) ? "white" : "555555"
                    x: 17
                    y: 1
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (valueSource.mode === 2) {
                        valueSource.mode = 0
                    } else {
                        valueSource.mode = 2
                        mp4Player.pause()
                    }
                }
            }
        }

        Rectangle {
            visible: (valueSource.mode === 2)
            width: 675
            height: 395
            color: "#555555"
            anchors.horizontalCenter: parent.horizontalCenter
            y: 75

            Image {
                source: "../image/album.jpg"
                width: 300
                height: 300
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
                x: 50
            }

            MediaPlayer {
                id: mp3Player
            }

            Image {
                source: "../image/play.png"
                width: 60
                height: 50
                rotation: 90
                anchors.verticalCenter: parent.verticalCenter
                x: 400

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        mp3Player.source = "../media/music.mp3"
                        mp3Player.play()
                    }
                }
            }

            Image {
                source: "../image/pause.png"
                width: 60
                height: 60
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
                x: 480

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        mp3Player.pause()
                    }
                }
            }

            Rectangle {
                width: 60
                height: 60
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
                x: 570

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        mp3Player.stop()
                    }
                }
            }
        }

        Rectangle {
            width: 140
            height: 60
            x: 870
            y: 380
            color: "black"
            radius: 20

            Rectangle {
                width: 130
                height: 50
                anchors.centerIn: parent
                color: (valueSource.mode === 3) ? "#555555" : "white"
                radius: 15

                Text {
                    text: "MP4"
                    font.family: font.name
                    font.pixelSize: 40
                    color: (valueSource.mode === 3) ? "white" : "555555"
                    x: 17
                    y: 1
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (valueSource.mode === 3) {
                        valueSource.mode = 0
                        mp4Player.pause()
                    } else {
                        valueSource.mode = 3
                    }
                }
            }
        }

        Rectangle {
            visible: (valueSource.mode === 3)
            width: 675
            height: 395
            color: "black"
            anchors.horizontalCenter: parent.horizontalCenter
            y: 75

            Video {
                id: mp4Player
                anchors.fill: parent
            }

            Text {
                text: "Ford v Ferrari (2019)"
                font.family: font.name
                font.pixelSize: 30
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                y: 10
            }

            Image {
                source: "../image/play.png"
                width: 40
                height: 30
                rotation: 90
                x: parent.width / 2 - width / 2 - 80
                y: 350

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (carinfo.sensorRpm === 0) {
                            mp4Player.source = "../media/movie.mp4"
                            mp4Player.play()
                        }
                    }
                }
            }

            Image {
                source: "../image/pause.png"
                width: 40
                height: 40
                fillMode: Image.PreserveAspectFit
                x: parent.width / 2 - width / 2
                y: 345

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        mp4Player.pause()
                    }
                }
            }

            Rectangle {
                width: 40
                height: 40
                color: "white"
                x: parent.width / 2 - width / 2 + 90
                y: 345

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        mp4Player.stop()
                    }
                }
            }

            property int sensorRpm: carinfo.sensorRpm

            onSensorRpmChanged: {
                if ((valueSource.mode === 3) && (sensorRpm !== 0)) {
                        mp4Player.pause()
                }
            }
        }

        Image {
            source: "../image/off.png"
            width: 100
            height: 100
            fillMode: Image.PreserveAspectFit
            opacity: ((carinfo.sensorRpm === 0) && (valueSource.gear === 0)) ? 1.0 : 0.5
            x: 888
            y: 470

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if ((carinfo.sensorRpm === 0) && (valueSource.gear === 0)) {
                        Qt.quit()
                        manager.poweroff()
                    }
                }
            }
        }
    }
}
