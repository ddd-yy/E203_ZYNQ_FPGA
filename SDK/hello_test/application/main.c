
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include "hbird_sdk_soc.h"



int main(void)
{

    for (int i = 0; i < 10; i ++) {
        //printf("%d: Hello World From My risc-v\r\n",i);

        printf("%d: Hello World In zynq 7020!!!\r\n",i);
    }
    return 0;
}

