#ifndef PIRACERCLASS_HPP
#define PIRACERCLASS_HPP


#include <stdint.h>
#include <Python.h>


class PiracerClass
{
    private:
        PyObject *pModule, *pClass, *pInstance, *pArgs;
        uint16_t gearMode;
        
    public:
        PiracerClass();
        ~PiracerClass();
        void setGearMode(uint16_t _gearMode);
        uint16_t getGearMode();
        void applyThrottle(double throttle);
        void applySteering(double steering);

};


extern PiracerClass piracer;


#endif

