#################################
#### Atari Assembly Projects ####
### 6502/6507 Specific Assembly ###
###################################

---------------------------------------------------

# Author

#######################################
#           Luke McCann               #
#    The University of Huddersfield   #
#######################################

Download these notes to read them in the correct format.

---------------------------------------------------

# If You Want To Simply Run My Files

    The easiest method for running my 6502/6507 binaries is via the browser based Atari Emulator.
    (see Alternative methods - JavAtari).

    First, windows users will need to use DASM to compile the .asm files. 

    (If you are on Linux you simply need to use the provided MakeFile after
    installing DASM )

    Then, simply fork this project -> head over the the JavAtari URL -> select Open ROM File
    and select the binary you wish to run.

    If you want to run these files in a debugger I have instructions in this file for 
    setting up DASM and Stella, alternatively you may use the online IDE from 8-bit
    workshop.

# Project Requirements:

    DASM - https://sourceforge.net/projects/dasm-dillon/
    DASM Docs - http://www.expertsetup.net/~brian/dasm/index.html
    Stella - https://stella-emu.github.io/

    This project requires an Assembler to compile code and an Atari emulator 
    to run the projects. I am using the Stella Emulator and DASM to create the
    project, I have included the version of DASM (and a Stella.exe) in the 
    ProjectRelatedFiles folder read on for assistance in assembling 6502 assembly.

# Project Spec:

    This project utilises NTSC standards. This is due to the extended colour pallette compared to 
    PAL standards, and also the fact I am using American emulators to run the programs. 

# Alternative Methods:

    8-Bit Workshop Broswer-Based IDE - https://8bitworkshop.com/v3.3.0/?=&platform=vcs&file=examples%2Fhello
    JavAtari Browser-Based Emulator - https://javatari.org/

# Useful Links

    Munsie (DASM) - https://github.com/munsie/dasm
    Colour Palette - https://en.wikipedia.org/wiki/List_of_video_game_console_palettes
    Interactive TIA Colour Palette - https://www.randomterrain.com/atari-2600-memories-tia-color-charts.html

---------------------------------------------------

## Running Binaries on Stella

    1. Assemble the .asm files to binaries (See Assembling .asm code to .bin).
    
    2. Run Stella Emulator

    3. Double click the Binary you wish to run

    Note: Right clicking empty space in stella allows you to show all files or only show viable ROM files.

    You may also select the window and press the "`" key to enable Stella's debugger.

---------------------------------------------------

# Assembling .asm Code to .bin 

To assemble the .asm files you must first unzip DASM. 
Once unzipped you can run dasm from the command line or linux terminal:

## Linux: 

    unzip dasm-version.zip
    rm dasm.exe && rm dasm.Darwin.X86
    mv dasm.Linux.X86 dasm
    sudo cp dasm /usr/local/bin

    cd into the asm code directory.

    Assemble the asm file in dasm:

        dasm file.asm -f3 -v0 -ofile.bin

    Change file permissions:

        chmod 755 cart.bin

## Windows:

    Unzip the dasm file using your preferred unzipper.

    Or

    If you have java installed run: jar xf dasm-verson.zip

    Edit your system environment variables and add the file "dasm.exe" to your system PATH (you can run it without doing so but this way is easier as it allows you to run dasm from anywhere).

    assemble the .asm files using dasm:

        dasm file.asm -f3 -v0 -ofilename

    Note: if this results in an error it may be because you have added the .bin extension
    to get around this use the command as stated above and add the .bin extension afterwards.

    Finally set permissions of the file(right click -> properties -> security) to allow the
    user and system to rwx and the group and other to rx.


IMPORTANT NOTE: You will not be able to run this binary like a normal bin file (double clicking or ./cart.bin). Remember these files are written for a 6502 processor not the Intel or AMD x86/x64 processor you are likely using in your machine. This cart.bin file does not have the machine code relevant to these modern processors, it has the machine code specific to the 6502/6507 processor from the Atari. 

---------------------------------------------------

### Editing Environment Variables (Windows 10)

Control Panel -> Search(Environment Variables) -> Select change system variables -> Select system PATH -> add new to Path

-> Paste path to dasm file and select OK -> restart powershell or cmd.

