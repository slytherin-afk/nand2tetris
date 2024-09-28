#include "gates.h"

bit AND(bit a, bit b)
{
    return NOT(NAND(a, b));
}
