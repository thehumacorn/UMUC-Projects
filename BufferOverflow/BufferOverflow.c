#include <stdio.h>
#include <string.h>
#include <stdlib.h>


enum {BUFFER_SIZE = 16};

int main(void) {
       char bufovr[] = "BufferOverflowLocation";
       char buf1[BUFFER_SIZE];

       strncpy(buf1, bufovr , BUFFER_SIZE);

       printf("buf1 val: %s\n", buf1);
       
}
