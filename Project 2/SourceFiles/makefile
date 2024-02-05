#
# Type 'make' with this 'makefile' file to build the example BLITZ programs.
# It will execute the following commands as needed, based on files'
# most-recent-update times.
# 

all: Echo Hello HelloWorld

Echo.o: Echo.s
	asm Echo.s

Echo: Echo.o
	lddd Echo.o -o Echo

Hello.o: Hello.s
	asm Hello.s

Hello: Hello.o
	lddd Hello.o -o Hello

Runtime.o: Runtime.s
	asm Runtime.s

System.s: System.h System.k
	kpl System -unsafe

System.o: System.s
	asm System.s

HelloWorld.s: HelloWorld.h HelloWorld.k System.h
	kpl HelloWorld

HelloWorld.o: HelloWorld.s
	asm HelloWorld.s

HelloWorld: Runtime.o System.o HelloWorld.o
	lddd Runtime.o System.o HelloWorld.o -o HelloWorld

echoPrime.s: echoPrime.h echoPrime.k System.h
	kpl echoPrime

echoPrime.o: echoPrime.s
	asm echoPrime.s

echoPrime: Runtime.o System.o echoPrime.o
	lddd Runtime.o System.o echoPrime.o -o echoPrime
	
clean:
	rm -f Echo.o Echo
	rm -f Hello.o Hello
	rm -f Runtime.o System.s System.o HelloWorld.o HelloWorld.s HelloWorld
