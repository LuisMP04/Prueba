%include "pc_iox.inc"

section .text
  global _start:

section .data
  Pedir: db "Ingrese la cantidad de pisos: ",10,0

_start:
  mov edx, Pedir
  call puts
  call getche

  mov cx, ax
  sub cx, 48		;En este caso, como el usuario ingresa mediante un caracter (ascii), se le resta 48 al valor del caracter
  call asteriscos	;No es necesario hacer esto si unicamente le movemos, por ejemplo, un 10 a CX, pues ahi le estariamos pasando un valor directo

  ;Finalizar programa
  mov eax, 1
  mov ebx, 0
  int 80h

  asteriscos:
    push cx
    push ax
    push dx

    mov dx, cx

    impri_asteris:
      mov dx, cx
      ;Empieza a imprimir los asteriscos
      pisos:
        mov al, '*'
        call putchar
        dec dx
        cmp dx,0
        je enter     ;Si dx = 0, imprime el salto de linea
        jmp pisos
      enter:
        mov al,10
        call putchar

    loop impri_asteris

    pop dx
    pop ax
    pop cx
    ret