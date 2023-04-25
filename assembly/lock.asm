; PIC18F452 Configuration Bit Settings

; Assembly source line config statements

#include "p18f452.inc"

; CONFIG1H
  CONFIG  OSC = RCIO            ; Oscillator Selection bits (RC oscillator w/ OSC2 configured as RA6)
  CONFIG  OSCS = OFF            ; Oscillator System Clock Switch Enable bit (Oscillator system clock switch option is disabled (main oscillator is source))

; CONFIG2L
  CONFIG  PWRT = OFF            ; Power-up Timer Enable bit (PWRT disabled)
  CONFIG  BOR = OFF             ; Brown-out Reset Enable bit (Brown-out Reset disabled)
  CONFIG  BORV = 20             ; Brown-out Reset Voltage bits (VBOR set to 2.0V)

; CONFIG2H
  CONFIG  WDT = OFF             ; Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
  CONFIG  WDTPS = 128           ; Watchdog Timer Postscale Select bits (1:128)

; CONFIG3H
  CONFIG  CCP2MUX = ON          ; CCP2 Mux bit (CCP2 input/output is multiplexed with RC1)

; CONFIG4L
  CONFIG  STVR = ON             ; Stack Full/Underflow Reset Enable bit (Stack Full/Underflow will cause RESET)
  CONFIG  LVP = ON              ; Low Voltage ICSP Enable bit (Low Voltage ICSP enabled)

; CONFIG5L
  CONFIG  CP0 = OFF             ; Code Protection bit (Block 0 (000200-001FFFh) not code protected)
  CONFIG  CP1 = OFF             ; Code Protection bit (Block 1 (002000-003FFFh) not code protected)
  CONFIG  CP2 = OFF             ; Code Protection bit (Block 2 (004000-005FFFh) not code protected)
  CONFIG  CP3 = OFF             ; Code Protection bit (Block 3 (006000-007FFFh) not code protected)

; CONFIG5H
  CONFIG  CPB = OFF             ; Boot Block Code Protection bit (Boot Block (000000-0001FFh) not code protected)
  CONFIG  CPD = OFF             ; Data EEPROM Code Protection bit (Data EEPROM not code protected)

; CONFIG6L
  CONFIG  WRT0 = OFF            ; Write Protection bit (Block 0 (000200-001FFFh) not write protected)
  CONFIG  WRT1 = OFF            ; Write Protection bit (Block 1 (002000-003FFFh) not write protected)
  CONFIG  WRT2 = OFF            ; Write Protection bit (Block 2 (004000-005FFFh) not write protected)
  CONFIG  WRT3 = OFF            ; Write Protection bit (Block 3 (006000-007FFFh) not write protected)

; CONFIG6H
  CONFIG  WRTC = OFF            ; Configuration Register Write Protection bit (Configuration registers (300000-3000FFh) not write protected)
  CONFIG  WRTB = OFF            ; Boot Block Write Protection bit (Boot Block (000000-0001FFh) not write protected)
  CONFIG  WRTD = OFF            ; Data EEPROM Write Protection bit (Data EEPROM not write protected)

; CONFIG7L
  CONFIG  EBTR0 = OFF           ; Table Read Protection bit (Block 0 (000200-001FFFh) not protected from Table Reads executed in other blocks)
  CONFIG  EBTR1 = OFF           ; Table Read Protection bit (Block 1 (002000-003FFFh) not protected from Table Reads executed in other blocks)
  CONFIG  EBTR2 = OFF           ; Table Read Protection bit (Block 2 (004000-005FFFh) not protected from Table Reads executed in other blocks)
  CONFIG  EBTR3 = OFF           ; Table Read Protection bit (Block 3 (006000-007FFFh) not protected from Table Reads executed in other blocks)

; CONFIG7H
  CONFIG  EBTRB = OFF           ; Boot Block Table Read Protection bit (Boot Block (000000-0001FFh) not protected from Table Reads executed in other blocks)

              
ZERO CODE 0x0000
    loop res 1
    Digits  res 4
    Input_code res 4
    goto START

