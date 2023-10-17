#ifndef HEADUNITSTUBIMPL_HPP
#define HEADUNITSTUBIMPL_HPP


#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/HeadUnitStubDefault.hpp>

#include "HeadUnitQtClass.hpp"


class HeadUnitStubImpl : public v1_0::commonapi::HeadUnitStubDefault
{
public:
    HeadUnitStubImpl();
    virtual ~HeadUnitStubImpl();
    virtual void setSensorRpm(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _sensorRpm, setSensorRpmReply_t _return);
    virtual void setSteering(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _steering, setSteeringReply_t _return);
};


#endif

