#include <iostream>
#include <thread>
#include <CommonAPI/CommonAPI.hpp>
#include "ManagerStubImpl.hpp"

using namespace std;

int main() {
    std::shared_ptr<CommonAPI::Runtime> runtime = CommonAPI::Runtime::get();
    std::shared_ptr<ManagerStubImpl> myService = std::make_shared<ManagerStubImpl>();
    runtime->registerService("local", "seame", myService);

    while (true) {
        std::cout << "Waiting for calls" << std::endl;
        std::this_thread::sleep_for(std::chrono::seconds(30));
    }
    return 0;
}
