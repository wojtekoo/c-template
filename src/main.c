#include <stdio.h>

#include "foo.h"

int main()
{
    uint32_t number = 0;

    number = foo();
    printf("foo returns number %u\n", number);

    return 0;
}

/* TODO: Add supporting unit-tests compilation to Makefile */