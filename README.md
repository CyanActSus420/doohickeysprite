![cooltext500677313913238](https://github.com/user-attachments/assets/7c0b1a71-e2f5-4c23-9350-d6770dd2ca0c)

a "simple" program that lets you make 64x64 pixel art and nothing else (not even save them)

## specification

64x64 screen

1024 bytes of memory

(both are easily expandable if you want to go through the source code and change it)

## usage

simply launch "untitledpixelartprogram.console.exe" or "untitledpixelartprogram.sh", depending on your operating system, and edit "main.txt" to change the output of the file

**!!! CUSTOM COLORS ARE NOT CURRENTLY SUPPORTED !!!**

on linux, i highly recommend launching the program inside a terminal window so you have access to the debug logs (on windows, this should be done automatically if you launch "untitledpixelartprogram.console.exe")

the command below assumes you ARE in the same folder as the executable files

```
$ ./untitledpixelartprogram.sh
```

## syntax

SET [VALUE] [TARGET]
 - saves a specific value to a byte

MOVE [BYTE] [TARGET]
 - moves the value of a byte to another byte, and clears the old one

PRINT [BYTE]
 - prints out the value of a byte into the console

SAY [BYTES]
 - prints out a collection of bytes as a long string

ADD/SUB/DIV/MUL [BYTE1] [BYTE2] [TARGET]
 - adds/subtracts/divides/multiplies 2 bytes together and saves the result to another byte

DRAW [BYTE1] [BYTE2] [COLOR]
 - draws a pixel on the coordinates specified by 2 bytes, with the color id from the game config (which can also be accessed using a byte and nothing else because i hate convenience)

CLEAR
 - clears the screen

DEF [NAME]
 - defines a function

END
 - ends function definition

CALL [NAME]
 - calls a function

JUMP [LINE]
 - jumps to a specific line of code

IF [BYTE] [EXPECTED BYTE] [LINE TO JUMP TO]
 - jumps to a specific line of code if a specified byte is equal to the value of the given byte

NOT [BYTE] [EXPECTED BYTE] [LINE TO JUMP TO]
 - jumps to a specific line of code if a specified byte is NOT equal to the value of the given byte

i'll make a proper documentation and readme file later, for now just ask me shit on discord
