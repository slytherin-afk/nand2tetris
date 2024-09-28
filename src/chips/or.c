#include "gates.h"

bit OR(bit a, bit b)
{
    return NOT(AND(NOT(a), NOT(b)));
}
