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
    movlw 0x04; count of the PRZYCISKI reading code
    movwf 0x86
    call SET_CODE

SET_CODE
    bsf PORTB, 4
    goto PRZYCISKI_1

SAVE_FST
    bsf PORTB, 0
    movf 0x90, W
    movwf 0x80
    goto PRZYCISKI_2

SAVE_SCD
    bsf PORTB, 1
    movf 0x90, W
    movwf 0x81 
    call PRZYCISKI_3

SAVE_THR
    bsf PORTB, 2
    movf 0x90, W
    movwf 0x82
    call PRZYCISKI_4

SAVE_FTH
    bsf PORTB, 3 ; wpisano 4 cyfrę
    movf 0x90, W 
    movwf 0x83
    bcf PORTB, 4
    goto UNLOCK_CODE

UNLOCK_CODE
    ; turn of the leds displaying the code
    bcf PORTB, 0
    bcf PORTB, 1
    bcf PORTB, 2
    bcf PORTB, 3
    
    bcf PORTB, 4 ; open led off
    bsf PORTB, 5 ; closed led on
    
    goto PRZYCISKI_1_LOCK

CHECK_FST
    bsf PORTB, 0
    movlw 0x80    ; Load 10 into WREG
    subwf 0x90, W, 0
    btfss STATUS, Z
    goto PRZYCISKI_2_LOCK
    goto UNLOCK_CODE

CHECK_SCD
    bsf PORTB, 1
    movlw 0x81    ; Load 10 into WREG
    subwf 0x90, W, 0
    btfss STATUS, Z
    goto PRZYCISKI_3_LOCK
    goto UNLOCK_CODE

CHECK_THR
    bsf PORTB, 2
    movlw 0x82    ; Load 10 into WREG
    subwf 0x90, W, 0
    btfss STATUS, Z
    goto PRZYCISKI_4_LOCK
    goto UNLOCK_CODE

CHECK_FTH
    bsf PORTB, 3
    movlw 0x83    ; Load 10 into WREG
    subwf 0x90, W, 0
    btfss STATUS, Z
    goto UNLOCKED
    goto UNLOCK_CODE
    
UNLOCKED
    ; turn of the leds displaying the code
    bcf PORTB, 0
    bcf PORTB, 1
    bcf PORTB, 2
    bcf PORTB, 3
    
    bcf PORTB, 5
    bcf PORTB, 5 ; open led ON
    bsf PORTB, 4 ; closed led OFF

REALEASED_LOOP
    btfsc PORTD, 0       
    call REALEASED_LOOP
    btfsc PORTD, 1       
    call REALEASED_LOOP
    btfsc PORTD, 2        
    call REALEASED_LOOP
    btfsc PORTD, 3       
    call REALEASED_LOOP
    btfsc PORTD, 4       
    goto REALEASED_LOOP
    btfsc PORTD, 5       
    goto REALEASED_LOOP
    btfsc PORTD, 6       
    goto REALEASED_LOOP
    btfsc PORTD, 7        
    goto REALEASED_LOOP
    btfsc PORTA, 0        
    goto REALEASED_LOOP
    return


PRZYCISKI_1
    movlw 0
    btfsc PORTD, 0
    movlw b'00000001'
    btfsc PORTD, 1
    movlw b'00000010'
    btfsc PORTD, 2
    movlw b'00000100'
    btfsc PORTD, 3
    movlw b'00001000'
    btfsc PORTD, 4
    movlw b'00001000'
    btfsc PORTD, 5
    movlw b'00010000'
    btfsc PORTD, 6
    movlw b'00100000'
    btfsc PORTD, 7
    movlw b'0100000'
    btfsc PORTA, 0
    movlw b'10000000'
    
    movwf 0x90 ; załadowanie do f 0x90
    
    btfsc 0x90, 0
    call ON_1
    btfsc 0x90, 1
    call ON_1
    btfsc 0x90, 2
    call ON_1
    btfsc 0x90, 3
    call ON_1
    btfsc 0x90, 4
    call ON_1
    btfsc 0x90, 5
    call ON_1
    btfsc 0x90, 6
    call ON_1
    btfsc 0x90, 7
    call ON_1
    btfsc 0x90, 8
    call ON_1
    
    goto PRZYCISKI_1

