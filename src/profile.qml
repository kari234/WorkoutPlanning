/*!
 *** VUT FIT ***
 * ITU project *
 * WorkoutPlanning *
 * 2022/2023 *
 @author: Josef Kuba
 @xlogin: xkubaj03
*/
import QtQuick
import QtQuick.Shapes 1.4
import QtQuick.Controls 6.3
import QtCharts 2.3
import "qrc:/profiles.js" as Data
Window {
    id: profile_screen
    width: 390
    height: 844
    visible: true
    title: qsTr("WorkoutPlanning")
    Rectangle {
        id: main
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
            id: header_menu
            visible: true
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: 73
            color: "#6F44A6"

            Image {
                id: menu
                anchors.top: parent.top
                anchors.left: parent.left
                width: 63
                height: 63
                anchors.margins: 5
                anchors.leftMargin: 10
                source: "qrc:/aaa/icons/menu.png"
                MouseArea {
                    id: btn_menu_area
                    anchors.fill: parent
                    onClicked: {
                        profile_screen.close()
                    }
                }
            }
            Image {
                id: settings
                anchors.top: parent.top
                anchors.right: parent.right
                width: 63
                height: 63
                anchors.margins: 5
                anchors.rightMargin: 10
                source: "qrc:/aaa/icons/settings.png"
                MouseArea {
                    id: btn_settings_area
                    anchors.fill: parent
                    onClicked: {
                        profile_settings.visible = !profile_settings.visible
                        profile_data.visible = !profile_data.visible
                        footer.visible = !footer.visible
                    }
                }
            }
        }
        Rectangle {
            id: footer
            z: 1
            visible: true
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: 60
            color: "#6686B7"
            Text{
                height: parent.height
                width: parent.width/3
                anchors.left: parent.left
                anchors.top: parent.top
                text: qsTr("Týden")
                horizontalAlignment:  Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 26
                font.bold: true
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        graph_1.visible = true
                        graph_2.visible = false
                        graph_3.visible = false
                    }
                }
            }
            Text{
                height: parent.height
                width: parent.width/3
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                text: qsTr("Měsíc")
                horizontalAlignment:  Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 26
                font.bold: true
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        graph_1.visible = false
                        graph_2.visible = true
                        graph_3.visible = false
                    }
                }
            }
            Text{
                height: parent.height
                width: parent.width/3
                anchors.right: parent.right
                anchors.top: parent.top
                text: qsTr("Rok")
                horizontalAlignment:  Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 26
                font.bold: true
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        graph_1.visible = false
                        graph_2.visible = false
                        graph_3.visible = true
                    }
                }
            }

        }
        Rectangle {
            id: profile_settings
            visible: false
            height: 340
            anchors.top: header_menu.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 65
            anchors.rightMargin: 65
            color: "#D9D9D9"
            radius: 20
            Text {
                id: form1
                text: qsTr("Nové jméno")
                font.pointSize: 15
                height: 35
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 15
                anchors.right: parent.right
                leftPadding: 35
            }
            TextField {
                id: input1
                font.pointSize: 12
                anchors.top: form1.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 35
                anchors.rightMargin: 35
                placeholderText:  qsTr(Data.profiles[Data.signed][0])
                background: Rectangle {
                    radius: 2
                    implicitWidth: 260
                    implicitHeight: 25
                    border.color: "#333"
                    border.width: 1
                }
            }
            Text {
                id: form2
                text: qsTr("Nové příjmení")
                font.pointSize: 15
                height: 35
                anchors.top: input1.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                leftPadding: 35
            }
            TextField {
                id: input2
                font.pointSize: 12
                anchors.top: form2.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 35
                anchors.rightMargin: 35
                placeholderText:  qsTr(Data.profiles[Data.signed][1])
                background: Rectangle {
                    radius: 2
                    implicitWidth: 260
                    implicitHeight: 25
                    border.color: "#333"
                    border.width: 1
                }
            }
            Text {
                id: form3
                text: qsTr("Staré heslo")
                font.pointSize: 15
                height: 35
                anchors.top: input2.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                leftPadding: 35
            }
            TextField {
                id: input3
                font.pointSize: 12
                anchors.top: form3.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 35
                anchors.rightMargin: 35
                echoMode: TextInput.Password
                background: Rectangle {
                    radius: 2
                    implicitWidth: 260
                    implicitHeight: 25
                    border.color: "#333"
                    border.width: 1
                }
            }
            Text {
                id: form4
                text: qsTr("Nové heslo")
                font.pointSize: 15
                height: 35
                anchors.top: input3.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                leftPadding: 35
            }
            TextField {
                id: input4
                font.pointSize: 12
                anchors.top: form4.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 35
                anchors.rightMargin: 35
                echoMode: TextInput.Password
                background: Rectangle {
                    radius: 2
                    implicitWidth: 260
                    implicitHeight: 25
                    border.color: "#333"
                    border.width: 1
                }
            }
            Rectangle {
                id: btn_confirm_changes
                anchors.top: input4.bottom
                anchors.horizontalCenter: input4.horizontalCenter
                anchors.topMargin: 15
                width: 120
                height: 35
                color: "#7EA778"
                radius: 10
                Text {
                    color: "white"
                    anchors.fill: parent
                    text: qsTr("Potvrdit")
                    font.pointSize: 12
                    horizontalAlignment:  Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                MouseArea {
                    id: btn_confirm_changes_area
                   anchors.fill: parent
                   onClicked: {
                        if((input3.text === Data.profiles[Data.signed][3])&& (input4.text !== ""))
                        {    // Correct password
                            if(input1.text != 0) Data.profiles[Data.signed][0] = (input1.text)
                            if(input2.text != 0) Data.profiles[Data.signed][1] = (input2.text)
                            Data.profiles[Data.signed][3] = (input4.text)
                            console.log("Changes have been saved!")
                            user_name_text.text = qsTr(Data.profiles[Data.signed][0] + " " + Data.profiles[Data.signed][1])
                        }else {
                            // TODO popup
                            pop_up_background.visible = true
                            pop_up_message.text = qsTr("Chybné heslo!")
                            btn_settings_area.visible = false
                            btn_menu_area.visible = false
                            btn_confirm_changes_area.visible = false
                            console.log("Incorrect password")
                            console.log("Signed: " + Data.signed)
                            console.log(Data.profiles)
                        }
                   }
                }
            }

        }
        Rectangle {
            id: profile_data
            visible: true
            anchors.top: header_menu.bottom
            anchors.bottom: footer.top
            anchors.left: parent.left
            anchors.right: parent.right
            color: "transparent"
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                id: user_name
                anchors.top: parent.top
                height: 50
                width: parent.width*0.7
                color: "#D9D9D9"                
                radius: 20
                Text {
                    id: user_name_text
                    anchors.fill: parent
                    font.pointSize: 18
                    text: qsTr(Data.profiles[Data.signed][0] + " " + Data.profiles[Data.signed][1])
                    horizontalAlignment:  Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }            
            Rectangle {
                id: graph_wrapper
                anchors.top: user_name.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 20
                color: "white"
                radius: 20
                Rectangle {
                    id: graph_1
                    visible: true
                    anchors.fill: parent
                    Text {
                        id: popis1
                        text: qsTr("Po")
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*7)/ 8) + (((parent.width - width*7)/ 8) + width) * 0
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 22
                    }
                    Text {
                        id: popis2
                        text: qsTr("Út")
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*7)/ 8) + (((parent.width - width*7)/ 8) + width) * 1
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 22
                    }
                    Text {
                        id: popis3
                        text: qsTr("St")
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*7)/ 8) + (((parent.width - width*7)/ 8) + width) * 2
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 22
                    }
                    Text {
                        id: popis4
                        text: qsTr("Čt")
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*7)/ 8) + (((parent.width - width*7)/ 8) + width) * 3
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 22
                    }
                    Text {
                        id: popis5
                        text: qsTr("Pá")
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*7)/ 8) + (((parent.width - width*7)/ 8) + width) * 4
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 22
                    }
                    Text {
                        id: popis6
                        text: qsTr("So")
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*7)/ 8) + (((parent.width - width*7)/ 8) + width) * 5
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 22
                    }
                    Text {
                        id: popis7
                        text: qsTr("Ne")
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*7)/ 8) + (((parent.width - width*7)/ 8) + width) * 6
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 22
                    }
                    Rectangle {
                        id: col1
                        anchors.bottom: popis1.top
                        anchors.horizontalCenter: popis1.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 30
                        height: 70
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col2
                        anchors.bottom: popis2.top
                        anchors.horizontalCenter: popis2.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 30
                        height: 90
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col3
                        anchors.bottom: popis3.top
                        anchors.horizontalCenter: popis3.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 30
                        height: 40
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col4
                        anchors.bottom: popis4.top
                        anchors.horizontalCenter: popis4.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 30
                        height: 120
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col5
                        anchors.bottom: popis5.top
                        anchors.horizontalCenter: popis5.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 30
                        height: 150
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col6
                        anchors.bottom: popis6.top
                        anchors.horizontalCenter: popis6.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 30
                        height: 90
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col7
                        anchors.bottom: popis7.top
                        anchors.horizontalCenter: popis7.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 30
                        height: 50
                        color: "#6F44A6"
                    }

                }
                Rectangle {
                    id: graph_2
                    visible: false
                    anchors.fill: parent
                    Text {
                        id: popis21
                        text: qsTr("První")
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*4)/ 5) + (((parent.width - width*4)/ 5) + width) * 0
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 19
                    }
                    Text {
                        id: popis22
                        text: qsTr("Druhý")
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*4)/ 5) + (((parent.width - width*4)/ 5) + width) * 1
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 19
                    }
                    Text {
                        id: popis23
                        text: qsTr("Třetí")
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*4)/ 5) + (((parent.width - width*4)/ 5) + width) * 2
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 19
                    }
                    Text {
                        id: popis24
                        text: qsTr("Čtvrtý")
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*4)/ 5) + (((parent.width - width*4)/ 5) + width) * 3
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 19
                    }
                    Rectangle {
                        id: col21
                        anchors.bottom: popis21.top
                        anchors.horizontalCenter: popis21.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 40
                        height: 70
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col22
                        anchors.bottom: popis22.top
                        anchors.horizontalCenter: popis22.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 40
                        height: 90
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col23
                        anchors.bottom: popis23.top
                        anchors.horizontalCenter: popis23.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 40
                        height: 40
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col24
                        anchors.bottom: popis24.top
                        anchors.horizontalCenter: popis24.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 40
                        height: 120
                        color: "#6F44A6"
                    }

                }
                Rectangle {
                    id: graph_3
                    visible: false
                    anchors.fill: parent
                    Text {
                        id: popis31
                        text: qsTr("Led")
                        rotation: -45
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*12)/ 13) + (((parent.width - width*12)/ 13) + width) * 0
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                    Text {
                        id: popis32
                        text: qsTr("Úno")
                        rotation: -45
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*12)/ 13) + (((parent.width - width*12)/ 13) + width) * 1
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                    Text {
                        id: popis33
                        text: qsTr("Bře")
                        rotation: -45
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*12)/ 13) + (((parent.width - width*12)/ 13) + width) * 2
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                    Text {
                        id: popis34
                        text: qsTr("Dub")
                        rotation: -45
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*12)/ 13) + (((parent.width - width*12)/ 13) + width) * 3
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                    Text {
                        id: popis35
                        text: qsTr("Kvě")
                        rotation: -45
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*12)/ 13) + (((parent.width - width*12)/ 13) + width) * 4
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                    Text {
                        id: popis36
                        text: qsTr("Čer")
                        rotation: -45
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*12)/ 13) + (((parent.width - width*12)/ 13) + width) * 5
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                    Text {
                        id: popis37
                        text: qsTr("Červ")
                        rotation: -45
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*12)/ 13) + (((parent.width - width*12)/ 13) + width) * 6
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                    Text {
                        id: popis38
                        text: qsTr("Srp")
                        rotation: -45
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*12)/ 13) + (((parent.width - width*12)/ 13) + width) * 7
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                    Text {
                        id: popis39
                        text: qsTr("Zář")
                        rotation: -45
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*12)/ 13) + (((parent.width - width*12)/ 13) + width) * 8
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                    Text {
                        id: popis3A
                        text: qsTr("Říj")
                        rotation: -45
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*12)/ 13) + (((parent.width - width*12)/ 13) + width)*9
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                    Text {
                        id: popis3B
                        text: qsTr("Lis")
                        rotation: -45
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*12)/ 13) + (((parent.width - width*12)/ 13) + width)*10
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                    Text {
                        id: popis3C
                        text: qsTr("Pro")
                        rotation: -45
                        height: 20
                        width: 30
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: ((parent.width - width*12)/ 13) + (((parent.width - width*12)/ 13) + width)*11
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                    Rectangle {
                        id: col31
                        anchors.bottom: popis31.top
                        anchors.horizontalCenter: popis31.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 15
                        height: 70
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col32
                        anchors.bottom: popis32.top
                        anchors.horizontalCenter: popis32.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 15
                        height: 90
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col33
                        anchors.bottom: popis33.top
                        anchors.horizontalCenter: popis33.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 15
                        height: 40
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col34
                        anchors.bottom: popis34.top
                        anchors.horizontalCenter: popis34.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 15
                        height: 120
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col35
                        anchors.bottom: popis35.top
                        anchors.horizontalCenter: popis35.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 15
                        height: 150
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col36
                        anchors.bottom: popis36.top
                        anchors.horizontalCenter: popis36.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 15
                        height: 90
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col37
                        anchors.bottom: popis37.top
                        anchors.horizontalCenter: popis37.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 15
                        height: 50
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col38
                        anchors.bottom: popis38.top
                        anchors.horizontalCenter: popis38.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 15
                        height: 65
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col39
                        anchors.bottom: popis39.top
                        anchors.horizontalCenter: popis39.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 15
                        height: 88
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col3A
                        anchors.bottom: popis3A.top
                        anchors.horizontalCenter: popis3A.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 15
                        height: 120
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col3B
                        anchors.bottom: popis3B.top
                        anchors.horizontalCenter: popis3B.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 15
                        height: 90
                        color: "#6F44A6"
                    }
                    Rectangle {
                        id: col3C
                        anchors.bottom: popis3C.top
                        anchors.horizontalCenter: popis3C.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 15
                        height: 40
                        color: "#6F44A6"
                    }

                }
                Rectangle {
                    id: user_info
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 20
                    height: 150
                    color: "#D9D9D9"
                    radius: 20
                    Text {
                        id: text_weigth
                        height: 50
                        width: parent.width
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        horizontalAlignment:  Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 20
                        font.bold: true
                        text: qsTr("Váha (kg):")
                    }
                    Text {
                        height: 50
                        width: parent.width
                        anchors.top: parent.top
                        anchors.topMargin: 50
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        horizontalAlignment:  Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 20
                        font.bold: true
                        text: qsTr("Výška (m):")
                    }
                    Text {
                        id: bmi_text
                        height: 50
                        width: parent.width
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        horizontalAlignment:  Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 20
                        font.bold: true
                        text: qsTr("BMI: " + (Data.profiles[Data.signed][4] / (Data.profiles[Data.signed][5] * Data.profiles[Data.signed][5])).toFixed(2))
                    }
                    TextField {
                        id: form_weigth
                        font.pointSize: 12
                        anchors.top: parent.top
                        anchors.right: parent.right
                        anchors.margins: 10
                        height: 30
                        width: 100
                        placeholderText:  qsTr("" + Data.profiles[Data.signed][4])
                        background: Rectangle {
                            radius: 2
                            implicitWidth: 260
                            implicitHeight: 25
                            border.color: "#333"
                            border.width: 1
                        }
                    }
                    TextField {
                        id: form_heigth
                        font.pointSize: 12
                        anchors.top: parent.top
                        anchors.right: parent.right
                        anchors.margins: 10
                        anchors.topMargin: 60
                        height: 30
                        width: 100
                        placeholderText:  qsTr("" + Data.profiles[Data.signed][5])
                        background: Rectangle {
                            radius: 2
                            implicitWidth: 260
                            implicitHeight: 25
                            border.color: "#333"
                            border.width: 1
                        }
                    }
                    Rectangle {
                        id: btn_calculate
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.margins: 10
                        width: 100
                        height: 35
                        color: "#7EA778"
                        radius: 10
                        Text {
                            color: "white"
                            anchors.fill: parent
                            text: qsTr("Vypočítat")
                            font.pointSize: 12
                            horizontalAlignment:  Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log(Data.profiles[Data.signed])
                                var height = Number(form_heigth.text)
                                var weigth = Number(form_weigth.text)
                                bmi_text.text = qsTr("BMI: " + (weigth / (height * height)).toFixed(2))
                                Data.profiles[Data.signed][4] = Number(form_weigth.text)
                                Data.profiles[Data.signed][5] = Number(form_heigth.text)
                                console.log(Data.profiles[Data.signed])
                            }
                        }
                    }

                }
            }
        }

        Rectangle {
            id: pop_up_background
            anchors.fill: parent
            color: "#88000000"
            visible: false
            Rectangle {
                id: pop_up_content
                //anchors.fill: parent
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 10
                anchors.topMargin: 35
                color: "white"
                radius: 20
                width: 300
                height: 150
                Rectangle {
                    id: pop_up_top_line
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    color: "#555555"
                    height: 45
                    radius: 18
                }
                Rectangle {
                    id: pop_up_top_line_fix
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.topMargin: 25
                    color: "#555555"
                    height: 20
                }
                Text {
                    id: pop_up_message
                    font.pointSize: 18
                    anchors.top: pop_up_top_line.bottom
                    horizontalAlignment:  Text.AlignHCenter
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 80
                }
                Rectangle {
                    id: btn_confirm
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 15
                    width: 100
                    height: 35
                    color: "#7EA778"
                    radius: 10
                    Text {
                        color: "white"
                        anchors.fill: parent
                        text: qsTr("Potvrdit")
                        font.pointSize: 12
                        horizontalAlignment:  Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            pop_up_background.visible = false
                            btn_menu_area.visible = true
                            btn_settings_area.visible = true
                            btn_confirm_changes_area.visible = true
                        }
                    }
                }
            }
        }
    }
}
