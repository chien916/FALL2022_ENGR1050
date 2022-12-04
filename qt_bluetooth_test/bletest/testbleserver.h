#ifndef TESTBLESERVER_H
#define TESTBLESERVER_H

//#include <qbluetoothlocaldevice.h>
#include <QObject>
#include <QVariant>
#include <QPointer>
#include <QtGlobal>
#include <QTimer>
#include <QList>
#include <QLowEnergyAdvertisingParameters>
#include <QBluetoothServiceDiscoveryAgent>
#include <QBluetoothDeviceDiscoveryAgent>
#include <QLowEnergyController>
#include <QBluetoothServiceInfo>
#include <QLowEnergyDescriptorData>
#include <QLowEnergyServiceData>
#include <QLowEnergyCharacteristicData>
#include <QPair>
#include <QRandomGenerator>
#if defined(Q_OS_ANDROID)
#include <QtAndroid>
#endif

class TestBleServer: public QObject {
	Q_OBJECT

  public:
	TestBleServer(QObject *parent = nullptr);
	void scan();
	void setAsPeripheral();
	void write(const QPair<quint8, quint8>& valuesToBeBroadcasted);
	void setAsCentral(const QBluetoothDeviceInfo &remoteDevice);
	QPair<quint8, quint8> read();
  private:
	QString role = "未定义"; //Undefined,Peripheral,Central
	QStringList availableDevices = {};
	QPointer<QBluetoothDeviceDiscoveryAgent> bluetoothDeviceDiscoveryAgent = nullptr;
	QPointer<QLowEnergyService> lowEnergyService = nullptr;
  private slots:
	void onError();

	// QObject interface

	// QObject interface
  protected:
	void timerEvent(QTimerEvent *event) override final;
};

inline void TestBleServer::scan() {
	availableDevices.clear();
	bluetoothDeviceDiscoveryAgent->start();
}

inline void TestBleServer::setAsPeripheral() {

#if defined(Q_OS_WINDOWS)
	throw std::runtime_error("WINDOWS不支持作为低功耗蓝牙周边");
#endif

	//initialize service structure configurations://SERVICE
	QLowEnergyServiceData lowEnergyServiceData = QLowEnergyServiceData();
	lowEnergyServiceData.setType(QLowEnergyServiceData::ServiceTypePrimary);
	lowEnergyServiceData.setUuid(QBluetoothUuid::LinkLoss);

	//initialize characteristic structure configurations for battery status:CHARACTERISTICS1
	QLowEnergyCharacteristicData batteryStatusCharacteristicData = QLowEnergyCharacteristicData();
	batteryStatusCharacteristicData.setUuid(QBluetoothUuid::BatteryLevel);
	batteryStatusCharacteristicData.setValue(QByteArray(1, 0));
	batteryStatusCharacteristicData.setProperties(QLowEnergyCharacteristic::Notify);

	//initialize descriptor structure configurations for battery status:DESCRIPTOR1
	QLowEnergyDescriptorData batteryStatusDescriptorData(QBluetoothUuid::ClientCharacteristicConfiguration,
			QByteArray(1, 0));

	//initialize characteristic structure configurations for tempering status:CHARACTERISTICS2
	QLowEnergyCharacteristicData temperingStautsCharacteristicData = QLowEnergyCharacteristicData();
	temperingStautsCharacteristicData.setUuid(QBluetoothUuid::Age);
	temperingStautsCharacteristicData.setValue(QByteArray(1, 0));
	temperingStautsCharacteristicData.setProperties(QLowEnergyCharacteristic::Notify);

	//initialize descriptor structure configurations for tempering status:DESCRIPTOR2
	QLowEnergyDescriptorData temperingStautsDescriptorData(QBluetoothUuid::ClientCharacteristicConfiguration,
			QByteArray(1, 0));//

	batteryStatusCharacteristicData.addDescriptor(batteryStatusDescriptorData);//CHARACTERISTRIC1{ DECRIPTOR1 }
	lowEnergyServiceData.addCharacteristic(batteryStatusCharacteristicData);//SERVICE{ CHARACTERISTRIC1{ DECRIPTOR1 } }
	temperingStautsCharacteristicData.addDescriptor(temperingStautsDescriptorData);//CHARACTERISTICS2{ DESCRIPTOR2 }
	lowEnergyServiceData.addCharacteristic(temperingStautsCharacteristicData);//SERVICE{ CHARACTERISTRIC1{ DECRIPTOR1 },CHARACTERISTRIC2{ DECRIPTOR2 } }

	//initialize advertising structure configurations
	QLowEnergyAdvertisingData lowEnergyAdvertisingData = QLowEnergyAdvertisingData();
	lowEnergyAdvertisingData.setDiscoverability(QLowEnergyAdvertisingData::DiscoverabilityGeneral);
	lowEnergyAdvertisingData.setIncludePowerLevel(true);
	lowEnergyAdvertisingData.setLocalName("BatteryLevelMonitor");
	lowEnergyAdvertisingData.setServices(QList<QBluetoothUuid>() << QBluetoothUuid::LinkLoss);

	//! [Start Advertising]
	QPointer<QLowEnergyController> lowEnergyController = QLowEnergyController::createPeripheral(this);
	lowEnergyService = lowEnergyController->addService(lowEnergyServiceData, this);
	lowEnergyController->startAdvertising(QLowEnergyAdvertisingParameters(), lowEnergyAdvertisingData, lowEnergyAdvertisingData);

	//! [Provide Heartbeat
	this->role = "周边";
}


