#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <oscursor.h>
#include <qfqmltypes.cpp>
#include <gel.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    com::cutehacks::gel::registerEngine(&engine);

    QFQmlTypes registerHelper;
    OSCursor cursor;
    engine.rootContext()->setContextProperty("globalCursor", &cursor);
    engine.addImportPath("qrc:/qml-material/modules/");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