## DASM

Input dasm to find a list of commands.

    The F3 flag tells the assembler the version to use
    f3 = 6502/6507

    The o flag tells the assembler the output we want, no space is needed
    between the flag and the name of the file.

    v0 sets verbose mode to minimal (errors only)

---------------------------------------------------

# Running Stella Emulator

## Linux

Run Stella from the Linux terminal:
    
    Stella

## Windows 

Run the file by clicking the created sortcut or application.exe in the installed location.

---------------------------------------------------

# Introduction

Assembly Language is a low-level programming language
designed for a particular processor. Assembly Language
can be produced by compiling source code from
high-level languages but can also be (and has been in the past)
written by hand. 

Most modern compilers convert source code directly to machine code,
hence modern developers use high-level abstraction languages to
create programs without the need for writing assembly code.

Assembly code can however be useful for fine-tuning efficiency.

Assembly Language differs between processor architectures,
however often includes similar instructions accross the
board:

X86 processor example:

    MOV - move data from one location to another
    ADD - add two values
    SUB - subtract a value from another value
    PUSH - push data onto a stack
    POP - pop data from a stack
    JMP - jump to another location
    INT - interrupt a process

# Atari System 

    # - defines a literal - e.g. #2
    $ - defines hexadecimal notation - e.g. $2F
    % - defines binary notation (dealing with bits) - e.g. %00010011

# Registers

    A - Accumulator

---------------------------------------------------

# Atari 6502 "Sally" Op-Codes

http://www.6502.org/tutorials/6502opcodes.html

https://user.xmission.com/~trevin/atari/6502_opcode_table.html

