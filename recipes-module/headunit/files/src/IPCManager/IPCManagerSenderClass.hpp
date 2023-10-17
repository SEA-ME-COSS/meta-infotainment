#ifndef IPCMANAGERSENDERCLASS_HPP
#define IPCMANAGERSENDERCLASS_HPP


#include <string>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/CANSenderProxy.hpp>
#include <v1/commonapi/PiracerSenderProxy.hpp>
#include <v1/commonapi/PiracerOperatorProxy.hpp>
#include <v1/commonapi/InstrumentClusterProxy.hpp>
#include <v1/commonapi/HeadUnitProxy.hpp>


using namespace v1_0::commonapi;

class IPCManagerSenderClass
{
public:
    IPCManagerSenderClass();
    ~IPCManagerSenderClass();

    std::shared_ptr<CommonAPI::Runtime> runtime;
    std::shared_ptr<CANSenderProxy<>> CANSenderTargetProxy;
    std::shared_ptr<PiracerSenderProxy<>> PiracerSenderTargetProxy;
    std::shared_ptr<PiracerOperatorProxy<>> PiracerOperatorTargetProxy;
    std::shared_ptr<InstrumentClusterProxy<>> InstrumentClusterTargetProxy;
    std::shared_ptr<HeadUnitProxy<>> HeadUnitTargetProxy;
    
    CommonAPI::CallStatus callStatus;
    std::string returnMessage;
};


#endif

