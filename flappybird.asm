.model small
.stack 100h
.data
    bird_char db '@'
    bird_x db 10          ; fixed x position (column)
    bird_y db 12          ; initial y position (row)

.code
start:
    mov ax, @data
    mov ds, ax

    ; Initialize screen (optional: clear screen)
    mov ah, 0
    mov al, 3     ; 80x25 text mode
    int 10h

main_loop:
    ; erase old bird position (print space)
    mov ah, 2       ; set cursor pos
    mov dh, [bird_y]
    mov dl, [bird_x]
    int 10h

    mov ah, 9       ; print character
    mov al, ' '
    mov bh, 0
    mov bl, 7       ; white color
    mov cx, 1
    int 10h

    ; Gravity: bird_y = bird_y + 1 (down)
    mov al, [bird_y]
    inc al
    cmp al, 24      ; don't go below bottom of screen
    jg skip_gravity
    mov [bird_y], al
skip_gravity:

    ; Check keyboard - spacebar to jump
    mov ah, 1       ; check for keypress
    int 16h
    jz skip_jump

    ; Read key
    mov ah, 0
    int 16h
    cmp al, ' '     ; spacebar?
    jne skip_jump

    ; Jump (bird_y = bird_y - 3)
    mov al, [bird_y]
    sub al, 3
    cmp al, 0
    jl set_top
    mov [bird_y], al
    jmp skip_jump
set_top:
    mov [bird_y], 1
skip_jump:

    ; Draw bird at new position
    mov ah, 2       ; set cursor pos
    mov dh, [bird_y]
    mov dl, [bird_x]
    int 10h

    mov ah, 9       ; print bird char
    mov al, [bird_char]
    mov bh, 0
    mov bl, 14      ; yellow color
    mov cx, 1
    int 10h

    ; Delay loop (~rough frame delay)
    mov cx, 0FFFFh
delay:
    loop delay

    jmp main_loop

end start
