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
#include <QBluetoothLocalDevice>
#include <QPair>
#include <QMetaEnum>
#include <QRandomGenerator>
#if defined(Q_OS_ANDROID)
#include <QtAndroid>
#endif

class TestBleServer: public QObject {
	Q_OBJECT

  signals:
	void verboseSignal(const QString& message);
	void criticalSignal(const QString& message);
  public:
	TestBleServer(QObject *parent = nullptr);
	void scan();
	void setAsPeripheral();
	void write(const QPair<quint8, quint8>& valuesToBeBroadcasted);
	void setAsCentral(qsizetype indexOfConnectedDeviceAddressesToBeConnected);
	QPair<quint8, quint8> read();
  private:
	QString role = "未定义"; //Undefined,Peripheral,Central
	QVector<QBluetoothDeviceInfo> connectedDeviceAddresses;
	QVector<QBluetoothDeviceInfo> allDeviceAddresses;
	QPointer<QBluetoothDeviceDiscoveryAgent> bluetoothDeviceDiscoveryAgent = nullptr;
	QPointer<QLowEnergyService> lowEnergyService = nullptr;
	QPointer<QLowEnergyController> lowEnergyController = nullptr;
  private slots:
	void onError();
  protected:
	void timerEvent(QTimerEvent *event) override final;
};

inline void TestBleServer::scan() {
	allDeviceAddresses.clear();
	connectedDeviceAddresses.clear();
	bluetoothDeviceDiscoveryAgent->start();
}

/**WORKED
 * @brief TestBleServer::setAsPeripheral
 */
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
			QByteArray("\x01\x00", 2));

	//initialize characteristic structure configurations for tempering status:CHARACTERISTICS2
	QLowEnergyCharacteristicData temperingStautsCharacteristicData = QLowEnergyCharacteristicData();
	temperingStautsCharacteristicData.setUuid(QBluetoothUuid::Age);
	temperingStautsCharacteristicData.setValue(QByteArray(1, 0));
	temperingStautsCharacteristicData.setProperties(QLowEnergyCharacteristic::Notify);

	//initialize descriptor structure configurations for tempering status:DESCRIPTOR2
	QLowEnergyDescriptorData temperingStautsDescriptorData(QBluetoothUuid::ClientCharacteristicConfiguration,
			QByteArray("\x01\x00", 2)); //

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

	Q_ASSERT(lowEnergyController.isNull() == true);
	//! [Start Advertising]
	lowEnergyController = QLowEnergyController::createPeripheral(this);
	lowEnergyService = lowEnergyController->addService(lowEnergyServiceData, this);
	lowEnergyController->startAdvertising(QLowEnergyAdvertisingParameters(), lowEnergyAdvertisingData, lowEnergyAdvertisingData);

	//! [Provide Heartbeat
	this->role = "周边";
}



