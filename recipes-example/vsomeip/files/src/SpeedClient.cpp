#include <iostream>
#include <string>
#include <unistd.h>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/ManagerProxy.hpp>

using namespace v1_0::commonapi;

int main() {
    std::shared_ptr < CommonAPI::Runtime > runtime = CommonAPI::Runtime::get();
    std::shared_ptr<ManagerProxy<>> myProxy = runtime->buildProxy<ManagerProxy>("local", "seame");

    std::cout << "Checking availability!" << std::endl;
    while (!myProxy->isAvailable())
        usleep(10);
    std::cout << "Available!" << std::endl;

    CommonAPI::CallStatus callStatus;
    std::string returnMessage;
    myProxy->setSpeed(1234, callStatus, returnMessage);
    std::cout << "********************" << std::endl;
    std::cout << returnMessage << std::endl;
    std::cout << "********************" << std::endl;
    return 0;
}
