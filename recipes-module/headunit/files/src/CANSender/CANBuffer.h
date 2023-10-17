#ifndef CANBUFFER_H
#define CANBUFFER_H


#ifdef __cplusplus
extern "C" {
#endif


#include <stdint.h>
#include <pthread.h>


#define CANBuffer_SIZE 10


extern uint16_t CANBuffer[CANBuffer_SIZE];
extern int CANBufferIndex;
extern pthread_mutex_t CANBufferMutex;


#ifdef __cplusplus
}
#endif


#endif

