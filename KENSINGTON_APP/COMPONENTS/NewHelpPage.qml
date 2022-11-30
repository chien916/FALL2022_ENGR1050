import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import QtQml

Rectangle {
	ColumnLayout {
		anchors.fill: parent
		Text {
			text: "Kensington Security Lock"
			horizontalAlignment: Text.AlignHCenter
			font.bold: true
			Layout.fillWidth: true
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
				text: "Version 1.0.0 Alpha"
				horizontalAlignment: Text.AlignHCenter
				font.bold: true
				Layout.fillWidth: true
			}
			Text {
				text: "Copyright © 2022 Kensington Computer Products Group"
				horizontalAlignment: Text.AlignHCenter
				Layout.fillWidth: true
			}
			Text {
				text: "All Rights Reserved"
				horizontalAlignment: Text.AlignHCenter
				Layout.fillWidth: true
			}
		}
		ColumnLayout {
			Layout.fillWidth: true
			Text {
				text: "Credits"
				horizontalAlignment: Text.AlignHCenter
				font.bold: true
				Layout.fillWidth: true
			}
			Text {
				text: "Liam D | Yinhao Q | Lucas R | Joseph S | Alyssa Z"
				horizontalAlignment: Text.AlignHCenter
				Layout.fillWidth: true
			}
			Text {
				text: "University of Pittsburgh | Swanson School of Engineering"
				horizontalAlignment: Text.AlignHCenter
				Layout.fillWidth: true
			}
		}
		Button {
			text: "Tutorial"
			Layout.fillWidth: true
		}
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;formeditorZoom:0.5;height:480;width:640}
}
##^##*/

