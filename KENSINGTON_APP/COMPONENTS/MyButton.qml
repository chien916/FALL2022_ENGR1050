import QtQuick
import QtQuick.Controls

Rectangle {
	id:myButton
	implicitHeight: 50
	implicitWidth: 100
	color:"transparent"
	property string buttonText: "button"
	property int buttonType: MyButton.ButtonTypeEnum.OUTLINE
	enum ButtonTypeEnum{
		SOLID,
		OUTLINE,
		GHOST
	}

	MouseArea{
		id:mousearea_clickArea
		anchors.fill: parent
	}

	Rectangle{
		id: rectangle_backgroundColor
		anchors.fill: parent
		color:buttonType===MyButton.ButtonTypeEnum.OUTLINE?
				  MyStyle.color_neutralWhite:
					buttonType===MyButton.ButtonTypeEnum.SOLID?
					  mousearea_clickArea.pressed?MyStyle.color_neutral600:MyStyle.color_neutral800:
						mousearea_clickArea.pressed?MyStyle.color_neutral400:MyStyle.color_neutral200

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
		border.width: MyStyle.param_lineWidth
		border.color: buttonType===MyButton.ButtonTypeEnum.OUTLINE?
						  mousearea_clickArea.pressed?MyStyle.color_neutral600:MyStyle.color_neutral800:
						"transparent"
		radius: MyStyle.param_radius
	}
	Text{
		z:3
		text: buttonText
		color: buttonType===MyButton.ButtonTypeEnum.SOLID?MyStyle.color_neutralWhite:
														   buttonType===MyButton.ButtonTypeEnum.OUTLINE?
																					 mousearea_clickArea.pressed?MyStyle.color_neutral600:MyStyle.color_neutral800:
																				   MyStyle.color_neutral800
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
