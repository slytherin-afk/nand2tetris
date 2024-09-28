#pragma once

typedef unsigned char bit;

#define TRUE 0b11111111
#define FALSE 0b00000000

bit NAND(bit a, bit b);
bit NOT(bit a);
bit AND(bit a, bit b);
bit OR(bit a, bit b);
