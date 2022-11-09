import QtQuick
import QtQuick.Controls

Rectangle {
	id: item1
	property int inheretedWindowHeight: 480
	implicitHeight: 20
	implicitWidth: 200
	TextField{
		z:2
		id:textfield_textField
		visible: true
		anchors.verticalCenter: parent.verticalCenter
		anchors.left: parent.left
		anchors.right: parent.right
		horizontalAlignment: Text.AlignLeft
		layer.samples: 16
		layer.enabled: false
		anchors.rightMargin: rectangle_backgroundColor.border.width
		anchors.leftMargin: rectangle_backgroundColor.border.width
		clip: false
		hoverEnabled: true
		placeholderText: "placeHolderText"
		background: null
		font.family: MyStyle.fontloader_interregular_alias
		font.pixelSize: MyStyle.param_fontSize
	}
	Rectangle{
		id: rectangle_backgroundColor
		anchors.fill: parent
		layer.enabled: false
		layer.smooth: false
		layer.mipmap: false

			/*{
			switch(buttonType){
					case MyButton.ButtonTypeEnum.SOLID:
						if(parent.hovered)
							return MyStyle.color_neutral800
						else if(parent.pressed)
							return MyStyle.color_neutral800
						else
							return MyStyle.color_neutral800
					case MyButton.ButtonTypeEnum.OUTLINE:
						return MyStyle.color_neutralWhite
					case MyButton.ButtonTypeEnum.GHOST:
						return MyStyle.color_neutral200
				}
		}*/
		border.color:textfield_textField.activeFocus?MyStyle.color_neutral800:MyStyle.color_neutral400
		border.width: MyStyle.param_lineWidth
		radius: MyStyle.param_radius

	}
}

/*##^##
Designer {
	D{i:0;formeditorZoom:1.75}
}
##^##*/
