all: main

lib.o: lib.asm
	nasm -f elf64 -o lib.o lib.asm

dict.o: dict.asm
	nasm -f elf64 -o dict.o dict.asm

main.o: main.asm
	nasm -f elf64 -o main.o main.asm

main: lib.o dict.o main.o
	ld -o main main.o lib.o dict.o

clean:
	rm -rf lib.o main.o dict.o main 

