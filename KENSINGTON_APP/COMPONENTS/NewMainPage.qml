import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia

Page {
	SwipeView {
		id: swipeView
		anchors.fill: parent
		anchors.margins: 10
		spacing: 10
		currentIndex: tabbar.currentIndex
		Loader {
			source: "qrc:/COMPONENTS/NewLockListView.qml"
		}
		Loader {
			source: "qrc:/COMPONENTS/MyStatusBlockDelegate.qml"
		}
		Loader {
			source: "qrc:/COMPONENTS/NewHelpPage.qml"
		}
	}
	footer: TabBar {
		id: tabbar
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
	D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}
}
##^##*/

