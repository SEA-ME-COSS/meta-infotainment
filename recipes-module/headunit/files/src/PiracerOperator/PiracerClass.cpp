#include "PiracerClass.hpp"


PiracerClass::PiracerClass()
{
    Py_Initialize();
    pModule = PyImport_ImportModule("piracer.vehicles");
    pClass = PyObject_GetAttrString(pModule, "PiRacerStandard");
    pInstance = PyObject_CallObject(pClass, NULL);
    
    gearMode = 0;
}

PiracerClass::~PiracerClass()
{
    Py_DECREF(pArgs);
    Py_DECREF(pInstance);
    Py_DECREF(pClass);
    Py_DECREF(pModule);
    Py_Finalize();
}

void PiracerClass::setGearMode(uint16_t _gearMode)
{
    gearMode = _gearMode;
    
    return;
}

uint16_t PiracerClass::getGearMode()
{
    return gearMode;
}

void PiracerClass::applyThrottle(double throttle)
{
    pArgs = PyTuple_Pack(1, PyFloat_FromDouble(throttle));
    PyObject_CallMethod(pInstance, "set_throttle_percent", "O", pArgs);
    
    return;
}

void PiracerClass::applySteering(double steering)
{
    pArgs = PyTuple_Pack(1, PyFloat_FromDouble(steering * -1.0));
    PyObject_CallMethod(pInstance, "set_steering_percent", "O", pArgs);
    
    return;
}


PiracerClass piracer;

