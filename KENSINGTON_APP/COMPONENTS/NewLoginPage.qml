import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtMultimedia 5.15
import QtQml 2.14

Rectangle {
	ListView {
		id: listView
		anchors {
			left: parent.left
			top: parent.top
			right: parent.right
			bottom: buttons.top
			margins: 20
		}
		model: fruitModel
		delegate: listDelegate
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;formeditorZoom:0.66;height:480;width:640}
}
##^##*/

