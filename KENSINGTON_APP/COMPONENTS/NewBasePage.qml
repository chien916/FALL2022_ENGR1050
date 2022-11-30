import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import QtQml

Rectangle {
	id: rectangle
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

