import QtQuick
import QtQuick.Shapes 1.14
import QtQuick.Controls 6.3
import QtQuick.Shapes

Window{
    id: runscreen
    width: 390
    height: 844
    visible: true
    title: qsTr("WorkoutPlanning")

    property int counter: 0
    property int value_of_time: 30
    property int value_of_degree: 360/value_of_time
    property int final_time: value_of_time-counter
    property int number_of_laps: 5




    Rectangle {
        id: rectangle1
        visible: true
        radius: 0
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        gradient: Gradient {
            GradientStop {position: 0.100;color: "#134981";}
            GradientStop {position: 0.900;color: Qt.rgba(143, 171, 200, 0);}
        }

        Loader {id: pageLoader5}
        MouseArea {
            id: exit_button
            x: 317
            y: 11
            width: 59
            height: 57
            onClicked: pageLoader5.source= "qrc:/main.qml"
        }

        Image {
            id: exit_image
            x: 317
            y: 11
            width: 59
            height: 57
            source: "qrc:/aaa/icons/blue_exit.png"
            fillMode: Image.PreserveAspectFit

        }

        Rectangle {
            id: lowerBar
            x: 10
            y: 779
            width: 370
            height: 65
            radius: 8
            color: "#8FABC8"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.leftMargin: 10
            anchors.rightMargin: 10


            Image {
                id: back
                x: 8
                y: 4
                width: 59
                height: 57
                source: "qrc:/aaa/icons/back.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: stop
                x: 156
                y: 4
                width: 59
                height: 57
                source: "qrc:/aaa/icons/pause.png"
                fillMode: Image.PreserveAspectFit
                visible: true
            }



            Image {
                id: play
                x: 156
                y: 4
                width: 59
                height: 57
                source: "qrc:/aaa/icons/play_button.png"
                fillMode: Image.PreserveAspectFit
                visible: false
            }

            Image {
                id: next
                x: 297
                y: 4
                width: 59
                height: 57
                source: "qrc:/aaa/icons/next.png"
                fillMode: Image.PreserveAspectFit
            }

            MouseArea {
                id: stop_button
                x: 156
                y: 4
                width: 59
                height: 57
                onClicked: if(stop.visible==true){timer.stop()
                            stop.visible=false
                            play.visible=true}
                           else {timer.start()
                                stop.visible=true
                                play.visible=false}
            }




            MouseArea {
                id: back_button
                x: 20
                y: 783
                width: 59
                height: 57
                //onClicked: "main.qml"
            }

            MouseArea {
                id: next_button
                x: 305
                y: 783
                width: 59
                height: 57
                //onClicked: "main.qml"
            }

        }

        Rectangle {
            id: rectangle
            x: 92
            y: 236
            width: 206
            height: 206
            color: "#E0E8F8"
            radius: 90
        }

        Rectangle {
            id: rectangle2
            x: 95
            y: 492
            width: 200
            height: 62
            color: "#ffffff"
            radius: 8
        }

    }
    Shape {
        width: 250
        height: 250
        anchors.top: parent.top
        anchors.leftMargin: 66
        anchors.topMargin: 212
        anchors.left: parent.left
        // Enable multisampled rendering
        layer.enabled: true
        layer.samples: 4

        ShapePath {
            fillColor: "transparent"
            strokeColor: "gray"
            strokeWidth: 20
            capStyle: ShapePath.RoundCap
            PathAngleArc {
                centerX: 125; centerY: 125
                radiusX: 120-20/2; radiusY: 120-20/2
                startAngle: 135
                sweepAngle: 360
            }
        }

        ShapePath {
            fillColor: "transparent"
            strokeColor: "green"
            strokeWidth: 20
            capStyle: ShapePath.RoundCap
            PathAngleArc {
                centerX: 125; centerY: 125
                radiusX: 120-20/2; radiusY: 120-20/2
                startAngle: -90
                sweepAngle: 360 - value_of_degree * counter
            }
        }
    }
    Rectangle {
        id: laps
        x: 156
        y: 359
        width: 71
        height: 28
        color: "#ffffff"
    }

    Rectangle {
        id: time_lap
        x: 113
        y: 304
        width: 156
        height: 44
        color: "#ffffff"
        Text {id: num_of_laps; x:70; y:58; width: 16; height: 22; color: "#134981"; text: number_of_laps ; horizontalAlignment: Text.AlignHCenter; font.bold: true;font.pointSize: 19}

        Timer {
            id: timer
            interval: 500; running: true; repeat: true;
            onTriggered: {runscreen.counter += 1
                         if(counter == value_of_time){
                         //timer.restart()
                         counter = 0
                         number_of_laps --}
                         if (number_of_laps == 0){
                         timer.stop()}}
        }
        Text { id: label; x: 24; y: 8; width: 108; height: 28; color: "#134981"; text: final_time ; horizontalAlignment: Text.AlignHCenter; font.bold: true;font.pointSize: 19 }
    }
}



