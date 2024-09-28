#include "gates.h"

bit NAND(bit a, bit b)
{
    return ~(a & b);
}
