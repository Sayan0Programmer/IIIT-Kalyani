$ gcc -Wall hello.c[ENTER]			=> a.out
$ ./a.out[ENTER]					=> Run the program

$ rm a.out[ENTER]					=> Remove a.out

$ gcc -Wall -S hello.c[ENTER]			=> hello.s	[Assembly Code]
$ nano/vi hello.s[ENTER]				// Comment Out

$ gcc -c hello.s[ENTER]				=> hello.o
$ objdump -d hello.o[ENTER]			=> Disassemble Object file and See inside

$ gcc hello.o[ENTER]				=> a.out		[Binary Executable file]
$ objdump -d a.out[ENTER]			=> Disassemble Binary file and See inside

$ ./a.out[ENTER]					=> Run the program

See:
$ man gcc[ENTER]
