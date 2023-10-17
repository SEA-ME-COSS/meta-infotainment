#include "ControllerClass.hpp"


ControllerClass::ControllerClass()
{
    Py_Initialize();
    pModule = PyImport_ImportModule("piracer.gamepads");
    pClass = PyObject_GetAttrString(pModule, "ShanWanGamepad");
    pInstance = PyObject_CallObject(pClass, NULL);
}

ControllerClass::~ControllerClass()
{
    Py_DECREF(pThrottle);
    Py_DECREF(pSteering);
    Py_DECREF(pInput);
    Py_DECREF(pInstance);
    Py_DECREF(pClass);
    Py_DECREF(pModule);
    Py_Finalize();
}

void ControllerClass::readControl()
{
    pInput = PyObject_CallMethod(pInstance, "read_data", NULL);
    pThrottle = PyObject_GetAttrString(pInput, "analog_stick_right");
    pThrottle = PyObject_GetAttrString(pThrottle, "y");
    pSteering = PyObject_GetAttrString(pInput, "analog_stick_left");
    pSteering = PyObject_GetAttrString(pSteering, "x");
    
    throttle = PyFloat_AsDouble(pThrottle) * 0.5;
    steering = PyFloat_AsDouble(pSteering);
    
    return;
}

double ControllerClass::getThrottle()
{
    return throttle;
}

double ControllerClass::getSteering()
{
    return steering;
}

