    device ZXSPECTRUM128
    org 40000
port_covox_f    EQU 0x00fb

begin:
    di
    ld sp, 39999
    ld a, 0b00000000
    out (0xfe), a

    ; Загружает картинку.
    ld b, 27
    ld de, (0x5cf4);0x0101
    ld hl, 0x4000
    ld c, 0x05
    call 0x3d13
    di

    ;x0000000
    ld a, 0
    call page
    ;ld de, (0x5cf4);0x020c
    call load
    ;x0000001
    ld a, 1
    call page
    ;ld de, (0x5cf4);0x060c
    call load
    ;x0000002
    ld a, 3
    call page
    ;ld de, (0x5cf4);0x0a0c
    call load
    ;x0000003
    ld a, 4
    call page
    ;ld de, (0x5cf4);0x0e0c
    call load
    ;x0000004
    ld a, 6
    call page
    ;ld de, (0x5cf4);0x120c
    call load
    ;x0000005
    ld a, 7
    call page
    ;ld de, (0x5cf4);0x160c
    call load



    ;x0000006
    ld a, 0
    or 0b1000000
    call page
    ;ld de, (0x5cf4);0x1a0c
    call load
    ;x0000007
    ld a, 1
    or 0b1000000
    call page
    ;ld de, (0x5cf4);0x1e0c
    call load
    ;x0000008
    ld a, 3
    or 0b1000000
    call page
    ;ld de, (0x5cf4);0x220c
    call load
    ;x0000009
    ld a, 4
    or 0b1000000
    call page
    ;ld de, (0x5cf4);0x260c
    call load
    ;x0000010
    ld a, 6
    or 0b1000000
    call page
    ld de, (0x5cf4);0x2a0c
    ld b, 40
    ld hl, 0xc000
    ld c, 0x05
    call 0x3d13
    di


covox_loop:
    ;x0000000
    ld a, 0
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop
    ;x0000001
    ld a, 1
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop
    ;x0000002
    ld a, 3
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop
    ;x0000003
    ld a, 4
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop
    ;x0000004
    ld a, 6
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop
    ;x0000005
    ld a, 7
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop



    ;x0000006
    ld a, 0
    or 0b1000000
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop
    ;x0000007
    ld a, 1
    or 0b1000000
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop
    ;x0000008
    ld a, 3
    or 0b1000000
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop
    ;x0000009
    ld a, 4
    or 0b1000000
    call page
    ld de, 0x4000
    ld hl, 0xc000
    call fb_loop

    ;x0000010
    ld a, 6
    or 0b1000000
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
    nop
    nop
    nop
    call delay

    ld a, (hl)
    ;     ld bc, port_gs_dat_f
    ld bc, port_covox_f
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
    ld (23388), a	; если надо либо порт 32765=16 перед выходом в бейсик
    out	(c), a
    ret

load:
    ld b, 64
    ld de, (0x5cf4)
    ld hl, 0xc000
    ld c, 0x05
    call 0x3d13
    di
    ret

end:
    ; Выводим размер банарника.
    display "covox code size: ", /d, end - begin
    SAVEBIN "build/covox.bin", begin, end - begin
    ;SAVESNA "build/covox.sna", begin




; LINEAD          EQU 0x196e
; TR_DOS          EQU 15619
; CH_ADD          EQU 23645
; CHANS           EQU 23631
; ERR_SP          EQU 23613
; ERR_DOS         EQU 23823

; REM         EQU 234
; CAT         EQU 207
; ERASE       EQU 210
; LOAD        EQU 239
; SAVE        EQU 248
; CODE        EQU 175
; ENTER       EQU 13




    ; ;store basic regs
    ; exx
    ; push hl
    ; ld (ZX_SP), sp
    ; ld hl, (ERR_SP)
    ; ld (ZX_ERR), hl
    ; ;ld hl, DISKERR
    ; push hl
    ; ld (ERR_SP), sp
    ; ld hl, quit
    ; ld (AD_RET), hl
    ; ld hl, (CH_ADD)
    ; ld (ZX_CH), hl

    ; ld hl, loadscr
    ; ld bc, loadscr_end-loadscr
    ; call execute
; quit:
;     ld hl, (ZX_CH)
;     ld (CH_ADD), hl
;     ;ld bc, (ZX_PR)
;     ;call CHANAL
;     ld hl, (ZX_ERR)
;     ld (ERR_SP), hl
;     ld sp, (ZX_SP)
;     ld (iy), -1
;     pop hl
;     exx
;     ret

; execute:
;     push bc
;     push hl
;     ld hl, 9999
;     call LINEAD
;     ld bc, 4
;     add hl, bc
;     ld (CH_ADD), hl
;     ex de, hl
;     pop hl
;     pop bc
;     ldir
;     call TR_DOS
;     ld a, (ERR_DOS)
;     ret

; loadscr:
;     DEFM ':LOAD "mlbmscr0.C" CODE 16384,6912'
; loadscr_end:

; ZX_SP   DEFS    2
; ZX_ERR  DEFS    2
; ZX_CH   DEFS    2
; AD_RET  DEFS    2
; ZX_PR   DEFS    2
; AD_CON  DEFS    2
    
; FILEDESC  DEFS    16