#include <QGuiApplication>
#include <QQmlApplicationEngine>
//#include <QtWebView>
#include <QIcon>

#include "workdatabase.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QCoreApplication::setOrganizationName("zloi");
    QCoreApplication::setApplicationName("ChipDip");

    QGuiApplication app(argc, argv);
    //QtWebView::initialize();
    app.setWindowIcon(QIcon(":/icon/icon.png"));
    QQmlApplicationEngine engine;
    qmlRegisterType<WorkDatabase>("WorkDatabase", 1, 0, "WorkDatabase");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
