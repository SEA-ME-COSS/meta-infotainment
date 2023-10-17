#ifndef HEADUNITQTCLASS_HPP
#define HEADUNITQTCLASS_HPP


#include <string>
#include <QObject>
#include <QString>
#include <cstdlib>

#include "HeadUnitSenderClass.hpp"


class HeadUnitQtClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(quint16 sensorRpm READ sensorRpm WRITE setSensorRpm NOTIFY sensorRpmChanged)
    Q_PROPERTY(quint16 steering READ steering WRITE setSteering NOTIFY steeringChanged)
    		
private:
    HeadUnitSenderClass sender;
    
    quint16 QsensorRpm;
    quint16 Qsteering;

public:
    explicit HeadUnitQtClass(QObject *parent = nullptr);
    
    quint16 sensorRpm() const;
    quint16 steering() const;
    void setSensorRpm(uint16_t _sensorRpm);
    void setSteering(uint16_t _steering);
    
public Q_SLOTS:
    Q_INVOKABLE void setGear(quint16 _gear);
    Q_INVOKABLE void setDirection(quint16 _direction);
    Q_INVOKABLE void setLight(QString _light);
    Q_INVOKABLE void poweroff();

signals:
    void sensorRpmChanged();
    void steeringChanged();
};


extern HeadUnitQtClass carinfo;


#endif

