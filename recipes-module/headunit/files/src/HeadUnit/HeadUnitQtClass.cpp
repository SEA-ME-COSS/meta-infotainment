#include "HeadUnitQtClass.hpp"


HeadUnitQtClass::HeadUnitQtClass(QObject *parent) : QObject(parent)
{
    QsensorRpm = 0;
    Qsteering = 0;
}

quint16 HeadUnitQtClass::sensorRpm() const
{
    return QsensorRpm;
}

quint16 HeadUnitQtClass::steering() const
{
    return Qsteering;
}

void HeadUnitQtClass::setSensorRpm(uint16_t _sensorRpm)
{
    QsensorRpm = _sensorRpm;
    emit sensorRpmChanged();
    
    return;
}

void HeadUnitQtClass::setSteering(uint16_t _steering)
{
    Qsteering = _steering;
    emit steeringChanged();
    
    return;
}

Q_INVOKABLE void HeadUnitQtClass::setGear(quint16 _gear)
{
    sender.IPCManagerTargetProxy->setGearMode(_gear, sender.callStatus, sender.returnMessage);
    
    return;
}

Q_INVOKABLE void HeadUnitQtClass::setDirection(quint16 _direction)
{
    sender.IPCManagerTargetProxy->setDirection(_direction, sender.callStatus, sender.returnMessage);
    
    return;
}

Q_INVOKABLE void HeadUnitQtClass::setLight(QString _light)
{    
    sender.IPCManagerTargetProxy->setLight(_light.toStdString(), sender.callStatus, sender.returnMessage);
    
    return;
}

Q_INVOKABLE void HeadUnitQtClass::poweroff()
{
    int exitCode = system("poweroff");
    
    return;
}


HeadUnitQtClass carinfo;

