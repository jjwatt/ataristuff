  processor 6502

  include "vcs.h"
  include "macro.h"

  seg code
  org $F000                     ; Define the origin of the ROM at $F000

START:
  CLEAN_START                   ; Call macro to safely clear the memory

  lda #$1E                      ; Load color code into A (ntsc yellow $1E)
  sta COLUBK                    ; Store A to memory address $09 (TIA COLUBK)
  jmp START                     ; Repeat from START

  ;; Footer: Fill ROM size to exactly 4KiB
  org $FFFC                     ; Defines origin to $FFFC
  .word START                   ; Reset vector at $FFFC 16 bit
  .word START                   ; Interrupt vector 16 bit (unused by the VCS)
