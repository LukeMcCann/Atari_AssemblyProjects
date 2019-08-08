    PROCESSOR 6502

    include "vcs.h"
    include "macro.h"

    SEG code
    ORG $F000

Start:
    CLEAN_START             ; macro for clearing memory and TIA addresses

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start a new frame
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NextFrame:
    LDA #%00000010          ; decimal #2
    STA  VBLANK             ; turn on VBLANK
    STA VSYNC               ; turn on VSYNC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Render 3 lines of VSYNC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    STA WSYNC               ; halt processor : first scanline
    STA WSYNC               ; halt processor : second scanline
    STA WSYNC               ; halt processor : third scanline

    LDA #0 
    STA VSYNC               ; turn off VSYNC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Let TIA output recommended 37 scanlines of VBLANK
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDX #37                 ; scanlineCounter : x = 37

LoopVBlank:
    STA WSYNC               ; hit WSYNC and wait for next scanline
    DEX                     ; x--
    BNE LoopVBlank          ; while(x != 0) { JMP LoopVBlank }

    LDA #0
    STA VBLANK              ; turn off VBLANK

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Render visible scanlines (192 scanlines for Kernel)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDX #192                 ; scanlineCounter : x = 192

LoopVisScanline:
    STX COLUBK              ; set bgcolor 
    STA WSYNC               ; halt processor : next scanline
    DEX                     ; x--

    BNE LoopVisScanline     ; while(x != 0) { JMP LoopVisScanline }

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Render 30 scanlines of Overscan
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDA #2                  ; hit and turn on VBLANK
    STA VBLANK

    LDX #30                 ; overscanCounter : x = 30

LoopOverscan:

    STA WSYNC               ; halt processor : next scanline
    DEX                     ; x--
    BNE LoopOverscan        ; while(x != 0) { JMP LoopOverscan }

    JMP NextFrame

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Complete ROM size to 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ORG $FFFC
    .word Start             ; reset vector at $FFFC
    .word Start             ; interrup vector at $FFFE