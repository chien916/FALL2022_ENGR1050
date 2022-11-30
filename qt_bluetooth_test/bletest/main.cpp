#include <QCoreApplication>
#include <QBluetoothLocalDevice>
#include<QBluetoothDeviceDiscoveryAgent>
#include<QBluetoothDeviceInfo>
#include<QBluetoothUuid>
#include<QBluetoothServiceInfo>
#include<QLowEnergyController>
#include<QLowEnergyService>
#include<QLowEnergyDescriptor>

int main(int argc, char *argv[]) {
	QCoreApplication a(argc, argv);
	QBluetoothLocalDevice localDevice;
	QString localDeviceName;


	// Check if Bluetooth is available on this device
	if (localDevice.isValid()) {

		// Turn Bluetooth on
		localDevice.powerOn();

		// Read local device name
		localDeviceName = localDevice.name();

		// Make it visible to others
		localDevice.setHostMode(QBluetoothLocalDevice::HostDiscoverable);

		// Get connected devices
		QList<QBluetoothAddress> remotes;
		remotes = localDevice.connectedDevices();

		qDebug() << remotes;

		return a.exec();
	}
}
