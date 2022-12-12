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
    property int total_t: 0
    property int tmp: -1
    property bool ok_input: true
    property string shared_Wo: ""

    Component.onCompleted: {
        // Load the list into the screen
        for (var i = 0; i < Data.a.length; i+=1 ) {
            if (i == 0) {
                id_cviky.append({"name": Data.a[0], "trvani": Data.a[1]})
            }
            if (Data.a[i] == "konec_s3r13" && i+2 != Data.a.length && i != 0) {
                id_cviky.append({"name": Data.a[i+1], "trvani": Data.a[i+2]})
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
            id: share_form
            x: 15
            y: 50
            z: 100
            opacity: 100
            visible: false
            width: 360
            height: 300
            radius: 14
            color: "#555555"
            Image {
                id: exit_share
                width: 54
                height: 54
                anchors.right: parent.right
                anchors.top: parent.top
                source: "qrc:/aaa/icons/exit.png"
                anchors.rightMargin: 13
                anchors.topMargin: 13
            }
            MouseArea {
                id: mouseAreaExitShare
                width: 54
                height: 54
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 13
                anchors.topMargin: 13
                onClicked: {
                    share_blurry.visible= false
                    share_form.visible= false
                    in_email.text= ""
                    invalidEm.visible= false
                }
            }
            Text {
                id: name_shared
                x: 30
                y: 15
                text: homescreen.shared_Wo
                font.pixelSize: 38
                font.bold: true
            }
            Text {
                id: text_email
                x: 30
                y: 70
                text: qsTr("Sdílet s (email):")
                font.pixelSize: 30
            }

            Rectangle {
                id: inputEmailRec
                x: 30
                y: 140
                width: 300
                height: 40
                color: "#ffffff"
                radius: 6

                TextInput {
                    id: in_email
                    x: 8
                    y: 0
                    width: 290
                    height: 40
                    text: ""
                    font.pixelSize: 30
                    onEditingFinished: {
                        if(in_email.text == "") {
                            invalidEm.visible= true
                        }
                        else {
                            invalidEm.visible= false
                        }
                    }
                    Text {
                        id: invalidEm
                        x: 210
                        y: 50
                        visible: false
                        text: "* povinné"
                        color: "red"
                        font.pixelSize: 14
                    }
                }
            }
            Button {
                id: share_b
                width: 150
                x: 105
                height: 63
                text: qsTr("Sdílet")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 15
                icon.source: ""
                autoRepeat: false
                font.family: "Arial"
                icon.width: 25
                icon.color: "#7EA778"
                font.pointSize: 36
                onClicked: {
                    if(in_email.text == "") {
                        invalidEm.visible= true
                    }
                    else {
                        /*
                        *****************************
                        **********  PEPA ************
                         - homescreen.shared_Wo
                         - v tom je nahranej název toho cviku kterej se má sdílet

                         - in_email.text
                         - v tom je nahraný email člověka s kterým to chce sdílet

                         ***************************
                         - sem si napiš ten kód aby se to pushnulo k těm sdíleným
                         - musíš to napsat do tohodle else{} nad to share_form.visible... jinak to nebude fungovat
                        */
                        share_form.visible= false
                        share_blurry.visible= false
                        invalidEm.visible= false
                        in_email.text= ""
                    }
                }
            }
        }
        Rectangle {
            id: share_blurry
            width: 390
            height: 844
            visible: false
            opacity: 0.68
            x: 0
            y: 0
            z: 20
            anchors.leftMargin: 0
            anchors.topMargin: 0
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
                onClicked: {
                    add_modal.show_modal1= true
                    id_container2.visible= true
                    id_cviky2.append({"edit_cvik": "", "edit_t": "", "edit_p": "", "edit_s": "", "test_i1": false, "test_i2": false, "test_i3": false, "test_i4": false})
                }
            }
        }


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
                            onClicked: {
                                info_modal.visible= true
                                nazev_info.text= textEdit.text
                                for (var i = 0; i < Data.a.length; i+=1) {
                                    if(Data.a[i] == textEdit.text) {
                                        min_info.text = Data.a[i+1] + " minut"
                                        i+=2
                                        while(Data.a[i] != "konec_s3r13") {
                                            cv_info.text += Data.a[i] + "<br>"
                                            i+=4
                                        }
                                        break
                                    }
                                }
                            }
                        }
                        Loader {id: pagePlay}

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

                                    pagePlay.source= "qrc:/cviceni.qml"

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
                            model: id_cviky
                            delegate: id_delegate
                        }
                    }
                }
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                }
            }



        // show info about workout
            Rectangle {
                id: info_modal
                visible: false
                x: 8
                y: 30
                width: 374
                height: 647
                color: "#555555"
                radius: 20
                Image {
                    id: exit_info
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
                    id: mouseAreaExitInfo
                    x: 297
                    width: 64
                    height: 64
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 13
                    anchors.topMargin: 13
                    onClicked: {
                        info_modal.visible= false
                        cv_info.text= ""
                    }
                }

                Button {
                    id: button_info
                    x: 111
                    y: 568
                    width: 152
                    height: 63
                    text: qsTr("Hotovo")
                    icon.source: ""
                    autoRepeat: false
                    font.family: "Arial"
                    icon.width: 25
                    icon.color: "#7EA778"
                    font.pointSize: 36
                    onClicked: {
                        info_modal.visible= false
                        cv_info.text= ""
                    }
                }


                Rectangle {
                    id: rectangle_infoshow
                    x: 8
                    y: 90
                    width: 358
                    height: 456
                    color: "white"
                    Text {
                        id: nazev_info
                        x: 30
                        y: 15
                        text: ""
                        font.pixelSize: 38
                        font.bold: true
                    }
                    Text {
                        id: cv_info
                        x: 30
                        y: 55
                        text: ""
                        font.pixelSize: 30
                    }
                    Text {
                        id: safrovani
                        x: 30
                        y: 300
                        text: "----------------------"
                        font.pixelSize: 30
                    }
                    Text {
                        id: min_info
                        x: 30
                        y: 330
                        text: ""
                        font.pixelSize: 30
                    }
                    Image {
                        id: share
                        width: 70
                        height: 70
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 13
                        anchors.bottomMargin: 13
                        source: "qrc:/aaa/icons/share_href.png"
                    }
                    MouseArea {
                        id: share_link
                        width: 70
                        height: 70
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 13
                        anchors.bottomMargin: 13
                        onClicked: {
                            homescreen.shared_Wo= nazev_info.text
                            share_blurry.visible= true
                            share_form.visible= true
                        }
                    }
                    Image {
                        id: edit_href
                        width: 70
                        height: 70
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 13
                        anchors.bottomMargin: 13
                        source: "qrc:/aaa/icons/edit_href.png"
                    }
                    Loader{id: edit_go}
                    MouseArea {
                        id: edit_link
                        width: 70
                        height: 70
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 13
                        anchors.bottomMargin: 13
                        onClicked: {
                            edit_go.source= "qrc:/upravit_main.qml"
                        }
                    }
                }
            }



        // add new workout modal window
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
                onClicked: {
                    add_modal.show_modal1= false
                    id_container2.visible= false
                    for (var j=0; j < id_cviky2.count; j+=1) {
                        id_cviky2.remove(j)
                        j=-1;
                    }
                }
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
                property string sum_t: ""
                Loader {id: pageLoader3}
                onClicked: {
                    if(in_nazev.text == "") {
                        homescreen.ok_input = homescreen.ok_input && false
                        invalid1.visible= true
                    }

                    for(var u=0; u < id_cviky2.count; u+=1) {
                        if(id_cviky2.get(u).edit_cvik == "") {
                            id_cviky2.setProperty(u, "test_i1", true)
                            homescreen.ok_input = homescreen.ok_input && false
                        }
                        if(id_cviky2.get(u).edit_t == "") {
                            id_cviky2.setProperty(u, "test_i2", true)
                            homescreen.ok_input = homescreen.ok_input && false
                        }
                        if(id_cviky2.get(u).edit_p == "") {
                            id_cviky2.setProperty(u, "test_i3", true)
                            homescreen.ok_input = homescreen.ok_input && false
                        }
                        if(id_cviky2.get(u).edit_s == "") {
                            id_cviky2.setProperty(u, "test_i4", true)
                            homescreen.ok_input = homescreen.ok_input && false
                        }

                    }
                    if (homescreen.ok_input) {
                    Data.a.pop()
                    Data.a.push(in_nazev.text)
                    // tohle predelat jen test
                    // TODO nesmi byt prazdny pole
                    for (var j=0; j < id_cviky2.count; j+=1) {
                        homescreen.total_t += (id_cviky2.get(j).edit_t*1 + id_cviky2.get(j).edit_p*1) * (id_cviky2.get(j).edit_s * 1)
                        Data.a.push(id_cviky2.get(j).edit_cvik)
                        Data.a.push(id_cviky2.get(j).edit_t)
                        Data.a.push(id_cviky2.get(j).edit_p)
                        Data.a.push(id_cviky2.get(j).edit_s)

                    }
                    Data.a.push("konec_s3r13")
                    Data.a.push("k0n3c")
                    button_add.sum_t= homescreen.total_t
                    // push celkovy cas !!!
                    // tadyyyyyy
                    for (var i = 0; i < Data.a.length; i+=1) {
                        if(Data.a[i] == in_nazev.text) {
                            homescreen.tmp = i+1
                            break
                        }
                    }
                    Data.a.splice(homescreen.tmp, 0, button_add.sum_t)



                    homescreen.total_t= 0
                    homescreen.tmp = -1
                    pageLoader3.source= "qrc:/main.qml"
                    console.log(Data.a)

                    // ok code
                    add_modal.show_modal1= false
                    id_container2.visible= false
                    for (var j=0; j < id_cviky2.count; j+=1) {
                        id_cviky2.remove(j)
                        j=-1;
                    }
                    }
                    homescreen.ok_input= true
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
                    onEditingFinished: {
                        if(in_nazev.text == "") {
                            invalid1.visible= true
                        }
                        else {
                            invalid1.visible= false
                        }
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
                width: homescreen.width * 0.9
                // helps to filter which workout it is

                Rectangle {
                    id: rectangle2
                    x: 25
                    y: 300
                    width: homescreen.width * 0.85
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

                                if(in_cvik.text == "") {
                                    id_cviky2.setProperty(index, "test_i1", true)
                                }
                                else {
                                    id_cviky2.setProperty(index, "test_i1", false)
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

                                if(in_cvik_t.text == "") {
                                    id_cviky2.setProperty(index, "test_i2", true)
                                }
                                else {
                                    id_cviky2.setProperty(index, "test_i2", false)
                                }
                            }
                            Text {
                                id: invalid3
                                x: 175
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

                                if(in_pauza_t.text == "") {
                                    id_cviky2.setProperty(index, "test_i3", true)
                                }
                                else {
                                    id_cviky2.setProperty(index, "test_i3", false)
                                }
                            }
                            Text {
                                id: min_p
                                x: 130
                                y: 20
                                text: "minut"
                                color: "black"
                                font.pixelSize: 16
                            }
                            Text {
                                id: invalid4
                                x: 175
                                y: 20
                                visible: test_i3
                                text: "* povinné"
                                color: "red"
                                font.pixelSize: 14
                            }
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

                                if(in_serie.text == "") {
                                    id_cviky2.setProperty(index, "test_i4", true)
                                }
                                else {
                                    id_cviky2.setProperty(index, "test_i4", false)
                                }
                            }
                            Text {
                                id: invalid5
                                x: 140
                                y: 20
                                visible: test_i4
                                text: "* povinné"
                                color: "red"
                                font.pixelSize: 14
                            }
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
                         console.log("Remaining elements: " + Data.a);
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
                left: homescreen.left
                top: top_area.bottom
                right: homescreen.right
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
                                 id_cviky2.append({"edit_cvik": "", "edit_t": "", "edit_p": "", "edit_s": "", "test_i1": false, "test_i2": false, "test_i3": false, "test_i4": false})
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
