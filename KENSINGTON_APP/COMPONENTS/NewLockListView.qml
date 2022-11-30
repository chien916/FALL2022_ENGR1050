import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import QtQml

Rectangle {
	id: root
	Component {
		id: lock_component
		Rectangle {
			id: rectangle
			anchors {
				left: parent.left
				right: parent.right
			}
			height: rowLayout.height
			required property string lockname
			required property string status
			required property string battery
			border.width: 2
			RowLayout {
				anchors {
					left: parent.left
					leftMargin: 10
					right: parent.right
				}
				id: rowLayout
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
					Layout.fillWidth: true
					Text {
						text: lockname
						Layout.fillWidth: true
					}
					Text {
						text: "Status: " + status
						Layout.fillWidth: true
					}
					Text {
						text: "Battery: " + battery
						Layout.fillWidth: true
					}
					Button {
						text: "Disconnect"
						Layout.fillWidth: true
					}
				}
			}
		}
	}
	ListModel {
		id: lock_listModel
		ListElement {
			lockname: "#LOCKNAME1"
			status: "normal"
			battery: "47%"
		}
		ListElement {
			lockname: "#LOCKNAME2"
			status: "normal"
			battery: "84%"
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

	Button {
		width: height
		highlighted: true
		anchors {
			bottom: parent.bottom
			right: parent.right
		}
		display: AbstractButton.IconOnly
		icon.source: "qrc:/ICONS/icon_plus.svg"
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;formeditorZoom:0.5;height:480;width:640}
}
##^##*/