inline void TestBleServer::setAsCentral(qsizetype indexOfConnectedDeviceAddressesToBeConnected = 0) {
	connect(bluetoothDeviceDiscoveryAgent, &QBluetoothDeviceDiscoveryAgent::finished, this, [this, indexOfConnectedDeviceAddressesToBeConnected]() {
		qInfo() << "￥TestBleServer BLE扫描完成";
		Q_ASSERT(indexOfConnectedDeviceAddressesToBeConnected >= 0);
		QBluetoothDeviceInfo remoteDevice = (indexOfConnectedDeviceAddressesToBeConnected <= connectedDeviceAddresses.size() - 1)
											? connectedDeviceAddresses.at(indexOfConnectedDeviceAddressesToBeConnected) : QBluetoothDeviceInfo();
		if(remoteDevice.isValid() == false) {
			emit this->verboseSignal("控制器无法扫描服务，因为在扫描设备时没有扫描到符合要求的设备");
			return;
		}
		emit this->verboseSignal("控制器开始扫描服务，设备地址：" + remoteDevice.address().toString());
		lowEnergyController = QLowEnergyController::createCentral(remoteDevice, this);
		QObject::connect(lowEnergyController, &QLowEnergyController::serviceDiscovered, this, [this](const QBluetoothUuid & newService) {
			emit this->verboseSignal("控制器发现服务 UUID:" + newService.toString());
			if(newService == QBluetoothUuid(QBluetoothUuid::LinkLoss)) {
				if(lowEnergyService.isNull() == false)
					emit this->criticalSignal("控制器发现服务端口已被占用");
				lowEnergyService = lowEnergyController->createServiceObject(QBluetoothUuid(QBluetoothUuid::LinkLoss), this);
				if(lowEnergyService.isNull() == false) {
					QObject::connect(lowEnergyService, &QLowEnergyService::stateChanged, this, [this](QLowEnergyService::ServiceState newState) {
						emit this->verboseSignal("服务器状态发生改变 新状态：" + QString::fromUtf8(QMetaEnum::fromType<QLowEnergyService::ServiceState>().valueToKey(newState)));
					});
					QObject::connect(lowEnergyService, &QLowEnergyService::characteristicChanged,
					this, [this](const QLowEnergyCharacteristic & characteristic, const QByteArray & newValue) {
						QBluetoothUuid bluetoothUuid = characteristic.uuid();
						if(bluetoothUuid == QBluetoothUuid(QBluetoothUuid::CharacteristicType::BatteryLevel)) {
							emit this->verboseSignal("服务器发现电池状态发生改变 新值：" + QString::number(newValue.at(0)));
						} else if(bluetoothUuid == QBluetoothUuid(QBluetoothUuid::CharacteristicType::Age)) {
							emit this->verboseSignal("服务器发现安全状态发生改变 新值：" + QString::number(newValue.at(0)));
						}
					});
					lowEnergyService->discoverDetails();
				} else {
					emit this->verboseSignal("控制器扫描到的服务与需求的服务UUID（LinkLoss aka 0x1803）不一致");
				}
			}
		});
		QObject::connect(lowEnergyController, &QLowEnergyController::discoveryFinished, this, [this]() {
			emit this->verboseSignal("控制器完成服务扫描");
		});
		QObject::connect(lowEnergyController, static_cast<void (QLowEnergyController::*)(QLowEnergyController::Error)>(&QLowEnergyController::error),
		this, [this](QLowEnergyController::Error newError) {
			emit this->verboseSignal("控制器发生了错误:" + QString::fromUtf8(QMetaEnum::fromType<QLowEnergyController::Error>().valueToKey(newError)));
		});
		QObject::connect(lowEnergyController, &QLowEnergyController::connected, this, [this]() {
			emit this->verboseSignal("控制器成功连接设备，即将开始服务扫描");
			lowEnergyController->discoverServices();
		});
		QObject::connect(lowEnergyController, &QLowEnergyController::disconnected, this, [this]() {
			emit this->verboseSignal("控制器与设备断开连接");
		});
		lowEnergyController->connectToDevice();
		this->role = "中心";
	});
	this->scan();

}




/**WORKED
 * @brief TestBleServer::write
 * @param valuesToBeBroadcasted
 */
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
	if(role.compare("周边") == 0)
		this->write(QPair(randomValue1, randomValue2));
}


/** TESTED
 * @brief TestBleServer::TestBleServer
 * @param parent
 */
inline TestBleServer::TestBleServer(QObject *parent) : QObject(parent) {

	QObject::connect(this, &TestBleServer::verboseSignal, [](const QString & message) {
		qInfo() << message;
	});
#ifdef Q_OS_ANDROID
	QStringList permissionList;
	permissionList.append("android.permission.BLUETOOTH");
	permissionList.append("android.permission.BLUETOOTH_ADMIN");
	permissionList.append("android.permission.ACCESS_FINE_LOCATION");
	permissionList.append("android.permission.ACCESS_COARSE_LOCATION");
	QtAndroid::requestPermissionsSync(permissionList);
#endif
	//!
	bluetoothDeviceDiscoveryAgent = new QBluetoothDeviceDiscoveryAgent(this);
	//设置扫描时间为5秒，然后自动停止
	bluetoothDeviceDiscoveryAgent->setLowEnergyDiscoveryTimeout(10000);
	//设备被发现
	connect(bluetoothDeviceDiscoveryAgent, &QBluetoothDeviceDiscoveryAgent::deviceDiscovered, this,
	[this](const QBluetoothDeviceInfo & info) {
		if(info.coreConfigurations()&QBluetoothDeviceInfo::LowEnergyCoreConfiguration) {
			try {
				allDeviceAddresses.push_front(info);
				emit this->verboseSignal("￥TestBleServer BLE设备被发现" + info.address().toString() + " " + info.name());
				if(info.name() == "Yin Hao's Tab A7") {
					connectedDeviceAddresses.push_front(info);
					qInfo() << "发现目标" << info.address().toString() << info.name();
				}
			} catch(int e) {
				qInfo() << "EXCEPTION:" << e;
			}

		}
	});
	//扫描到设备错误
	connect(bluetoothDeviceDiscoveryAgent,
			static_cast<void (QBluetoothDeviceDiscoveryAgent::*)(QBluetoothDeviceDiscoveryAgent::Error)>(&QBluetoothDeviceDiscoveryAgent::error),
	this, [this](const QBluetoothDeviceDiscoveryAgent::Error newError) {
		emit this->verboseSignal("蓝牙扫描器错误 错误值：" + QString::fromUtf8(QMetaEnum::fromType<QBluetoothDeviceDiscoveryAgent::Error>().valueToKey(newError)));
	});




}

#endif // TESTBLESERVER_H
