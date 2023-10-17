#ifndef PIRACEROPERATORSTUBIMPL_HPP
#define PIRACEROPERATORSTUBIMPL_HPP


#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/PiracerOperatorStubDefault.hpp>

#include "PiracerClass.hpp"


class PiracerOperatorStubImpl: public v1_0::commonapi::PiracerOperatorStubDefault
{
public:
    PiracerOperatorStubImpl();
    virtual ~PiracerOperatorStubImpl();
    virtual void setGearMode(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _gearMode, setGearModeReply_t _return);
};


#endif

