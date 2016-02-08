#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <oscursor.h>
#include <qfqmltypes.cpp>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QFQmlTypes registerHelper;
    OSCursor cursor;
    engine.rootContext()->setContextProperty("globalCursor", &cursor);
    engine.addImportPath("qrc:/qml-material/modules/");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