# Assembly Code

    LDA - Load Accumulator with [value] (e.g. LDA #2)
    STA - Store Accumulator A in [memoryAddress] (e.g. STA $2B) - store A to memory address 2B
    LDX - Load Register X with [value] (e.g. LDX $1234)
    DEX - Decrement X (x--)

---------------------------------------------------

# VIM 6502 Syntax Highlighting

https://www.vim.org/scripts/script.php?script_id=1314

# 6502 Assembly Instructions

    TXS - Transfer X register to stack pointer register

## Load and Store

<!--Load a given value form a register, or Store a value from a register to a memory address-->

    LDA - Load the A register
    LDX - Load the X register
    LDY -  Load the Y register

    STA - Store the A register
    STX - Store the X register
    STY - Store the Y register


## Arithmetic Instructions

<!--in 6502 there are two arithmetic modes, binary and decimal (BCD/Binary Coded Decimal)-->

    ADC - Add to accumulator (with carry)
    SBC - Subtract from the accumulator (with carry)

    CLC - Clears the carry flag, usually performed before addition
    SEC - Sets the carry flag, usually performed before subtraction

    INC - Increment memory by one
    INX - Increment X by one
    INY - Increment Y by one

    DEC - Decrement memory by one
    DEX - decrement X by one
    DEY - decrement Y by one

    (Flag) Z = 1 if result is zero, else 0
    (Flag) N = 1 if 7 bit (sign) is 1, else 0 

## Jump and Branch Instructions

    JMP - Jump to another location     - GOTO

    BCC - Branch on carry clear        - C == 0
    BCS - Branch on Carry set          - C == 1
    BEQ - Branch on equal to zero      - Z == 1
    BNE - Branch on not equal to zero  - Z == 0
    BMI - Branch on minus              - N == 1
    BPL - Branch on plus               - N == 0
    BVC - Branch on overflow clear     - V == 0
    BVS - Branch on overflow set       - V == 1

    the final column is equivalent to saying: if(flag == val)

    The branch operations simply jump if the flag value is the same as on the right.

## Op-code PROCESSOR

Set processor (e.g. PROCESSOR 6502)

## Op-code SEG

Atari Reference:
"The SEG pseudo-op: Though it is not strictly necessary, all of our code uses it. Without the .U extension, SEG will create binary data for our ROM. With the .U, SEG just allows DASM to populate its symbol table with names/values."

SEG.U Variables: the label "Variables" will appear in our symbol table's segment list

SEG: end of uninitialised segment - start of ROM binary

Define new segment start (e.g. SEG code)

## Op-code ORG

Set the origin of code in memory.

Our code in memory resides in the ROM (read-only memory) space. 
Data stored here may only be read.

Our code should always start at the default position of $F000 in memory

## Op-code SEI 

Set interrupt code disabled.

## Op-code CLD

Clear decimal mode (disabled BCD (Binary Coded Decimal) decimal math mode)

## Labels

Code in assembly is indented one indentation to the right.
To place Labels we ignore indentation as such:

    PROCESSOR 6502
    SEG code
    ORG $F000

Start:


Here "Start" is a Label, labels can be placed at the beginning to a statement, during assemblty the label is assigned
the current valye of the active location counter and serves as an instruction operand.

Labels can either be symbolic or numeric.

### Symbolic Labels

A symbolic label consists of an identifier followed by a colon. 
These labels must be defined only once. Symbolic labels have 
a global scope and appear in the object files symbol table.


### Numeric Labels

A numeric label consists of a single digit in the range zero through nine followed by a colon.
Numeric labels are used only for local reference and are not included in the object files symbol table.
Numeric labels have limited scope and can therefore be redefined repeatedly.

When a numeric ;label is used as a reference (e.g. as an instruction operand) the suffixes "b" (backward) and "f" (forward)
should be added to the numeric label. For numeric label N the reference N b referes to the nearest label N defined before the reference, and the reference N f refers to the nearest label N defined after the reference. 

### First Loop

        LDY #100 ; y = 100
    Loop:
        DEY ; y--
        BNE Loop ; repeat until y == 0

----------------------------------------------------

# Binary

Binary (0's and 1's) are an abstraction of the ongoings 
of the hardware components of our metallic constructions. 
When we provide current to our machines the electronic components
within them work on a ticking cycle of electrical states. 

These cycles are linked to the machine clock, which in turn
is linked to the speed of the machine/processor measured in hertz
(how man instructions per second a machine can execute).

The only physical aspect these components can detect is whether
or not a provided current is in a high or low voltage state at any
given time. This means we can only identify two states - 
in other words it is "Binary".

States:
    highVoltage - 1 - on
    !highVoltage - 0 - off

Binary is not specific to electrical components.
Engineers discovered alternate measures for utilising
these two states such as working with optics and 
magnetic forces. 

The placeholders we have in memory can only hold
0's and 1's due to this concept, this is what we refer
to as "bits". In representing alternative values (those other 
than 0 and 1) we group bits together. 

----------------------------------------------------

# Counting Systems

In western culutre we utilise a base 10 counting system.
This is a very common system used globally and is the 
basis of a place value numeric system known as the
decimal system. Each digit in any given position may 
have a value in the range of 0 to 9. 

It is thought that we evolved this base sytsem
due to the ease of counting in 10's for us as
a human species. We have 10 fingers, therefore
it is easiest for us to conceptualize numeric 
identities by counting in 10's.

On the other hand (no pun intended) machines
are built using switches which can only ever be
of a binary value. Hence, it is only natural
for a machine to count in base 2 (Binary) but
what other counting systems are there?

This question is dependent on what systems
we are talking about. There are many systems
from all different cultures and developments.
A list of which is available at:

https://en.wikipedia.org/wiki/List_of_numeral_systems

# Side - Track (Hexadecimal)

    However, imagine that you are an alien race known as the
    Hexari. You evolved on a planet far away from our 
    here in the CygnusA galaxy 232 Megaparsecs away from 
    those of us here on Earth. You are from the planet Hexanaught,
    your people evolved to be very humanoid and highly intelligent.
    The main difference is the number of fingers and toes you possess,
    rather than 10 of each you have 16. 

    Now think back to when you were first learning to count,
    you may remember having to use your fingers a lot to do so,
    it is only logical that a race which possesses more fingers
    may derive a different base system for how they count.

    In reality we have and use Base 16 in programming,
    it is known as Hexadecimal and looks like so:

    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F

    You may have seen this if you have worked with
    CSS in selecting colours: #FFdd23

    in this format we use hexadecimal to define colour
    values where the highest value is the prescence of
    colour (or light if you prefer to think of it as such)
    and the lowest value is the abscence. As such
    you can see hexadecimal as #RRGGBB where:

        R = red
        G = green
        B = blue

    In Hexadecimal colours white = #FFFFFF and black = #000000

# Back To The Main Topic

When counting in base 10 we use the digits 0 to 9
as symbols. You might be thinking "if we only consider
0 to 9 then how do we get numbers greater than 10?"

in this case we move to a positional system where
we add a new column to the left of the numbers
indicating the number of 10's 100's 1000's etc...
the column on the right then starts repeating again.

This is why you only need to know how to count to 10
and you can logically infer the next number in the case
to count to much higher numbers (within reason, many people
come unstuck when they don't know the term to describe insanely
large numbers.)

100's     10's     1's
                    0
                    1
                    2
                    3
                    4
                    5
                    6
                    7
                    8
                    9
            1       0
            1       1
            1       2
            1       3


As you can see from above when we write "10" we are
actually syaing 1 ten and 0 ones, just as if we were to
write 100 we are saying 1 hundred, 0 tens and 0 ones
or if we wrote 200 two hundreds, 0 tens and 0 ones
or 432 four hundreds, 30 tens and 2 ones.

# Base 2 (Binary)

So how do we count in base 2 you ask?

As you can see from the decimal system examples,
in base 10 we utilise 0 to 9 as out symbols. This
equates to 10 symbols for use in defining our numbers
in base 2 we only have two sumbols (1 and 0) as such
if we want to count in binary we need to utilise the
same logic on how we represent larger numbers in binary.

                        1's
                        0
                        1   

Counting to 1 is easy, we have a bit that can be
either 0 or 1 therefore we already have our answer.
As soon as we want to count higher (say simply to 2)
we need to take positional logic into account and add
a new column to the left, grouping two bits together
to be inerpreted as a new number altogether. 

                2's     1's
                        0
                        1
                1       0
                1       1

As you can see we simply count to the base number
then add a new positional column to represent the new number,
in this case it is not representing the number of 10's we have
but instead the number of 2's, remember that each time we reach
the limit of how many numbers we can represent in our base count
we must add a new positonal to represent the next number.


        4's     2's     1's
                        0                 = 0
                        1                 = 1
                1       0                 = 2
                1       1                 = 3
        1       0       0                 = 4

This works the same for any positional numeric system, you simply 
need to know the base count to udnerstand how many symbols you have
before you must add a new positional to represent higher numbers. 

The number of unique values which can be represented in binary
utilising n bits is equivalent to 2^n. Therefore a 32 bit system
can represent 2^32 numbers or 4,294,967,296 in total, while a 64
bit system can represent 2^64 numbers or 18,446,744,073,709,551,616.

It is important to note that a a group of 8 bits is refferred to as a
byte. Another way to look at this exaple is as such:


       128's    64's    32's   16's    8's     4's     2's    1's
       2^7     2^6     2^5     2^4     2^3     2^2     2^1     2^0
        0       0       0       1       1       0       1       1

      equivalent to decimal: 27
      equivalent to Hex: 1B


it is important to remember that the rightmost bit is often what we refer to
as the lSB (Least Significant Bit). This bit has the least impact on the overal
value whilst the leftmost bit is referred to as the MSB (Most Significant Bit)
as it holds the highest value.

In converting from binary to decimal we take the bit and multiply them by
their value.

        1 * 2^0 = 1
        1 * 2^1 = 2
        0 * 2^2 = 0
        1 * 2^3 = 8
        1 * 2^4 = 16

Once the values are converted you simply sum the numbers together:

        1 + 2 + 0 + 8 + 16 = 27

Remember: leftmost zeros can be dropped as anything multiplied by zero is zero, therefore
10110 is the same as 00010110.

## Fun Fact

    A theory as to why we divide our days into 24 hours is that Ancient Egyptians liked
    to count in Base 12 using the joints in their fingers to do so, if you take your
    thumb and press each joint as you count (where the creases on your fingers are separating) then you can easily count in base 12.

----------------------------------------------------

# Converting Base Number Systems

## Decimal to Other Base Systems

    Step 1 − Divide the decimal number to be converted by the value of the new base.

    Step 2 − Get the remainder from Step 1 as the rightmost digit (least significant digit) of new base number.

    Step 3 − Divide the quotient of the previous divide by the new base.

    Step 4 − Record the remainder from Step 3 as the next digit (to the left) of the new base number.

## Other Base Systems to Decimal

    Step 1 − Determine the column (positional) value of each digit (this depends on the position of the digit and the base of the number system).

    Step 2 − Multiply the obtained column values (in Step 1) by the digits in the corresponding columns.

    Step 3 − Sum the products calculated in Step 2. The total is the equivalent value in decimal.

## Other Base Systems to Non-Decimal

    Step 1 − Convert the original number to a decimal number (base 10).

    Step 2 − Convert the decimal number so obtained to the new base number.

## Binary to Octal Shortcut

    Step 1 − Divide the binary digits into groups of three (starting from the right).

    Step 2 − Convert each group of three binary digits to one octal digit

## Octal to Binary Shortcut

    Step 1 − Convert each octal digit to a 3 digit binary number (the octal digits may be treated as decimal for this conversion).

    Step 2 − Combine all the resulting binary groups (of 3 digits each) into a single binary number.

## Binary to Hexadecimal Shortcut

    Step 1 − Divide the binary digits into groups of four (starting from the right).

    Step 2 − Convert each group of four binary digits to one hexadecimal symbol.

## Hexadecimal to Binary Shortcut

    Step 1 − Convert each hexadecimal digit to a 4 digit binary number (the hexadecimal digits may be treated as decimal for this conversion).

    Step 2 − Combine all the resulting binary groups (of 4 digits each) into a single binary number.

----------------------------------------------------

# Non Electrical Binary Concepts

Compact Discs:

Compact discs work with the idea of Binary data in mind.
A laser is used to "read" the disc by firing a laser at the disc.
If the laser reflects back we say that data is present (1), however if 
the disc absorbs the laser we can say data is not present (0).

CD Burners:

These worked by damaging the CD media creating small spots which
did not reflect light.

Hard Drives and Floppy Discs:

These also identify data via 1's and 0's, however
they do this using magnetic forces. A magnetic hard drive
contains several magnetic regions, when the reader moves
over these regions the lever is either attracted or
repelled by the force. 

    repel - 1 - on
    attract - 0 - off

----------------------------------------------------

# Hardware

## CPU

The CPU ticks approximately 1.9 milion times per second
each tick is called a clock cycle or "cpu cycle".
It is important to remember that our processor works almost
like an electronic spring unwinding turning gears.

As such a task is performed follow by rest in a different
state.

## Arithmetic Logic Unit (ALU)

The ALU is a digital circuit used to perform arithmetic
and logic operations. It represents the fundamental building
block of a CPU. Modern CPU's contain highly complex and powerful
ALU's.

Most CPU operations are performed by one more more ALU's which
load data from input registers, a register is a small amount of storage available as
part of the CPU. The control unit tells the ALU what operation to perform on
the data, and the ALU stores the result in a output register, the control unit moves
data between these registers, the ALU and memory.

## Proceessor Status Register (P Register)

The P Register is a special 8 bit register
where each bit represents a flag which tells us
that some operation occurred with the processor.

----------------------------------------------------

# Carry and Overflow

If we ask the ALU to perform the following equation:

    0   1 1 1 1 1 1 1
  + 0   0 0 0 0 0 0 0 1
  = 1   0 0 0 0 0 0 0 0

since 1 + 1 = 2 and 2 in binary is 10
we write down the 0 and carry the 1
we then perform the next calculation 1 + 1 = 2
write the zero and carry the one and so forth. 

In this calculation we reach the limit of the 8 bits 
and carry the 1 to the very end giving the byte 1 extra bit.

Whenever this happens the carry flag is set to 1 showing us
that a carry ocurred which needs to be handled. 

# Representing Negative Numbers

A number can only be positive or negative. Since this itself
is also a binary state we only need a single bit to represent
the sign of a number. We use the left-most bit to tell us the sign
of the number:

        0 being positive
        1 being negative

    0 1 1 1 1 1 1 1   = +
    1 1 1 1 1 1 1 1   = -

The repercussions of this is that we are more limited in the 
values we can possibly store/represent in 8 bits. 

This means that we can only store half of the original magnitude representing
numbers from -127 to 127

This simple method is called sign & magnitude, and it does have some issues.

One issue of this system is that there are two different ways to representing 
zero.

    00000000 = +0
    10000000 = -0 

virtually no computers use this method anymore due to these complications.


# Two's Complement

Two's Complement is a smarter way of representing signed numbers and is the 
most popular way in which computers store negative values today.

If we look at the original unsigned binary we have the following columns:

        128's    64's    32's    16's    8's    4's    2's    1's

in Two's Complement we simply take the leftmost column and use it to represent the
number of negative 128's:

        -128's    64's    32's    16's    8's    4's    2's    1's

By storing the number of negative 128's we can represent the maximum number
of negative values, any values from the right we simply subtract from 128.
If you want a positive number you simply place a 0 in the -128 column.

In this method there is only one way of representing zero, and it has become
the most popular method for representing negative numbers in modern computers
since the days of the Atari itself. 


    Examples:

            0   1   1   1   1   1   1   1  = 127 [7F]
            1   0   0   0   0   0   0   0  = -128 [80]

            1   1   1   1   1   1   1   1  = -1 [FF]


## Two's Complement Overflow

If we take the same situation as before in Two's Complement:

    0   1 1 1 1 1 1 1    = 127
  + 0   0 0 0 0 0 0 1    = 1
  = 1   0 0 0 0 0 0 0    = -128

While the same thing happens as previously (the calculation is still exactly the same) 
this method allows for overflow, as we are still only working with 8 bits the calculation
is able to be performed normally. However, since we are talking about Two's Complement
we have a slight bug, our calculation currently shows 127 + 1 = -128 which is mathematically
incorrect. In this case, whenever we change the state of the leftmost bit the processor
will set the overflow flag to true, telling us a workaround is needed for the calculation
to be corrected.

----------------------------------------------------

# Processor Register

    PC - Program Counter
    SP - Stack Pointer
    A - Register A (Accumulator)
    X - Register X
    Y - Register Y

    PS - Processor Status Flags

----------------------------------------------------

# Assembler

The assembler is a program which is used for writing Assembly code. It acts as an 
interpreter between assembly code (e.g. LDA #2) and machine code:

     1010 1001 0000 0010   - Machine Code

        A9       02        - Hexadecimal

           LDA #2          - Assembly Code


When we write in Assembly code we must then translate our assembly code to machine code.
The Assembler can almost be likened to a compiler for a higher level language.

The assembler translates our Assembly code: LDA #2
to the correct hexadecimal or binary bit codes: A9 02  or  1010 1001 0000 0010


If we take the following instruction set:

    LDA #2
    STA $2B

    LDX $1234
    DEX

we are basically saying:

    Load Accumulator with value Literal 2
    Store Accumulator A into memory Address hex value 2B

    Load Register X with hex value 1234
    Decrement X


If we were to then pass these instructions through the assembler 
we would get something like this:

    a9 02
    85 2b

    ae 34 12
    ca 

Remember: this is a hexadecimal representation of machine (binary) code. 

You may notice the third instruction has somewhat been inverted, while you
may have expected the reuslt to be along the lines of "ae 12 34" since our
command was LDX 1234 not LDX 3412 this is to do with the processors architecture.

The processor orders the architecutre in either a Big Endian or Little Endian structure.

The 6502 processor is a Little Endian processor, these definitions are to do with the 
storage of data in the processor addresses. As such the order of addresses for the 
Little Endian structure places the least significant byte before the most significant.

----------------------------------------------------

# Memory Map

When we use the phrase "Memory Map" we are referring to the location in address space.

## VCS Bus

In the VCS bus we have three important registers:

    TIA (Television Interface Adapter)
    PIA (Peripheral Interface Adapter)
    ROM (Read Only memory) Cartridge

### TIA Register

The TIA can be used to access properties such as background colour, player colour, payfield colour etc...

The PIA is basically our memory (RAM).

Finally, we have the ROM, this is our cartridge in which we have written our instructions.

Within our VCS memory map we have the address registers:

    $00 
    $01
    $02
    .
    .
    .
    $7D
    $7E
    $7F

the registers from 00 to 7F are responsible for storing values within the TIA.

e.g. If a value is stored in $09 - this is the register to set the background colour.
Whenever this address receives a value the TIA register gets the value from the address
and send the instruction to the television set to execute changing the background colour.

### PIA RAM

The address values:

    $80
    $81
    $82
    .
    .
    $FD
    $FE
    $FF
    

are our PIA RAM.

Together the PIA and TIA make up the Zero Page.

### ROM 

We started coding from address $F000 to $FFFF this is our ROM cartridge.

    .
    .
    $F000
    $F001
    $F002
    .
    . 
    $FFFC   -> this is where we have 2 bytes for our reset vector
    $FFFD   
    $FFFE   -> this is where we have the 2 bytes for break interruption
    $FFFF

----------------------------------------------------

# Header Files

To prevent having to remember register addresses from the top of your head
there is a helper file included (vcs.h). Inside this file are several
useful definitions of memory addresses.

This file gives unique names to the memory addresses to make
them more human-readable and easier to remember. This is 
the equivalent of assigning the addresses and alias to
refer to it by.

There is also a macro.h file which contains some useful macros
to make building applications in assembly easier. 

----------------------------------------------------

# CRT Displays

CRT monitors contain millions of tiny red, green and blue phosphor "dots" which glow when
struck by an electron beam which travels accross the screen, creating a visible image.

CRT displays had different standards accross the globe, utilising NTSC in the US and PAL standards
in the UK. 

The devices wihtin a CRT are controlled via the TIA (Television Interface Adapter). Different
standards require independent TIA chips specifically created for that standard.

The cathode creates an electron beam, when this beam touches the phosphor screen it illuminates
in an RGB output. Modern computers instead store every pixel rendered in the display in memory
before it is rendered (or even sent to the display). This was not possible in older configurations
as devices such as the Atari had such limited memory capacity it was not possible to store every
possible pixel configuration in memory.

With CRT displays we work with the concept of scanlines. When we speak of scanlines, we are 
referring to the action of the electron beam passing from left to right, this beam "paints" the picture on the display following TIA instruction. The TIA instructions need to be reprogrammed 
every scanline. The TIA chip must be reprogrammed for each scanline we are drawing (this is known as racing the scanline).

## Horizontal Blank

The time it takes for the beam to travel to the right, deactivate and realign again back to the left
and begin rendering again, this is known as the Horizontal blank and is around 68 colour clocks, derived from the fact we work with a 3.8Mhz clock in the TIA. Color clocks can be thought of as "pixels".

The visible scanline is where our content is rendered, this is around 160 colour clocks. 

To control when a scanline finishes the processor is halted until it receives a WSYNC signal from the 
TIA. As when we send instructions to the TIA to render our content, the processor is never absolute (this is in the context that items may take more or less time), as such the TIA needs a way of telling the processor when it is done rendering the scanline. 

The way the Atari does this, is that whenever the TIA hits a certain address in memory the processor is halted, waiting for the TIA to receive a WSYNC flag (Weight Synchronisation). Whenever we finish rendering our scanline the TIA releases the WSYNC allowing the processor to resume it's execution.

## Vertical Synchronisation (VSYNC)

NTSC standard displays utilise VSYNC, this is a time frame which is around 3 scanlines. 
VSYNC tells the VCS when a frame starts and ends. Once the 3 scanlines are rendered there 
is a space known as the vertical blank. This space is around 37 scanlines long, it acts as a buffer placed before the rendering of visible lines. 

Visible scanlines after all of these fucntions are around 192 scanlines for the NTSC standard.

Lastly we enable the Overscan. The overscan is 30 scanlines which are rendered before restarting
the frame. There is a relationship between the CPU cycles and colour clocks.

Overall the colour clocks add up to 228 which in turn is equivalent to 76 CPU cycles, equating 
to an average of 3 colour clocks per CPU cycle.

----------------------------------------------------

# src Code Files

## cleanmemory

Goal: clean all the memory addresses from 00 to FF 

How: this file will zero out all of the values in these memory addresses, this will be done using a LOOP

Memory positions 00 to FF are what Atari programmers refer to as "the zero page".
These addresses hold things such as: RAM memory addressing, TIA register mapping etc...