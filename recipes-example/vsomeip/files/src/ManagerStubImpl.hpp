#ifndef MANAGERSTUBIMPL_H_
#define MANAGERSTUBIMPL_H_
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/ManagerStubDefault.hpp>

class ManagerStubImpl: public v1_0::commonapi::ManagerStubDefault {
public:
    ManagerStubImpl();
    virtual ~ManagerStubImpl();
    virtual void setSpeed(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _speed, setSpeedReply_t _return);
    virtual void setRpm(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _rpm, setRpmReply_t _return);
};
#endif /* MANAGERSTUBIMPL_H_ */
