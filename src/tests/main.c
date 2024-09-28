#include <stdio.h>
#include <assert.h>
#include "gates.h"

void test_NAND()
{
    assert(NAND(FALSE, FALSE) == TRUE);
    assert(NAND(FALSE, TRUE) == TRUE);
    assert(NAND(TRUE, FALSE) == TRUE);
    assert(NAND(TRUE, TRUE) == FALSE);

    printf("All NAND gate tests passed!\n");
}

void test_NOT()
{
    assert(NOT(FALSE) == TRUE);
    assert(NOT(TRUE) == FALSE);

    printf("All NOT gate tests passed!\n");
}

void test_AND()
{
    assert(AND(FALSE, FALSE) == FALSE);
    assert(AND(FALSE, TRUE) == FALSE);
    assert(AND(TRUE, FALSE) == FALSE);
    assert(AND(TRUE, TRUE) == TRUE);

    printf("All AND gate tests passed!\n");
}

void test_OR()
{
    assert(OR(FALSE, FALSE) == FALSE);
    assert(OR(FALSE, TRUE) == TRUE);
    assert(OR(TRUE, FALSE) == TRUE);
    assert(OR(TRUE, TRUE) == TRUE);

    printf("All OR gate tests passed!\n");
}

int main()
{
    test_NAND();
    test_NOT();
    test_AND();
    test_OR();

    return 0;
}
