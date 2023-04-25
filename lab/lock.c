/*
 * File:   newmain.c
 * Author: sztef
 *
 * Created on 24 April 2023, 22:13
 */

#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include <stdio.h>
__bit led = 0x05.0 __bit TRIS_led = 0x85.0 __data lcd = 0x06 __data TRIS_lcd = 0x86 __bit rs = 0x07.0 __bit TRIS_rs = 0x87.0 __bit en = 0x07.1 __bit TRIS_en = 0x87.1 __bit relay = 0x07.2 __bit TRIS_relay = 0x87.2 __bit C1 = 0x08.0 __bit C2 = 0x08.1 __bit C3 = 0x08.2 __bit R1 = 0x08.3 __bit R2 = 0x08.4 __bit R3 = 0x08.5 __bit R4 = 0x08.6 __bit TRIS_C1 = 0x88.0 __bit TRIS_C2 = 0x88.1 __bit TRIS_C3 = 0x88.2 __bit TRIS_R1 = 0x88.3 __bit TRIS_R2 = 0x88.4 __bit TRIS_R3 = 0x88.5 __bit TRIS_R4 = 0x88.6

void display(unsigned char a, int b); // LCD subroutine
char keypad();                       // Keypad Subroutine
void check();                        // Password check routine
char password[5] = {“7196”};         // Predefined password
char pswd[5];
unsigned char open_msg[15] =“Enter Password”;
unsigned char welcome_msg[8] =“Welcome”;
unsigned char close_msg[15] =“Wrong Password”;
char c;
int flag, i, count, j;
void main()
{
    TRIS_lcd = TRIS_en = TRIS_rs = TRIS_led = TRIS_relay = 0; // Directions set
    TRIS_R1 = TRIS_R2 = TRIS_R3 = TRIS_R4 = count = 0;
    TRIS_C1 = TRIS_C2 = TRIS_C3 = 1;
    while (TRUE)
    {
        c = keypad();
        {
            if (c ==‘*’) // Initialize condition
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
            else if (c ==‘#’) // Turning off condition
            {
                count = 0;
                relay = 0;
                display(0x01, 0);
                display(0x0c, 0);
            }
            else
            {
                display(‘*’, 1);
                pswd[count] = c; // Storing input in new arrays
                count = count + 1;
                check();
            }
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
char keypad()
{
    if (flag == 0) // Waiting for Initialization
    {
        while (TRUE)
        {
            R4 = 1;
            R1 = R2 = R3 = 0;
            if (C1 == 1)
            {
                while (C1 == 1)
                    ;
                count = 0;
                return "*";
            }
            if (C3 == 1)
            {
                while (C3 == 1)
                    ;
                count = 0;
                return "#";
            }
        }
    }
    else if (flag == 1)
    {
        while (TRUE) // Keypad scan
        {
            R1 = 1;
            R2 = R3 = R4 = 0;
            if (C1 == 1)
            {
                while (C1 == 1)
                    ;
                return "1";
            }
            if (C2 == 1)
            {
                while (C2 == 1)
                    ;
                return "2";
            }
            if (C3 == 1)
            {
                while (C3 == 1)
                    ;
                return "3";
            }
            R2 = 1;
            R1 = R3 = R4 = 0;
            if (C1 == 1)
            {
                while (C1 == 1)
                    ;
                return "4";
            }
            if (C2 == 1)
            {
                while (C2 == 1)
                    ;
                return "5";
            }
            if (C3 == 1)
            {
                while (C3 == 1)
                    ;
                return "6";
            }
            R3 = 1;
            R1 = R2 = R4 = 0;
            if (C1 == 1)
            {
                while (C1 == 1)
                    ;
                return "7";
            }
            if (C2 == 1)
            {
                while (C2 == 1)
                    ;
                return "8";
            }
            if (C3 == 1)
            {
                while (C3 == 1)
                    ;
                return "9";
            }
            R4 = 1;
            R1 = R2 = R3 = 0;
            if (C1 == 1)
            {
                while (C1 == 1)
                    ;
                return "*";
            }
            if (C2 == 1)
            {
                while (C2 == 1)
                    ;
                return "0";
            }
            if (C3 == 1)
            {
                while (C3 == 1)
                    ;
                return "#";
            }
        }
    }
}
void check()
{
    if (count > 3) // Input exceeds count 3 will execute comparison
    {
        flag = count = 0;
        j = strcmp(pswd, password); // Comparison of input and Predefined pswd
        if (j == 0)
        {
            relay = 1; // Turning relay on
            display(0x01, 0);
            display(0x80, 0);
            for (i = 0; i <= 6; i++)
            {
                display(welcome_msg[i], 1);
            }
        }
        else
        {
            relay = 0;
            display(0x01, 0);
            display(0x80, 0);

            for (i = 0; i <= 13; i++)
            {
                display(close_msg[i], 1);
            }
        }
    }
}
