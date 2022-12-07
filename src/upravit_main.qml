import QtQuick
import QtQuick.Shapes 1.4
import QtQuick.Controls 6.3

Window {
    id: homescreen
    width: 390
    height: 844
    visible: true
    title: qsTr("WorkoutPlanning")
    Rectangle {
        id: rectangle1
        visible: true
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        gradient: Gradient {
            GradientStop {position: 0.100;color: "#6F44A6";}
            GradientStop {position: 0.900;color: Qt.rgba(120, 105, 151, 1);}
        }

        Rectangle {
            id: rectangle
            x: 0
            width: 390
            height: 73
            anchors.top: parent.top
            rotation: 0
            anchors.topMargin: 0
            color: "#6F44A6"

        }

        Rectangle {
            id: rectangle2
            x: 8
            y: 97
            width: 374
            height: 130
            radius: 20
            focus: true
            color: "#8AB5DD"

            Text {
                id: textEdit
                width: 204
                height: 53
                text: qsTr("Cvičení 1")
                anchors.left: parent.left
                anchors.top: parent.top
                font.pixelSize: 40
                anchors.leftMargin: 24
                anchors.topMargin: 14
            }

            Image {
                id: play
                x: 301
                y: 41
                width: 53
                height: 49
                source: "qrc:/icons/play.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: doba_trvani
                x: 24
                y: 89
                width: 104
                height: 23
                text: qsTr("Doba trvani:")
                font.pixelSize: 20
            }

            Text {
                id: minuty
                x: 190
                y: 89
                text: qsTr("min")
                font.pixelSize: 20
            }

            Item {
                id: time
                property int casmin: 11
                x: -44
                y: 101
                width: 163
                height: 0
                Text {
                    id: cas
                    x: 173
                    y: -12
                    width: 48
                    height: 24
                    text: time.casmin
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            MouseArea {
                id: mouseArea
                x: 0
                y: 0
                width: 272
                height: 130
                Rectangle {
                    id: test
                    x: 37

                    y: 84
                    width: 56
                    height: 43
                    visible: false
                    rotation: 172.275
                }
                onClicked: test.visible= true;
            }

            MouseArea {
                id: mouseArea1
                x: 278
                y: 0
                width: 96
                height: 130
                Rectangle {
                    id: test2
                    x: -18

                    y: 195
                    width: 56
                    height: 43
                    visible: false
                    rotation: 172.275
                }
                onClicked: test2.visible= true;
            }

        }

        Rectangle {
            id: lowerBar
            x: 0
            y: 790
            width: 390
            height: 60
            color: "#6686B7"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0

            Text {
                id: hotovo
                x: 306
                y: 15
                text: qsTr("Hotovo")
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                font.pixelSize: 24
                anchors.rightMargin: 7
                anchors.bottomMargin: 14
            }

        }

        MouseArea {
            id: mouseHotovo
            x: 287
            y: 784
            width: 103
            height: 60
            onClicked: "main.qml"
        }


    }

}