START
    movlw 0x00
    movwf TRISB
    movlw 0xFC
    movwf TRISC
    clrf TRISA
    movlw 0xFF
    movwf TRISD
    movlw 0x09
    movwf 0x86
    call SET_CODE

SET_CODE
    call LOOP
    movf 0x90, W 
    movwf Digits
    bcf TRISB, 0
    bsf PORTB, 0
    call LOOP
    movf 0x90, W 
    movwf Digits+1
    bcf TRISB, 1
    bsf PORTB, 1
    call LOOP
    movf 0x90, W 
    movwf Digits+2
    call LOOP
    movf 0x90, W 
    movwf Digits+3
    bcf TRISB, 1
    bsf PORTB, 1
    goto UNLOCK_CODE

UNLOCK_CODE
    call LOOP
    movf 0x90, W 
    movwf Input_code
    call LOOP
    movf 0x90, W 
    movwf Input_code+1
    call LOOP
    movf 0x90, W 
    movwf Input_code+2
    call LOOP
    movf 0x90, W 
    movwf Input_code+3
    goto COMPARE_CODE
    
COMPARE_CODE
    movlw 4
    movwf loop
;    clrf loop     ; initialize a temporary variable to 0

    goto compare_loop
    
compare_loop
    movf Digits, W   ; load the first element of the first array into the W register
    subwf Input_code, W  ; subtract the first element of the second array from W
    btfsc STATUS, Z   ; check if the result of the subtraction is zero (arrays match)
    goto NOT_EQUAL    ; if not, jump to not_equal
    incf loop, F      ; if arrays match, increment the temporary variable
    incf Digits, F   ; increment the pointers to the next element
    incf Input_code, F   ; in both arrays
    decfsz loop      ; decrement the loop counter and check if it's zero
    goto compare_loop ; if not, go back to compare_loop
    
    ;UNLOCKED, TURN ON THE LEDS
    bcf TRISB, 2
    bsf PORTB, 2
    bcf TRISB, 3
    bsf PORTB, 3

    
NOT_EQUAL
    goto UNLOCK_CODE
    
LOOP
    bcf TRISB, 7
    bsf PORTB, 7
    bsf PORTC, 0
    call WAIT
    btfsc PORTC, 0
    call TOP
    bcf PORTC, 0
    bsf PORTC, 1
    call WAIT
    btfsc PORTC, 1
    call BOTTOM
    bcf PORTC, 1
    goto LOOP
    
END_LOOP
    return

TOP
    btfsc PORTC, 2       
    call ON_1
    btfsc PORTC, 3       
    call ON_2
    btfsc PORTC, 4        
    call ON_3
    btfsc PORTC, 5       
    call ON_4
    btfsc PORTC, 6       
    call ON_5
    return
    
BOTTOM
    btfsc PORTC, 2       
    call ON_6
    btfsc PORTC, 3       
    call ON_7
    btfsc PORTC, 4        
    call ON_8
    btfsc PORTC, 5       
    call ON_9
    btfsc PORTC, 6       
    call ON_0
    return
 
ON_1
    movlw 1
    movwf 0x90
    return
ON_2
    movlw 2
    movwf 0x90
    return
ON_3
    movlw 3
    movwf 0x90
    return
ON_4
    movlw 4
    movwf 0x90
    return
ON_5
    movlw 5
    movwf 0x90
    return
ON_6
    movlw 6
    movwf 0x90
    return
ON_7
    movlw 7
    movwf 0x90
    return
ON_8
    movlw 8
    movwf 0x90
    return 
ON_9
    movlw 9
    movwf 0x90
    return
ON_0
    movlw 0
    movwf 0x90
    return 


WAIT
    movlw 0x02
    movwf 0x80
    movwf 0x81
WAIT1
    decf 0x80
    btfsc STATUS, Z
    return
WAIT2
    decf 0x81
    btfsc STATUS, Z
    goto WAIT1
    goto WAIT2
 
    END
