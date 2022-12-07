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

            Image {
                id: plus
                x: 323
                y: 8
                width: 59
                height: 57
                source: "qrc:/aaa/icons/plus.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: user
                x: 8
                y: 8
                width: 53
                height: 49
                source: "qrc:/aaa/icons/user.png"
                fillMode: Image.PreserveAspectFit
            }

            MouseArea {
                id: mouseAreaPlus
                x: 312
                y: 0
                width: 78
                height: 65
                onClicked: add_modal.show_modal1= true;
            }
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
            id: add_modal
            property bool show_modal1: false
            visible: show_modal1
            x: 8
            y: 30
            width: 374
            height: 647
            color: "#555555"
            radius: 20
            Image {
                id: exit_modal
                x: 297
                width: 64
                height: 64
                anchors.right: parent.right
                anchors.top: parent.top
                source: "qrc:/aaa/icons/exit.png"
                anchors.rightMargin: 13
                anchors.topMargin: 13
            }

            MouseArea {
                id: mouseAreaExitAdd
                x: 297
                width: 64
                height: 64
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 13
                anchors.topMargin: 13
                onClicked: add_modal.show_modal1= false;
            }

            Button {
                id: button
                x: 111
                y: 568
                width: 152
                height: 63
                text: qsTr("Přidat")
                icon.source: ""
                autoRepeat: false
                font.family: "Arial"
                icon.width: 25
                icon.color: "#7EA778"
                font.pointSize: 36
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
                id: upravit
                x: 306
                y: 15
                text: qsTr("Upravit")
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                font.pixelSize: 24
                anchors.rightMargin: 7
                anchors.bottomMargin: 14
            }

            Text {
                id: sdileni
                y: 31
                text: qsTr("Sdílené")
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                font.pixelSize: 24
                anchors.leftMargin: 12
                anchors.bottomMargin: 14
            }

            Loader {id: pageLoader}

            MouseArea {
                id: mouseUpravit
                x: 285
                y: 0
                width: 105
                height: 60
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                onClicked: pageLoader.source= "qrc:/upravit_main.qml"
                Rectangle {
                    id: test3
                    x: -91

                    y: -296
                    width: 56
                    height: 43
                    visible: false
                    rotation: 172.275
                }
                //onClicked: test3.visible= true;
            }

        }




    }

}


/*##^##
Designer {
    D{i:0;annotation:"1 //;;//  //;;//  //;;// <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\nli.unchecked::marker { content: \"\\2610\"; }\nli.checked::marker { content: \"\\2612\"; }\n</style></head><body style=\" font-family:'.AppleSystemUIFont'; font-size:13pt; font-weight:400; font-style:normal;\">\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p></body></html> //;;// 1670257531";customId:""}
D{i:26}
}
##^##*/
