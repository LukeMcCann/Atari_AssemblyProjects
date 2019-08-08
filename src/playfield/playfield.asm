    PROCESSOR 6502

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Include required files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    include "vcs.h"
    include "macro.h"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start ROM code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    SEG code
    ORG $F000

Reset:
    CLEAN_START
    
    LDX #$C4            ; set background colour (NTSC)
    STX COLUBK

    LDA #$7E           ; set playfield colour
    STA COLUPF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start new frame
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
StartFrame:
    LDA #02
    STA VBLANK          ; VBLANK ON
    STA VSYNC           ; VSYNC ON

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Render 3 lines VSYNC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    REPEAT 3            ; DASM repeat * 3
        STA WSYNC
    REPEND

    LDA #0 
    STA VSYNC           ; VSYNC OFF 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Let TIA output 37 lines VBLANK
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    REPEAT 37
        STA WSYNC
    REPEND

    LDA #0
    STA VBLANK          ; VBLANK OFF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set CTRLPF register, allow playfield reflection 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDX #%00000001      ; CTRLPF register (D0 = reflect PF)
    STX CTRLPF


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Draw visible scanlines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ; Skip 7 scanlines with no PF set
    LDX #0
    STX PF0
    STX PF1 
    STX PF2
    REPEAT 7
        STA WSYNC
    REPEND

    ; Set PF0 to 1110 (LSB First) and PF1-PF2
    LDX #%11100000
    STX PF0

    LDX #%11111111
    STX PF1
    STX PF2
    REPEAT 7
        STA WSYNC
    REPEND

    ; Set next 164 lines

    LDX #%01100000
    STX PF0
    LDX #%10000000
    STX PF2
    LDX #0
    STX PF1
    REPEAT 164
        STA WSYNC
    REPEND

    ; Set PF0 to 1110 (LSB first) and PF1 - PF2 as 1111 1111

    LDX #%11100000
    STX PF0

    LDX #%11111111
    STX PF1
    STX PF2
    REPEAT 7
        STA WSYNC
    REPEND

    ; Skip 7 vertical lines with no PF set
    LDX #0
    STX PF0
    STX PF1
    STX PF2
    REPEAT 7
        STA WSYNC
    REPEND


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; overscan 30 VBLANK scanlines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDA #02
    STA VBLANK      ; VBLANK ON
    REPEAT 30
        STA WSYNC
    REPEND

    LDA #0
    STA VBLANK      ; VBLANK OFF
    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Loop to next frame
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    JMP StartFrame

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Complete ROM size
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ORG $FFFC
    .word Reset
    .word Reset