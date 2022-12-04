#include <QCoreApplication>
#include <QBluetoothLocalDevice>
#include<QBluetoothDeviceDiscoveryAgent>
#include<QBluetoothDeviceInfo>
#include<QBluetoothUuid>
#include<QBluetoothServiceInfo>
#include<QLowEnergyController>
#include<QLowEnergyService>
#include<QLowEnergyDescriptor>
#include<testbleserver.h>

int main(int argc, char *argv[]) {
	QCoreApplication a(argc, argv);
	TestBleServer test;
//	test.scan();
	test.setAsPeripheral();
	test.startTimer(500);
	return a.exec();

}
