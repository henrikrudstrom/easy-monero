#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <oscursor.h>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    OSCursor cursor;
    engine.rootContext()->setContextProperty("globalCursor", &cursor);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
