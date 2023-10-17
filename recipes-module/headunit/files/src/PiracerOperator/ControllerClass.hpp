#ifndef CONTROLLERCLASS_HPP
#define CONTROLLERCLASS_HPP


#include <Python.h>


class ControllerClass
{
    private:
        PyObject *pModule, *pClass, *pInstance, *pInput, *pThrottle, *pSteering;
        double throttle;
        double steering;
        
    public:
        ControllerClass();
        ~ControllerClass();
        void readControl();
        double getThrottle();
        double getSteering();
};


#endif