PRZYCISKI_2
    movlw 0
    btfsc PORTD, 0
    movlw b'00000001'
    btfsc PORTD, 1
    movlw b'00000010'
    btfsc PORTD, 2
    movlw b'00000100'
    btfsc PORTD, 3
    movlw b'00001000'
    btfsc PORTD, 4
    movlw b'00001000'
    btfsc PORTD, 5
    movlw b'00010000'
    btfsc PORTD, 6
    movlw b'00100000'
    btfsc PORTD, 7
    movlw b'0100000'
    btfsc PORTA, 0
    movlw b'10000000'
    
    movwf 0x90 ; załadowanie do f 0x90
    
    btfsc 0x90, 0
    call ON_2
    btfsc 0x90, 1
    call ON_2
    btfsc 0x90, 2
    call ON_2
    btfsc 0x90, 3
    call ON_2
    btfsc 0x90, 4
    call ON_2
    btfsc 0x90, 5
    call ON_2
    btfsc 0x90, 6
    call ON_2
    btfsc 0x90, 7
    call ON_2
    btfsc 0x90, 8
    call ON_2
    
    goto PRZYCISKI_2

PRZYCISKI_3
    movlw 0
    btfsc PORTD, 0
    movlw b'00000001'
    btfsc PORTD, 1
    movlw b'00000010'
    btfsc PORTD, 2
    movlw b'00000100'
    btfsc PORTD, 3
    movlw b'00001000'
    btfsc PORTD, 4
    movlw b'00001000'
    btfsc PORTD, 5
    movlw b'00010000'
    btfsc PORTD, 6
    movlw b'00100000'
    btfsc PORTD, 7
    movlw b'0100000'
    btfsc PORTA, 0
    movlw b'10000000'
    
    movwf 0x90 ; załadowanie do f 0x90
    
    btfsc 0x90, 0
    call ON_3
    btfsc 0x90, 1
    call ON_3
    btfsc 0x90, 2
    call ON_3
    btfsc 0x90, 3
    call ON_3
    btfsc 0x90, 4
    call ON_3
    btfsc 0x90, 5
    call ON_3
    btfsc 0x90, 6
    call ON_3
    btfsc 0x90, 7
    call ON_3
    btfsc 0x90, 8
    call ON_3
    
    goto PRZYCISKI_3
    
PRZYCISKI_4
    movlw 0
    btfsc PORTD, 0
    movlw b'00000001'
    btfsc PORTD, 1
    movlw b'00000010'
    btfsc PORTD, 2
    movlw b'00000100'
    btfsc PORTD, 3
    movlw b'00001000'
    btfsc PORTD, 4
    movlw b'00001000'
    btfsc PORTD, 5
    movlw b'00010000'
    btfsc PORTD, 6
    movlw b'00100000'
    btfsc PORTD, 7
    movlw b'0100000'
    btfsc PORTA, 0
    movlw b'10000000'
    
    movwf 0x90 ; załadowanie do f 0x90
    
    btfsc 0x90, 0
    call ON_4
    btfsc 0x90, 1
    call ON_4
    btfsc 0x90, 2
    call ON_4
    btfsc 0x90, 3
    call ON_4
    btfsc 0x90, 4
    call ON_4
    btfsc 0x90, 5
    call ON_4
    btfsc 0x90, 6
    call ON_4
    btfsc 0x90, 7
    call ON_4
    btfsc 0x90, 8
    call ON_4
    
    goto PRZYCISKI_4
    
    
    
ON_1
    call REALEASED_LOOP
    goto SAVE_FST
ON_2
    call REALEASED_LOOP
    goto SAVE_SCD
ON_3
    call REALEASED_LOOP
    goto SAVE_THR
ON_4
    call REALEASED_LOOP
    goto SAVE_FTH

PRZYCISKI_1_LOCK
    movlw 0
    btfsc PORTD, 0
    movlw b'00000001'
    btfsc PORTD, 1
    movlw b'00000010'
    btfsc PORTD, 2
    movlw b'00000100'
    btfsc PORTD, 3
    movlw b'00001000'
    btfsc PORTD, 4
    movlw b'00001000'
    btfsc PORTD, 5
    movlw b'00010000'
    btfsc PORTD, 6
    movlw b'00100000'
    btfsc PORTD, 7
    movlw b'0100000'
    btfsc PORTA, 0
    movlw b'10000000'
    
    movwf 0x90 ; załadowanie do f 0x90
    
    btfsc 0x90, 0
    call ON_1_LOCK
    btfsc 0x90, 1
    call ON_1_LOCK
    btfsc 0x90, 2
    call ON_1_LOCK
    btfsc 0x90, 3
    call ON_1_LOCK
    btfsc 0x90, 4
    call ON_1_LOCK
    btfsc 0x90, 5
    call ON_1_LOCK
    btfsc 0x90, 6
    call ON_1_LOCK
    btfsc 0x90, 7
    call ON_1_LOCK
    btfsc 0x90, 8
    call ON_1_LOCK
    
    goto PRZYCISKI_1_LOCK

