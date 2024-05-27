all:
	flex compiler.l
	bison -d compiler.y -Wcounterexamples	
	g++ *.c -o compiler
