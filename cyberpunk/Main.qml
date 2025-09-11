import QtQuick 2.12
import QtQuick.Controls 2.12
//import SddmComponents 2.0

Item {
    id: root
    width: 1920
    height: 1080

    //background img
    Image {
        id: bg
        anchors.fill: parent
        source: "Kap.jpg"
        fillMode: Image.PreserveAspectCrop
    }

    //username
    TextInput {
        id: userInput
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 780
        anchors.topMargin: 509
        width: 365
        height: 50

        text: ""
        color: "#D7051C"
        font.pixelSize: 32
        font.family: "ShureTechMono Nerd Font Mono"

        Rectangle {
            anchors.fill: parent
            color: "transparent"
    	}

	Component.onCompleted: {
            forceActiveFocus()
    	}
	KeyNavigation.tab: passwordInput
    }

    //password
    TextInput {
        id: passwordInput
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 780
        anchors.topMargin: 595
        width: 365
        height: 50
        echoMode: TextInput.Password

        text: ""
        color: "#D7051C"
        font.pixelSize: 32
        font.family: "ShureTechMono Nerd Font Mono"

        Rectangle {
            anchors.fill: parent
            color: "transparent"
    	}

	KeyNavigation.tab: loginButton

	Keys.onPressed: {
            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
            	sddm.login(userInput.text, passwordInput.text, 0)

            	passwordInput.text = ""
            	passwordInput.cursorPosition = 0
            	passwordInput.forceActiveFocus()

            	event.accepted = true
            }
	}
    }

    Button {
	id: loginButton
	anchors.left: parent.left
	anchors.top: parent.top
	anchors.leftMargin: 854
	anchors.topMargin: 685
	width: 213
	height: 58


    	background: Rectangle {
        	opacity: loginButton.down ? 0.2 : 0
        	color: loginButton.down ? "#D7051C" : "transparent"
    	}

    	onClicked: {
        	sddm.login(userInput.text, passwordInput.text, 0)
	}
	
	KeyNavigation.tab: userInput
    }
}

