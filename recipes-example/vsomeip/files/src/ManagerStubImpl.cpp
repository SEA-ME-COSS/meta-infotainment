#include "ManagerStubImpl.hpp"

ManagerStubImpl::ManagerStubImpl() { }
ManagerStubImpl::~ManagerStubImpl() { }

void ManagerStubImpl::setSpeed(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _speed, setSpeedReply_t _reply) {
		std::cout << "********************" << std::endl;
		std::cout << "speed: " << _speed << std::endl;
		std::cout << "********************" << std::endl;

		_reply(":)");
};

void ManagerStubImpl::setRpm(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _rpm, setRpmReply_t _reply) {
		std::cout << "********************" << std::endl;
		std::cout << "rpm: " << _rpm << std::endl;
		std::cout << "********************" << std::endl;

		_reply(":)");
};
