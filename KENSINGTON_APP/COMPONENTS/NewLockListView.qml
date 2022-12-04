import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtMultimedia 5.15
import QtQml 2.14

Rectangle {
	id: root
	border.color: "#ffffff"

	//	Settings {}
	Component {
		id: lock_component
		Rectangle {
			id: rectangle
			color: MyStyle.color_neutral300
			anchors {
				left: parent.left
				right: parent.right
			}

			height: rowLayout.height
			required property string lockname
			required property string status
			required property string battery
			border.width: 2
			border.color: MyStyle.color_neutral800
			RowLayout {
				//				anchors {
				//					left: parent.left
				//					leftMargin: 10
				//					right: parent.right
				//				}
				id: rowLayout
				anchors.left: parent.left
				anchors.leftMargin: 10
				anchors.right: parent.right

				//				anchors.fill: parent
				Image {
					id: lockicon
					Layout.margins: 10
					Layout.preferredWidth: parent.width * 0.2
					source: "qrc:/ICONS/icon_status.svg"
					fillMode: Image.Pad
				}
				ColumnLayout {
					Layout.margins: 10
					Text {
						text: lockname
						font.pointSize: MyStyle.param_largeFontSize
						font.family: "Montserrat Medium"
						color: MyStyle.color_neutral800
						Layout.fillWidth: true
					}
					Text {
						font.pointSize: MyStyle.param_fontSize
						font.family: "Montserrat Medium"
						color: MyStyle.color_neutral600
						text: "Status: " + status
						Layout.fillWidth: true
					}
					Text {
						font.pointSize: MyStyle.param_fontSize
						font.family: "Montserrat Medium"
						text: "Battery: " + battery
						color: MyStyle.color_neutral600
						Layout.fillWidth: true
					}
					Button {
						Text {
							text: "Disconnect"
							anchors.fill: parent
							horizontalAlignment: Text.AlignHCenter
							verticalAlignment: Text.AlignVCenter
							color: MyStyle.color_neutralWhite
							font.pointSize: MyStyle.param_fontSize
							font.family: "Montserrat Medium"
						}
						highlighted: true
						Layout.fillWidth: true
					}
				}
			}
		}
	}
	ListModel {
		id: lock_listModel
		ListElement {
			lockname: "15:73:1A:C3:11:50"
			status: "normal"
			battery: "56%"
		}
		ListElement {
			lockname: "A6:02:14:56:30:BA"
			status: "normal"
			battery: "23%"
		}
	}

	ListView {
		id: lock_listView
		model: lock_listModel
		spacing: 10
		anchors {
			fill: parent
		}
		delegate: lock_component
	}

	function add() {
		lock_listModel.append({
								  "lockname": "22:A4:71:9A:D7",
								  "status": "normal",
								  "battery": "100%"
							  })
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;formeditorZoom:0.5;height:480;width:640}
}
##^##*/

