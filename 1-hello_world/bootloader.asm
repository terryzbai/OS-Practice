    BITS 16                      ; Tell the assembler to use 16-bit mode
    ORG 0x7C00                   ; Origin, BIOS loads the bootloader here

start:
    MOV SI, helloWorld           ; Load the address of the string into SI
    CALL PrintString             ; Call the print function

    JMP $                        ; Infinite loop to hang after printing

PrintString:                     ; Function to print the string in SI to screen
    MOV AH, 0x0E                 ; BIOS teletype function
    MOV BH, 0x00                 ; Page number
    MOV BL, 0x07                 ; Attribute (light grey on black)
.nextChar:
    LODSB                        ; Load next byte from SI into AL
    OR AL, AL                    ; Check if AL is 0 (end of string)
    JZ .done                     ; If zero, end of string, jump to done
    INT 0x10                     ; BIOS interrupt to print AL
    JMP .nextChar                ; Loop to print next character
.done:
    RET

    helloWorld db 'Hello World', 0

    TIMES 510-($-$$) db 0        ; Pad remainder of boot sector with 0s
    DW 0xAA55                    ; Boot sector magic number
