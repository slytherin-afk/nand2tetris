#include "gates.h"

bit NOT(bit a)
{
    return NAND(a, a);
}
