import QtQuick
import "./"
Rectangle {
	implicitHeight: 30
	implicitWidth: 70
	property string lockName: "LOCKNAME"
	property string lockStatus: "Status:"
	property string lockBattery: "Battery:"
	readonly property string lockNameConcated: "LOCKNAME"+lockName
	readonly property string lockStatusConcated: "Status:"+lockStatus
	readonly property string lockBatteryConcated: "Battery:"+lockBattery
	border.color: "#ffffff"
	Loader{
		id:loader_statusIcon
		source: "qrc:/COMPONENTS/MyIcon.qml"
		anchors.verticalCenter: rectangle_connector.verticalCenter
		anchors.horizontalCenter:  rectangle_connector.horizontalCenter
		width: MyStyle.param_lineWidth*10
		height: MyStyle.param_lineWidth*10
		z:2
	}
	Text{
		id:text_lockName
		text: lockNameConcated
		color: MyStyle.color_neutral800
		font.family: MyStyle.fontloader_interbold_alias
		font.pixelSize: MyStyle.param_largeFontSize
		anchors.margins: MyStyle.param_lineWidth*5
		anchors.left: rectangle_squareCorners.right
		anchors.top: parent.top
		z:2
	}
	Text{
		id:text_lockStatus
		text: lockStatusConcated
		color: MyStyle.color_neutral600
		font.family: MyStyle.fontloader_interbold_alias
		font.pixelSize: MyStyle.param_fontSize
		anchors.topMargin: MyStyle.param_lineWidth
		anchors.leftMargin:text_lockName.anchors.margins
		anchors.left: text_lockName.anchors.left
		anchors.top: text_lockName.bottom
		z:2
	}
	Text{
		id:text_lockBattery
		text: lockBatteryConcated
		color: MyStyle.color_neutral600
		font.family: MyStyle.fontloader_interbold_alias
		font.pixelSize: MyStyle.param_fontSize
		anchors.topMargin: MyStyle.param_lineWidth
		anchors.leftMargin:text_lockName.anchors.margins
		anchors.left: text_lockName.anchors.left
		anchors.top: text_lockStatus.bottom
		z:2
	}
	Loader{
		id:loader_disconnectButton
		source:"qrc:/COMPONENTS/MyButton.qml"
		anchors.top: text_lockBattery.bottom
		anchors.bottom: parent.bottom
		anchors.left: text_lockName.anchors.left
		anchors.right:parent.right
		anchors.topMargin: anchors.bottomMargin*0.5
		anchors.bottomMargin: text_lockName.anchors.margins
		anchors.leftMargin: text_lockName.anchors.margins
		anchors.rightMargin: text_lockName.anchors.margins
//		onLoaded: {item.buttonType = item.ButtonTypeEnum.OUTLINE}
	}

	//背景布局
	Rectangle{
		z:1
		id: rectangle_background
		color: "transparent"
		anchors.fill: parent
		border.color:MyStyle.color_neutral800
		border.width: MyStyle.param_lineWidth
		radius: MyStyle.param_radius
	}
	Rectangle{
		z:1
		id: rectangle_divider
		width: MyStyle.param_lineWidth
		height: parent.height
		x:parent.width*0.3
		color:MyStyle.color_neutral800
	}

	Rectangle {
		z:0
		id: rectangle_roundCorners
		width: MyStyle.param_radius*2
		height: parent.height
		color: MyStyle.color_neutral400
		radius: MyStyle.param_radius
		anchors.left: parent.left
	}
	Rectangle {
		z:0
		id: rectangle_squareCorners
		width: MyStyle.param_radius
		height: parent.height
		color: MyStyle.color_neutral400
		anchors.right: rectangle_divider.left
	}
	Rectangle {
		id: rectangle_connector
		z:0
		anchors.left: rectangle_roundCorners.horizontalCenter
		anchors.right: rectangle_squareCorners.horizontalCenter
		height: parent.height
		color: MyStyle.color_neutral400
	}

}





/*##^##
Designer {
	D{i:0;autoSize:true;formeditorZoom:0.5;height:480;width:640}
}
##^##*/
