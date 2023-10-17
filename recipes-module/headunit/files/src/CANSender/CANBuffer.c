#include "CANBuffer.h"


uint16_t CANBuffer[CANBuffer_SIZE] = {0};
int CANBufferIndex = 0;
pthread_mutex_t CANBufferMutex = PTHREAD_MUTEX_INITIALIZER;

