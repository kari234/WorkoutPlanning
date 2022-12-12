/*
 *** VUT FIT ***
 * ITU project *
 * WorkoutPlanning *
 * 2022/2023 *
 @author: Adam Ondrousek
 @xlogin: xondro09
*/

import QtQuick
import QtQuick.Shapes 1.14
import QtQuick.Controls 6.3
import QtQuick.Shapes
import "qrc:/cviky_storage.js" as Data

Window{
    id: runscreen
    width: 390
    height: 844
    visible: true
    title: qsTr("WorkoutPlanning")

    property int index: -1
    property string jmeno: Data.play.pop()

    function foo() {
        for (var i = 0; i <= Data.a.length; i+=1) {
            if (Data.a[i] == runscreen.jmeno) {
                runscreen.index= i+2
                break
            }
        }
    }
    Component.onCompleted: foo();

    property int static_number_of_laps: Data.a[runscreen.index+3+num_of_exercises]*1
    property int num_of_exercises: 0
    property bool cvik_probehl: false
    property int time_of_pause: (Data.a[runscreen.index+2+num_of_exercises]*60)//cas pro pauzu
    property int real_time_of_pause: (Data.a[runscreen.index+2+num_of_exercises]*60)-counter//cas ve vterinach pro pauzu
    property string name_of_series:Data.a[runscreen.index+num_of_exercises]//nazev cviku
    property int real_time: Data.a[runscreen.index+1+num_of_exercises]*1//cas ve vterinach pro cvik
    property int real_time_to_sec: real_time * 60
    property int number_of_laps: Data.a[runscreen.index+3+num_of_exercises]*1 //pocet kol cviku
    property int counter: 0//nastaveni casovace
    property int value_of_degree: 360/(Data.a[runscreen.index+1+num_of_exercises] * 60)//pomocna promenna pro ubyvani kruhu pri odpoctu
    property int degree_of_pause: 360/(Data.a[runscreen.index+2+num_of_exercises] * 60)//stejna promenna pro pauzu
    property int final_time: (Data.a[runscreen.index+1+num_of_exercises] * 60) - counter
    property int minutes_lap: final_time/60
    property int seconds_deci_lap: (final_time-(minutes_lap*60))/10
    property int seconds_lap: (final_time-(minutes_lap*60))%10
    property int minutes_pause: real_time_of_pause/60
    property int seconds_deci_pause: (real_time_of_pause-(minutes_pause*60))/10
    property int seconds_pause: (real_time_of_pause-(minutes_pause*60))%10
    Loader {id: pageLoader5}
    Loader {id: pageLoader7}
    Loader {id: pageLoader8}


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
                id: next_button
                x: 297
                y: 4
                width: 59
                height: 57
                onClicked: { if (number_of_laps > 0) {
                                number_of_laps -= 1
                                counter = 0
                            } else {
                                timer.stop()
                                counter = 0
                            }
                    }
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
                x: 8
                y: 4
                width: 59
                height: 57
                onClicked: if(runscreen.number_of_laps<static_number_of_laps) {
                               console.log(static_number_of_laps)
                                runscreen.number_of_laps += 1
                                counter = 0
                           } else {
                               if (runscreen.index < (runscreen.index+runscreen.num_of_exercises)) {
                                runscreen.num_of_exercises -= 4
                                runscreen.number_of_laps = Data.a[runscreen.index+3+runscreen.num_of_exercises]*1
                                counter = 0
                               } else {
                                timer.stop()
                                console.log(static_number_of_laps)
                                stop.visible = false
                                play.visible = true
                                counter = 0
                               }
                           }
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
            id: name_series
            x: 95
            y: 492
            width: 200
            height: 62
            color: "#ffffff"
            radius: 8

            Text {
                id: text1
                x: 20
                y: 8
                width: 160
                height: 46
                text: qsTr(runscreen.cvik_probehl ? "pauza" : name_of_series)
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
            }
        }

    }
    Shape {
        width: 250
        height: 250
        anchors.top: parent.top
        anchors.leftMargin: 66
        anchors.topMargin: 212
        anchors.left: parent.left
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
                sweepAngle: runscreen.cvik_probehl ? (360 - degree_of_pause * counter) : (360 - value_of_degree * counter)
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
        Text {id: num_of_laps; x:8; y:3
            width: 55; height: 22; color: "#134981";
            text: number_of_laps ; horizontalAlignment: Text.AlignHCenter;
            font.bold: true;font.pointSize: 19}
    }

    Rectangle {
        id: time_lap
        x: 113
        y: 304
        width: 156
        height: 44
        color: "#ffffff"

        Timer {
            id: timer
            interval: 1000; running: true; repeat: true;
            onTriggered: {runscreen.counter += 1
                         if(runscreen.counter == runscreen.real_time_to_sec && !runscreen.cvik_probehl){
                                runscreen.cvik_probehl = true
                                runscreen.counter = 0
                            }
                         if (runscreen.counter == runscreen.time_of_pause && runscreen.cvik_probehl) {
                                runscreen.counter = 0
                                runscreen.cvik_probehl = false
                                runscreen.number_of_laps --
                            }
                         if (runscreen.number_of_laps <= 0){
                                runscreen.num_of_exercises += 4
                                runscreen.counter = 0
                                runscreen.number_of_laps = Data.a[runscreen.index+3+runscreen.num_of_exercises]*1
                            if (runscreen.name_of_series == "konec_s3r13") {
                                timer.stop()
                                Data.play.push(runscreen.jmeno)
                                pageLoader8.source= "qrc:/end_of_exercise.qml"
                                }
                            }
            }
        } 
        Text { id: label; x: 24; y: 8; width: 108; height: 28; color: "#134981"; text: runscreen.cvik_probehl ? minutes_pause +":"+ seconds_deci_pause+seconds_pause : minutes_lap+":"+seconds_deci_lap+seconds_lap ; horizontalAlignment: Text.AlignHCenter; font.bold: true;font.pointSize: 19 }
    }

}



