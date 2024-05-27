all:
	flex compiler.l
	bison -d compiler.y
	g++ *.c -o compiler
