import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtMultimedia 5.15
import QtQml 2.14

Rectangle {
	id: rectangle
	border.color: "#ffffff"
	Image {
		id: kensingtonlogo
		horizontalAlignment: Image.AlignLeft
		source: "qrc:/ICONS/kensington.svg"
		anchors {
			top: parent.top
			left: parent.left
			right: parent.right
			margins: 10
		}
		fillMode: Image.Pad
		Layout.fillWidth: true
	}
	Rectangle {
		id: divider
		anchors {
			top: kensingtonlogo.bottom
			left: parent.left
			right: parent.right
			margins: 10
		}
		height: 2
		color: "#000000"
	}
	Loader {
		anchors {
			left: parent.left
			right: parent.right
			top: divider.bottom
			bottom: parent.bottom
		}
		clip: true
		source: "qrc:/COMPONENTS/NewMainPage.qml"
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;formeditorZoom:0.5;height:480;width:640}
}
##^##*/

