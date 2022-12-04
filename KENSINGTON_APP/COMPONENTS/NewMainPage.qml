import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.15
import QtMultimedia 5.15
import QtQml 2.14
import QtGraphicalEffects 1.15

Page {
	id: page
	property alias tabbarFontpointSize: tabbar.font.pointSize

	SwipeView {
		id: swipeView
		anchors {
			left: parent.left
			right: parent.right
			top: parent.top
			bottom: {
				switch (tabbar.currentIndex) {
				case 0:
					return parent.bottom
				case 1:
					return bottomButton.top
				case 2:
					return bottomButton.top
				}
			}
			margins: 10
		}
		spacing: 10
		currentIndex: tabbar.currentIndex
		Loader {
			id: newLockListView_loader
			source: "qrc:/COMPONENTS/NewLockListView.qml"
		}
		Loader {
			id: newSettingPage_loader
			source: "qrc:/COMPONENTS/NewSettingPage.qml"
		}
		Loader {
			id: newHelpPage_loader
			source: "qrc:/COMPONENTS/NewHelpPage.qml"
		}
	}

	FastBlur {
		id: fastblur
		visible: false
		anchors {
			left: parent.left
			right: parent.right
			top: parent.top
			bottom: {
				switch (tabbar.currentIndex) {
				case 0:
					return parent.bottom
				case 1:
					return bottomButton.top
				case 2:
					return bottomButton.top
				}
			}
			margins: 10
		}
		source: swipeView
		radius: 0
		transparentBorder: true
	}
	Item {
		height: connectDialog.height
		anchors {
			left: parent.left
			right: parent.right
			bottom: parent.bottom
			margins: 10
		}
		Dialog {
			id: connectDialog
			width: parent.width
			ColumnLayout {
				anchors {
					left: parent.left
					right: parent.right
					bottom: parent.bottom
				}
				Label {
					elide: Label.ElideRight
					font.weight: Font.Black
					font.bold: true
					text: "Connect"
					font.pointSize: MyStyle.param_largeFontSize
					font.family: "Montserrat Medium"
					Layout.fillWidth: true
				}
				Label {
					elide: Label.ElideRight
					font.pointSize: MyStyle.param_fontSize
					font.family: "Montserrat Medium"
					text: "Please enter the lock MAC address:"
					Layout.fillWidth: true
				}
				TextField {
					focus: true
					Layout.fillWidth: true
					font.pointSize: MyStyle.param_fontSize
					font.family: "Montserrat Medium"
					inputMask: "HH:HH:HH:HH:HH:HH;_"
				}
				Label {
					wrapMode: Text.WordWrap
					font.pointSize: MyStyle.param_fontSize
					font.family: "Montserrat Medium"
					text: "Note: MAC address usually can be found on the back of your E-Lock"
					Layout.fillWidth: true
				}
				RowLayout {
					Layout.fillWidth: true
					Button {
						Layout.fillWidth: true
						Text {
							text: "Confirm"
							anchors.fill: parent
							horizontalAlignment: Text.AlignHCenter
							verticalAlignment: Text.AlignVCenter
							color: MyStyle.color_neutralWhite
							font.pointSize: MyStyle.param_fontSize
							font.family: "Montserrat Medium"
						}
						highlighted: true
						onClicked: {

						}
					}
					Button {
						Text {
							text: "Cancel"
							anchors.fill: parent
							horizontalAlignment: Text.AlignHCenter
							verticalAlignment: Text.AlignVCenter
							color: MyStyle.color_neutral800
							font.pointSize: MyStyle.param_fontSize
							font.family: "Montserrat Medium"
						}
						Layout.fillWidth: true
						onClicked: connectDialog.close()
					}
				}
			}
			onClosed: {
				swipeView.visible = true
				fastblur.visible = false
				newLockListView_loader.item.add()
			}
		}
	}

	Button {
		id: bottomButton
		width: {
			switch (tabbar.currentIndex) {
			case 0:
				return height
			case 1:
				return swipeView.width
			case 2:
				return swipeView.width
			}
		}
		highlighted: true
		anchors {
			bottom: parent.bottom
			right: parent.right
			margins: 10
		}
		display: {
			switch (tabbar.currentIndex) {
			case 0:
				return AbstractButton.IconOnly
			case 1:
				return AbstractButton.TextOnly
			case 2:
				return AbstractButton.TextOnly
			}
		}
		text: {
			switch (tabbar.currentIndex) {
			case 0:
				return "Add device"
			case 1:
				return "Log out"
			case 2:
				return "Tutorials"
			}
		}
		onClicked: {
			switch (tabbar.currentIndex) {
			case 0:
				connectDialog.open()
				fastblur.radius = 30
				swipeView.visible = false
				fastblur.visible = true
				return
			case 1:
				return
			case 2:
				return
			}
		}

		icon.source: "qrc:/ICONS/icon_plus.svg"
	}

	footer: TabBar {
		id: tabbar
		font.pointSize: MyStyle.param_fontSize
		font.family: "Montserrat Medium"
		currentIndex: swipeView.currentIndex
		TabButton {
			text: "Status"
			display: AbstractButton.TextUnderIcon
			icon.source: "qrc:/ICONS/icon_status.svg"
		}
		TabButton {
			display: AbstractButton.TextUnderIcon
			icon.source: "qrc:/ICONS/icon_setting.svg"
			text: "Setting"
		}
		TabButton {
			display: AbstractButton.TextUnderIcon
			icon.source: "qrc:/ICONS/icon_help.svg"
			text: "Help"
		}
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;formeditorZoom:0.5;height:480;width:640}
}
##^##*/

