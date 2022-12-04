#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFont>
#include <QUrl>
#include <QSurfaceFormat>
#include <QFontDatabase>

int main(int argc, char *argv[]) {
	QGuiApplication app(argc, argv);
	QQmlApplicationEngine engine;
	const QUrl url("qrc:/main.qml");
	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
	&app, [url](QObject * obj, const QUrl & objUrl) {
		if (!obj && url == objUrl)
			QCoreApplication::exit(-1);
	}, Qt::QueuedConnection);
	int id = QFontDatabase::addApplicationFont(":/FONTS/Montserrat-Medium.ttf");
	auto test =  QFontDatabase::applicationFontFamilies(id).at(0);
//	auto fontToTest
	app.setFont(QFont(test));
//	QString family = QFontDatabase::applicationFontFamilies(id).at(0);
//	QFont inter(family);
//	QSurfaceFormat format;
//	format.setSamples(8);
//	QSurfaceFormat::setDefaultFormat(format);
	engine.load(url);

	return app.exec();

}