PRZYCISKI_2_LOCK
    movlw 0
    btfsc PORTD, 0
    movlw b'00000001'
    btfsc PORTD, 1
    movlw b'00000010'
    btfsc PORTD, 2
    movlw b'00000100'
    btfsc PORTD, 3
    movlw b'00001000'
    btfsc PORTD, 4
    movlw b'00001000'
    btfsc PORTD, 5
    movlw b'00010000'
    btfsc PORTD, 6
    movlw b'00100000'
    btfsc PORTD, 7
    movlw b'0100000'
    btfsc PORTA, 0
    movlw b'10000000'
    
    movwf 0x90 ; załadowanie do f 0x90
    
    btfsc 0x90, 0
    call ON_2_LOCK
    btfsc 0x90, 1
    call ON_2_LOCK
    btfsc 0x90, 2
    call ON_2_LOCK
    btfsc 0x90, 3
    call ON_2_LOCK
    btfsc 0x90, 4
    call ON_2_LOCK
    btfsc 0x90, 5
    call ON_2_LOCK
    btfsc 0x90, 6
    call ON_2_LOCK
    btfsc 0x90, 7
    call ON_2_LOCK
    btfsc 0x90, 8
    call ON_2_LOCK
    
    goto PRZYCISKI_2_LOCK

PRZYCISKI_3_LOCK
    movlw 0
    btfsc PORTD, 0
    movlw b'00000001'
    btfsc PORTD, 1
    movlw b'00000010'
    btfsc PORTD, 2
    movlw b'00000100'
    btfsc PORTD, 3
    movlw b'00001000'
    btfsc PORTD, 4
    movlw b'00001000'
    btfsc PORTD, 5
    movlw b'00010000'
    btfsc PORTD, 6
    movlw b'00100000'
    btfsc PORTD, 7
    movlw b'0100000'
    btfsc PORTA, 0
    movlw b'10000000'
    
    movwf 0x90 ; załadowanie do f 0x90
    
    btfsc 0x90, 0
    call ON_3_LOCK
    btfsc 0x90, 1
    call ON_3_LOCK
    btfsc 0x90, 2
    call ON_3_LOCK
    btfsc 0x90, 3
    call ON_3_LOCK
    btfsc 0x90, 4
    call ON_3_LOCK
    btfsc 0x90, 5
    call ON_3_LOCK
    btfsc 0x90, 6
    call ON_3_LOCK
    btfsc 0x90, 7
    call ON_3_LOCK
    btfsc 0x90, 8
    call ON_3_LOCK
    
    goto PRZYCISKI_3_LOCK
    
PRZYCISKI_4_LOCK
    movlw 0
    btfsc PORTD, 0
    movlw b'00000001'
    btfsc PORTD, 1
    movlw b'00000010'
    btfsc PORTD, 2
    movlw b'00000100'
    btfsc PORTD, 3
    movlw b'00001000'
    btfsc PORTD, 4
    movlw b'00001000'
    btfsc PORTD, 5
    movlw b'00010000'
    btfsc PORTD, 6
    movlw b'00100000'
    btfsc PORTD, 7
    movlw b'0100000'
    btfsc PORTA, 0
    movlw b'10000000'
    
    movwf 0x90 ; załadowanie do f 0x90
    
    btfsc 0x90, 0
    call ON_4_LOCK
    btfsc 0x90, 1
    call ON_4_LOCK
    btfsc 0x90, 2
    call ON_4_LOCK
    btfsc 0x90, 3
    call ON_4_LOCK
    btfsc 0x90, 4
    call ON_4_LOCK
    btfsc 0x90, 5
    call ON_4_LOCK
    btfsc 0x90, 6
    call ON_4_LOCK
    btfsc 0x90, 7
    call ON_4_LOCK
    btfsc 0x90, 8
    call ON_4_LOCK
    
    goto PRZYCISKI_4_LOCK
    
    
    
ON_1_LOCK
    call REALEASED_LOOP
    goto CHECK_FST
ON_2_LOCK
    bsf PORTB, 1
    call REALEASED_LOOP
    goto CHECK_SCD
ON_3_LOCK
    bsf PORTB, 2
    call REALEASED_LOOP
    goto CHECK_THR
ON_4_LOCK
    bsf PORTB, 3
    call REALEASED_LOOP
    goto CHECK_FTH

    END
