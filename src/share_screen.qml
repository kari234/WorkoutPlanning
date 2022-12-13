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
import "qrc:/cviky_storage.js" as Cviky
Window {
    id: share_screen
    width: 390
    height: 844
    visible: true
    title: qsTr("WorkoutPlanning")
    function create_list(){
        for (var i = 0 ; i < Data.shared.length; i++ ) {
            //element_list.append({"name": Data.profiles[i][0], "index": i})
            if((Data.shared[i][0] == Data.signed) || (Data.shared[i][1] == Data.signed)){
                element_list.append({"name": Data.shared[i][2],
                                     "index": i,
                                     "img_path": (Data.shared[i][0] == Data.signed) ? "qrc:/aaa/icons/share2.png" : "qrc:/aaa/icons/share1.png"})
            }
        }
    }
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
        /*Rectangle {
            id: header_menu
            visible: true
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: 73
            color: "#6F44A6"
            Image {
                id: user_img
                anchors.top: parent.top
                anchors.left: parent.left
                width: 73
                height: 73
                source: "qrc:/aaa/icons/user2.png"
                //TODO onClick
                Loader {id: pepa_loader}
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(pepa_loader.source != "")
                            pepa_loader.source= ""
                        pepa_loader.source= "qrc:/profile.qml"

                    }

                }
            }
        }*/
        Rectangle {
            id: footer
            z: 1
            visible: true
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: 60
            color: "#6686B7"
            Image {
                id: btn_back
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 30
                source: "qrc:/aaa/icons/circled-left.png"
                //TODO onClick
                Loader {id: pepa_loader}
                MouseArea{
                    id: btn_back_area
                    anchors.fill: parent
                    onClicked: {
                        pepa_loader.source= "qrc:/main.qml"
                        share_screen.close()
                    }
                }
            }
        }
        Rectangle {
            id: list
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: footer.top
            color: "transparent"
            Item {
                id: element_list_orIDK
                Component.onCompleted: create_list();
            }
            ListModel {
               id: element_list
            }
            Flickable {
                id: id_container
                anchors.fill: parent
                ScrollView {
                    anchors.fill: parent
                    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                    //anchors.horizontalCenter: parent.horizontalCenter
                    Row {
                        anchors.fill: parent
                        //anchors.leftMargin: (parent.width - width)/2
                        //anchors.horizontalCenter: parent.horizontalCenter
                        Column {
                            //anchors.horizontalCenter: parent.horizontalCenter

                            Repeater {
                                model: element_list
                                delegate: element_listDelegate
                            }
                        }
                    }
                }
            }
            // Display workouts
            Component {
                id: element_listDelegate
                Item {
                    height: 140
                    width: share_screen.width * 0.8
                    Rectangle {
                        id: element_list_content
                        width: parent.width * 0.9
                        height: 130
                        radius: 20
                        focus: true
                        color: "#8AB5DD"
                        anchors {
                            top: parent.top
                            topMargin: parent.height * 0.1
                            bottom: parent.bottom
                            bottomMargin: parent.height * 0.1
                            horizontalCenter: parent.horizontalCenter
                        }
                        Image {
                            id: share_img
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.topMargin: 28
                            source: img_path
                        }
                        Text {
                            id: textEdit
                            text: name
                            anchors.top: parent.top
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            anchors.left: share_img.right
                            font.pixelSize: 35
                            horizontalAlignment:  Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                        }
                        MouseArea {
                            id: element_list_area
                            anchors.fill: parent
                            onClicked: {
                                console.log("Index: " + index)
                                pop_up_background.visible = true
                                pop_up_background.index = index
                                pop_up_message1.text = qsTr(Data.shared[index][2])
                                pop_up_message2.text = ""
                                for(var i = 4; i < Data.shared[index].length; i+=4){
                                    pop_up_message2.text = qsTr(pop_up_message2.text + Data.shared[index][i] + "\n")
                                }
                                pop_up_message2.text = qsTr(pop_up_message2.text + "----------------------\n" + Data.shared[index][3] + "minut")
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            id: pop_up_background
            z: 5
            anchors.fill: parent
            color: "#88000000"
            visible: false
            property int index: 1
            MouseArea {
                anchors.fill: parent
                propagateComposedEvents: false
                onClicked: (mouse)=> {
                    console.log("OnClicked denied!")
                    mouse.accepted = false
                }
            }
            Rectangle {
                id: pop_up_content
                anchors.fill: parent
                anchors.margins: 10
                anchors.topMargin: 35
                color: "white"
                radius: 20              
                Rectangle {
                    id: pop_up_top_line_fix
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.topMargin: 25
                    color: "#555555"
                    height: 20
                }
                Rectangle {
                    id: pop_up_top_line
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    color: "#555555"
                    height: 45
                    radius: 18
                    Image {
                        anchors.top: parent.top
                        anchors.right: parent.right
                        anchors.margins: 5
                        source: "qrc:/aaa/icons/close2.png"
                        width: 40
                        height: 40
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                pop_up_background.visible = false
                            }
                        }
                    }
                }
                Text {
                    id: pop_up_message1
                    font.pointSize: 24
                    font.bold: true
                    anchors.top: pop_up_top_line.bottom
                    //horizontalAlignment:  Text.AlignHCenter
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 20
                    height: 40 //TODO
                    text: qsTr("Toto je defaultní popup message")
                }
                Text {
                    id: pop_up_message2
                    font.pointSize: 16
                    anchors.top: pop_up_message1.bottom
                    //horizontalAlignment:  Text.AlignHCenter
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 20
                    //height: 80 //TODO
                    anchors.bottom: btn_rate.top
                    text: qsTr("Toto je defaultní popup message")
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
                        text: qsTr("Hotovo")
                        font.pointSize: 12
                        horizontalAlignment:  Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            pop_up_background.visible = false
                        }
                    }
                }
                Rectangle {
                    id: btn_add
                    anchors.bottom: btn_confirm.top
                    anchors.right: parent.right
                    anchors.bottomMargin: 15
                    width: 100
                    height: 35
                    color: "#6F44A6"
                    radius: 10
                    anchors.rightMargin: (parent.width/2 - width)/2
                    Text {
                        color: "white"
                        anchors.fill: parent
                        text: qsTr("Přidat")
                        font.pointSize: 12
                        horizontalAlignment:  Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            pop_up_background.visible = false
                            var j = Cviky.a.length - 1
                            for(var i = 2; i < Data.shared[pop_up_background.index].length; i++){
                                Cviky.a[j++] = Data.shared[pop_up_background.index][i]
                            }
                            Cviky.a[j++] = "konec_s3r13"
                            Cviky.a[j++] = "k0n3c"

                            console.log(Cviky.a)

                            Data.shared.splice(pop_up_background.index, 1)
                            element_list.clear()
                            create_list()
                        }
                    }
                }
                Rectangle {
                    id: btn_remove
                    anchors.bottom: btn_confirm.top
                    anchors.left: parent.left
                    anchors.bottomMargin: 15
                    width: 100
                    height: 35
                    color: "#C91515"
                    radius: 10
                    anchors.leftMargin: (parent.width/2 - width)/2
                    Text {
                        color: "white"
                        anchors.fill: parent
                        text: qsTr("Odebrat")
                        font.pointSize: 12
                        horizontalAlignment:  Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            Data.shared.splice(pop_up_background.index, 1)
                            pop_up_background.visible = false
                            element_list.clear()
                            create_list()
                        }
                    }
                }
                Rectangle {
                    id: btn_rate
                    anchors.bottom: btn_add.top
                    anchors.bottomMargin: 15
                    anchors.right: parent.right
                    width: 100
                    height: 35
                    color: "#ACBB4E"
                    radius: 10
                    anchors.rightMargin: (parent.width/2 - width)/2
                    Text {
                        color: "white"
                        anchors.fill: parent
                        text: qsTr("Ohodnotit")
                        font.pointSize: 12
                        horizontalAlignment:  Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("Number of stars: " + pop_up_star_wrapper.number_of_stars)
                        }
                    }
                }
                Rectangle {
                    id: pop_up_star_wrapper
                    property int number_of_stars: 0
                    anchors.bottom: btn_rate.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 15
                    width: 200
                    height:50
                    color:"transparent"

                    Image {
                        id: star1
                        source: "qrc:/aaa/icons/star_empty.png"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: ((parent.width - width*5)/ 6) + (((parent.width - width*5)/ 6) + width) * 0
                        anchors.left: parent.left
                        height: 40
                        width: 40
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                star1.source = "qrc:/aaa/icons/star.png"
                                star2.source = "qrc:/aaa/icons/star_empty.png"
                                star3.source = "qrc:/aaa/icons/star_empty.png"
                                star4.source = "qrc:/aaa/icons/star_empty.png"
                                star5.source = "qrc:/aaa/icons/star_empty.png"
                                pop_up_star_wrapper.number_of_stars = 1
                            }
                        }
                    }
                    Image {
                        id: star2
                        source: "qrc:/aaa/icons/star_empty.png"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: ((parent.width - width*5)/ 6) + (((parent.width - width*5)/ 6) + width) * 1
                        anchors.left: parent.left
                        height: 40
                        width: 40
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                star1.source = "qrc:/aaa/icons/star.png"
                                star2.source = "qrc:/aaa/icons/star.png"
                                star3.source = "qrc:/aaa/icons/star_empty.png"
                                star4.source = "qrc:/aaa/icons/star_empty.png"
                                star5.source = "qrc:/aaa/icons/star_empty.png"
                                pop_up_star_wrapper.number_of_stars = 2
                            }
                        }
                    }
                    Image {
                        id: star3
                        source: "qrc:/aaa/icons/star_empty.png"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: ((parent.width - width*5)/ 6) + (((parent.width - width*5)/ 6) + width) * 2
                        anchors.left: parent.left
                        height: 40
                        width: 40
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                star1.source = "qrc:/aaa/icons/star.png"
                                star2.source = "qrc:/aaa/icons/star.png"
                                star3.source = "qrc:/aaa/icons/star.png"
                                star4.source = "qrc:/aaa/icons/star_empty.png"
                                star5.source = "qrc:/aaa/icons/star_empty.png"
                                pop_up_star_wrapper.number_of_stars = 3
                            }
                        }
                    }
                    Image {
                        id: star4
                        source: "qrc:/aaa/icons/star_empty.png"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: ((parent.width - width*5)/ 6) + (((parent.width - width*5)/ 6) + width) * 3
                        anchors.left: parent.left
                        height: 40
                        width: 40
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                star1.source = "qrc:/aaa/icons/star.png"
                                star2.source = "qrc:/aaa/icons/star.png"
                                star3.source = "qrc:/aaa/icons/star.png"
                                star4.source = "qrc:/aaa/icons/star.png"
                                star5.source = "qrc:/aaa/icons/star_empty.png"
                                pop_up_star_wrapper.number_of_stars = 4
                            }
                        }
                    }
                    Image {
                        id: star5
                        source: "qrc:/aaa/icons/star_empty.png"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: ((parent.width - width*5)/ 6) + (((parent.width - width*5)/ 6) + width) * 4
                        anchors.left: parent.left
                        height: 40
                        width: 40
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                star1.source = "qrc:/aaa/icons/star.png"
                                star2.source = "qrc:/aaa/icons/star.png"
                                star3.source = "qrc:/aaa/icons/star.png"
                                star4.source = "qrc:/aaa/icons/star.png"
                                star5.source = "qrc:/aaa/icons/star.png"
                                pop_up_star_wrapper.number_of_stars = 5
                            }
                        }
                    }
                }
            }
        }
    }
}
