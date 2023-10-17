#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "HeadUnitStubImpl.hpp"
#include "HeadUnitQtClass.hpp"


using namespace v1_0::commonapi;

int main(int argc, char *argv[])
{
    std::shared_ptr<CommonAPI::Runtime> runtime;
    std::shared_ptr<HeadUnitStubImpl> HeadUnitService;
    
    runtime = CommonAPI::Runtime::get();
    HeadUnitService = std::make_shared<HeadUnitStubImpl>();
    runtime->registerService("local", "HeadUnit", HeadUnitService);
    
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    
    qmlRegisterType<HeadUnitQtClass>("DataModule", 1, 0, "HeadUnitQtClass");

    QQmlApplicationEngine engine;
    
    engine.rootContext()->setContextProperty("carinfo", &carinfo);
    
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl)
    {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

