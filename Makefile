CC = clang
LD = ld
AS = nasm

CFLAGS = -c --target=i686-elf -nostdlib -ffreestanding -O2 -Wall -Wextra -m32 -Iinclude -std=c99
LDFLAGS = -T linker.ld -nostdlib -e _start -m elf_i386
ASFLAGS = -f elf32

all: build buildiso run clean

build:
	$(AS) $(ASFLAGS) -o boot.o src/boot.asm
	$(CC) $(CFLAGS) -o vga.o src/vga.c
	$(CC) $(CFLAGS) -o kernel.o src/kernel.c
	$(LD) $(LDFLAGS) -o kernel.elf vga.o kernel.o boot.o

buildiso:
	cp -r kernel.elf grub/boot/kernel.elf
	grub-mkrescue -o BakeryOS.iso grub

run:
	qemu-system-i386 -cdrom ./BakeryOS.iso

clean:
	rm -r *.o
	rm -r *.elf