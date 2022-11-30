import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
Rectangle{
	ListView {
		id: listView
		anchors {
			left: parent.left; top: parent.top;
			right: parent.right; bottom: buttons.top;
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
