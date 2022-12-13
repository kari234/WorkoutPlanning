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
import "qrc:/profiles.js" as Data

Window {
    id: login_screen
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

        Text {
            id: title
            height: 120
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            text: qsTr("Workout planning")
            font.family: "Helvetica"
            font.pointSize: 24
            font.bold: true
            color: "White"
            horizontalAlignment:  Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Rectangle{
            id: white_field_login
            visible: true
            height: 370
            anchors.top: title.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 65
            anchors.rightMargin: 65
            color: "#D9D9D9"
            radius: 20
            Text {
                id: login
                text: qsTr("Přihlášení do aplikace")
                font.pointSize: 18
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                height: 80
                font.bold: true
                horizontalAlignment:  Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            Text {
                id: login_form1
                text: qsTr("E-mail")
                font.pointSize: 15
                height: 35
                anchors.top: login.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                leftPadding: 35
            }
            TextField {
                id: login_input1
                font.pointSize: 12
                anchors.top: login_form1.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 35
                anchors.rightMargin: 35
                background: Rectangle {
                    radius: 2
                    implicitWidth: 260
                    implicitHeight: 25
                    border.color: "#333"
                    border.width: 1
                }
            }
            Text {
                id: login_form2
                text: qsTr("Heslo")
                font.pointSize: 15
                height: 35
                anchors.top: login_input1.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                leftPadding: 35
            }
            TextField {
                id: login_input2
                font.pointSize: 12
                anchors.top: login_form2.bottom
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
                 id:btn_login
                 anchors.top: login_input2.bottom
                 anchors.horizontalCenter: login_input2.horizontalCenter
                 width: 120
                 height: 35
                 anchors.topMargin: 15
                 color: "#6F44A6"
                 radius: 32
                 Text {
                     id: btn_login_text
                     text: qsTr("Přihlásit")
                     anchors.fill: parent
                     color:"white"
                     font.pointSize: 12
                     horizontalAlignment:  Text.AlignHCenter
                     verticalAlignment: Text.AlignVCenter
                 }
                 MouseArea {
                        id: btn_login_area
                        anchors.fill: parent
                        onClicked: {
                            for(var i = 0; i < Data.profiles.length; i++)
                            {
                                if((Data.profiles[i][2] === login_input1.text) &&
                                    Data.profiles[i][3] === login_input2.text){
                                    Data.signed = i
                                    /*!pop_up_background.visible = true
                                    pop_up_message.text = qsTr("Přihlášení bylo úspěšné!")
                                    btn_login_area.visible = false
                                    btn_register.visible = false*/
                                    console.log("Signed!")
                                    login_screen.close()
                                    return;
                                }
                            }
                            console.log("Wrong mail or password!")
                            pop_up_background.visible = true
                            pop_up_message.text = qsTr("Chyné údaje!")
                            btn_login_area.visible = false
                            btn_register.visible = false
                        }
                 }
            }
            Text {
                id: have_acc
                text: qsTr("Nemáte účet? Zaregistrujte se")
                font.pointSize: 12
                font.bold: true
                height: 45
                anchors.top: btn_login.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment:  Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            Rectangle {
                 id:btn_register
                 anchors.top: have_acc.bottom
                 anchors.horizontalCenter: have_acc.horizontalCenter
                 width: 120
                 height: 35
                 anchors.topMargin: 5
                 color: "#6F44A6"
                 radius: 32
                 Text {
                     id: btn_register_text
                     text: qsTr("Registrovat")
                     anchors.fill: parent
                     color:"white"
                     font.pointSize: 12
                     horizontalAlignment:  Text.AlignHCenter
                     verticalAlignment: Text.AlignVCenter
                 }
                 MouseArea {
                        id: btn_register_area
                        anchors.fill: parent
                        onClicked: {
                            white_field_login.visible = false
                            white_field_register.visible = true
                        }
                 }
            }
        }
        Rectangle{
            id: white_field_register
            visible: false
            height: 460
            anchors.top: title.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 65
            anchors.rightMargin: 65
            color: "#D9D9D9"
            radius: 20

            Text {
                id: register
                text: qsTr("Registrace")
                font.pointSize: 18
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                height: 80
                font.bold: true
                horizontalAlignment:  Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            Text {
                id: form1
                text: qsTr("Jméno")
                font.pointSize: 15
                height: 35
                anchors.top: register.bottom
                anchors.left: parent.left
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
                text: qsTr("Příjmení")
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
                text: qsTr("E-MAIL")
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
                text: qsTr("Heslo")
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
            Text {
                id: form5
                text: qsTr("Potvrzení hesla")
                font.pointSize: 15
                height: 35
                anchors.top: input4.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                leftPadding: 35
            }
            TextField {
                id: input5
                font.pointSize: 12
                anchors.top: form5.bottom
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
            Image {
                id: btn_back
                anchors.top: input5.bottom
                anchors.left: parent.left
                anchors.leftMargin: 35
                anchors.topMargin: 12
                width:  40
                height: 40
                source: "qrc:/aaa/icons/go_back2.png"
                MouseArea {
                   anchors.fill: parent
                   onClicked: {
                       white_field_login.visible = true
                       white_field_register.visible = false
                   }
                }
            }
            Rectangle {
                 id: btn_register_user
                 anchors.top: input5.bottom
                 anchors.left: btn_back.right
                 width: 120
                 height: 35
                 anchors.leftMargin: 30
                 anchors.topMargin: 15
                 color: "#6F44A6"
                 radius: 32
                 Text {
                     id: btn_register_user_text
                     text: qsTr("Registrovat")
                     anchors.fill: parent
                     color:"white"
                     font.pointSize: 12
                     horizontalAlignment:  Text.AlignHCenter
                     verticalAlignment: Text.AlignVCenter
                 }
                 //TODO register
                 MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(((input1.text !== "") &&
                            (input2.text !== "") &&
                            (input3.text !== "") &&
                            (input4.text !== "") &&
                            (input5.text !== "")) &&
                            (input4.text == input5.text))
                        {
                            Data.signed = Data.profiles.length
                            Data.profiles[Data.profiles.length] = ([input1.text,
                                                                    input2.text,
                                                                    input3.text,
                                                                    input4.text])
                            /*!pop_up_background.visible = true
                            pop_up_message.text = qsTr("Registrace byla úspěšná!")
                            btn_back.visible = false
                            btn_register_user.visible = false*/
                            console.log("Registered and signed!")
                            login_screen.close()
                        }else {
                            // TODO popup
                            pop_up_background.visible = true
                            pop_up_message.text = qsTr("Chybná registrace!")
                            btn_back.visible = false
                            btn_register_user.visible = false
                            console.log("Bad registration")
                            console.log("Signed: " + Data.signed)
                            console.log(Data.profiles)

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
                            btn_login_area.visible = true
                            btn_register.visible = true
                            btn_back.visible = true
                            btn_register_user.visible = true
                        }
                    }
                }
            }
        }
    }
}
