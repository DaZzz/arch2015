_PRINTF = 127
_PUTCHAR = 122

.SECT .TEXT

!!!
! Printing array
!!!
PRINT_ARR:
        PUSH    BP
        MOV     BP, SP
        PUSH    BX
        PUSH    CX

        MOV     CX, 4(BP)
        MOV     BX, 6(BP)
L1:
        PUSH    (BX)
        PUSH    array_format
        PUSH    _PRINTF
        SYS
        ADD     SP, 6
        ADD     BX, 2

        DEC     CX
        CMP     CX, 0
        JNE     L1

        ! Next line
        PUSH '\n'
        PUSH _PUTCHAR
        SYS
        ADD     SP, 4

        ! Free BX, CX
        POP     CX
        POP     BX
        POP     BP
        RET

.SECT .DATA
array_format:         .ASCIZ          "%d "

.SECT .BSS
