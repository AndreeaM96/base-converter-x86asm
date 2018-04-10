Mai intai verific daca datele introduse necesita intrarea in bucla sau nu:
- Daca baza introdusa este gresita, afisez mesajul aferent.
- Daca numarul dat este mai mic decat baza, afisez direct numarul, deoarece nu va necesita impartiri
- Daca se trece de conditiile de mai sus, numarul necesita intrarea in bucla

Fac, initial, o impartire in afara buclei pentru a putea pune datele in registrele care trebuie.
Dupa aceasta impartire, pun pe stiva restul obtinut si initializez ecx cu 1
In registru ecx voi retine cate elemente am adaugat pe stiva pentru a le putea scoate mai usor dupa aceea.

Apoi intru in bucla. Nu va mai fi nevoie de edx, deci il golesc pentru a nu afecta impartirea, iar de acum incolo eax va contine numarul care trebuie impartit.
Continui sa impart si sa pun resturile pe stiva si sa incrementez ecx pana cand numarul (retinut mereu in eax) devine mai mic decat baza (retinuta in ebx).
In momentul in care iesim din bucla, numarul din eax va fi mai mic decat baza, deci il adaug direct pe stiva si incrementez ecx.

Pun baza in edx si il compar, pe rand cu 10 si 16 pentru a afla in ce mod o sa reprezint rezultatul final, 
adica daca e nevoie sa fie reprezentat si cu litere (a-f), sau e nevoie doar de cifre (0-9).
Sar la eticheta aferenta pentru fiecare din cele doua cazuri.

In cazul in care edx este mai mic sau egal cu 10, atunci este nevoie sa printez doar cifre, deci voi scoate de pe stiva resturile si le voi printa direct.

In celalalt caz, compar pe edx (valoarea scoasa de pe stiva) cu fiecare din numerele de la 10-15 si sar la etichete aferente, care vor printa litera corespunzatoare valorii.
Daca valoarea scoasa de pe stiva este mai mica decat 10, atunci se printeaza direct.
Saritura la eticheta skip doar finalizeaza bucla si este folosita ca etichetele care printeaza litere sa nu printeze mai multe valori deodata. Am folosit decrementarea lui ecx imprenua cu jnz deoarece
nu am putut folosi instructiunea loop pentru ca trebuia sa sara prea mult inapoi si dadea eroare si nu mergea, oricum functonalitatea este aceasi.

Apoi urmeaza cele doua etichete la care se sare in cazul in care datele introduse nu necesita bucla.

La eticheta END se sare cand numarul a fost printat complet si aceasta termina programul.