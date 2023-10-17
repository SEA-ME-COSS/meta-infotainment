#include "PiracerOperatorStubImpl.hpp"
#include <iostream>


PiracerOperatorStubImpl::PiracerOperatorStubImpl() { }
PiracerOperatorStubImpl::~PiracerOperatorStubImpl() { }

void PiracerOperatorStubImpl::setGearMode(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _gearMode, setGearModeReply_t _reply)
{
    piracer.setGearMode(_gearMode);

    _reply("");
    
    return;
}

