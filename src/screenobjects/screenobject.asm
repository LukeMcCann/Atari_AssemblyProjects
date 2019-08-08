    PROCESSOR 6502

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Include MACROS and Definitions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    include "vcs.h"
    include "macro.h"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start an unitialized segment as $80 for variable declaration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    SEG.u variables
    ORG $80
P0Height ds 1       ; defines one byte for Player 0 height
P1Height ds 1       ; defines one byte for Player 1 height

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start ROM code segment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    SEG code
    ORG $F000

Reset:
    CLEAN_START
    
    LDA #$0         ; set background colour
    STA COLUBK

    LDA #%1111      ; set playfield colour
    STA COLUPF

    ; init unitialized
    LDA #10
    STA P0Height 
    STA P1Height

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set te TIA registers for P0,P1 colour
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDA #$32            ; P0 colour
    STA COLUP0

    LDA #$60            ; P1 colour
    STA COLUP1

    LDY #%00000010      ; CTRLPF D1 set to 1 means (score)
    STY CTRLPF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start a new frame
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
StartFrame:
    LDA #2
    STA VBLANK          ; VBLANK ON
    STA VSYNC           ; VSYNC ON

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    REPEAT 3    
        STA WSYNC        ; first 3 scanlines
    REPEND

    LDA #0
    STA VSYNC             ; VSYNC OFF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Let TIA output 37 lines VBLANK
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    REPEAT 37
        STA WSYNC
    REPEND

    LDA #0 
    STA VBLANK          ; VBLANK OFF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Draw visible scanlines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
VisibleScanlines:
    REPEAT 10
        STA WSYNC       ; draw 10 empty scanlines at top of frame
    REPEND

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Draw 10 scanlines for scoreboard
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDY #0
ScoreboardLoop:
    LDA NumberBitmap,Y      ; bitmap array + y
    STA PF1
    STA WSYNC
    INY                     ; y++
    CPY #10                 ; compares difference betwen y and 10, if 0 Z flag is set

    BNE ScoreboardLoop

    LDA #0
    STA PF1                 ; disable playfield, wont be rendered in next scanlines


    ; Draw 50 scanlines between socreboard and players
    REPEAT 50
        STA WSYNC
    REPEND

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Draw 10 scanlines for P0 graphics
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDY #0
Player0Loop:
    LDA PlayerBitmap,Y
    STA GRP0
    STA WSYNC
    INY                     ; y++
    CPY P0Height
    BNE Player0Loop

    LDA #0
    STA GRP0                ; disable P0 graphics
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Draw 10 scanlines for P1 graphics
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDY #0
Player1Loop:
    LDA PlayerBitmap,Y
    STA GRP1
    STA WSYNC
    INY                     ; y++
    CPY P1Height
    BNE Player1Loop

    LDA #0
    STA GRP1                ; disable P0 graphics
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Draw remaining 102 scanlines ; total used = 80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    REPEAT 102
        STA WSYNC
    REPEND

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Overscan 30 VBLANK scanlines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDA #02
    STA VBLANK          ; VBLANK ON
    REPEAT 30
        STA WSYNC
    REPEND

    LDA #0
    STA VBLANK          ; VBLANK OFF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Loop next frame
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    JMP StartFrame

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bitmaps
;; Defines an array of bytes to draw sprites.
;; These bytes are added in the final ROM addresses.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ORG $FFE8
PlayerBitmap:
    .byte #%01111110    ;    ######
    .byte #%11111111    ;   ########
    .byte #%10011001    ;   #  ##  #
    .byte #%11111111    ;   ########
    .byte #%11111111    ;   ########
    .byte #%11111111    ;   ########
    .byte #%10111101    ;   # #### #
    .byte #%11000011    ;   ##    ##
    .byte #%01111110    ;    ###### 

    ORG $FFF2
NumberBitmap:
    .byte #%00001110    ;   ########
    .byte #%00001110    ;   ########
    .byte #%00000010    ;        ###
    .byte #%00000010    ;        ###
    .byte #%00001110    ;   ########
    .byte #%00001110    ;   ########
    .byte #%00001000    ;   ###
    .byte #%00001000    ;   ###
    .byte #%00001110    ;   ########
    .byte #%00001110    ;   ########

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Complete ROM size
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ORG $FFFC
    .word Reset
    .word Reset