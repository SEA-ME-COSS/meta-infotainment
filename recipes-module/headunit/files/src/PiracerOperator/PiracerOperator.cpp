#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/IPCManagerProxy.hpp>

#include "ControllerClass.hpp"
#include "PiracerClass.hpp"
#include "PiracerOperatorStubImpl.hpp"


using namespace v1_0::commonapi;

int main ()
{
    std::shared_ptr<CommonAPI::Runtime> runtime;
    std::shared_ptr<PiracerOperatorStubImpl> PiracerOperatorService;
    std::shared_ptr<IPCManagerProxy<>> IPCManagertargetProxy;
    
    runtime = CommonAPI::Runtime::get();
    PiracerOperatorService = std::make_shared<PiracerOperatorStubImpl>();
    runtime->registerService("local", "PiracerOperator", PiracerOperatorService);
    IPCManagertargetProxy = runtime->buildProxy<IPCManagerProxy>("local", "IPCManager");
    
    ControllerClass controller;
    
    CommonAPI::CallStatus callStatus;
    std::string returnMessage;
    
    double throttle, steering;
    
    while (1)
    {
        controller.readControl();
        throttle = controller.getThrottle();
        steering = controller.getSteering();

        switch (piracer.getGearMode())
        {
            case 0:    // P
                piracer.applyThrottle(0.0);
                piracer.applySteering(0.0);
                break;
                
            case 1:    // R
                if (throttle <= 0)
                {
                    piracer.applyThrottle(throttle);
                    piracer.applySteering(steering);
                }
                else
                {
                    piracer.applyThrottle(0.0);
                    piracer.applySteering(steering);
                }
                break;
                
            case 2:    // N
                piracer.applyThrottle(0.0);
                piracer.applySteering(steering);
                break;
                
            case 3:    // D
                if (throttle >= 0)
                {
                    piracer.applyThrottle(throttle);
                    piracer.applySteering(steering);
                }
                else
                {
                    piracer.applyThrottle(0.0);
                    piracer.applySteering(steering);
                }
                break;
        }
        
        
        if (steering == 0.0)    //straight
        {
            IPCManagertargetProxy->setSteering((uint16_t) 0, callStatus, returnMessage);
        }
        else if (steering == -1.0)    // left
        {
            IPCManagertargetProxy->setSteering((uint16_t) 1, callStatus, returnMessage);
        }
        else if (steering == 1.0)    //right
        {
            IPCManagertargetProxy->setSteering((uint16_t) 2, callStatus, returnMessage);
        }
    }

    return 0;
}

