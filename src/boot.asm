bits 32

section .multiboot
    align 4
    dd 0x1BADB002        ; Magic number dla multiboot
    dd 0x00              ; Parametry flagi
    dd -(0x1BADB002 + 0x00)

section .text
    global _start
    extern print_string, delay

_start:
    cli                 ; Wyłącza przerwania
    ; Wyświetl tekst "Ładowanie..."
    mov edx, message
    call print_string
    call delay          ; Opóźnienie (dla efektu animacji)

    ; Główna funkcjonalność systemu
    call main           ; Wywołanie funkcji main

    hlt                 ; Zatrzymanie procesora

; Funkcja wyświetlająca tekst na ekranie (przykład)
print_string:
    ; Zakładamy, że w edx jest adres tekstu do wyświetlenia
    ; Tu można dodać funkcję rysowania tekstu na ekranie
    ret

message db "Ładowanie...", 0