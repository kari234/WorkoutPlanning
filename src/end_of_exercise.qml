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

Window{
    id: runscreen
    width: 390
    height: 844
    visible: true
    title: qsTr("WorkoutPlanning")

    Loader {id: pageLoader1}



    Rectangle {
        id: rectangle1
        visible: true
        color: "#cbcfc7"
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

        Text {
            id: text1
            x: 13
            y: 279
            width: 369
            height: 58
            color: "#CBCFC7"
            text: qsTr("Cvičení dokončeno!")
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
        }

        Rectangle {
            id: exercise_done
            x: 90
            y: 702
            width: 211
            height: 84
            color: "#6C9B68"
            radius: 8
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 15

            Image {
                id: repeat
                x: 75
                y: 16
                width: 61
                height: 50
                source: "qrc:/aaa/icons/done_icon.png"
            }
        }
        MouseArea {
            id: done_button
            x: 90
            y: 702
            width: 211
            height: 84
            z: 0
            rotation: 0
            onClicked: pageLoader5.source= "qrc:/main.qml"
        }

        Text {
            id: repeat_title
            x: 159
            y: 388
            width: 73
            height: 22
            color: "#cbcfc7"
            text: qsTr("Opakovat")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
        }

        Image {
            id: image
            x: 166
            y: 416
            width: 58
            height: 49
            source: "qrc:/aaa/icons/repeat.png"
            fillMode: Image.PreserveAspectFit
           
        }
        MouseArea {
            id: button
            x: 166
            y: 416
            width: 58
            height: 49
            onClicked: pageLoader1.source = "qrc:/cviceni.qml" //tady je potreba oprava
        }
    }
}

/*##^##
Designer {
    D{i:0}D{i:9;invisible:true}
}
##^##*/
