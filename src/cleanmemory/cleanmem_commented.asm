    PROCESSOR 6502 ; processor type (Atari 6502)
 
    SEG code ; define new code segment start
    ORG $F000 ; define origin of code in memory (in ROM space)

Start:
    SEI ; set interrupt disabled
    CLD ; disable the BCD decimal math mode

    ; Whenever we start a program we need to zero the stack pointer to the default origin position in memory
    ; this is usually position $FF so we need to point the stack pointer at this address.

    LDX #$FF ; loads the X register with #$FF
    TXS ; transfer X register to stack pointer register

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Clear the Zero page region ($00 to $FF)
;  Meaning the entire TIA register space
;  and also RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDA #0  ; A = 0
    LDX #$FF ; Counter: X = #$FF

MemLoop:
    STA $0,X ; Store the value of A register (0) at address $0 + X
    DEX ; x--
    BNE MemLoop ; Loop until x == 0 (z-Flag set)

    ; When we need to end the program there is a rule to follow
    ; We need to tell Atari 2 things

    ; The ROM size must be filled to 4KB 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ORG $FFFC ; Force to memory position FFFC 
    .word Start ; .word tells the assembler to add 2 bytes, Start will ensure Atari finds the Start label
    .word Start  ; we add 2 bytes as Start is a memory position (16bits)

    ; ^ reset vector at $FFFC (where program starts)
    ; the second .word Start is to fill 4KB - this is an interrupt vector at $FFFE (unused in VCS)


    ; We need to complete the ROM cartridge to memory position FFFF but before we 
    ; get to FFFF Atari requires us to go to FFFC and add 4 bytes there
    ; in these 4 bytes we need to put the address of the memory position 
    ; we need to go to whenever the Atari system is reset