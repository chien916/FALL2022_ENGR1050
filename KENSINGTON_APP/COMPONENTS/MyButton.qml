import QtQuick
import QtQuick.Controls

Item {
	implicitHeight: 50
	implicitWidth: 100
	property string buttonText: "button"
	property int buttonType: MyButton.ButtonTypeEnum.SOLID
	enum ButtonTypeEnum{
		SOLID,
		OUTLINE,
		GHOST
	}
	MouseArea{
		id:mousearea_clickArea
		anchors.fill: parent
//		onPressed: {
//			rectangle_backgroundColor.color = MyStyle.color_neutral700
//		}
//		onReleased:{rectangle_backgroundColor.color = MyStyle.color_neutral800}
	}

	Rectangle{
		id: rectangle_backgroundColor
		anchors.fill: parent
		color:mousearea_clickArea.pressed?MyStyle.color_neutral600:MyStyle.color_neutral800
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
		radius: MyStyle.param_radius
	}
	Text{
		text: buttonText
		color: MyStyle.color_neutralWhite
		anchors.verticalCenter: parent.verticalCenter
		font.pixelSize: MyStyle.param_fontSize
		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
		font.family: MyStyle.fontloader_interbold_alias
		anchors.horizontalCenter: parent.horizontalCenter
	}
}

/*##^##
Designer {
	D{i:0;formeditorZoom:3}
}
##^##*/
