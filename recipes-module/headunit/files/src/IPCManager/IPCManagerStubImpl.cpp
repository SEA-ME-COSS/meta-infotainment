#include "IPCManagerStubImpl.hpp"


IPCManagerStubImpl::IPCManagerStubImpl() { }
IPCManagerStubImpl::~IPCManagerStubImpl() { }

void IPCManagerStubImpl::setSensorRpm(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _sensorRpm, setSensorRpmReply_t _reply)
{
    sender.InstrumentClusterTargetProxy->setSpeedRpm(_sensorRpm, sender.callStatus, sender.returnMessage);
    sender.HeadUnitTargetProxy->setSensorRpm(_sensorRpm, sender.callStatus, sender.returnMessage);

    _reply("");

    return;
}

void IPCManagerStubImpl::setBatteryLevel(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _batteryLevel, setBatteryLevelReply_t _reply)
{
    sender.InstrumentClusterTargetProxy->setBattery(_batteryLevel, sender.callStatus, sender.returnMessage);
    
    _reply("");

    return;
}

void IPCManagerStubImpl::setGearMode(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _gearMode, setGearModeReply_t _reply)
{
    sender.PiracerOperatorTargetProxy->setGearMode(_gearMode, sender.callStatus, sender.returnMessage);
    sender.InstrumentClusterTargetProxy->setGear(_gearMode, sender.callStatus, sender.returnMessage);

    _reply("");

    return;
}

void IPCManagerStubImpl::setDirection(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _direction, setDirectionReply_t _reply)
{
    sender.InstrumentClusterTargetProxy->setDirection(_direction, sender.callStatus, sender.returnMessage);

    _reply("");

    return;
}

void IPCManagerStubImpl::setLight(const std::shared_ptr<CommonAPI::ClientId> _client, std::string _light, setLightReply_t _reply)
{
    sender.InstrumentClusterTargetProxy->setLight(_light, sender.callStatus, sender.returnMessage);

    _reply("");

    return;
}

void IPCManagerStubImpl::setSteering(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _steering, setSteeringReply_t _reply)
{
    sender.HeadUnitTargetProxy->setSteering(_steering, sender.callStatus, sender.returnMessage);

    _reply("");

    return;
}

