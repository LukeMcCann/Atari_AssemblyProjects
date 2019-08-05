    PROCESSOR 6502 
 
    SEG code 
    ORG $F000 

Start:
    SEI ; disable interrupts
    CLD ; disable the BCD decimal math
    LDX #$FF ; loads the X register with #$FF
    TXS ; transfer X register to Stack register

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ORG $FFFC 
    .word Start ; reset vector at $FFFC (where program starts)
    .word Start  ; interrupt vecotr at $FFFE
