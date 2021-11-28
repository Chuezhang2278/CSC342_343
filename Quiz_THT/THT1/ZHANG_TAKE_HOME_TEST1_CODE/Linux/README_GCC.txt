1. if needed, compile the code with these instruction
	a. gcc -g -w <filename>.c
	b. gcc -o <filename>.o <filename.c>
	c. gcc -S <filename>.c
2. do gdb ./a.out
3. do break <function>, can be break main, break myAdd
4. after breaking, type in next to proceed to next steps
5. use commands
	print /x $rip [instruction pointer]
	print /x $rsp [stack pointer]
	print /x $rbp [base pointer]
	x /8bx <address>