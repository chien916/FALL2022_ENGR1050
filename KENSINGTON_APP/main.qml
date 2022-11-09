import QtQuick
import QtQuick.Controls
import "COMPONENTS"
Window {
	id: window
	width: 320
	height: 640
	visible: true
	title: qsTr("Hello World")
//	Text{
//		height: 300
//		text:"testtesttest"
//		font.pixelSize: 50
//		font.styleName: "Regular"
//	}

//	MyIcon{
//		width: 50
//		height: 50
//		icon: MyIcon.EnumIcon.Help
//	}

//	Image{
//		id: image_kensington
//		width: 282
//		height: 60
//		source: "qrc:/ICONS/kensington.svg"
//		sourceSize.height: 400
//		sourceSize.width: 2000
//		clip: false
//		anchors.horizontalCenter: parent.horizontalCenter
//		fillMode: Image.PreserveAspectFit
//	}

//	MyButton{
//		buttonText: "test"
//		buttonType: MyButton.ButtonTypeEnum.SOLID
//	}
//	MyTextField{

//	}
	MyStatusBlockDelegate{
		height: 115
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.top: parent.top
		anchors.topMargin: 100
		anchors.rightMargin: 27
		anchors.leftMargin: 31
	}

}



/*##^##
Designer {
	D{i:0;formeditorZoom:0.9}D{i:1}
}
##^##*/
