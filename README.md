# specification

64x64 screen
1024 bytes of memory
(both are easily expandable if you want to go through the source code and change it)

# syntax

> SET [VALUE] [TARGET]
saves a specific value to a byte

> MOVE [BYTE] [TARGET]
moves the value of a byte to another byte, and clears the old one

> PRINT [BYTE]
prints out the value of a byte into the console

> ADD/SUB/DIV/MUL [BYTE1] [BYTE2] [TARGET]
adds/subtracts/divides/multiplies 2 bytes together and saves the result to another byte

> DRAW [BYTE1] [BYTE2] [COLOR]
draws a pixel on the coordinates specified by 2 bytes, with the color id from the game config (which can also be accessed using a byte and nothing else because i hate convenience)

> CLEAR
clears the screen

> DEF [NAME]
defines a function

> END
ends function definition

> CALL [NAME]
calls a function

> JUMP [LINE]
jumps to a specific line of code

> IF [BYTE] [EXPECTED VALUE] [LINE TO JUMP TO]
jumps to a specific line of code if a specified byte is equal to the given value

> NOT [BYTE] [EXPECTED VALUE] [LINE TO JUMP TO]
jumps to a specific line of code if a specified byte is NOT equal to the given value

> ;
turns the line into a comment (the line will be ignored)
