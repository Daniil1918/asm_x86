all:
	nasm -f elf32 write_to_file.asm -o write_to_file.o
	gcc -m32 write_to_file.o -o write_to_file

clean:
	rm write_to_file write_to_file.o
