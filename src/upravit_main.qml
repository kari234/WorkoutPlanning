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
    id: editscreen
    width: 390
    height: 844
    visible: true
    title: qsTr("WorkoutPlanning")
    property int smazat: -1
    property string nazev: ""
    property int zacatek: -1
    property int konec: -1
    property string edit: ""
    property string zobraz: ""
    property string edituj: ""
    property bool find: false
    property int tmp: -1
    property int total_t: 0
    property bool edit_ok: true

    Component.onCompleted: {
        // Load the list into the screen
        for (var i = 0; i < Data.a.length; i+=1 ) {
            if (i == 0) {
                id_cviky.append({"name": Data.a[0], "trvani": Data.a[1]})
                var jmeno=Data.a[0]
                i=2
                while (Data.a[i] != "konec_s3r13") {
                    id_cviky2.append({"edit_cvik": Data.a[i], "edit_t": Data.a[i+1], "edit_p": Data.a[i+2], "edit_s": Data.a[i+3], "filtruj": jmeno, "test_i1": false, "test_i2": false, "test_i3": false, "test_i4": false})
                    i+=4
                }

            }
            if (Data.a[i] == "konec_s3r13" && i+2 != Data.a.length && i != 0) {
                id_cviky.append({"name": Data.a[i+1], "trvani": Data.a[i+2]})
                var jmeno2= Data.a[i+1]
                i+=3;
                while (Data.a[i] != "konec_s3r13") {
                    id_cviky2.append({"edit_cvik": Data.a[i], "edit_t": Data.a[i+1], "edit_p": Data.a[i+2], "edit_s": Data.a[i+3], "filtruj": jmeno2, "test_i1": false, "test_i2": false, "test_i3": false, "test_i4": false})
                    i+=4
                }
                i-=1
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
        // delete window
        Rectangle {
            id: delete_window

            width: 390
            height: 844
            opacity: 0.68
            visible: false
            x: 0
            y: 0
            z: 100
            anchors.leftMargin: 0
            anchors.topMargin: 0
            rotation: 0

            Rectangle {
                id: rectangle3
                x: 26
                y: 148
                width: 338
                height: 197
                opacity: 1
                color: "#ffffff"
                radius: 12
                border.width: 2

                Text {
                    id: text1
                    x: 29
                    y: 32
                    width: 274
                    height: 92
                    text: "Opravdu chcete sestavu <br>"+ editscreen.nazev +"<br> smazat?"
                    font.pixelSize: 28
                    horizontalAlignment: Text.AlignHCenter
                }

                Rectangle {
                    id: rectangle4
                    x: 0
                    y: 138
                    width: 169
                    height: 59
                    color: "#717171"
                    radius: 12
                    border.width: 3

                    Text {
                        id: text2
                        x: 38
                        y: 13
                        color: "#a53333"
                        text: qsTr("Smazat")
                        font.pixelSize: 28
                    }
                    MouseArea {
                        id: mouseAreaSmazat
                        x: 8
                        y: 0
                        width: 161
                        height: 59
                        onClicked: {
                            id_cviky.remove(editscreen.smazat)


                            for (var i = 0; i < Data.a.length; i+=1 ) {
                                if (Data.a[i] == editscreen.nazev) {
                                    editscreen.zacatek= i
                                }
                                if (Data.a[i] == "konec_s3r13" && editscreen.zacatek != -1) {
                                    editscreen.konec= i+1
                                    break;
                                }
                            }
                            Data.a.splice(editscreen.zacatek, editscreen.konec - editscreen.zacatek)
                            console.log("Remaining elements: " + Data.a);

                            editscreen.zacatek= -1
                            editscreen.konec= -1
                            delete_window.visible= false
                        }
                    }
                }

                Rectangle {
                    id: rectangle5
                    x: 169
                    y: 138
                    width: 169
                    height: 59
                    color: "#d9d9d9"
                    radius: 12
                    border.width: 3

                    Text {
                        id: text3
                        x: 48
                        y: 13
                        text: qsTr("Zrušit")
                        font.pixelSize: 28
                    }

                    MouseArea {
                        id: mouseAreaZrusit
                        x: 8
                        y: 0
                        width: 161
                        height: 59
                        onClicked: delete_window.visible= false;
                    }
                }


            }
        }



        Rectangle {
            id: topBar
            x: 0
            width: 390
            height: 73
            anchors.top: parent.top
            rotation: 0
            anchors.topMargin: 0
            color: "#6F44A6"

            Text {
                id: upravy_text
                x: 142
                y: 37
                width: 106
                height: 36
                text: qsTr("Úpravy")
                font.pixelSize: 30
                horizontalAlignment: Text.AlignHCenter
            }

        }

        //workout icons
        // create workout list
           // List of location in center
           ListModel {
               id: id_cviky
           }


           // Display workouts
           Component {
               id: id_delegate

               Item {
                   height: 150
                   width: editscreen.width * 0.95

                   Rectangle {
                       id: rectangle2
                       x: 8
                       y: 97
                       width: editscreen.width * 0.92
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
                           id: delete_icon
                           x: 301
                           y: 41
                           width: 53
                           height: 49
                           source: "qrc:/aaa/icons/delete.png"
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
                            onClicked: {
                                in_nazev.text= textEdit.text
                                editscreen.zobraz = textEdit.text
                                rectangle2.visible= true
                                edit_modal.show_modal1= true
                                id_container2.visible= true
                                editscreen.edituj= textEdit.text
                                editscreen.edit= textEdit.text
                            }
                       }

                        MouseArea {
                           id: mouseArea1
                           x: 278
                           y: 0
                           width: 96
                           height: 130
                           onClicked: {
                               editscreen.smazat= index
                               editscreen.nazev= textEdit.text
                               delete_window.visible= true
                            }
                        }

                    }
                }

            }

           // Container to store list
           Flickable {
               id: id_container
               anchors {
                   left: editscreen.left
                   top: topBar.bottom
                   right: editscreen.right
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
                           model: id_cviky
                           delegate: id_delegate
                       }
                   }
               }
               ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
               }
           }

           Rectangle {
               id: edit_modal
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
                    onClicked: {
                        edit_modal.show_modal1= false;
                        id_container2.visible= false
                    }
                }
               Button {
                   id: button_safe
                   x: 111
                   y: 568
                   width: 152
                   height: 63
                   text: qsTr("Uložit")
                   icon.source: ""
                   autoRepeat: false
                   font.family: "Arial"
                   icon.width: 25
                   icon.color: "#7EA778"
                   font.pointSize: 36
                   Loader {id: pageLoader3}
                   property string sum_t: ""
                   onClicked: {
                       if(in_nazev.text == "") {
                           editscreen.edit_ok = editscreen.edit_ok && false
                           invalid1.visible= true
                       }

                       for(var u=0; u < id_cviky2.count; u+=1) {
                           if(id_cviky2.get(u).edit_cvik == "") {
                               id_cviky2.setProperty(u, "test_i1", true)
                               editcreen.edit_ok = editscreen.edit_ok && false
                           }
                           if(id_cviky2.get(u).edit_t == "") {
                               id_cviky2.setProperty(u, "test_i2", true)
                               editscreen.edit_ok = editscreen.edit_ok && false
                           }
                           if(id_cviky2.get(u).edit_p == "") {
                               id_cviky2.setProperty(u, "test_i3", true)
                               editscreen.edit_ok = editscreen.edit_ok && false
                           }
                           if(id_cviky2.get(u).edit_s == "") {
                               id_cviky2.setProperty(u, "test_i4", true)
                               editscreen.edit_ok = editscreen.edit_ok && false
                           }

                       }

                       if(editscreen.edit_ok) {
                       for (var i = 0; i < Data.a.length; i+=1 ) {
                           if (Data.a[i] == editscreen.edituj) {
                               editscreen.zacatek= i+2
                               editscreen.tmp = i+1
                           }
                           if (Data.a[i] == "konec_s3r13" && editscreen.zacatek != -1) {
                               editscreen.konec= i
                               break;
                           }
                       }
                       Data.a.splice(editscreen.zacatek, editscreen.konec - editscreen.zacatek)
                       console.log("Remaining elements Safe after delete: " + Data.a);
                       // insert new values na pozici i

                        for (var j=0; j < id_cviky2.count; j+=1) {
                            if(id_cviky2.get(j).filtruj == editscreen.zobraz) {
                                console.log(id_cviky2.get(j).edit_cvik)
                                console.log(id_cviky2.get(j).edit_t)
                                console.log(id_cviky2.get(j).edit_p)
                                console.log(id_cviky2.get(j).edit_s)
                                editscreen.total_t += (id_cviky2.get(j).edit_t * 1 + id_cviky2.get(j).edit_p * 1) * (id_cviky2.get(j).edit_s * 1)
                                Data.a.splice(editscreen.zacatek, 0, id_cviky2.get(j).edit_cvik)
                                Data.a.splice(editscreen.zacatek+1, 0, id_cviky2.get(j).edit_t)
                                Data.a.splice(editscreen.zacatek+2, 0, id_cviky2.get(j).edit_p)
                                Data.a.splice(editscreen.zacatek+3, 0, id_cviky2.get(j).edit_s)
                                editscreen.zacatek += 4
                            }
                        }
                        console.log("Remaining elements after Safe n insert: " + Data.a);
                        Data.a.splice(editscreen.tmp, 1)
                        button_safe.sum_t = editscreen.total_t
                         Data.a.splice(editscreen.tmp, 0, button_safe.sum_t)
                        console.log("Remaining elements after Safe n insert total time: " + Data.a);
                        editscreen.zacatek= -1
                        editscreen.konec= -1
                        editscreen.tmp= -1
                        editscreen.total_t = 0
                        edit_modal.visible= false
                        id_container2.visible= false
                        pageLoader3.source= "qrc:/upravit_main.qml"
                       }
                       editscreen.edit_ok= true
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

                   TextEdit {
                       id: in_nazev
                       x: 8
                       y: 0
                       width: 194
                       height: 40
                       text: ""
                       font.pixelSize: 30
                   }
                   Text {
                       id: invalid1
                       x: 210
                       y: 20
                       visible: false
                       text: "* povinné"
                       color: "red"
                       font.pixelSize: 14
                   }
               }

               Text {
                   id: text1e
                   x: 143
                   y: 100
                   width: 89
                   height: 26
                   text: qsTr("Sestava")
                   font.pixelSize: 22
                   horizontalAlignment: Text.AlignHCenter
               }

               Rectangle {
                   id: rectangle3e
                   x: 8
                   y: 126
                   width: 358
                   height: 436
                   color: "#6C6C6C"
                   //tady to
                }
            }




           ListModel {
               id: id_cviky2
           }


           // Display workout elements
           Component {
               id: id_delegate2

               Item {
                   height: 360
                   width: editscreen.width * 0.9
                   // helps to filter which workout it is
                   Text {
                        id: filtr_cvik
                        width: 0
                        height: 0
                        x:0
                        y:0
                        visible: false
                        text: filtruj
                   }
                   visible: (editscreen.zobraz == filtr_cvik.text)

                   Rectangle {
                       id: rectangle2
                       x: 25
                       y: 300
                       width: editscreen.width * 0.85
                       height: 160
                       radius: 20
                       focus: true
                       color: "#A1A1A1"
                       anchors {
                           top: parent.top
                           topMargin: 10
                           bottom: parent.bottom
                           bottomMargin: 10
                       }
                       MouseArea {
                               anchors.fill: parent
                               onClicked: forceActiveFocus()
                        }

                       Text {
                           id: text2e
                           x: 19
                           y: 8
                           color: "black"
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

                           TextEdit {
                               id: in_cvik
                               overwriteMode: true
                               focus: true
                               x: 8
                               y: 0
                               width: 164
                               height: 40
                               text: qsTr(edit_cvik)
                               //onTextChanged:
                               font.pixelSize: 30
                               onEditingFinished: {
                                    id_cviky2.setProperty(index, "edit_cvik", in_cvik.text)
                               }
                           }
                           Text {
                               id: invalid2
                               x: 210
                               y: 20
                               visible: test_i1
                               text: "* povinné"
                               color: "red"
                               font.pixelSize: 14
                           }
                       }
                       Text {
                           id: text3e
                           x: 19
                           color: "black"
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

                           TextEdit {
                               id: in_cvik_t
                               x: 8
                               width: 105
                               height: 40
                               focus: true
                               text: qsTr(edit_t)
                               anchors.top: parent.top
                               font.pixelSize: 30
                               anchors.topMargin: 0
                               onEditingFinished: {
                                    id_cviky2.setProperty(index, "edit_t", in_cvik_t.text)
                                }
                           }
                           Text {
                               id: invalid3
                               x: 200
                               y: 20
                               visible: test_i2
                               text: "* povinné"
                               color: "red"
                               font.pixelSize: 14
                           }
                           Text {
                               id: min_s
                               x: 130
                               y: 20
                               text: "minut"
                               color: "black"
                               font.pixelSize: 16
                           }
                       }
                       Text {
                           id: text4
                           x: 19
                           color: "black"
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

                           TextEdit {
                               id: in_pauza_t
                               x: 8
                               width: 105
                               height: 40
                               text: edit_p
                               anchors.top: parent.top
                               font.pixelSize: 30
                               anchors.topMargin: 0
                               onEditingFinished: {
                                    id_cviky2.setProperty(index, "edit_p", in_pauza_t.text)
                                }
                           }
                           Text {
                               id: invalid4
                               x: 200
                               y: 20
                               visible: test_i3
                               text: "* povinné"
                               color: "red"
                               font.pixelSize: 14
                           }
                           Text {
                               id: min_p
                               x: 130
                               y: 20
                               text: "minut"
                               color: "black"
                               font.pixelSize: 16
                           }
                       }
                       Text {
                           id: text5
                           x: 19
                           color: "black"
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

                           TextEdit {
                               id: in_serie
                               x: 8
                               width: 55
                               height: 40
                               text: edit_s
                               anchors.top: parent.top
                               font.pixelSize: 30
                               anchors.topMargin: 0
                               onEditingFinished: {
                                    id_cviky2.setProperty(index, "edit_s", in_serie.text)
                                }
                           }
                           Text {
                               id: invalid5
                               x: 210
                               y: 20
                               visible: test_i4
                               text: "* povinné"
                               color: "red"
                               font.pixelSize: 14
                           }
                       }
                       Image {
                           id: delete_e
                           x: 270
                           y: 120
                           width: 59
                           height: 50
                           source: "qrc:/aaa/icons/delete_element.png"
                           fillMode: Image.PreserveAspectFit
                       }
                       MouseArea {
                        id: delete_element
                        x: 270
                        y: 120
                        width: 59
                        height: 50
                        onClicked: {
                            for (var i = 0; i < Data.a.length; i+=1 ) {
                                if (Data.a[i] == filtr_cvik.text) {
                                    editscreen.find= true
                                }
                                if (Data.a[i] == in_cvik.text && editscreen.find) {
                                    editscreen.zacatek= i
                                    break;
                                }
                            }
                            Data.a.splice(editscreen.zacatek, 4)

                            console.log("Remaining elements: " + Data.a);
                            editscreen.find= false
                            editscreen.zacatek= -1
                            editscreen.konec= -1
                            id_cviky2.remove(index)
                        }

                       }


                    }
                }

            }

           // Container to store list
           Flickable {
               id: id_container2
               visible: false
               anchors {
                   left: editscreen.left
                   top: topBar.bottom
                   right: editscreen.right
                   bottom: lowerBar.top
               }
               ScrollView {
                   width: 375
                   height: 436
                   y: 83
               // 1 column in 1 row
               Row {
                   anchors.fill: parent
                   Column {
                       Repeater {
                           model: id_cviky2
                           delegate: id_delegate2
                       }
                        Image {
                            id: add_elem
                            width: 180
                            height: 50
                            x: 30
                            source: "qrc:/aaa/icons/add_element.png"
                            MouseArea {
                                width: 180
                                height: 50
                                onClicked: {
                                    console.log("klik")
                                    id_cviky2.append({"edit_cvik": "", "edit_t": "", "edit_p": "", "edit_s": "", "filtruj": editscreen.zobraz, "test_i1": false, "test_i2": false, "test_i3": false, "test_i4": false}) // ttt
                                }
                            }
                        }
                   }
               }

               ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
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

            Loader {id: pageLoader}

            MouseArea {
                id: mouseHotovo
                x: 287
                y: 0
                width: 103
                height: 60
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                onClicked: pageLoader.source= "qrc:/main.qml"
            }

        }

    }


}
