#include <unistd.h>
#include <cstdlib>
#include <CommonAPI/CommonAPI.hpp>

#include "IPCManagerStubImpl.hpp"
#include "IPCManagerSenderClass.hpp"


using namespace v1_0::commonapi;

int main()
{
    std::shared_ptr<CommonAPI::Runtime> runtime;
    std::shared_ptr<IPCManagerStubImpl> IPCManagerService;
    
    runtime = CommonAPI::Runtime::get();
    IPCManagerService = std::make_shared<IPCManagerStubImpl>();
    runtime->registerService("local", "IPCManager", IPCManagerService);
    
    IPCManagerSenderClass sender;
    int exitCode;
    
    while (1)
    {
        if (!sender.CANSenderTargetProxy->isAvailable())
	    exitCode = system("sh ../reboot_script/reboot_can_sender.sh");
        if (!sender.PiracerSenderTargetProxy->isAvailable())
	    exitCode = system("sh ../reboot_script/reboot_piracer_sender.sh");
        if (!sender.PiracerOperatorTargetProxy->isAvailable())
	    exitCode = system("sh ../reboot_script/reboot_piracer_operator.sh");
        if (!sender.InstrumentClusterTargetProxy->isAvailable())
	    exitCode = system("sh ../reboot_script/reboot_instrument_cluster.sh");
        if (!sender.HeadUnitTargetProxy->isAvailable())
	    exitCode = system("sh ../reboot_script/reboot_head_unit.sh");
	
	usleep(1000000);
    }
    
    return 0;
}

