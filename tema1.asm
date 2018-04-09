%include "io.inc"

section .data
    %include "input.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    
    mov EAX, [baza]
    mov EBX, [numar]
    
    cmp EAX,   16   ;Verific daca baza introdusa este corecta
    jg Error
    
    cmp EAX,   2   ;Verific daca baza introdusa este corecta
    jl Error
    
    cmp EBX, EAX   ;Verific daca numarul introdus este mai mic decat baza
    jl NrLowerThanBase

    xor edx, edx   ;Golesc edx pentru impartire
    mov eax, dword [numar]   ;Deimpartitul
    mov ebx, dword [baza]   ;Impartitorul
    
    div ebx   ;Impartirea initiala
    
    push EDX   ;Pun restul pe stiva
    mov ECX, 1   ;Initializez ecx cu 1, in ecx voi retine cate push-uri pe stiva fac
   
Cycle:
    
    xor edx, edx   ;Golesc edx pentru impartire
    div ebx   ;Impart
    
    push EDX   ;Pun urmatoarele resturi pe stiva
    inc ECX   ;Incrementez ecx de fiecare data cand se face push
    
    cmp eax, ebx   ;Atata timp cat numarul este mai mare ca baza, continui sa fac bucla
    jge Cycle
    
    push eax   ;Atunci cand se iese din bucla, numarul/catul va fi mai mic ca baza, deci se pune pe stiva
    inc ecx
    
    mov EDX, [baza]   ;Pun baza in edx ca sa aflu daca numarul trebuie reprezentat doar cu cifre (0-9) sau trebuie si litere (a-f)
    cmp EDX, 10 
    jle DecOrLess
    
    cmp EDX, 16
    jle MoreThanDec
    
    jmp END
    
DecOrLess:
    pop EDX   ;Scot primul element din varful stivei (adica restul ultimei impartiri), care va fi prima cifra din rezultat
    PRINT_UDEC 4, EDX   ;Afisez ce e in edx
    loop DecOrLess   ;Fac asta pana ecx este 0 (in ecx initial am retinut cate elemente am pus pe stiva)
    jmp END
    
MoreThanDec:
    pop EDX   ;Scot primul element de pe stiva
    
    cmp EDX, 10   ;Daca este 10, sar la eticheta care afiseaza A
    je A
    
    cmp EDX, 11   ;Daca este 11, sar la eticheta care afiseaza B
    je B
    
    cmp EDX, 12   ;Daca este 12, sar la eticheta care afiseaza C
    je C
    
    cmp EDX, 13   ;Daca este 13, sar la eticheta care afiseaza D
    je D
    
    cmp EDX, 14   ;Daca este 14, sar la eticheta care afiseaza E
    je E
    
    cmp EDX, 15   ;Daca este 15, sar la eticheta care afiseaza F
    je F
    
    PRINT_UDEC 4, EDX   ;Daca este o cifra intre 0-9 o afisez direct
    jmp skip
    
A:
    PRINT_CHAR "a"   ;Printez a
    jmp skip
    
B:
    PRINT_CHAR "b"   ;Printez b
    jmp skip
    
C:
    PRINT_CHAR "c"   ;Printez c
    jmp skip
    
D:
    PRINT_CHAR "d"   ;Printez d
    jmp skip
    
E:
    PRINT_CHAR "e"   ;Printez e
    jmp skip
    
F:
    PRINT_CHAR "f"   ;Printez f
    jmp skip
       
skip:
    dec ECX   ;Decrementez ecx (pentru ca am scos un element de pe stiva)
    jnz MoreThanDec   ;Atata timp cat ecx este diferit de 0, repet bucla
    jmp END

NrLowerThanBase:   ;Cazul in care numarul este mai mic decat baza
    PRINT_UDEC 4, EBX   ;Doar afisez numarul direct
    jmp END

Error:   ;Cazul in care baza este incorecta
    PRINT_STRING "Baza incorecta"   ;Afisez mesajul 
    jmp END

END:   ;Sfarsitul codului. Golesc eax si termin programul
    xor eax, eax
    ret