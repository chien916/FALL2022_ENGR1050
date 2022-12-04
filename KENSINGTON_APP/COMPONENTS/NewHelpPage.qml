import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtMultimedia 5.15
import QtQml 2.14

Rectangle {
	ColumnLayout {
		anchors.fill: parent
		Text {
			text: "Kensington Security Lock"
			horizontalAlignment: Text.AlignHCenter
			font.underline: false
			font.weight: Font.ExtraLight
			font.bold: true
			Layout.fillWidth: true
			font.family: "Montserrat Medium"
			font.pointSize: MyStyle.param_largeFontSize * 1.5
			color: MyStyle.color_neutral800
		}
		Image {
			source: "qrc:/ICONS/round_pitt.svg"
			Layout.fillWidth: true
			sourceSize.height: 200
			sourceSize.width: 200
			fillMode: Image.Pad
		}
		ColumnLayout {
			Layout.fillWidth: true
			Text {
				horizontalAlignment: Text.AlignHCenter
				font.weight: Font.Black
				font.italic: false
				color: MyStyle.color_neutral800
				text: "Version 1.0.0 Alpha"
				font.bold: true
				Layout.fillWidth: true
				font.family: "Montserrat Medium"
				font.pointSize: MyStyle.param_largeFontSize
			}
			Text {
				text: "Copyright © 2022 Kensington Computer Products Group"
				horizontalAlignment: Text.AlignHCenter
				Layout.fillWidth: true
				font.family: "Montserrat Medium"
				font.pointSize: MyStyle.param_fontSize
				color: MyStyle.color_neutral800
			}
			Text {
				text: "All Rights Reserved"
				horizontalAlignment: Text.AlignHCenter
				Layout.fillWidth: true
				font.family: "Montserrat Medium"
				font.pointSize: MyStyle.param_fontSize
				color: MyStyle.color_neutral800
			}
		}
		ColumnLayout {
			Layout.fillWidth: true
			Text {
				text: "Credits"
				horizontalAlignment: Text.AlignHCenter
				font.weight: Font.Black
				font.italic: false
				font.bold: true
				Layout.fillWidth: true
				font.family: "Montserrat Medium"
				font.pointSize: MyStyle.param_largeFontSize
				color: MyStyle.color_neutral800
			}
			Text {
				text: "Liam D | Yinhao Q | Lucas R | Joseph S | Alyssa Z"
				horizontalAlignment: Text.AlignHCenter
				Layout.fillWidth: true
				font.family: "Montserrat Medium"
				font.pointSize: MyStyle.param_fontSize
				color: MyStyle.color_neutral800
			}
			Text {
				text: "University of Pittsburgh | Swanson School of Engineering"
				horizontalAlignment: Text.AlignHCenter
				Layout.fillWidth: true
				font.family: "Montserrat Medium"
				font.pointSize: MyStyle.param_fontSize
				color: MyStyle.color_neutral800
			}
		}
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;formeditorZoom:1.25;height:480;width:640}
}
##^##*/

