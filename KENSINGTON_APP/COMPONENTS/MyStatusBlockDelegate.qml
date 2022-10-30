import QtQuick

Item {
	implicitHeight: 50
	implicitWidth: 100
	property string lockName: "lockname"
	property string lockStatus: "status"
	property string lockBattery: "battery"
	MyIcon{
		id:myicon_lockIcon
		anchors.verticalCenter: rectangle_connector.verticalCenter
		anchors.horizontalCenter:  rectangle_connector.horizontalCenter
		width: rectangle_connector.width*0.5
		height: rectangle_connector.width*0.5
		z:2
	}
	Text{
		text: lockName
		color: MyStyle.color_neutral800
		font.family: MyStyle.fontloader_interbold_alias
		font.pixelSize: MyStyle.param_largeFontSize
		anchors.margins: (parent.width-(rectangle_divider.x-parent.x))*0.05
		anchors.left: rectangle_divider.right
		anchors.top: parent.top

	}
//	MyButton{
//		id:mybutton_disconnect
//		z:2
//	}

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

//	MyIcon{

//	}
//	width: 100
//	 height: 50
//	 opacity: 0.5
//	 layer.enabled: true
//	 anchors.centerIn: parent

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
