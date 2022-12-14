import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtMultimedia 5.15
import QtQml 2.14

Rectangle {
	id: myIcon
	color: "transparent"
	border.color: "#ffffff"
	implicitHeight: MyStyle.param_iconSize
	implicitWidth: MyStyle.param_iconSize
	enum IconTypeEnum {
		Exclam,
		Help,
		Loading,
		Setting,
		Status
	}
	property int iconType: MyIcon.IconTypeEnum.Exclam
	Image {
		height: MyStyle.param_iconSize
		anchors.verticalCenter: parent.verticalCenter
		width: MyStyle.param_iconSize
		source: "qrc:/ICONS/icon_exclam.svg"
		anchors.horizontalCenter: parent.horizontalCenter
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
