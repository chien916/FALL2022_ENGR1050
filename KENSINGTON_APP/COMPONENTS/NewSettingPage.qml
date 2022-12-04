import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.15
import QtMultimedia 5.15
import QtQml 2.14

Rectangle {
	id: rectangle
	border.color: "#ffffff"

	ColumnLayout {
		anchors.fill: parent
		spacing: 10
		Text {
			text: "Now logged in as Administrator.01"
			font.pointSize: MyStyle.param_fontSize
			font.family: "Montserrat Medium"
			horizontalAlignment: Text.AlignHCenter
			Layout.fillWidth: true
		}

		Rectangle {
			height: 100
			border.width: 2
			Layout.alignment: Qt.AlignLeft | Qt.AlignTop
			Layout.fillWidth: true
		}

		ListView {
			id: listView
			Layout.fillHeight: true
			Layout.alignment: Qt.AlignLeft | Qt.AlignTop
			Layout.fillWidth: true
			spacing: 10
			interactive: false
			model: ListModel {
				ListElement {
					description: "Allow alarm sound"
					currCheckedState: true
				}
				ListElement {
					description: "Allow viberations"
					currCheckedState: false
				}
				ListElement {
					description: "Allow flashlights"
					currCheckedState: false
				}
				ListElement {
					description: "Allow pushed notifications"
					currCheckedState: true
				}
				ListElement {
					description: "Allow anonymous data collections"
					currCheckedState: false
				}
			}
			delegate: RowLayout {
				required property string description
				required property bool currCheckedState
				anchors.left: parent.left
				anchors.right: parent.right
				//				height: 40
				//				anchors {
				//					left: parent.left
				//					right: parent.right
				//				}
				Text {
					text: description
					leftPadding: 10
					Layout.fillWidth: true
					font.family: "Montserrat Medium"
					font.pointSize: MyStyle.param_fontSize
				}
				Switch {
					checked: currCheckedState
				}
			}
		}
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

