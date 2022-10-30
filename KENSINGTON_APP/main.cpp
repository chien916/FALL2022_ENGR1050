#include <QGuiApplication>
#include <QQmlApplicationEngine>


#include <QSurfaceFormat>

int main(int argc, char *argv[]) {
	QGuiApplication app(argc, argv);
	QQmlApplicationEngine engine;
	const QUrl url(u"qrc:/main.qml"_qs);
	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
	&app, [url](QObject * obj, const QUrl & objUrl) {
		if (!obj && url == objUrl)
			QCoreApplication::exit(-1);
	}, Qt::QueuedConnection);
	QSurfaceFormat format;
	format.setSamples(8);
	QSurfaceFormat::setDefaultFormat(format);
	engine.load(url);

//	engine.addImportPath("qrc:///");
//	engine.load(QUrl("qrc:/MyIcon.qml"));
//	engine.load(QUrl("qrc:/MyStyle.qml"));
	return app.exec();

}
