import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtMultimedia 5.15
import QtQml 2.14
import "COMPONENTS"

ApplicationWindow {
	flags: Qt.Window
	id: window
	minimumHeight: 830
	minimumWidth: 360
	width: 360
	height: 830
	visible: true

	title: qsTr("Kensington Security")
	FontLoader {}

	Loader {
		id: stackView
		anchors.fill: parent
		source: "qrc:/COMPONENTS/NewBasePage.qml"
	}
} //Page {//	id: window//	width: 320//	height: 640//	visible: true//	title: qsTr("Hello World")//	enum IconTypeEnum{//		Exclam,//		Help,//		Loading,//		Setting,//		Status//	}//	//	Text{//	//		height: 300//	//		text:"testtesttest"//	//		font.pixelSize: 50//	//		font.styleName: "Regular"//	//	}//	//	MyIcon{//	//		width: 50//	//		height: 50//	//		icon: MyIcon.EnumIcon.Help//	//	}//	//	MyButton{//	//		buttonText: "test"//	//		buttonType: MyButton.ButtonTypeEnum.SOLID//	//	}//	//	MyTextField{//	//	}//	Image{//		id: image_kensington//		y: 11
//		width: 261
//		height: 74
//		source: "qrc:/ICONS/kensington.svg"
//		anchors.horizontalCenterOffset: 0
//		mipmap: true
//		sourceSize.height: 400
//		sourceSize.width: 2000
//		clip: false
//		anchors.horizontalCenter: parent.horizontalCenter
//		fillMode: Image.PreserveAspectFit
//	}

//	MyStatusBlockDelegate{
//		height: 115
//		anchors.left: parent.left
//		anchors.right: parent.right
//		anchors.top: parent.top
//		anchors.topMargin: 91
//		anchors.rightMargin: 29
//		anchors.leftMargin: 29
//	}
//	MyTextField{
//		x: 29
//		y: 375
//		width: 262
//		height: 40
//	}
//	MyButton{
//		x: 29
//		y: 321
//		buttonType: MyButton.ButtonTypeEnum.SOLID
//		width: 262
//		height: 42
//	}
//	MyButton {
//		x: 29
//		y: 266
//		buttonType: MyButton.ButtonTypeEnum.OUTLINE
//		width: 262
//		height: 43
//	}

//	MyButton {
//		x: 29
//		y: 221
//		buttonType: MyButton.ButtonTypeEnum.GHOST
//		width: 262
//		height: 39
//	}

////	MyMenuBar{
////		z:1
////		anchors.left: parent.left
////		anchors.right: parent.right
////		anchors.bottom: parent.bottom
////	}

//	footer: TabBar {
//		id: bar
//		TabButton {
//			display: AbstractButton.TextUnderIcon
//			text: "Status"
//		}
//		TabButton {
//			display: AbstractButton.TextUnderIcon
//			text: "Setting"
//		}
//		TabButton {
//			display: AbstractButton.TextUnderIcon
//			text: "Help"
//		}
//	}
//}


/*##^##
Designer {
	D{i:0;width:100}
}
##^##*/

