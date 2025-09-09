#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "DataSimulator.h"
#include "TableModel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Create model + simulator first
    TableModel t;
    DataSimulator ds(&t);

    // Register in QML context BEFORE loading QML
    engine.rootContext()->setContextProperty("tblModel", &t);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    engine.load(url);

    return app.exec();
}
