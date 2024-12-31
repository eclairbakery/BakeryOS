#include <vga.h>
#include <kernel.h>

void main(void)
{
	terminal_initialize();

	terminal_writestring("Hello, kernel World!\n");
	terminal_writestring("Second row");
}