inline void TestBleServer::write(const QPair<quint8, quint8> &valuesToBeBroadcasted) {
	Q_ASSERT(this->role.compare( "周边") == 0);

	QByteArray temperingStatusCharacteristicValue = QByteArray(1, valuesToBeBroadcasted.first);
	QLowEnergyCharacteristic temperingStatusCharacteristic
		= lowEnergyService->characteristic(QBluetoothUuid::Age);
	Q_ASSERT(temperingStatusCharacteristic.isValid());
	lowEnergyService->writeCharacteristic(temperingStatusCharacteristic, temperingStatusCharacteristicValue);

	QByteArray batteryStatusCharacteristicValue = QByteArray(1, valuesToBeBroadcasted.second);
	QLowEnergyCharacteristic batteryStatusCharacteristic
		= lowEnergyService->characteristic(QBluetoothUuid::BatteryLevel);
	Q_ASSERT(batteryStatusCharacteristic.isValid());
	lowEnergyService->writeCharacteristic(batteryStatusCharacteristic, batteryStatusCharacteristicValue);
}


inline QPair<quint8, quint8> TestBleServer::read() {

}

inline void TestBleServer::onError() {
	throw std::runtime_error("￥！低功耗蓝牙控制器或者代理错误");
}

inline void TestBleServer::timerEvent(QTimerEvent *event) {
	qint8 randomValue1 = static_cast<qint8>(QRandomGenerator::global()->bounded(0, 100));
	qint8 randomValue2 = static_cast<qint8>(QRandomGenerator::global()->bounded(10, 20));
	this->write(QPair(randomValue1, randomValue2));
}


/** TESTED
 * @brief TestBleServer::TestBleServer
 * @param parent
 */
inline TestBleServer::TestBleServer(QObject *parent) : QObject(parent) {
#ifdef Q_OS_ANDROID
	QStringList permissionList;
	permissionList.append("android.permission.BLUETOOTH");
	permissionList.append("android.permission.BLUETOOTH_ADMIN");
	permissionList.append("android.permission.ACCESS_FINE_LOCATION");
	permissionList.append("android.permission.ACCESS_COARSE_LOCATION");
	QtAndroid::requestPermissionsSync(permissionList);
#endif
	//! [les-devicediscovery-1]
	bluetoothDeviceDiscoveryAgent = new QBluetoothDeviceDiscoveryAgent();
	//设置扫描时间为5秒，然后自动停止
	bluetoothDeviceDiscoveryAgent->setLowEnergyDiscoveryTimeout(5000);
	//设备被发现
	connect(bluetoothDeviceDiscoveryAgent, &QBluetoothDeviceDiscoveryAgent::deviceDiscovered, this,
	[this](const QBluetoothDeviceInfo & info) {
		if(info.coreConfigurations()&QBluetoothDeviceInfo::LowEnergyCoreConfiguration) {
			QString discoveredDevice = info.address().toString();
			qInfo() << "￥TestBleServer BLE设备被发现" << discoveredDevice;
			this->availableDevices.push_back(discoveredDevice);
		}
	});
	//扫描到设备错误
	connect(bluetoothDeviceDiscoveryAgent, SIGNAL(error(QBluetoothDeviceDiscoveryAgent::Error)), this, SLOT(onError()));
	//扫描完成
	connect(bluetoothDeviceDiscoveryAgent, &QBluetoothDeviceDiscoveryAgent::finished, []() {
		qInfo() << "￥TestBleServer BLE扫描完成";
	});
}

#endif // TESTBLESERVER_H
