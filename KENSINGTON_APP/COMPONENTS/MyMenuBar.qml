import QtQuick
import QtQuick.Layouts
Rectangle {
	id:rectangle_myMenuBar
	height: 50
	width: 320
	property double spacePartition: 0.6
	Rectangle{
		id: rectangle_menubarDivider
		height: MyStyle.param_lineWidth;
		width: parent.width
		color: MyStyle.color_neutral800
		anchors.top: parent.top
	}
	Item{
		id: item_anchorHorizontalHelper
		y: parent.height*0.6;
		height: 0
		width: parent.width;
	}
	Item{
		id: item_anchorVerticalHelperLeft
		x:parent.width/3;
		height: parent.height
		width: 0
	}
	Item{
		id: item_anchorVerticalHelperRight
		x:parent.width/3*2
		height: parent.height
		width: 0
	}

	Loader{
		id:loader_statusIconOnMenuBar
		source: "qrc:/COMPONENTS/MyIcon.qml"
		anchors.top: rectangle_menubarDivider.bottom
		anchors.bottom: item_anchorHorizontalHelper.top
		anchors.left: parent.left
		anchors.right: item_anchorVerticalHelperLeft.left
	}
	Text {
		id: text_statusTextOnMenuBar
		text: "Status"
		anchors.top: item_anchorHorizontalHelper.bottom
		anchors.bottom: parent.bottom
		anchors.bottomMargin: MyStyle.param_lineWidth;
		anchors.left: parent.left
		anchors.right: item_anchorVerticalHelperLeft.left
		font.pixelSize: MyStyle.param_fontSize*0.8
		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
	}
	Loader{
		id:loader_settingIconOnMenuBar
		source: "qrc:/COMPONENTS/MyIcon.qml"
		anchors.top: rectangle_menubarDivider.bottom
		anchors.bottom: item_anchorHorizontalHelper.top
		anchors.left: item_anchorVerticalHelperLeft.right
		anchors.right: item_anchorVerticalHelperRight.left
	}
	Text {
		id: text_settingTextOnMenuBar
		text: "Setting"
		anchors.top: item_anchorHorizontalHelper.bottom
		anchors.bottom: parent.bottom
		anchors.bottomMargin: MyStyle.param_lineWidth;
		anchors.left: item_anchorVerticalHelperLeft.right
		anchors.right: item_anchorVerticalHelperRight.left
		font.pixelSize: MyStyle.param_fontSize*0.8
		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
	}
	Loader{
		id:loader_helpIconOnMenuBar
		source: "qrc:/COMPONENTS/MyIcon.qml"
		anchors.top: rectangle_menubarDivider.bottom
		anchors.bottom: item_anchorHorizontalHelper.top
		anchors.left: item_anchorVerticalHelperRight.left
		anchors.right: parent.right
		onLoaded: {
			loader_helpIconOnMenuBar.item.iconType = MyIcon.IconTypeEnum.Help
		}
	}
	Text {
		id: text_helpTextOnMenuBar
		text: "Help"
		anchors.top: item_anchorHorizontalHelper.bottom
		anchors.bottom: parent.bottom
		anchors.bottomMargin: MyStyle.param_lineWidth;
		anchors.left: item_anchorVerticalHelperRight.left
		anchors.right: parent.right
		font.pixelSize: MyStyle.param_fontSize*0.8
		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
	}
}

/*##^##
Designer {
	D{i:0;formeditorZoom:1.5}
}
##^##*/
