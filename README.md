Atari Assembly projects

#################################
            Luke McCann
    The University of Huddersfield
#################################


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

