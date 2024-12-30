#include <vga.h>
#include <kernel.h>

void kernel_main(void) 
{
	terminal_initialize();

	/* TODO: Newline support */
	terminal_writestring("Hello, kernel World!\n");
}