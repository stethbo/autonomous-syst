#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include <string.h>

#pragma config FOSC = HS        // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
#pragma config BOREN = ON       // Brown-out Reset Enable bit (BOR enabled)
#pragma config LVP = OFF        // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital I/O, HV on MCLR must be used for programming)
#pragma config CPD = OFF        // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
#pragma config WRT = OFF        // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
#pragma config CP = OFF         // Flash Program Memory Code Protection bit (Code protection off)

__bit led = 0x05.0;
__bit TRIS_led = 0x85.0;
__data lcd = 0x06;
__data TRIS_lcd = 0x86;
__bit rs = 0x07.0;
__bit TRIS_rs = 0x87.0;
__bit en = 0x07.1;
__bit TRIS_en = 0x87.1;
__bit relay = 0x07.2;
__bit TRIS_relay = 0x87.2;
__bit C1 = 0x08.0;
__bit C2 = 0x08.1;
__bit C3 = 0x08.2;
__bit R1 = 0x08.3;
__bit R2 = 0x08.4;
__bit R3 = 0x08.5;
__bit R4 = 0x08.6;
__bit TRIS_C1 = 0x88.0;
__bit TRIS_C2 = 0x88.1;
__bit TRIS_C3 = 0x88.2;
__bit TRIS_R1 = 0x88.3;
__bit TRIS_R2 = 0x88.4;
__bit TRIS_R3 = 0x88.5;
__bit TRIS_R4 = 0x88.6;

void display(unsigned char a, int b);
char keypad();
void check();
char password[5] = "7196";    // Predefined password
char pswd[5];
unsigned char open_msg[15] = "Enter Password";
unsigned char welcome_msg[8] = "Welcome";
unsigned char close_msg[15] = "Wrong Password";
char c;
int flag, i, count, j;

void main()
{
    TRIS_lcd = TRIS_en = TRIS_rs = TRIS_led = TRIS_relay = 0; // Directions set
    TRIS_R1 = TRIS_R2 = TRIS_R3 = TRIS_R4 = count = 0;
    TRIS_C1 = TRIS_C2 = TRIS_C3 = 1;

    while (1)
    {
        c = keypad();

        if (c == '*') // Initialize condition
        {
            flag = 1; // Flag set to scan other keys
            count = 0;
            display(0x01, 0);
            display(0x38, 0);
            display(0x0f, 0);
            display(0x01,0);
            display(0x80,0);
            for(i=0;i<=7;i++)
            {
            display(welcome_msg[i],1); //Display welcome message
            }
            __delay_ms(1000); //Delay for 1 sec
            display(0x01,0); //Clear the display
            }
            else
            {
            display(0x01,0); //Clear the display
            for(i=0;i<=13;i++)
            {
            display(close_msg[i],1); //Display Wrong password message
            }
            __delay_ms(1000); //Delay for 1 sec
            display(0x01,0); //Clear the display
            }
            for(i=0;i<=4;i++)
            {
            pswd[i]=0; //Resetting the input array
            }
            }
            }

void main()
{
    int i;
    char c;
    unsigned char count = 0;
    unsigned char flag = 0;
    
    TRIS_lcd = TRIS_en = TRIS_rs = TRIS_led = TRIS_relay = 0; // Directions set
    TRIS_R1 = TRIS_R2 = TRIS_R3 = TRIS_R4 = count = 0;
    TRIS_C1 = TRIS_C2 = TRIS_C3 = 1;
    
    while (1)
    {
        c = keypad();
        
        if (c == '*') // Initialize condition
        {
            flag = 1; // Flag set to scan other keys
            count = 0;
            display(0x01, 0);
            display(0x38, 0);
            display(0x0f, 0);
            display(0x80, 0);
            
            for (i = 0; i <= 13; i++)
            {
                display(open_msg[i], 1);
            }
            display(0xc0, 0);
        }
        else if (c == '#') // Turning off condition
        {
            count = 0;
            relay = 0;
            display(0x01, 0);
            display(0x0c, 0);
        }
        else
        {
            display('*', 1);
            pswd[count] = c; // Storing input in new arrays
            count++;
            check();
        }
    }
}

void display(unsigned char a, int b)
{
    lcd = a;
    rs = b;
    en = 1;
    __delay_ms(10);
    en = 0;
    __delay_ms(10);
}
