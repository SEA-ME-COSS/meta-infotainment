#ifndef IPCMANAGERSTUBIMPL_HPP
#define IPCMANAGERSTUBIMPL_HPP


#include <string>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/IPCManagerStubDefault.hpp>

#include "IPCManagerSenderClass.hpp"


class IPCManagerStubImpl: public v1_0::commonapi::IPCManagerStubDefault
{
private:
    IPCManagerSenderClass sender;

public:
    IPCManagerStubImpl();
    virtual ~IPCManagerStubImpl();
    virtual void setSensorRpm(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _sensorRpm, setSensorRpmReply_t _return);
    virtual void setBatteryLevel(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _batteryLevel, setBatteryLevelReply_t _return);
    virtual void setGearMode(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _gearMode, setGearModeReply_t _return);
    virtual void setDirection(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _direction, setDirectionReply_t _return);
    virtual void setLight(const std::shared_ptr<CommonAPI::ClientId> _client, std::string _light, setLightReply_t _return);
    virtual void setSteering(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _steering, setSteeringReply_t _return);
};


#endif

