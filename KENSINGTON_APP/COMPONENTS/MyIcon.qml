import QtQuick
import QtQuick.Controls

Item {
	width: 50
	height: 50
	enum IconTypeEnum{
		Exclam,
		Help,
		Loading,
		Setting,
		Status
	}
	property int iconType: MyIcon.IconTypeEnum.Exclam
	Image{
		anchors.fill: parent
		source:"qrc:/ICONS/icon_exclam.svg"
		clip: true
//			{
//			switch(iconType){
//			case MyIcon.IconTypeEnum.Exclam:
//				return "qrc:/ICONS/icon_exclam.svg"
//			case MyIcon.IconTypeEnum.Help:
//				return "qrc:/ICONS/icon_help.svg"
//			case MyIcon.IconTypeEnum.Loading:
//				return "qrc:/ICONS/icon_loading.svg"
//			case MyIcon.IconTypeEnum.Setting:
//				return "qrc:/ICONS/icon_setting.svg"
//			case MyIcon.IconTypeEnum.Status:
//				return "qrc:/ICONS/icon_status.svg"
//			}
//		}
		mipmap: true
		fillMode: Image.PreserveAspectFit
		sourceSize.height: 300
		sourceSize.width: 300
	}

}

/*##^##
Designer {
	D{i:0;autoSize:true;formeditorZoom:0.25;height:480;width:640}
}
##^##*/
