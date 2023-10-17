#include "HeadUnitStubImpl.hpp"


HeadUnitStubImpl::HeadUnitStubImpl() { }
HeadUnitStubImpl::~HeadUnitStubImpl() { }

void HeadUnitStubImpl::setSensorRpm(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _sensorRpm, setSensorRpmReply_t _reply)
{
    carinfo.setSensorRpm((uint16_t)((float)((uint16_t)((float)_sensorRpm / 2.6)) * 3.4));

    _reply("");
    
    return;
}

void HeadUnitStubImpl::setSteering(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _steering, setSteeringReply_t _reply)
{
    carinfo.setSteering(_steering);

    _reply("");
    
    return;
}

