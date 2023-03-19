include "macro.asm"

; notes: C50A:C50B is x-velocity
;        C50E is facing (01: right. 21: left.)
;        C553 is player input

if rom_type==rom_us
    OFFSET: equ 0
else
    OFFSET: equ 342
endif


org $47ef+OFFSET
banksk1
    nop
    nop
    nop
    
org $4c47+OFFSET
banksk1

    nop
    nop
    nop
    
org $5188+OFFSET
banksk1

    nop
    nop
    nop

org $5321+OFFSET
banksk1

    nop
    nop
    nop
    
org $5329+OFFSET
banksk1

    nop
    nop
    nop
    
org $5196+OFFSET
banksk1

    nop
    nop
    nop

org $519e+OFFSET
banksk1

    nop
    nop
    nop

if NO_VCANCEL == 1
    org $51DA+OFFSET
    banksk1
    
        db $18 ; jr (instead of jr nz)
endif
