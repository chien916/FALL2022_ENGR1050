import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "COMPONENTS"
import QtMultimedia
Window {
	id: window
	width: 320
	height: 640
	visible: true
	title: qsTr("Hello World")
	enum IconTypeEnum{
		Exclam,
		Help,
		Loading,
		Setting,
		Status
	}


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


	//	MyButton{
	//		buttonText: "test"
	//		buttonType: MyButton.ButtonTypeEnum.SOLID
	//	}
	//	MyTextField{

	//	}


	Image{
		id: image_kensington
		y: 11
		width: 261
		height: 74
		source: "qrc:/ICONS/kensington.svg"
		anchors.horizontalCenterOffset: 0
		mipmap: true
		sourceSize.height: 400
		sourceSize.width: 2000
		clip: false
		anchors.horizontalCenter: parent.horizontalCenter
		fillMode: Image.PreserveAspectFit
	}

	MyStatusBlockDelegate{
		height: 115
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.top: parent.top
		anchors.topMargin: 91
		anchors.rightMargin: 29
		anchors.leftMargin: 29
	}
	MyTextField{
		x: 29
		y: 375
		width: 262
		height: 40
	}
	MyButton{
		x: 29
		y: 321
		buttonType: MyButton.ButtonTypeEnum.SOLID
		width: 262
		height: 42
	}
	MyButton {
		x: 29
		y: 266
		buttonType: MyButton.ButtonTypeEnum.OUTLINE
		width: 262
		height: 43
	}

	MyButton {
		x: 29
		y: 221
		buttonType: MyButton.ButtonTypeEnum.GHOST
		width: 262
		height: 39
	}


	MyMenuBar{
		z:1
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.bottom: parent.bottom
	}


}



/*##^##
Designer {
	D{i:0;formeditorZoom:0.75}
}
##^##*/
