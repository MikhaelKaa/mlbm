    device ZXSPECTRUM128
    org 40000
port_covox_pent_0xfb    EQU 0x00fb
port_covox_scorp_0xdd   EQU 0x00dd ; для эмулятора Fuse, порт ковокса DD в скорпионе.
port_GS_CMD_0xbb        EQU 0x00bb
port_GS_DAT_0xb3        EQU 0x00b3
GS_CMD_reset_flags      EQU 0x0e
GS_CMD_covox_mode       EQU 0x0e
GS_CMD_cold_restart     EQU 0xf4

    INCLUDE "file_size_auto.asm"

begin:
    di
    ld sp, 39999
    ld a, 0b00000000
    out (0xfe), a

    ; init GS
    ld a, GS_CMD_covox_mode
    ld bc, port_GS_CMD_0xbb
    out (c), a

    ld a, 0
    call page

    ; Загружает картинку.
    ld b, SCREEN_SIZE ; количество секторов
    ld de, (0x5cf4) ; адрес по которому лежит сектор(?) с которого пойдет загрузка.
    ld hl, 0xc000 ; адрес загрузки
    ld c, 0x05
    call 0x3d13

    ld a, 0
    call page

    ld hl, 0xc000
    ld de, 0x4000
    call dzx0_standard


    ;x0000000
    ld a, 0
    call page
    call load

    ;x0000001
    ld a, 1
    call page
    call load

    ;x0000002
    ld a, 3
    call page
    call load

    ;x0000003
    ld a, 4
    call page
    call load

    ;x0000004
    ld a, 6
    call page
    call load

    ;x0000005
    ld a, 7
    call page
    call load



    ;x0000006
    ld a, 0x10
    call page_sc
    ld a, 0x80
    call page
    call load

    ;x0000007
    ld a, 0x10
    call page_sc
    ld a, 0x81
    call page
    call load

    ;x0000008
    ld a, 0x10
    call page_sc
    ld a, 0x83
    call page
    call load

    ;x0000009
    ld a, 0x10
    call page_sc
    ld a, 0x84
    call page
    call load

    ;x0000010
    ld a, 0x10
    call page_sc
    ld a, 0x87
    call page
    ld de, (0x5cf4)
    ld b, LAST_SAMPLE_SIZE
    ld hl, 0xc000
    ld c, 0x05
    call 0x3d13


    di
covox_loop:
    ld a, 0x00
    call page_sc

    ;x0000000
    ld a, 0x00
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop
    ;x0000001
    ld a, 0x01
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop
    ;x0000002
    ld a, 0x03
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop
    ;x0000003
    ld a, 0x04
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop
    ;x0000004
    ld a, 0x06
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop
    ;x0000005
    ld a, 0x07
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop



    ld a, 0x10
    call page_sc
    ;x0000006
    ld a, 0x80
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop

    ;x0000007
    ld a, 0x81
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop
    
    ;x0000008
    ld a, 0x83
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop
    
    ;x0000009
    ld a, 0x84
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop

    ;x0000010
    ld a, 0x87
    call page
    ld de, 10091
    ld hl, 0xc000
    call fb_loop

    jp covox_loop

fb_loop:
    ld bc, 7
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call delay

    ld a, (hl)
    ld bc, port_GS_DAT_0xb3
    out (c), a
    ld bc, port_covox_pent_0xfb
    out (c), a

    inc hl

    dec de
    ld a, d
    or e
    jr nz, fb_loop
    ret

ZX_SP   defs 2

; Процедура задержки
; bc - время
delay:
    dec bc
    ld a, b
    or c
    jr nz, delay
    ret

page:
    or 16
    ld bc, 0x7ffd
    ;ld (23388), a	; если надо либо порт 32765=16 перед выходом в бейсик
    out	(c), a
    ret

page_sc:
    ld bc, 0x1ffd
    out	(c), a
    ret

load:
    ld b, DEFAULT_SIZE
    ld de, (0x5cf4)
    ld hl, 0xc000
    ld c, 0x05
    call 0x3d13
    ret

    INCLUDE "dzx0_standard.asm"

end:
    ; Выводим размер банарника.
    display "covox code size: ", /d, end - begin
    SAVEBIN "build/covox.bin", begin, end - begin
    ;SAVESNA "build/covox.sna", begin
