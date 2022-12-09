/*
 *** VUT FIT ***
 * ITU project *
 * WorkoutPlanning *
 * 2022/2023 *
 @author: Filip Karasek
 @xlogin: xkaras39
*/


import QtQuick
import QtQuick.Shapes 1.4
import QtQuick.Controls 6.3

// import js file to r/w created workout
import "qrc:/cviky_storage.js" as Data

Window {
    id: homescreen
    width: 390
    height: 844
    visible: true
    title: qsTr("WorkoutPlanning")

    Component.onCompleted: {
        // Load the list into the screen
        for (var i = 0; i < Data.a.length; i+=1 ) {
            if (i == 0) {
                id_leftLocation.append({"name": Data.a[0], "trvani": Data.a[1]})
            }
            if (Data.a[i] == "konec_s3r13" && i+2 != Data.a.length && i != 0) {
                id_leftLocation.append({"name": Data.a[i+1], "trvani": Data.a[i+2]})
                i+=2;
            }
        }
    }


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
            id: top_area
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


         // create workout list
            // List of location in center
            ListModel {
                id: id_leftLocation
            }


            // Display workouts
            Component {
                id: id_leftDelegate

                Item {
                    height: 150
                    width: homescreen.width * 0.95

                    Rectangle {
                        id: rectangle2
                        x: 8
                        y: 97
                        width: homescreen.width * 0.92
                        height: 130
                        radius: 20
                        focus: true
                        color: "#8AB5DD"
                        anchors {
                            top: parent.top
                            topMargin: parent.height * 0.1
                            bottom: parent.bottom
                            bottomMargin: parent.height * 0.1
                        }

                        Text {
                            id: textEdit
                            width: 204
                            height: 53
                            text: name
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
                                text: trvani
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

                                y: 55
                                width: 56
                                height: 43
                                visible: false
                                rotation: 172.275
                            }
                            onClicked: {
                                Data.play.push(textEdit.text)
                                test2.visible= true;
                                console.log("Remaining elements: " + Data.play);
                            }
                        }

                    }
                }
            }

            // Container to store list
            Flickable {
                id: id_container
                anchors {
                    left: homescreen.left
                    top: top_area.bottom
                    right: homescreen.right
                    bottom: lowerBar.top
                }
                ScrollView {
                    width: 385
                    height: 664
                // 1 column in 1 row
                Row {
                    anchors.fill: parent
                    Column {
                        Repeater {
                            model: id_leftLocation
                            delegate: id_leftDelegate
                        }
                    }
                }
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
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
                id: button_add
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
                Loader {id: pageLoader3}
                property string sum_t: (in_cvik_t.text*1+in_pauza_t.text*1)*in_serie.text*1
                onClicked: {
                    Data.a.pop()
                    Data.a.push(in_nazev.text)
                    Data.a.push(button_add.sum_t)
                    Data.a.push(in_cvik.text)
                    Data.a.push(in_cvik_t.text)
                    Data.a.push(in_pauza_t.text)
                    Data.a.push("konec_s3r13")
                    Data.a.push("k0n3c")
                    console.log("Remaining elements: " + Data.a);
                    pageLoader3.source= "qrc:/main.qml"
                    add_modal.visible= false
                }
            }

            Text {
                id: text_nazev
                x: 15
                y: 13
                text: qsTr("Název sestavy:")
                font.pixelSize: 20
            }

            Rectangle {
                id: inputRect1
                x: 15
                y: 54
                width: 210
                height: 40
                color: "#ffffff"
                radius: 6

                TextInput {
                    id: in_nazev
                    x: 8
                    y: 0
                    width: 194
                    height: 40
                    text: ""
                    font.pixelSize: 30
                }
            }

            Text {
                id: text1
                x: 143
                y: 100
                width: 89
                height: 26
                text: qsTr("Sestava")
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
            }

            Rectangle {
                id: rectangle3
                x: 8
                y: 126
                width: 358
                height: 436
                color: "#6C6C6C"
                Item {
                    id: item1
                    Text {
                        id: text2
                        x: 19
                        y: 8
                        color: "#c2bebe"
                        text: qsTr("Jméno cviku")
                        font.pixelSize: 18
                    }
                    Rectangle {
                        id: inputRect2
                        x: 8
                        y: 36
                        width: 180
                        height: 40
                        color: "#ffffff"
                        radius: 6

                        TextInput {
                            id: in_cvik
                            x: 8
                            y: 0
                            width: 164
                            height: 40
                            text: ""
                            font.pixelSize: 30
                        }
                    }
                    Text {
                        id: text3
                        x: 19
                        color: "#c2bebe"
                        text: qsTr("Doba trvání")
                        anchors.top: parent.top
                        font.pixelSize: 18
                        anchors.topMargin: 91
                    }
                    Rectangle {
                        id: inputRect3
                        x: 8
                        width: 121
                        height: 40
                        color: "#ffffff"
                        radius: 6
                        anchors.top: parent.top
                        anchors.topMargin: 119

                        TextInput {
                            id: in_cvik_t
                            x: 8
                            width: 105
                            height: 40
                            text: ""
                            anchors.top: parent.top
                            font.pixelSize: 30
                            anchors.topMargin: 0
                        }
                    }
                    Text {
                        id: text4
                        x: 19
                        color: "#c2bebe"
                        text: qsTr("Pauza")
                        anchors.top: parent.top
                        font.pixelSize: 18
                        anchors.topMargin: 171
                    }
                    Rectangle {
                        id: inputRect4
                        x: 8
                        width: 121
                        height: 40
                        color: "#ffffff"
                        radius: 6
                        anchors.top: parent.top
                        anchors.topMargin: 199

                        TextInput {
                            id: in_pauza_t
                            x: 8
                            width: 105
                            height: 40
                            text: ""
                            anchors.top: parent.top
                            font.pixelSize: 30
                            anchors.topMargin: 0
                        }
                    }
                    Text {
                        id: text5
                        x: 19
                        color: "#c2bebe"
                        text: qsTr("Počet sérií")
                        anchors.top: parent.top
                        font.pixelSize: 18
                        anchors.topMargin: 251
                    }
                    Rectangle {
                        id: inputRect5
                        x: 8
                        width: 69
                        height: 40
                        color: "#ffffff"
                        radius: 6
                        anchors.top: parent.top
                        anchors.topMargin: 279

                        TextInput {
                            id: in_serie
                            x: 8
                            width: 55
                            height: 40
                            text: ""
                            anchors.top: parent.top
                            font.pixelSize: 30
                            anchors.topMargin: 0
                        }
                    }
                }
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
            }

        }




    }

}


/*##^##
Designer {
    D{i:0;annotation:"1 //;;//  //;;//  //;;// <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\nli.unchecked::marker { content: \"\\2610\"; }\nli.checked::marker { content: \"\\2612\"; }\n</style></head><body style=\" font-family:'.AppleSystemUIFont'; font-size:13pt; font-weight:400; font-style:normal;\">\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p></body></html> //;;// 1670257531";customId:""}
D{i:40}D{i:42}D{i:41}
}
##^##*/
