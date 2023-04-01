#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int main(){
    int32_t x;
    int32_t *a, *b;
    a = &x;
    b = a + 5;
    printf("%d\n", sizeof(x));
    int difference = (a - b) * sizeof(int);
    printf("%d\n", difference);

}