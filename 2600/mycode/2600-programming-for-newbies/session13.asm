  ;;  '2600 for Newbies'
  ;; Session 13 - Playfield

  processor 6502
  include "vcs.h"
  include "macro.h"

PATTERN         = $80               ; storage location (1st byte in RAM)
TIMETOCHANGE    = 20                ; speed of "animation" - change as desired

  seg
  org $F000

Reset:
  ;; Clear RAM and all TIA registers
  lda #0                        ; 4 cycles
  tax                           ; 2 cycles
Clear:
  dex
  txs
  pha
  bne Clear

  ;; Once-only initialization

  lda #0
  sta PATTERN                   ; the binary PF 'pattern'

  lda #$45
  sta COLUPF                    ; set the playfield color

  ldy #0                        ; "speed" counter

StartOfFrame:
  ;; Start of a new frame
  ;; Start of vertical blank processing
  lda #0
  sta VBLANK

  lda #2
  sta VSYNC

  sta WSYNC
  sta WSYNC
  sta WSYNC                     ; 3 scanlines of VSYNC signal

  lda #0
  sta VSYNC

  ;; 37 scanlines of vertical blank...
  ldx #0
VerticalBlank:
  sta WSYNC
  inx
  cpx #37
  bne VerticalBlank

  ;; Hanlde a change in the pattern once every 20 frames
  ;; and write the pattern to the PF1 register

  iny                           ; increment speed count by one
  cpy #TIMETOCHANGE             ; has it reached the "change point?"
  bne notyet                    ; no, so branch past

  ldy #0                        ; reset speed count
  inc PATTERN                   ; switch to next pattern
notyet:
  lda PATTERN                   ; Use our saved pattern
  sta PF1                       ; as the playfield shape

  ;; Do 192 scanlines of color-changing (our picture)
  ldx #0                        ; This is for counting the scanline number
Picture:
  stx COLUBK             ; change the background color (rainbow effect)
  sta WSYNC              ; wait until the end of the scanline
  inx
  cpx #192
  bne Picture

  lda #%01000010
  sta VBLANK                    ; end of screen - enter blanking

  ;; 30 scanlines of overscan
  ldx #0
Overscan:
  sta WSYNC
  inx
  cpx #30
  bne Overscan


  jmp StartOfFrame


  org $FFFA

InterruptVectors:
  .word Reset
  .word Reset