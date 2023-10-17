#include "ReadCANThread.h"
#include "SendSomeipThread.hpp"


int main ()
{
    pthread_t canThread, someipThread;
    pthread_create(&canThread, NULL, ReadCANThread, NULL);
    pthread_create(&someipThread, NULL, SendSomeipThread, NULL);

    pthread_join(canThread, NULL);
    pthread_join(someipThread, NULL);

    return 0;
}

