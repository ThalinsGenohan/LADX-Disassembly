; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

func_036_496E::
    ldh  a, [hFrameCounter]                       ; $496E: $F0 $E7
    and  $0F                                      ; $4970: $E6 $0F
    ret  nz                                       ; $4972: $C0

    call PointHLToEntitySpriteVariant             ; $4973: $CD $02 $6C
    ld   a, [hl]                                  ; $4976: $7E
    xor  $01                                      ; $4977: $EE $01
    ld   [hl], a                                  ; $4979: $77
    ret                                           ; $497A: $C9

func_036_497B::
    call func_036_496E                            ; $497B: $CD $6E $49
    ld   hl, wEntitiesPrivateState1Table          ; $497E: $21 $B0 $C2
    add  hl, bc                                   ; $4981: $09
    ld   a, [hl]                                  ; $4982: $7E
    and  a                                        ; $4983: $A7
    call PointHLToEntitySpeedX                    ; $4984: $CD $EE $6B
    ld   e, $E8                                   ; $4987: $1E $E8
    and  a                                        ; $4989: $A7
    jr   z, .jr_498E                              ; $498A: $28 $02

    ld   e, $18                                   ; $498C: $1E $18

.jr_498E
    ld   [hl], e                                  ; $498E: $73
    jp   IncrementEntityState                     ; $498F: $C3 $12 $3B

func_036_4992::
    call func_036_496E                            ; $4992: $CD $6E $49
    call PointHLToEntitySpeedX                    ; $4995: $CD $EE $6B
    ld   a, [hl]                                  ; $4998: $7E
    bit  7, a                                     ; $4999: $CB $7F
    jr   z, .jr_49A0                              ; $499B: $28 $03

    inc  a                                        ; $499D: $3C
    jr   jr_036_49A1                              ; $499E: $18 $01

.jr_49A0
    dec  a                                        ; $49A0: $3D

jr_036_49A1:
    ld   [hl], a                                  ; $49A1: $77
    and  a                                        ; $49A2: $A7
    jr   nz, .jr_49AD                             ; $49A3: $20 $08

    call GetEntityTransitionCountdown             ; $49A5: $CD $05 $0C
    ld   [hl], $38                                ; $49A8: $36 $38
    jp   IncrementEntityState                     ; $49AA: $C3 $12 $3B

.jr_49AD
    push af                                       ; $49AD: $F5
    swap a                                        ; $49AE: $CB $37
    and  $F0                                      ; $49B0: $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ; $49B2: $21 $60 $C2
    add  [hl]                                     ; $49B5: $86
    ld   [hl], a                                  ; $49B6: $77
    rl   d                                        ; $49B7: $CB $12
    ld   hl, wEntitiesPosXTable                   ; $49B9: $21 $00 $C2
    add  hl, bc                                   ; $49BC: $09
    pop  af                                       ; $49BD: $F1
    ld   e, $00                                   ; $49BE: $1E $00
    bit  7, a                                     ; $49C0: $CB $7F
    jr   z, .jr_49C6                              ; $49C2: $28 $02

    ld   e, $F0                                   ; $49C4: $1E $F0

.jr_49C6
    swap a                                        ; $49C6: $CB $37
    and  $0F                                      ; $49C8: $E6 $0F
    or   e                                        ; $49CA: $B3
    rr   d                                        ; $49CB: $CB $1A
    adc  [hl]                                     ; $49CD: $8E
    ld   [hl], a                                  ; $49CE: $77
    ret                                           ; $49CF: $C9

func_036_49D0::
    call func_036_496E                            ; $49D0: $CD $6E $49
    call GetEntityTransitionCountdown             ; $49D3: $CD $05 $0C
    ret  nz                                       ; $49D6: $C0

    jp   IncrementEntityState                     ; $49D7: $C3 $12 $3B

func_036_49DA::
    ld   hl, wEntitiesPrivateState1Table          ; $49DA: $21 $B0 $C2
    add  hl, bc                                   ; $49DD: $09
    ld   a, [hl]                                  ; $49DE: $7E
    and  a                                        ; $49DF: $A7
    xor  $01                                      ; $49E0: $EE $01
    ld   [hl], a                                  ; $49E2: $77
    call PointHLToEntitySpriteVariant             ; $49E3: $CD $02 $6C
    ld   a, [hl]                                  ; $49E6: $7E
    xor  $02                                      ; $49E7: $EE $02
    ld   [hl], a                                  ; $49E9: $77
    call IncrementEntityState                     ; $49EA: $CD $12 $3B
    xor  a                                        ; $49ED: $AF
    ld   [hl], a                                  ; $49EE: $77
    call GetEntityTransitionCountdown             ; $49EF: $CD $05 $0C
    ld   a, $20                                   ; $49F2: $3E $20
    ld   [hl], a                                  ; $49F4: $77
    ret                                           ; $49F5: $C9

func_036_49F6::
    call PointHLToEntitySpriteVariant             ; $49F6: $CD $02 $6C
    ld   [hl], $04                                ; $49F9: $36 $04
    ret                                           ; $49FB: $C9

TailCaveHints::
    db_dialog_low Dialog280
    db_dialog_low Dialog280
    db_dialog_low Dialog288

BottleGrottoHints::
    db_dialog_low Dialog281
    db_dialog_low Dialog28A
    db_dialog_low Dialog289

KeyCavernHints::
    db_dialog_low Dialog282
    db_dialog_low Dialog28B
    db_dialog_low Dialog28C

AnglersTunnelHints::
    db_dialog_low Dialog283
    db_dialog_low Dialog200
    db_dialog_low Dialog200

CatfishsMawHints::
    db_dialog_low Dialog284
    db_dialog_low Dialog28D
    db_dialog_low Dialog200

FaceShrineHints::
    db_dialog_low Dialog285
    db_dialog_low Dialog28E
    db_dialog_low Dialog28F

EaglesTowerHints::
    db_dialog_low Dialog286
    db_dialog_low Dialog290
    db_dialog_low Dialog291

TurtleRockHints::
    db_dialog_low Dialog287
    db_dialog_low Dialog292
    db_dialog_low Dialog293

; Indexed by hMapId
Data_036_4A14::
._0 dw TailCaveHints
._1 dw BottleGrottoHints
._2 dw KeyCavernHints
._3 dw AnglersTunnelHints
._4 dw CatfishsMawHints
._5 dw FaceShrineHints
._6 dw EaglesTowerHints
._7 dw TurtleRockHints

Data_036_4A24::
    db   UNKNOWN_ROOM_03, UNKNOWN_ROOM_0A, UNKNOWN_ROOM_04

Data_036_4A27::
    db   UNKNOWN_ROOM_29, UNKNOWN_ROOM_33, UNKNOWN_ROOM_2F

Data_036_4A2A::
    db   UNKNOWN_ROOM_54, UNKNOWN_ROOM_40, UNKNOWN_ROOM_47

Data_036_4A2D::
    db   UNKNOWN_ROOM_6F, UNKNOWN_ROOM_00, UNKNOWN_ROOM_00

Data_036_4A30::
    db   UNKNOWN_ROOM_8A, UNKNOWN_ROOM_9A, UNKNOWN_ROOM_00

Data_036_4A33::
    db   UNKNOWN_ROOM_BB, UNKNOWN_ROOM_B6, UNKNOWN_ROOM_D7

Data_036_4A36::
    db   UNKNOWN_ROOM_16, UNKNOWN_ROOM_1C, UNKNOWN_ROOM_04

Data_036_4A39::
    db   UNKNOWN_ROOM_53, UNKNOWN_ROOM_45, UNKNOWN_ROOM_41

Data_036_4A3C::
    dw   Data_036_4A24
    dw   Data_036_4A27
    dw   Data_036_4A2A
    dw   Data_036_4A2D
    dw   Data_036_4A30
    dw   Data_036_4A33
    dw   Data_036_4A36
    dw   Data_036_4A39

; Returns a dialog id for an owl statue hint, depending on the
; current map and room.
;
; Returns:
;   hMultiPurpose0   the lower part of the dialog id
GetOwlStatueDialogId::
    push bc                                       ; $4A4C: $C5
    ld   hl, Data_036_4A3C                        ; $4A4D: $21 $3C $4A
    ldh  a, [hMapId]                              ; $4A50: $F0 $F7
    sla  a                                        ; $4A52: $CB $27
    ld   e, a                                     ; $4A54: $5F
    ld   d, $00                                   ; $4A55: $16 $00
    ld   c, d                                     ; $4A57: $4A
    ld   b, d                                     ; $4A58: $42
    add  hl, de                                   ; $4A59: $19
    ld   a, [hl+]                                 ; $4A5A: $2A
    ld   h, [hl]                                  ; $4A5B: $66
    ld   l, a                                     ; $4A5C: $6F
    dec  hl                                       ; $4A5D: $2B

.loop_4A5E
    inc  hl                                       ; $4A5E: $23
    ldh  a, [hMapRoom]                            ; $4A5F: $F0 $F6
    cp   [hl]                                     ; $4A61: $BE
    jr   z, .jr_4A6A                              ; $4A62: $28 $06

    inc  c                                        ; $4A64: $0C
    ld   a, c                                     ; $4A65: $79
    cp   $03                                      ; $4A66: $FE $03
    jr   nz, .loop_4A5E                           ; $4A68: $20 $F4

.jr_4A6A
    ld   hl, Data_036_4A14                        ; $4A6A: $21 $14 $4A
    add  hl, de                                   ; $4A6D: $19
    ld   a, [hl+]                                 ; $4A6E: $2A
    ld   h, [hl]                                  ; $4A6F: $66
    ld   l, a                                     ; $4A70: $6F
    add  hl, bc                                   ; $4A71: $09
    ld   a, [hl]                                  ; $4A72: $7E
    ldh  [hMultiPurpose0], a                      ; $4A73: $E0 $D7
    pop  bc                                       ; $4A75: $C1
    ret                                           ; $4A76: $C9

func_036_4A77::
    ld   a, $02                                   ; $4A77: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4A79: $E0 $A1
    ld   [wC167], a                               ; $4A7B: $EA $67 $C1
    ldh  a, [hActiveEntityState]                  ; $4A7E: $F0 $F0
    JP_TABLE                                      ; $4A80
._00 dw func_036_4A9F                             ; $4A81
._01 dw func_036_4AD9                             ; $4A83
._02 dw func_036_4AF3                             ; $4A85
._03 dw func_036_4B0C                             ; $4A87
._04 dw func_036_4B26                             ; $4A89
._05 dw func_036_4B3B                             ; $4A8B
._06 dw func_036_4B57                             ; $4A8D
._07 dw func_036_4B8F                             ; $4A8F
._08 dw func_036_4BAC                             ; $4A91
._09 dw func_036_4BC3                             ; $4A93
._0A dw func_036_4BCF                             ; $4A95

Data_036_4A97::
    db   $FF, $7F, $00, $00, $71, $44, $7F, $7D

func_036_4A9F::
    push bc                                       ; $4A9F: $C5
    call LCDOff                                   ; $4AA0: $CD $CF $28
    ld   a, $38                                   ; $4AA3: $3E $38
    ld   b, $40                                   ; $4AA5: $06 $40
    ld   c, $06                                   ; $4AA7: $0E $06
    ld   h, $36                                   ; $4AA9: $26 $36
    call CopyDataToVRAM                           ; $4AAB: $CD $13 $0A
    ld   a, $38                                   ; $4AAE: $3E $38
    ld   b, $41                                   ; $4AB0: $06 $41
    ld   c, $07                                   ; $4AB2: $0E $07
    ld   h, $36                                   ; $4AB4: $26 $36
    call CopyDataToVRAM                           ; $4AB6: $CD $13 $0A
    ld   a, [wLCDControl]                         ; $4AB9: $FA $FD $D6
    ldh  [rLCDC], a                               ; $4ABC: $E0 $40
    di                                            ; $4ABE: $F3
    ld   a, $02                                   ; $4ABF: $3E $02
    ldh  [rSVBK], a                               ; $4AC1: $E0 $70
    ld   de, Data_036_4A97                        ; $4AC3: $11 $97 $4A
    ld   hl, wObjPal7                             ; $4AC6: $21 $80 $DC

.loop_4AC9
    ld   a, [de]                                  ; $4AC9: $1A
    ld   [hl+], a                                 ; $4ACA: $22
    inc  de                                       ; $4ACB: $13
    ld   a, l                                     ; $4ACC: $7D
    and  $07                                      ; $4ACD: $E6 $07
    jr   nz, .loop_4AC9                           ; $4ACF: $20 $F8

    xor  a                                        ; $4AD1: $AF
    ldh  [rSVBK], a                               ; $4AD2: $E0 $70
    ei                                            ; $4AD4: $FB
    pop  bc                                       ; $4AD5: $C1
    jp   IncrementEntityState                     ; $4AD6: $C3 $12 $3B

func_036_4AD9::
    ld   a, [wTransitionSequenceCounter]          ; $4AD9: $FA $6B $C1
    cp   $04                                      ; $4ADC: $FE $04
    ret  nz                                       ; $4ADE: $C0

    call GetEntityTransitionCountdown             ; $4ADF: $CD $05 $0C
    ld   [hl], $10                                ; $4AE2: $36 $10
    jp   IncrementEntityState                     ; $4AE4: $C3 $12 $3B

func_036_4AE7::
    ldh  a, [hFrameCounter]                       ; $4AE7: $F0 $E7
    and  $07                                      ; $4AE9: $E6 $07
    ret  nz                                       ; $4AEB: $C0

    ldh  a, [hLinkAnimationState]                 ; $4AEC: $F0 $9D
    xor  $01                                      ; $4AEE: $EE $01
    ldh  [hLinkAnimationState], a                 ; $4AF0: $E0 $9D
    ret                                           ; $4AF2: $C9

func_036_4AF3::
    call GetEntityTransitionCountdown             ; $4AF3: $CD $05 $0C
    ret  nz                                       ; $4AF6: $C0

    call func_036_4AE7                            ; $4AF7: $CD $E7 $4A
    ld   hl, hLinkPositionY                       ; $4AFA: $21 $99 $FF
    dec  [hl]                                     ; $4AFD: $35
    ld   a, [hl]                                  ; $4AFE: $7E
    cp   $42                                      ; $4AFF: $FE $42
    ret  nc                                       ; $4B01: $D0

    ld   a, $42                                   ; $4B02: $3E $42
    ld   [hl], a                                  ; $4B04: $77
    ld   a, LINK_ANIMATION_STATE_STANDING_RIGHT   ; $4B05: $3E $0A
    ldh  [hLinkAnimationState], a                 ; $4B07: $E0 $9D
    jp   IncrementEntityState                     ; $4B09: $C3 $12 $3B

func_036_4B0C::
    call func_036_4AE7                            ; $4B0C: $CD $E7 $4A
    ld   hl, hLinkPositionX                       ; $4B0F: $21 $98 $FF
    inc  [hl]                                     ; $4B12: $34
    ld   a, [hl]                                  ; $4B13: $7E
    cp   $78                                      ; $4B14: $FE $78
    ret  c                                        ; $4B16: $D8

    ld   a, $78                                   ; $4B17: $3E $78
    ld   [hl], a                                  ; $4B19: $77
    ld   a, LINK_ANIMATION_STATE_STANDING_UP      ; $4B1A: $3E $04
    ldh  [hLinkAnimationState], a                 ; $4B1C: $E0 $9D
    call GetEntityTransitionCountdown             ; $4B1E: $CD $05 $0C
    ld   [hl], $60                                ; $4B21: $36 $60
    jp   IncrementEntityState                     ; $4B23: $C3 $12 $3B

func_036_4B26::
    call func_036_4AE7                            ; $4B26: $CD $E7 $4A
    ld   hl, hLinkPositionY                       ; $4B29: $21 $99 $FF
    dec  [hl]                                     ; $4B2C: $35
    ld   a, [hl]                                  ; $4B2D: $7E
    cp   $2C                                      ; $4B2E: $FE $2C
    ret  nc                                       ; $4B30: $D0

    ld   a, $2C                                   ; $4B31: $3E $2C
    ld   [hl], a                                  ; $4B33: $77
    ld   a, LINK_ANIMATION_STATE_STANDING_UP      ; $4B34: $3E $04
    ldh  [hLinkAnimationState], a                 ; $4B36: $E0 $9D
    jp   IncrementEntityState                     ; $4B38: $C3 $12 $3B

func_036_4B3B::
    call GetEntityTransitionCountdown             ; $4B3B: $CD $05 $0C
    jr   nz, .jr_4B4D                             ; $4B3E: $20 $0D

    call IncrementEntityState                     ; $4B40: $CD $12 $3B
    call_open_dialog Dialog1EF                    ; $4B43
    ld   a, $03                                   ; $4B48: $3E $03
    jp   SetEntitySpriteVariant                   ; $4B4A: $C3 $0C $3B

.jr_4B4D
    and  $04                                      ; $4B4D: $E6 $04
    ld   a, $01                                   ; $4B4F: $3E $01
    jr   z, .jr_4B54                              ; $4B51: $28 $01

    inc  a                                        ; $4B53: $3C

.jr_4B54
    jp   SetEntitySpriteVariant                   ; $4B54: $C3 $0C $3B

func_036_4B57::
    ld   a, [wDialogState]                        ; $4B57: $FA $9F $C1
    and  a                                        ; $4B5A: $A7
    ret  nz                                       ; $4B5B: $C0

    ;ld   a, ENTITY_PHOTOGRAPHER                   ; $4B5C: $3E $FA
    ;call SpawnNewEntity_trampoline                ; $4B5E: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $4B61: $21 $00 $C2
    add  hl, de                                   ; $4B64: $19
    ld   [hl], $50                                ; $4B65: $36 $50
    ld   hl, wEntitiesPosYTable                   ; $4B67: $21 $10 $C2
    add  hl, de                                   ; $4B6A: $19
    ld   [hl], $7C                                ; $4B6B: $36 $7C
    ld   hl, wEntitiesPrivateState5Table          ; $4B6D: $21 $90 $C3
    add  hl, bc                                   ; $4B70: $09
    ld   [hl], e                                  ; $4B71: $73
    call GetEntityTransitionCountdown             ; $4B72: $CD $05 $0C
    ld   [hl], $20                                ; $4B75: $36 $20
    jp   IncrementEntityState                     ; $4B77: $C3 $12 $3B

func_036_4B7A::
    ld   hl, wEntitiesPrivateState5Table          ; $4B7A: $21 $90 $C3
    add  hl, bc                                   ; $4B7D: $09
    ld   e, [hl]                                  ; $4B7E: $5E
    ld   d, $00                                   ; $4B7F: $16 $00
    ld   hl, wEntitiesSpriteVariantTable          ; $4B81: $21 $B0 $C3
    add  hl, de                                   ; $4B84: $19
    ldh  a, [hFrameCounter]                       ; $4B85: $F0 $E7
    and  $07                                      ; $4B87: $E6 $07
    ret  nz                                       ; $4B89: $C0

    ld   a, [hl]                                  ; $4B8A: $7E
    xor  $01                                      ; $4B8B: $EE $01
    ld   [hl], a                                  ; $4B8D: $77
    ret                                           ; $4B8E: $C9

func_036_4B8F::
    call GetEntityTransitionCountdown             ; $4B8F: $CD $05 $0C
    ret  nz                                       ; $4B92: $C0

    call func_036_4B7A                            ; $4B93: $CD $7A $4B
    ld   hl, wEntitiesPosYTable                   ; $4B96: $21 $10 $C2
    add  hl, de                                   ; $4B99: $19
    dec  [hl]                                     ; $4B9A: $35
    ld   a, [hl]                                  ; $4B9B: $7E
    cp   $42                                      ; $4B9C: $FE $42
    ret  nc                                       ; $4B9E: $D0

    ld   a, $42                                   ; $4B9F: $3E $42
    ld   [hl], a                                  ; $4BA1: $77
    ld   a, $02                                   ; $4BA2: $3E $02

jr_036_4BA4:
    ld   hl, wEntitiesSpriteVariantTable          ; $4BA4: $21 $B0 $C3
    add  hl, de                                   ; $4BA7: $19
    ld   [hl], a                                  ; $4BA8: $77
    jp   IncrementEntityState                     ; $4BA9: $C3 $12 $3B

func_036_4BAC::
    call func_036_4B7A                            ; $4BAC: $CD $7A $4B
    ld   hl, wEntitiesPosXTable                   ; $4BAF: $21 $00 $C2
    add  hl, de                                   ; $4BB2: $19
    inc  [hl]                                     ; $4BB3: $34
    ld   a, [hl]                                  ; $4BB4: $7E
    cp   $78                                      ; $4BB5: $FE $78
    ret  c                                        ; $4BB7: $D8

    ld   a, $78                                   ; $4BB8: $3E $78
    ld   [hl], a                                  ; $4BBA: $77
    call GetEntityTransitionCountdown             ; $4BBB: $CD $05 $0C
    ld   [hl], $30                                ; $4BBE: $36 $30
    xor  a                                        ; $4BC0: $AF
    jr   jr_036_4BA4                              ; $4BC1: $18 $E1

func_036_4BC3::
    call GetEntityTransitionCountdown             ; $4BC3: $CD $05 $0C
    ret  nz                                       ; $4BC6: $C0

    call_open_dialog Dialog1F8                    ; $4BC7
    jp   IncrementEntityState                     ; $4BCC: $C3 $12 $3B

func_036_4BCF::
    ld   a, [wDialogState]                        ; $4BCF: $FA $9F $C1
    and  a                                        ; $4BD2: $A7
    ret  nz                                       ; $4BD3: $C0

    ld   a, $40                                   ; $4BD4: $3E $40
    ldh  [hNoiseSfx], a                           ; $4BD6: $E0 $F4
    ld   a, $17                                   ; $4BD8: $3E $17
    ld   [wGameplayType], a                       ; $4BDA: $EA $95 $DB
    xor  a                                        ; $4BDD: $AF
    ld   [wGameplaySubtype], a                    ; $4BDE: $EA $96 $DB
    ld   [wTransitionSequenceCounter], a          ; $4BE1: $EA $6B $C1
    ld   [wC16C], a                               ; $4BE4: $EA $6C $C1
    ret                                           ; $4BE7: $C9

func_036_4BE8::
    ld   a, [wD202]                               ; $4BE8: $FA $02 $D2
    ld   e, a                                     ; $4BEB: $5F
    ld   d, $00                                   ; $4BEC: $16 $00
    ld   hl, wEntitiesStatusTable                 ; $4BEE: $21 $80 $C2
    add  hl, de                                   ; $4BF1: $19
    ld   a, [hl]                                  ; $4BF2: $7E
    cp   $01                                      ; $4BF3: $FE $01
    jr   nz, .jr_4BFE                             ; $4BF5: $20 $07

    call func_036_6C89                            ; $4BF7: $CD $89 $6C
    call func_036_5CAB                            ; $4BFA: $CD $AB $5C
    ret                                           ; $4BFD: $C9

.jr_4BFE
    ld   a, [wCurrentBank]                        ; $4BFE: $FA $AF $DB
    push af                                       ; $4C01: $F5
    ld   a, $36                                   ; $4C02: $3E $36
    ld   [wCurrentBank], a                        ; $4C04: $EA $AF $DB
    call label_3CD9                               ; $4C07: $CD $D9 $3C
    call func_036_4C12                            ; $4C0A: $CD $12 $4C
    pop  af                                       ; $4C0D: $F1
    ld   [wCurrentBank], a                        ; $4C0E: $EA $AF $DB
    ret                                           ; $4C11: $C9

func_036_4C12::
    ldh  a, [hActiveEntityState]                  ; $4C12: $F0 $F0
    JP_TABLE                                      ; $4C14
._00 dw func_036_4C1D                             ; $4C15
._01 dw func_036_4C25                             ; $4C17
._02 dw func_036_4C5C                             ; $4C19
._03 dw func_036_4C82                             ; $4C1B

func_036_4C1D::
    call GetEntityTransitionCountdown             ; $4C1D: $CD $05 $0C
    ret  nz                                       ; $4C20: $C0

    call IncrementEntityState                     ; $4C21: $CD $12 $3B
    ret                                           ; $4C24: $C9

func_036_4C25::
    ldh  a, [hFrameCounter]                       ; $4C25: $F0 $E7
    xor  c                                        ; $4C27: $A9
    and  $03                                      ; $4C28: $E6 $03
    jr   nz, .jr_4C31                             ; $4C2A: $20 $05

    ld   a, $08                                   ; $4C2C: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $4C2E: $CD $AA $3B

.jr_4C31
    call func_036_6B8A                            ; $4C31: $CD $8A $6B
    cp   $18                                      ; $4C34: $FE $18
    jr   nc, .jr_4C4C                             ; $4C36: $30 $14

    call func_036_6B9A                            ; $4C38: $CD $9A $6B
    cp   $18                                      ; $4C3B: $FE $18
    jr   nc, .jr_4C4C                             ; $4C3D: $30 $0D

    call PointHLToEntitySpeedZ                    ; $4C3F: $CD $F8 $6B
    ld   [hl], $28                                ; $4C42: $36 $28
    ld   a, $10                                   ; $4C44: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $4C46: $CD $AA $3B
    call IncrementEntityState                     ; $4C49: $CD $12 $3B

.jr_4C4C
    call UpdateEntityPosWithSpeed_36              ; $4C4C: $CD $62 $6A
    call label_3B23                               ; $4C4F: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $4C52: $F0 $E7
    rra                                           ; $4C54: $1F
    rra                                           ; $4C55: $1F
    and  $01                                      ; $4C56: $E6 $01
    call SetEntitySpriteVariant                   ; $4C58: $CD $0C $3B
    ret                                           ; $4C5B: $C9

func_036_4C5C::
    call UpdateEntityPosWithSpeed_36              ; $4C5C: $CD $62 $6A
    call label_3B23                               ; $4C5F: $CD $23 $3B
    call func_036_6AEC                            ; $4C62: $CD $EC $6A
    call PointHLToEntitySpeedZ                    ; $4C65: $CD $F8 $6B
    dec  [hl]                                     ; $4C68: $35
    dec  [hl]                                     ; $4C69: $35
    ld   a, [hl]                                  ; $4C6A: $7E
    cp   $02                                      ; $4C6B: $FE $02
    jr   nc, .jr_4C7C                             ; $4C6D: $30 $0D

    ld   [hl], $C0                                ; $4C6F: $36 $C0
    ld   a, $10                                   ; $4C71: $3E $10
    call func_036_6C83                            ; $4C73: $CD $83 $6C
    call ClearEntitySpeed                         ; $4C76: $CD $7F $3D
    call IncrementEntityState                     ; $4C79: $CD $12 $3B

.jr_4C7C
    ld   a, $02                                   ; $4C7C: $3E $02
    call SetEntitySpriteVariant                   ; $4C7E: $CD $0C $3B
    ret                                           ; $4C81: $C9

func_036_4C82::
    call GetEntityTransitionCountdown             ; $4C82: $CD $05 $0C
    ret  nz                                       ; $4C85: $C0

    call func_036_6AEC                            ; $4C86: $CD $EC $6A
    call PointHLToEntityPosZ                      ; $4C89: $CD $2D $6C
    ld   a, [hl]                                  ; $4C8C: $7E
    bit  7, a                                     ; $4C8D: $CB $7F
    ret  z                                        ; $4C8F: $C8

    ld   [hl], b                                  ; $4C90: $70
    ld   a, $20                                   ; $4C91: $3E $20
    call func_036_6C83                            ; $4C93: $CD $83 $6C
    xor  a                                        ; $4C96: $AF
    call SetEntityState                           ; $4C97: $CD $07 $6C
    ld   hl, wEntitiesSpeedZTable                 ; $4C9A: $21 $20 $C3
    add  hl, bc                                   ; $4C9D: $09
    ld   a, [hl]                                  ; $4C9E: $7E
    ld   [hl], b                                  ; $4C9F: $70
    bit  7, a                                     ; $4CA0: $CB $7F
    ret  z                                        ; $4CA2: $C8

    cp   $D0                                      ; $4CA3: $FE $D0
    ret  nc                                       ; $4CA5: $D0

    ldh  a, [hActiveEntityPosX]                   ; $4CA6: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $4CA8: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $4CAA: $F0 $EC
    add  $0C                                      ; $4CAC: $C6 $0C
    ldh  [hMultiPurpose1], a                      ; $4CAE: $E0 $D8
    call label_D15                                ; $4CB0: $CD $15 $0D
    ret                                           ; $4CB3: $C9

Data_036_4CB4::
    db   $1C, $28

; Color Dungeon Boss
HardhitBeetleEntityHandler::
    call label_394D                               ; $4CB6: $CD $4D $39
    ld   a, c                                     ; $4CB9: $79
    ld   [wD202], a                               ; $4CBA: $EA $02 $D2
    call func_036_4F4E                            ; $4CBD: $CD $4E $4F
    ldh  a, [hActiveEntityStatus]                 ; $4CC0: $F0 $EA
    cp   $05                                      ; $4CC2: $FE $05
    jp   nz, label_036_5C3C                       ; $4CC4: $C2 $3C $5C

    ldh  a, [hFrameCounter]                       ; $4CC7: $F0 $E7
    and  $1F                                      ; $4CC9: $E6 $1F
    jr   nz, .jr_4CD5                             ; $4CCB: $20 $08

    call PointHLToEntitySpriteVariant             ; $4CCD: $CD $02 $6C
    ld   a, [hl]                                  ; $4CD0: $7E
    inc  a                                        ; $4CD1: $3C
    and  $01                                      ; $4CD2: $E6 $01
    ld   [hl], a                                  ; $4CD4: $77

.jr_4CD5
    call BossIntro                                ; $4CD5: $CD $E8 $3E
    call ReturnIfNonInteractive_36                ; $4CD8: $CD $40 $6A
    call UpdateEntityPosWithSpeed_36              ; $4CDB: $CD $62 $6A
    ld   de, Data_036_4CB4                        ; $4CDE: $11 $B4 $4C
    call func_036_6C90                            ; $4CE1: $CD $90 $6C
    call label_3B39                               ; $4CE4: $CD $39 $3B
    ld   a, [wC190]                               ; $4CE7: $FA $90 $C1
    and  a                                        ; $4CEA: $A7
    ret  z                                        ; $4CEB: $C8

    call func_036_4D03                            ; $4CEC: $CD $03 $4D
    call func_036_4D4B                            ; $4CEF: $CD $4B $4D
    ldh  a, [hActiveEntityState]                  ; $4CF2: $F0 $F0
    JP_TABLE                                      ; $4CF4
._00 dw AvalaunchState0Handler                             ; $4CF5
._01 dw AvalaunchState1Handler                             ; $4CF7
._02 dw func_036_4DB7                             ; $4CF9
._03 dw func_036_4DCF                             ; $4CFB
._04 dw func_036_4E27                             ; $4CFD
._05 dw func_036_4DCF                             ; $4CFF
._06 dw func_036_4EA2                             ; $4D01

func_036_4D03::
    ld   hl, wEntitiesHealthTable                 ; $4D03: $21 $60 $C3
    add  hl, bc                                   ; $4D06: $09
    ld   a, [hl]                                  ; $4D07: $7E
    cp   $10                                      ; $4D08: $FE $10
    jr   nz, .jr_4D13                             ; $4D0A: $20 $07

    ld   hl, wEntitiesPrivateState1Table          ; $4D0C: $21 $B0 $C2
    add  hl, bc                                   ; $4D0F: $09
    ld   [hl], $00                                ; $4D10: $36 $00
    ret                                           ; $4D12: $C9

.jr_4D13
    ld   hl, wEntitiesFlashCountdownTable         ; $4D13: $21 $20 $C4
    add  hl, bc                                   ; $4D16: $09
    ld   a, [hl]                                  ; $4D17: $7E
    and  a                                        ; $4D18: $A7
    ret  nz                                       ; $4D19: $C0

    call GetEntityPrivateCountdown1               ; $4D1A: $CD $00 $0C
    ret  nz                                       ; $4D1D: $C0

    ld   hl, wEntitiesPrivateState2Table          ; $4D1E: $21 $C0 $C2
    add  hl, bc                                   ; $4D21: $09
    ld   a, [hl]                                  ; $4D22: $7E
    and  a                                        ; $4D23: $A7
    jr   z, .jr_4D28                              ; $4D24: $28 $02

    dec  [hl]                                     ; $4D26: $35
    ret                                           ; $4D27: $C9

.jr_4D28
    ld   hl, wEntitiesHealthTable                 ; $4D28: $21 $60 $C3
    add  hl, bc                                   ; $4D2B: $09
    inc  [hl]                                     ; $4D2C: $34
    ld   a, [hl]                                  ; $4D2D: $7E
    cp   $10                                      ; $4D2E: $FE $10
    jr   nz, jr_036_4D6E                          ; $4D30: $20 $3C

    call_open_dialog Dialog26F                    ; $4D32
    jr   jr_036_4D6E                              ; $4D37: $18 $35

Data_036_4D39::
    db   $1F, $00, $1F, $00, $1F, $01, $1F, $02, $1F
    db   $03, $31, $07, $44, $0B, $40, $3A, $A5, $7C

func_036_4D4B::
    call DecrementEntityIgnoreHitsCountdown       ; $4D4B: $CD $56 $0C
    ld   a, [hl]                                  ; $4D4E: $7E
    and  a                                        ; $4D4F: $A7
    jr   nz, .jr_4D5C                             ; $4D50: $20 $0A

    ld   hl, wEntitiesFlashCountdownTable         ; $4D52: $21 $20 $C4
    add  hl, bc                                   ; $4D55: $09
    ld   a, [hl]                                  ; $4D56: $7E
    and  a                                        ; $4D57: $A7
    ret  z                                        ; $4D58: $C8

    ld   [hl], $00                                ; $4D59: $36 $00
    ret                                           ; $4D5B: $C9

.jr_4D5C
    ld   a, $10                                   ; $4D5C: $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $4D5E: $EA $3E $C1
    ld   a, $14                                   ; $4D61: $3E $14
    call GetVectorTowardsLink_trampoline          ; $4D63: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $4D66: $F0 $D7
    ldh  [hLinkSpeedY], a                         ; $4D68: $E0 $9B
    ldh  a, [hMultiPurpose1]                      ; $4D6A: $F0 $D8
    ldh  [hLinkSpeedX], a                         ; $4D6C: $E0 $9A

jr_036_4D6E:
    ld   hl, wEntitiesHealthTable                 ; $4D6E: $21 $60 $C3
    add  hl, bc                                   ; $4D71: $09
    ld   a, [hl]                                  ; $4D72: $7E
    and  $FE                                      ; $4D73: $E6 $FE
    ld   e, a                                     ; $4D75: $5F
    ld   d, $00                                   ; $4D76: $16 $00
    ld   hl, Data_036_4D39                        ; $4D78: $21 $39 $4D
    add  hl, de                                   ; $4D7B: $19
    ld   a, [wObjPal8 + 2*2]                      ; $4D7C: $FA $8C $DC
    cp   [hl]                                     ; $4D7F: $BE
    jr   nz, .jr_4D89                             ; $4D80: $20 $07

    inc  hl                                       ; $4D82: $23
    ld   a, [wObjPal8 + 2*2+1]                    ; $4D83: $FA $8D $DC
    cp   [hl]                                     ; $4D86: $BE
    ret  z                                        ; $4D87: $C8

    dec  hl                                       ; $4D88: $2B

.jr_4D89
    ld   e, l                                     ; $4D89: $5D
    ld   d, h                                     ; $4D8A: $54
    ld   hl, rSVBK                                ; $4D8B: $21 $70 $FF
    ld   a, [de]                                  ; $4D8E: $1A
    ld   [wObjPal8 + 2*2], a                      ; $4D8F: $EA $8C $DC
    ld   [hl], $02                                ; $4D92: $36 $02
    ld   [wObjPal8 + 2*2], a                      ; $4D94: $EA $8C $DC
    ld   [hl], $00                                ; $4D97: $36 $00
    inc  de                                       ; $4D99: $13
    ld   a, [de]                                  ; $4D9A: $1A
    ld   [wObjPal8 + 2*2+1], a                    ; $4D9B: $EA $8D $DC
    ld   [hl], $02                                ; $4D9E: $36 $02
    ld   [wObjPal8 + 2*2+1], a                    ; $4DA0: $EA $8D $DC
    ld   [hl], $00                                ; $4DA3: $36 $00
    ld   a, $02                                   ; $4DA5: $3E $02
    ld   [wPaletteDataFlags], a                   ; $4DA7: $EA $D1 $DD
    ld   hl, wEntitiesPrivateCountdown1Table      ; $4DAA: $21 $F0 $C2
    add  hl, bc                                   ; $4DAD: $09
    ld   [hl], $60                                ; $4DAE: $36 $60
    ld   hl, wEntitiesPrivateState2Table          ; $4DB0: $21 $C0 $C2
    add  hl, bc                                   ; $4DB3: $09
    ld   [hl], $04                                ; $4DB4: $36 $04
    ret                                           ; $4DB6: $C9

func_036_4DB7::
    push bc                                       ; $4DB7: $C5
    sla  c                                        ; $4DB8: $CB $21
    sla  c                                        ; $4DBA: $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ; $4DBC: $21 $80 $D5
    add  hl, bc                                   ; $4DBF: $09
    inc  hl                                       ; $4DC0: $23
    inc  hl                                       ; $4DC1: $23
    inc  hl                                       ; $4DC2: $23
    ld   [hl], $14                                ; $4DC3: $36 $14
    pop  bc                                       ; $4DC5: $C1
    call_open_dialog Dialog26D                    ; $4DC6
    call IncrementEntityState                     ; $4DCB: $CD $12 $3B
    ret                                           ; $4DCE: $C9

func_036_4DCF::
    ld   a, [wDialogState]                        ; $4DCF: $FA $9F $C1
    and  a                                        ; $4DD2: $A7
    ret  nz                                       ; $4DD3: $C0

    call IncrementEntityState                     ; $4DD4: $CD $12 $3B
    ret                                           ; $4DD7: $C9

func_036_4DD8::
    ldh  a, [hFrameCounter]                       ; $4DD8: $F0 $E7
    and  $0F                                      ; $4DDA: $E6 $0F
    ret  nz                                       ; $4DDC: $C0

    call GetRandomByte                            ; $4DDD: $CD $0D $28
    and  $07                                      ; $4DE0: $E6 $07
    ret  nz                                       ; $4DE2: $C0

    call func_036_4E7F                            ; $4DE3: $CD $7F $4E
    and  a                                        ; $4DE6: $A7
    ret  nz                                       ; $4DE7: $C0

    push bc                                       ; $4DE8: $C5
    ld   a, ENTITY_BOUNCING_BOULDER               ; $4DE9: $3E $F5
    call SpawnNewEntity_trampoline                ; $4DEB: $CD $86 $3B
    jr   c, .jr_4E1B                              ; $4DEE: $38 $2B

    ld   hl, wEntitiesStateTable                  ; $4DF0: $21 $90 $C2
    add  hl, de                                   ; $4DF3: $19
    ld   [hl], $04                                ; $4DF4: $36 $04
    call PointHLToEntityPosX                      ; $4DF6: $CD $23 $6C
    ld   a, [hl]                                  ; $4DF9: $7E
    ld   hl, wEntitiesPosXTable                   ; $4DFA: $21 $00 $C2
    add  hl, de                                   ; $4DFD: $19
    ld   [hl], a                                  ; $4DFE: $77
    call PointHLToEntityPosY                      ; $4DFF: $CD $28 $6C
    ld   a, [hl]                                  ; $4E02: $7E
    ld   hl, wEntitiesPosYTable                   ; $4E03: $21 $10 $C2
    add  hl, de                                   ; $4E06: $19
    ld   [hl], a                                  ; $4E07: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4E08: $21 $40 $C3
    add  hl, de                                   ; $4E0B: $19
    ld   [hl], $12                                ; $4E0C: $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ; $4E0E: $21 $50 $C3
    add  hl, de                                   ; $4E11: $19
    set  7, [hl]                                  ; $4E12: $CB $FE
    ld   c, e                                     ; $4E14: $4B
    ld   b, d                                     ; $4E15: $42
    ld   a, $10                                   ; $4E16: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $4E18: $CD $AA $3B

.jr_4E1B
    pop  bc                                       ; $4E1B: $C1
    ret                                           ; $4E1C: $C9

Data_036_4E1D::
    db   $FA, $FC

Data_036_4E1F::
    db   $00, $04, $06, $04, $00, $FC, $FA, $FC

func_036_4E27::
    call func_036_4DD8                            ; $4E27: $CD $D8 $4D
    ld   hl, wEntitiesHealthTable                 ; $4E2A: $21 $60 $C3
    add  hl, bc                                   ; $4E2D: $09
    ld   a, [hl]                                  ; $4E2E: $7E
    and  a                                        ; $4E2F: $A7
    jr   z, jr_036_4E5C                           ; $4E30: $28 $2A

    ld   hl, wEntitiesPrivateState1Table          ; $4E32: $21 $B0 $C2
    add  hl, bc                                   ; $4E35: $09
    cp   $02                                      ; $4E36: $FE $02
    jr   nc, .jr_4E42                             ; $4E38: $30 $08

    ld   a, [hl]                                  ; $4E3A: $7E
    dec  a                                        ; $4E3B: $3D
    and  a                                        ; $4E3C: $A7
    jr   nz, .jr_4E42                             ; $4E3D: $20 $03

    inc  [hl]                                     ; $4E3F: $34
    jr   jr_036_4E50                              ; $4E40: $18 $0E

.jr_4E42
    cp   $05                                      ; $4E42: $FE $05
    jr   nc, jr_036_4E5C                          ; $4E44: $30 $16

    ld   a, [hl]                                  ; $4E46: $7E
    and  a                                        ; $4E47: $A7
    jr   nz, jr_036_4E5C                          ; $4E48: $20 $12

    inc  [hl]                                     ; $4E4A: $34
    call_open_dialog Dialog26E                    ; $4E4B

jr_036_4E50:
    call PointHLToEntitySpeedX                    ; $4E50: $CD $EE $6B
    ld   [hl], a                                  ; $4E53: $77
    call PointHLToEntitySpeedY                    ; $4E54: $CD $F3 $6B
    ld   [hl], a                                  ; $4E57: $77
    call IncrementEntityState                     ; $4E58: $CD $12 $3B
    ret                                           ; $4E5B: $C9

jr_036_4E5C:
    call GetEntityTransitionCountdown             ; $4E5C: $CD $05 $0C
    ret  nz                                       ; $4E5F: $C0

    call GetRandomByte                            ; $4E60: $CD $0D $28
    and  $3F                                      ; $4E63: $E6 $3F
    add  $30                                      ; $4E65: $C6 $30
    ld   [hl], a                                  ; $4E67: $77
    and  $07                                      ; $4E68: $E6 $07
    ld   e, a                                     ; $4E6A: $5F
    ld   d, b                                     ; $4E6B: $50
    ld   hl, Data_036_4E1F                        ; $4E6C: $21 $1F $4E
    add  hl, de                                   ; $4E6F: $19
    ld   a, [hl]                                  ; $4E70: $7E
    call PointHLToEntitySpeedX                    ; $4E71: $CD $EE $6B
    ld   [hl], a                                  ; $4E74: $77
    ld   hl, Data_036_4E1D                        ; $4E75: $21 $1D $4E
    add  hl, de                                   ; $4E78: $19
    ld   a, [hl]                                  ; $4E79: $7E
    call PointHLToEntitySpeedY                    ; $4E7A: $CD $F3 $6B
    ld   [hl], a                                  ; $4E7D: $77
    ret                                           ; $4E7E: $C9

func_036_4E7F::
    xor  a                                        ; $4E7F: $AF
    ldh  [hMultiPurpose0], a                      ; $4E80: $E0 $D7
    ld   e, a                                     ; $4E82: $5F
    ld   d, a                                     ; $4E83: $57

jr_036_4E84:
    ld   hl, wEntitiesTypeTable                   ; $4E84: $21 $A0 $C3
    add  hl, de                                   ; $4E87: $19
    ld   a, [hl]                                  ; $4E88: $7E
    cp   $1A                                      ; $4E89: $FE $1A
    jr   nz, .jr_4E99                             ; $4E8B: $20 $0C

    ld   hl, wEntitiesStatusTable                 ; $4E8D: $21 $80 $C2
    add  hl, de                                   ; $4E90: $19
    ld   a, [hl]                                  ; $4E91: $7E
    and  a                                        ; $4E92: $A7
    jr   z, .jr_4E99                              ; $4E93: $28 $04

    ld   hl, hMultiPurpose0                       ; $4E95: $21 $D7 $FF
    inc  [hl]                                     ; $4E98: $34

.jr_4E99
    inc  de                                       ; $4E99: $13
    ld   a, e                                     ; $4E9A: $7B
    and  $0F                                      ; $4E9B: $E6 $0F
    jr   nz, jr_036_4E84                          ; $4E9D: $20 $E5

    ldh  a, [hMultiPurpose0]                      ; $4E9F: $F0 $D7
    ret                                           ; $4EA1: $C9

func_036_4EA2::
    call func_036_4E7F                            ; $4EA2: $CD $7F $4E
    cp   $02                                      ; $4EA5: $FE $02
    jr   z, .jr_4EE4                              ; $4EA7: $28 $3B

    ld   a, ENTITY_STALFOS_AGGRESSIVE             ; $4EA9: $3E $1A
    call SpawnNewEntity_trampoline                ; $4EAB: $CD $86 $3B
    jr   c, .jr_4EE4                              ; $4EAE: $38 $34

    ldh  a, [hLinkPositionX]                      ; $4EB0: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $4EB2: $21 $00 $C2
    add  hl, de                                   ; $4EB5: $19
    ld   [hl], a                                  ; $4EB6: $77
    ldh  a, [hLinkPositionY]                      ; $4EB7: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $4EB9: $21 $10 $C2
    add  hl, de                                   ; $4EBC: $19
    ld   [hl], a                                  ; $4EBD: $77
    ld   hl, wEntitiesPosZTable                   ; $4EBE: $21 $10 $C3
    add  hl, de                                   ; $4EC1: $19
    ld   [hl], $30                                ; $4EC2: $36 $30
    ld   hl, wEntitiesSpeedZTable                 ; $4EC4: $21 $20 $C3
    add  hl, de                                   ; $4EC7: $19
    ld   [hl], $C0                                ; $4EC8: $36 $C0
    ld   hl, wEntitiesSpriteVariantTable          ; $4ECA: $21 $B0 $C3
    add  hl, de                                   ; $4ECD: $19
    ld   [hl], $02                                ; $4ECE: $36 $02
    ld   hl, wEntitiesHealthTable                 ; $4ED0: $21 $60 $C3
    add  hl, de                                   ; $4ED3: $19
    ld   [hl], $02                                ; $4ED4: $36 $02
    ld   hl, wEntitiesStateTable                  ; $4ED6: $21 $90 $C2
    add  hl, de                                   ; $4ED9: $19
    ld   [hl], $03                                ; $4EDA: $36 $03
    ld   hl, wEntitiesHealthTable                 ; $4EDC: $21 $60 $C3
    add  hl, bc                                   ; $4EDF: $09
    ld   a, [hl]                                  ; $4EE0: $7E
    cp   $04                                      ; $4EE1: $FE $04
    ret  nc                                       ; $4EE3: $D0

.jr_4EE4
    ld   a, $04                                   ; $4EE4: $3E $04
    call SetEntityState                           ; $4EE6: $CD $07 $6C
    ret                                           ; $4EE9: $C9

Data_036_4EEA::
    db   $F0, $F8, $60, $07, $F0, $00, $62, $07   ; $4EEA
    db   $F0, $08, $62, $27, $F0, $10, $60, $27   ; $4EF2
    db   $00, $F8, $64, $07, $00, $00, $66, $07   ; $4EFA
    db   $00, $08, $66, $27, $00, $10, $64, $27   ; $4F02
    db   $10, $F8, $68, $06, $10, $00, $6A, $06   ; $4F0A
    db   $10, $08, $6C, $06, $10, $10, $6E, $06   ; $4F12

Data_036_4F1A::
    db   $F0, $F8, $60, $07, $F0, $00, $62, $07   ; $4F1A
    db   $F0, $08, $62, $27, $F0, $10, $60, $27   ; $4F22
    db   $00, $F8, $64, $07, $00, $00, $66, $07   ; $4F2A
    db   $00, $08, $66, $27, $00, $10, $64, $27   ; $4F32
    db   $10, $F8, $6E, $26, $10, $00, $6C, $26   ; $4F3A
    db   $10, $08, $6A, $26, $10, $10, $68, $26   ; $4F42

Data_036_4F4A::
    dw   Data_036_4EEA
    dw   Data_036_4F1A

func_036_4F4E::
    call PointHLToEntitySpriteVariant             ; $4F4E: $CD $02 $6C
    ld   a, [hl]                                  ; $4F51: $7E
    sla  a                                        ; $4F52: $CB $27
    ld   e, a                                     ; $4F54: $5F
    ld   d, $00                                   ; $4F55: $16 $00
    ld   hl, Data_036_4F4A                        ; $4F57: $21 $4A $4F
    call func_036_6C7E                            ; $4F5A: $CD $7E $6C
    ld   c, $0C                                   ; $4F5D: $0E $0C
    call RenderActiveEntitySpritesRect            ; $4F5F: $CD $E6 $3C
    ld   a, $0C                                   ; $4F62: $3E $0C
    call func_015_7964_trampoline                 ; $4F64: $CD $A0 $3D
    ret                                           ; $4F67: $C9

func_036_4F68::
    ld   a, [wCurrentBank]                        ; $4F68: $FA $AF $DB
    push af                                       ; $4F6B: $F5

IF __PATCH_0__
    ld   a, $09
    ld   hl, wEntitiesHealthGroup
    add  hl, bc
    ld   [hl], a
ENDC

    ld   a, $36                                   ; $4F6C: $3E $36
    ld   [wCurrentBank], a                        ; $4F6E: $EA $AF $DB
    ld   hl, wEntitiesPrivateState2Table          ; $4F71: $21 $C0 $C2
    add  hl, bc                                   ; $4F74: $09
    ld   a, [hl]                                  ; $4F75: $7E
    ld   hl, Data_020_6A20                        ; $4F76: $21 $20 $6A
    and  a                                        ; $4F79: $A7
    jr   nz, .jr_4F7F                             ; $4F7A: $20 $03

    ld   hl, Data_020_6A28                        ; $4F7C: $21 $28 $6A

.jr_4F7F
    ld   c, $02                                   ; $4F7F: $0E $02
    ld   a, $36                                   ; $4F81: $3E $36
    call func_A5F                                 ; $4F83: $CD $5F $0A
    ld   a, $02                                   ; $4F86: $3E $02
    call func_015_7964_trampoline                 ; $4F88: $CD $A0 $3D
    ld   hl, wEntitiesPrivateState1Table          ; $4F8B: $21 $B0 $C2
    add  hl, bc                                   ; $4F8E: $09
    ld   a, [hl]                                  ; $4F8F: $7E
    and  a                                        ; $4F90: $A7
    jr   z, .jr_4F96                              ; $4F91: $28 $03

    call UnloadEntity                             ; $4F93: $CD $8D $3F

.jr_4F96
    pop  af                                       ; $4F96: $F1
    ld   [wCurrentBank], a                        ; $4F97: $EA $AF $DB
    ret                                           ; $4F9A: $C9

func_036_4F9B::
    ld   a, [wD202]                               ; $4F9B: $FA $02 $D2
    ld   e, a                                     ; $4F9E: $5F
    ld   d, $00                                   ; $4F9F: $16 $00
    ld   hl, wEntitiesStatusTable                 ; $4FA1: $21 $80 $C2
    add  hl, de                                   ; $4FA4: $19
    ld   a, [hl]                                  ; $4FA5: $7E
    cp   $01                                      ; $4FA6: $FE $01
    jr   nz, .jr_4FB1                             ; $4FA8: $20 $07

    call func_036_6C89                            ; $4FAA: $CD $89 $6C
    call func_036_5CAB                            ; $4FAD: $CD $AB $5C
    ret                                           ; $4FB0: $C9

.jr_4FB1
    ld   a, [wCurrentBank]                        ; $4FB1: $FA $AF $DB
    push af                                       ; $4FB4: $F5
    ld   a, $36                                   ; $4FB5: $3E $36
    ld   [wCurrentBank], a                        ; $4FB7: $EA $AF $DB
    ld   hl, Data_020_6A10                        ; $4FBA: $21 $10 $6A
    ld   c, $02                                   ; $4FBD: $0E $02
    ld   a, $36                                   ; $4FBF: $3E $36
    call func_A5F                                 ; $4FC1: $CD $5F $0A
    ld   a, $02                                   ; $4FC4: $3E $02
    call func_015_7964_trampoline                 ; $4FC6: $CD $A0 $3D
    pop  af                                       ; $4FC9: $F1
    ld   [wCurrentBank], a                        ; $4FCA: $EA $AF $DB
    call ReturnIfNonInteractive_36                ; $4FCD: $CD $40 $6A
    ld   a, [wCurrentBank]                        ; $4FD0: $FA $AF $DB
    push af                                       ; $4FD3: $F5
    ld   a, $36                                   ; $4FD4: $3E $36
    ld   [wCurrentBank], a                        ; $4FD6: $EA $AF $DB
    call label_3CD9                               ; $4FD9: $CD $D9 $3C
    call PointHLToEntitySpeedX                    ; $4FDC: $CD $EE $6B
    ld   a, [hl]                                  ; $4FDF: $7E
    rlca                                          ; $4FE0: $07
    rlca                                          ; $4FE1: $07
    and  $01                                      ; $4FE2: $E6 $01
    call SetEntitySpriteVariant                   ; $4FE4: $CD $0C $3B
    call UpdateEntityPosWithSpeed_36              ; $4FE7: $CD $62 $6A
    call func_036_5000                            ; $4FEA: $CD $00 $50
    ld   a, [wIsLinkInTheAir]                     ; $4FED: $FA $46 $C1
    and  a                                        ; $4FF0: $A7
    jr   z, .jr_4FFB                              ; $4FF1: $28 $08

    call CheckLinkCollisionWithEnemy_trampoline   ; $4FF3: $CD $5A $3B
    jr   nc, .jr_4FFB                             ; $4FF6: $30 $03

    call func_036_503C                            ; $4FF8: $CD $3C $50

.jr_4FFB
    pop  af                                       ; $4FFB: $F1
    ld   [wCurrentBank], a                        ; $4FFC: $EA $AF $DB
    ret                                           ; $4FFF: $C9

func_036_5000::
    ldh  a, [hActiveEntityState]                  ; $5000: $F0 $F0
    JP_TABLE                                      ; $5002
._00 dw func_036_5007                             ; $5003
._01 dw func_036_501C                             ; $5005

func_036_5007::
    call PointHLToEntityPosY                      ; $5007: $CD $28 $6C
    ld   a, [hl]                                  ; $500A: $7E
    cp   $50                                      ; $500B: $FE $50
    jr   c, .ret_501B                             ; $500D: $38 $0C

    xor  a                                        ; $500F: $AF
    call PointHLToEntitySpeedX                    ; $5010: $CD $EE $6B
    ld   [hl], a                                  ; $5013: $77
    call PointHLToEntitySpeedY                    ; $5014: $CD $F3 $6B
    ld   [hl], a                                  ; $5017: $77
    call IncrementEntityState                     ; $5018: $CD $12 $3B

.ret_501B
    ret                                           ; $501B: $C9

func_036_501C::
    call label_3B23                               ; $501C: $CD $23 $3B
    call GetEntityTransitionCountdown             ; $501F: $CD $05 $0C
    ret  nz                                       ; $5022: $C0

    ld   [hl], $30                                ; $5023: $36 $30
    call GetRandomByte                            ; $5025: $CD $0D $28
    and  $0F                                      ; $5028: $E6 $0F
    sub  $08                                      ; $502A: $D6 $08
    call PointHLToEntitySpeedX                    ; $502C: $CD $EE $6B
    ld   [hl], a                                  ; $502F: $77
    call GetRandomByte                            ; $5030: $CD $0D $28
    and  $0F                                      ; $5033: $E6 $0F
    sub  $08                                      ; $5035: $D6 $08
    call PointHLToEntitySpeedY                    ; $5037: $CD $F3 $6B
    ld   [hl], a                                  ; $503A: $77
    ret                                           ; $503B: $C9

func_036_503C::
    call func_036_6C89                            ; $503C: $CD $89 $6C
    ld   a, $01                                   ; $503F: $3E $01
    ldh  [hWaveSfx], a                            ; $5041: $E0 $F3
    ld   d, $0C                                   ; $5043: $16 $0C
    call GiveInventoryItem_trampoline             ; $5045: $CD $6B $3E
    ld   a, REPLACE_TILES_MAGIC_POWDER            ; $5048: $3E $0B
    ldh  [hReplaceTiles], a                       ; $504A: $E0 $A5
    ld   hl, wMaxMagicPowder                      ; $504C: $21 $76 $DB
    ld   de, wMagicPowderCount                    ; $504F: $11 $4C $DB
    ld   a, [de]                                  ; $5052: $1A
    cp   [hl]                                     ; $5053: $BE
    jr   nc, ret_036_505E                         ; $5054: $30 $08

    add  $10                                      ; $5056: $C6 $10
    daa                                           ; $5058: $27
    cp   [hl]                                     ; $5059: $BE
    jr   c, .jr_505D                              ; $505A: $38 $01

    ld   a, [hl]                                  ; $505C: $7E

.jr_505D
    ld   [de], a                                  ; $505D: $12

ret_036_505E:
    ret                                           ; $505E: $C9

; @TODO Big Fairy in the Color Dungeon
func_036_505F::
    ld   hl, Data_020_69E0                        ; $505F: $21 $E0 $69
    ldh  a, [hFrameCounter]                       ; $5062: $F0 $E7
    and  $08                                      ; $5064: $E6 $08
    jr   z, .jr_506B                              ; $5066: $28 $03

    ld   hl, Data_020_69F8                        ; $5068: $21 $F8 $69

.jr_506B
    ld   c, $06                                   ; $506B: $0E $06
    ld   a, $36                                   ; $506D: $3E $36
    call func_A5F                                 ; $506F: $CD $5F $0A
    ld   a, [wCurrentBank]                        ; $5072: $FA $AF $DB
    push af                                       ; $5075: $F5
    ld   a, $36                                   ; $5076: $3E $36
    ld   [wCurrentBank], a                        ; $5078: $EA $AF $DB
    ld   a, $06                                   ; $507B: $3E $06
    call func_015_7964_trampoline                 ; $507D: $CD $A0 $3D
    call label_3CD9                               ; $5080: $CD $D9 $3C
    pop  af                                       ; $5083: $F1
    ld   [wCurrentBank], a                        ; $5084: $EA $AF $DB
    ld   a, [wGameplayType]                       ; $5087: $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ; $508A: $FE $0B
    ret  nz                                       ; $508C: $C0

    ld   a, [wTransitionSequenceCounter]          ; $508D: $FA $6B $C1
    cp   $04                                      ; $5090: $FE $04
    ret  nz                                       ; $5092: $C0

    ld   a, [wCurrentBank]                        ; $5093: $FA $AF $DB
    push af                                       ; $5096: $F5
    ld   a, $36                                   ; $5097: $3E $36
    ld   [wCurrentBank], a                        ; $5099: $EA $AF $DB
    call label_394D                               ; $509C: $CD $4D $39
    pop  af                                       ; $509F: $F1
    ld   [wCurrentBank], a                        ; $50A0: $EA $AF $DB
    ld   e, $FE                                   ; $50A3: $1E $FE
    ld   hl, wEntitiesInertiaTable                ; $50A5: $21 $D0 $C3
    add  hl, bc                                   ; $50A8: $09
    inc  [hl]                                     ; $50A9: $34
    ld   a, [hl]                                  ; $50AA: $7E
    and  $40                                      ; $50AB: $E6 $40
    jr   z, .jr_50B1                              ; $50AD: $28 $02

    ld   e, $02                                   ; $50AF: $1E $02

.jr_50B1
    call PointHLToEntitySpeedZ                    ; $50B1: $CD $F8 $6B
    ld   [hl], e                                  ; $50B4: $73
    call func_036_6AEC                            ; $50B5: $CD $EC $6A
    ld   a, [wCurrentBank]                        ; $50B8: $FA $AF $DB
    push af                                       ; $50BB: $F5
    ld   a, $36                                   ; $50BC: $3E $36
    ld   [wCurrentBank], a                        ; $50BE: $EA $AF $DB
    call func_036_50C9                            ; $50C1: $CD $C9 $50
    pop  af                                       ; $50C4: $F1
    ld   [wCurrentBank], a                        ; $50C5: $EA $AF $DB
    ret                                           ; $50C8: $C9

func_036_50C9::
    ldh  a, [hActiveEntityState]                  ; $50C9: $F0 $F0
     JP_TABLE                                      ; $50CB
._00 dw TunicFairyState0                             ; $50CC
._01 dw TunicFairyState1                             ; $50CE
._02 dw TunicFairyState2                             ; $50D0
._03 dw TunicFairyState3                             ; $50D2
._04 dw TunicFairyState4                             ; $50D4
._05 dw TunicFairyState5                             ; $50D6
._06 dw TunicFairyState6                             ; $50D8
._07 dw TunicFairyState7                             ; $50DA
._08 dw TunicFairyState8                             ; $50DC
._09 dw TunicFairyState9                             ; $50DE
._0A dw TunicFairyStateA                             ; $50E0
._0B dw TunicFairyStateB                             ; $50E2

TunicFairyState0::
    call func_036_6B8A                            ; $50E4: $CD $8A $6B
    cp   $10                                      ; $50E7: $FE $10
    ret  nc                                       ; $50E9: $D0

    call func_036_6B9A                            ; $50EA: $CD $9A $6B
    cp   $24                                      ; $50ED: $FE $24
    ret  nc                                       ; $50EF: $D0

    ldh  a, [hLinkDirection]                      ; $50F0: $F0 $9E
    cp   $02                                      ; $50F2: $FE $02
    ret  nz                                       ; $50F4: $C0

    ld   hl, wC1AD                                ; $50F5: $21 $AD $C1
    ld   [hl], $01                                ; $50F8: $36 $01
    ldh  a, [hJoypadState]                        ; $50FA: $F0 $CC
    and  J_A                                      ; $50FC: $E6 $10
    ret  z                                        ; $50FE: $C8

    call_open_dialog Dialog268                    ; $50FF
    xor  a                                        ; $5104: $AF
    ld   [wC16C], a                               ; $5105: $EA $6C $C1
    ld   [wTransitionSequenceCounter], a          ; $5108: $EA $6B $C1
    ld   [wActivePowerUp], a                      ; $510B: $EA $7C $D4
    ld   hl, wEntitiesPrivateState1Table          ; $510E: $21 $B0 $C2
    add  hl, bc                                   ; $5111: $09
    ld   [hl], a                                  ; $5112: $77
    call IncrementEntityState                     ; $5113: $CD $12 $3B
    ret                                           ; $5116: $C9

TunicFairyState1::
    ld   a, [wDialogState]                        ; $5117: $FA $9F $C1
    and  a                                        ; $511A: $A7
    ret  nz                                       ; $511B: $C0

    ld   a, [wDialogAskSelectionIndex]            ; $511C: $FA $77 $C1
    and  a                                        ; $511F: $A7
IF __PATCH_1__
    xor  $01
ENDC
    ld   hl, wEntitiesPrivateState2Table          ; $5120: $21 $C0 $C2
    add  hl, bc                                   ; $5123: $09
    ld   [hl], a                                  ; $5124: $77
    ld_dialog_low e, Dialog25D ; "Are you sure?"  ; $5125: $1E $5D
    and  a                                        ; $5127: $A7
    jr   z, .jr_512C                              ; $5128: $28 $02

    ld_dialog_low e, Dialog2AE ; "Are you sure?"  ; $512A: $1E $AE

.jr_512C
    ld   a, e                                     ; $512C: $7B
    call OpenDialogInTable2                       ; $512D: $CD $7C $23
    call IncrementEntityState                     ; $5130: $CD $12 $3B
    ret                                           ; $5133: $C9

TunicFairyState2::
    ld   a, [wDialogState]                        ; $5134: $FA $9F $C1
    and  a                                        ; $5137: $A7
    ret  nz                                       ; $5138: $C0

    ld   a, [wDialogAskSelectionIndex]            ; $5139: $FA $77 $C1
    and  a                                        ; $513C: $A7
    jr   nz, .jr_5148                             ; $513D: $20 $09

    ld   hl, wEntitiesPrivateState2Table          ; $513F: $21 $C0 $C2
    add  hl, bc                                   ; $5142: $09
    ld   a, [hl]                                  ; $5143: $7E
    call IncrementEntityState                     ; $5144: $CD $12 $3B
    ret                                           ; $5147: $C9

.jr_5148
    call_open_dialog Dialog25C                    ; $5148
    ld   a, $01                                   ; $514D: $3E $01
    call SetEntityState                           ; $514F: $CD $07 $6C
    ret                                           ; $5152: $C9

func_036_5153::
    ld   a, $36                                   ; $5153: $3E $36
    call func_003_5A2E_trampoline                 ; $5155: $CD $6B $0A
    ret                                           ; $5158: $C9

TunicFairyState3::
    ld   a, $01                                   ; $5159: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $515B: $E0 $A1
    ld   a, [wDialogState]                        ; $515D: $FA $9F $C1
    and  a                                        ; $5160: $A7
    ret  nz                                       ; $5161: $C0

    ld   a, JINGLE_TREASURE_FOUND                 ; $5162: $3E $01
    ldh  [hJingle], a                             ; $5164: $E0 $F2
    ldh  a, [hLinkPositionX]                      ; $5166: $F0 $98
    ld   a, ENTITY_BUZZ_BLOB                      ; $5168: $3E $B9
    call SpawnNewEntity_trampoline                ; $516A: $CD $86 $3B
    ldh  a, [hLinkPositionX]                      ; $516D: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $516F: $21 $00 $C2
    add  hl, de                                   ; $5172: $19
    ld   [hl], a                                  ; $5173: $77
    ldh  a, [hLinkPositionY]                      ; $5174: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $5176: $21 $10 $C2
    add  hl, de                                   ; $5179: $19
    ld   [hl], a                                  ; $517A: $77
    ld   hl, wEntitiesPrivateState2Table          ; $517B: $21 $C0 $C2
    add  hl, bc                                   ; $517E: $09
    ld   a, [hl]                                  ; $517F: $7E
    ld   hl, wEntitiesPrivateState2Table          ; $5180: $21 $C0 $C2
    add  hl, de                                   ; $5183: $19
    ld   [hl], a                                  ; $5184: $77
    call func_036_5153                            ; $5185: $CD $53 $51
    ld   a, $60                                   ; $5188: $3E $60
    call func_036_6C83                            ; $518A: $CD $83 $6C
    ld   hl, wEntitiesPrivateState3Table          ; $518D: $21 $D0 $C2
    add  hl, bc                                   ; $5190: $09
    ld   [hl], e                                  ; $5191: $73
    call IncrementEntityState                     ; $5192: $CD $12 $3B
    ret                                           ; $5195: $C9

TunicFairyState4::
    call func_036_5153                            ; $5196: $CD $53 $51
    call GetEntityTransitionCountdown             ; $5199: $CD $05 $0C
    ret  nz                                       ; $519C: $C0

    call_open_dialog Dialog26B                    ; $519D
    call IncrementEntityState                     ; $51A2: $CD $12 $3B
    ret                                           ; $51A5: $C9

TunicFairyState5::
    ld   a, $02                                   ; $51A6: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $51A8: $E0 $A1
    ld   [wC167], a                               ; $51AA: $EA $67 $C1
    call func_036_5153                            ; $51AD: $CD $53 $51
    ld   a, [wDialogState]                        ; $51B0: $FA $9F $C1
    and  a                                        ; $51B3: $A7
    ret  nz                                       ; $51B4: $C0

    ld   hl, wEntitiesPrivateState3Table          ; $51B5: $21 $D0 $C2
    add  hl, bc                                   ; $51B8: $09
    ld   [hl], $00                                ; $51B9: $36 $00
    call IncrementEntityState                     ; $51BB: $CD $12 $3B
    ret                                           ; $51BE: $C9

Data_036_51BF::
    db   $00, $08, $10, $18, $01, $09, $11, $19, $02, $0A, $12, $1A, $03, $0B, $13, $1B
    db   $04, $0C, $14, $1C, $05, $0D, $15, $1D, $06, $0E, $16, $1E, $07, $0F, $17, $1F

func_036_51DF::
    ld   a, $07                                   ; $51DF: $3E $07
    ldh  [hAnimatedTilesGroup], a                 ; $51E1: $E0 $A4
    ld   hl, wEntitiesPrivateState3Table          ; $51E3: $21 $D0 $C2
    add  hl, bc                                   ; $51E6: $09
    ld   e, [hl]                                  ; $51E7: $5E
    ld   d, $00                                   ; $51E8: $16 $00
    ld   hl, Data_036_51BF                        ; $51EA: $21 $BF $51
    add  hl, de                                   ; $51ED: $19
    ld   e, [hl]                                  ; $51EE: $5E
    ld   hl, wDCC0                                ; $51EF: $21 $C0 $DC
    add  hl, de                                   ; $51F2: $19
    ld   [hl], $00                                ; $51F3: $36 $00
    ret                                           ; $51F5: $C9

func_036_51F6::
    ldh  a, [hMultiPurpose0]                      ; $51F6: $F0 $D7
    inc  a                                        ; $51F8: $3C
    bit  5, a                                     ; $51F9: $CB $6F
    jr   z, .jr_51FF                              ; $51FB: $28 $02

    ld   a, $1F                                   ; $51FD: $3E $1F

.jr_51FF
    ldh  [hMultiPurpose0], a                      ; $51FF: $E0 $D7
    ldh  a, [hMultiPurpose1]                      ; $5201: $F0 $D8
    sub  $02                                      ; $5203: $D6 $02
    and  a                                        ; $5205: $A7
    jr   nz, .jr_520A                             ; $5206: $20 $02

    ld   a, $02                                   ; $5208: $3E $02

.jr_520A
    ldh  [hMultiPurpose1], a                      ; $520A: $E0 $D8
    ldh  a, [hMultiPurpose2]                      ; $520C: $F0 $D9
    sub  $04                                      ; $520E: $D6 $04
    cp   $14                                      ; $5210: $FE $14
    jr   nc, .jr_5216                             ; $5212: $30 $02

    ld   a, $14                                   ; $5214: $3E $14

.jr_5216
    ldh  [hMultiPurpose2], a                      ; $5216: $E0 $D9
    ret                                           ; $5218: $C9

func_036_5219::
    ldh  a, [hMultiPurpose0]                      ; $5219: $F0 $D7
    dec  a                                        ; $521B: $3D
    cp   $03                                      ; $521C: $FE $03
    jr   nc, .jr_5222                             ; $521E: $30 $02

    ld   a, $03                                   ; $5220: $3E $03

.jr_5222
    ldh  [hMultiPurpose0], a                      ; $5222: $E0 $D7
    ldh  a, [hMultiPurpose1]                      ; $5224: $F0 $D8
    bit  5, a                                     ; $5226: $CB $6F
    jr   nz, .jr_5234                             ; $5228: $20 $0A

    add  $02                                      ; $522A: $C6 $02
    cp   $20                                      ; $522C: $FE $20
    jr   c, jr_036_523C                           ; $522E: $38 $0C

    ld   a, $20                                   ; $5230: $3E $20
    jr   jr_036_523C                              ; $5232: $18 $08

.jr_5234
    sub  $02                                      ; $5234: $D6 $02
    cp   $20                                      ; $5236: $FE $20
    jr   nc, jr_036_523C                          ; $5238: $30 $02

    ld   a, $20                                   ; $523A: $3E $20

jr_036_523C:
    ldh  [hMultiPurpose1], a                      ; $523C: $E0 $D8
    ldh  a, [hMultiPurpose2]                      ; $523E: $F0 $D9
    add  $04                                      ; $5240: $C6 $04
    bit  7, a                                     ; $5242: $CB $7F
    jr   z, .jr_5248                              ; $5244: $28 $02

    ld   a, $7C                                   ; $5246: $3E $7C

.jr_5248
    ldh  [hMultiPurpose2], a                      ; $5248: $E0 $D9
    ret                                           ; $524A: $C9

TunicFairyState6::
    ld   a, $02                                   ; $524B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $524D: $E0 $A1
    ld   [wC167], a                               ; $524F: $EA $67 $C1
    ldh  a, [hFrameCounter]                       ; $5252: $F0 $E7
    and  $03                                      ; $5254: $E6 $03
    ret  nz                                       ; $5256: $C0

    ld   hl, wEntitiesPrivateState3Table          ; $5257: $21 $D0 $C2
    add  hl, bc                                   ; $525A: $09
    inc  [hl]                                     ; $525B: $34
    ld   hl, wObjPal1 + 2*2                       ; $525C: $21 $54 $DC
    ld   a, [wTunicType]                          ; $525F: $FA $0F $DC
    and  a                                        ; $5262: $A7
    jr   z, .jr_526E                              ; $5263: $28 $09

    inc  a                                        ; $5265: $3C
    swap a                                        ; $5266: $CB $37
    srl  a                                        ; $5268: $CB $3F
    ld   e, a                                     ; $526A: $5F
    ld   d, $00                                   ; $526B: $16 $00
    add  hl, de                                   ; $526D: $19

.jr_526E
    push hl                                       ; $526E: $E5
    ld   a, [hl]                                  ; $526F: $7E
    and  $1F                                      ; $5270: $E6 $1F
    ldh  [hMultiPurpose0], a                      ; $5272: $E0 $D7
    ld   a, [hl+]                                 ; $5274: $2A
    and  $E0                                      ; $5275: $E6 $E0
    swap a                                        ; $5277: $CB $37
    ld   e, a                                     ; $5279: $5F
    ld   a, [hl]                                  ; $527A: $7E
    and  $03                                      ; $527B: $E6 $03
    swap a                                        ; $527D: $CB $37
    or   e                                        ; $527F: $B3
    ldh  [hMultiPurpose1], a                      ; $5280: $E0 $D8
    ld   a, [hl]                                  ; $5282: $7E
    and  $7C                                      ; $5283: $E6 $7C
    ldh  [hMultiPurpose2], a                      ; $5285: $E0 $D9
    ld   hl, wEntitiesPrivateState2Table          ; $5287: $21 $C0 $C2
    add  hl, bc                                   ; $528A: $09
    ld   a, [hl]                                  ; $528B: $7E
    and  a                                        ; $528C: $A7
    jr   nz, .jr_5294                             ; $528D: $20 $05

    call func_036_51F6                            ; $528F: $CD $F6 $51
    jr   jr_036_5297                              ; $5292: $18 $03

.jr_5294
    call func_036_5219                            ; $5294: $CD $19 $52

jr_036_5297:
    pop  hl                                       ; $5297: $E1
    ldh  a, [hMultiPurpose0]                      ; $5298: $F0 $D7
    ld   e, a                                     ; $529A: $5F
    ldh  a, [hMultiPurpose1]                      ; $529B: $F0 $D8
    and  $0E                                      ; $529D: $E6 $0E
    swap a                                        ; $529F: $CB $37
    or   e                                        ; $52A1: $B3
    ld   [hl+], a                                 ; $52A2: $22
    ldh  a, [hMultiPurpose1]                      ; $52A3: $F0 $D8
    and  $30                                      ; $52A5: $E6 $30
    swap a                                        ; $52A7: $CB $37
    ld   e, a                                     ; $52A9: $5F
    ldh  a, [hMultiPurpose2]                      ; $52AA: $F0 $D9
    or   e                                        ; $52AC: $B3
    ld   [hl], a                                  ; $52AD: $77
    ld   a, $02                                   ; $52AE: $3E $02
    ld   [wPaletteDataFlags], a                   ; $52B0: $EA $D1 $DD
    call func_036_51DF                            ; $52B3: $CD $DF $51
    ld   hl, wEntitiesPrivateState3Table          ; $52B6: $21 $D0 $C2
    add  hl, bc                                   ; $52B9: $09
    ld   a, [hl]                                  ; $52BA: $7E
    cp   $20                                      ; $52BB: $FE $20
    ret  nz                                       ; $52BD: $C0

    ld   hl, wEntitiesPrivateState2Table          ; $52BE: $21 $C0 $C2
    add  hl, bc                                   ; $52C1: $09
    ld   a, [hl]                                  ; $52C2: $7E
    inc  a                                        ; $52C3: $3C
    ld   [wTunicType], a                          ; $52C4: $EA $0F $DC
    ld   hl, wEntitiesPrivateState3Table          ; $52C7: $21 $D0 $C2
    add  hl, bc                                   ; $52CA: $09
    ld   e, [hl]                                  ; $52CB: $5E
    ld   d, $00                                   ; $52CC: $16 $00
    ld   hl, wEntitiesPrivateState1Table          ; $52CE: $21 $B0 $C2
    add  hl, de                                   ; $52D1: $19
    ld   [hl], $01                                ; $52D2: $36 $01
    call IncrementEntityState                     ; $52D4: $CD $12 $3B
    ret                                           ; $52D7: $C9

TunicFairyState7::
    ld   a, $02                                   ; $52D8: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $52DA: $E0 $A1
    ld   [wC167], a                               ; $52DC: $EA $67 $C1
    ld   a, [wDialogState]                        ; $52DF: $FA $9F $C1
    and  a                                        ; $52E2: $A7
    ret  nz                                       ; $52E3: $C0

    xor  a                                        ; $52E4: $AF
    ldh  [hAnimatedTilesGroup], a                 ; $52E5: $E0 $A4
    ld_dialog_low e, Dialog25B ; "got the Red Clothes" ; $52E7: $1E $5B
    ld   a, [wTunicType]                          ; $52E9: $FA $0F $DC
    cp   $01                                      ; $52EC: $FE $01
    jr   z, .jr_52F2                              ; $52EE: $28 $02

    ld_dialog_low e, Dialog25A ; "got the Blue Clothes" ; $52F0: $1E $5A

.jr_52F2
    ld   a, e                                     ; $52F2: $7B
    call OpenDialogInTable2                       ; $52F3: $CD $7C $23
    call IncrementEntityState                     ; $52F6: $CD $12 $3B
    ret                                           ; $52F9: $C9

TunicFairyState8::
    ld   a, $02                                   ; $52FA: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $52FC: $E0 $A1
    ld   [wC167], a                               ; $52FE: $EA $67 $C1
    ld   a, [wDialogState]                        ; $5301: $FA $9F $C1
    and  a                                        ; $5304: $A7
    ret  nz                                       ; $5305: $C0

    ldh  a, [hFrameCounter]                       ; $5306: $F0 $E7
    and  $03                                      ; $5308: $E6 $03
    ret  nz                                       ; $530A: $C0

    ld   hl, wEntitiesPrivateState1Table          ; $530B: $21 $B0 $C2
    add  hl, bc                                   ; $530E: $09
    push hl                                       ; $530F: $E5
    ld   a, $36                                   ; $5310: $3E $36
    call func_020_6D52_trampoline                 ; $5312: $CD $83 $0A
    pop  hl                                       ; $5315: $E1
    inc  [hl]                                     ; $5316: $34
    ld   a, [hl]                                  ; $5317: $7E
    cp   $60                                      ; $5318: $FE $60
    ret  nz                                       ; $531A: $C0

    xor  a                                        ; $531B: $AF
    ld   [hl], a                                  ; $531C: $77
    ldh  [hBaseScrollX], a                        ; $531D: $E0 $96
    ldh  [hBaseScrollY], a                        ; $531F: $E0 $97
    ld   [wBGOriginLow], a                        ; $5321: $EA $2F $C1
    ld   [wBGOriginHigh], a                       ; $5324: $EA $2E $C1
    ld   hl, wLCDControl                          ; $5327: $21 $FD $D6
    res  5, [hl]                                  ; $532A: $CB $AE
    call IncrementEntityState                     ; $532C: $CD $12 $3B
    ret                                           ; $532F: $C9

Data_036_5330::
    db   $98, $00, $53, $7F, $98, $20, $53, $7F, $98, $40, $53, $7F, $98, $60, $53, $7F
    db   $98, $80, $53, $7F, $98, $A0, $53, $7F, $98, $C0, $53, $7F, $98, $E0, $53, $7F
    db   $99, $00, $53, $7F, $99, $20, $53, $7F, $99, $40, $53, $7F, $99, $60, $53, $7F
    db   $99, $80, $53, $7F, $99, $A0, $53, $7F, $99, $C0, $53, $7F, $99, $E0, $53, $7F
    db   $9A, $00, $53, $7F, $9A, $20, $53, $7F

Data_036_5378::
    db   $98, $00, $53, $00, $98, $20, $53, $00, $98, $40, $53, $00, $98, $60, $53, $00
    db   $98, $80, $53, $00, $98, $A0, $53, $00, $98, $C0, $53, $00, $98, $E0, $53, $00
    db   $99, $00, $53, $00, $99, $20, $53, $00, $99, $40, $53, $00, $99, $60, $53, $00
    db   $99, $80, $53, $00, $99, $A0, $53, $00, $99, $C0, $53, $00, $99, $E0, $53, $00
    db   $9A, $00, $53, $00, $9A, $20, $53, $00

TunicFairyState9::
    call func_036_5153                            ; $53C0: $CD $53 $51
    push bc                                       ; $53C3: $C5
    ld   hl, wEntitiesPrivateState1Table          ; $53C4: $21 $B0 $C2
    add  hl, bc                                   ; $53C7: $09
    ld   c, [hl]                                  ; $53C8: $4E
    sla  c                                        ; $53C9: $CB $21
    sla  c                                        ; $53CB: $CB $21
    sla  c                                        ; $53CD: $CB $21
    ld   hl, Data_036_5330                        ; $53CF: $21 $30 $53

.jr_53D2
    add  hl, bc                                   ; $53D2: $09
    ld   c, l                                     ; $53D3: $4D
    ld   b, h                                     ; $53D4: $44
    ld   a, [wDrawCommandsSize]                   ; $53D5: $FA $00 $D6
    ld   e, a                                     ; $53D8: $5F
    add  $08                                      ; $53D9: $C6 $08
    ld   [wDrawCommandsSize], a                   ; $53DB: $EA $00 $D6
    ld   d, $00                                   ; $53DE: $16 $00
    ld   hl, wDrawCommand                         ; $53E0: $21 $01 $D6
    add  hl, de                                   ; $53E3: $19
    ld   e, $08                                   ; $53E4: $1E $08

.loop_53E6
    ld   a, [bc]                                  ; $53E6: $0A
    inc  bc                                       ; $53E7: $03
    ld   [hl+], a                                 ; $53E8: $22
    dec  e                                        ; $53E9: $1D
    jr   nz, .loop_53E6                           ; $53EA: $20 $FA

    ld   [hl], $00                                ; $53EC: $36 $00
    pop  bc                                       ; $53EE: $C1
    push bc                                       ; $53EF: $C5
    ld   hl, wEntitiesPrivateState1Table          ; $53F0: $21 $B0 $C2
    add  hl, bc                                   ; $53F3: $09
    ld   c, [hl]                                  ; $53F4: $4E
    sla  c                                        ; $53F5: $CB $21
    sla  c                                        ; $53F7: $CB $21
    sla  c                                        ; $53F9: $CB $21
    ld   hl, Data_036_5378                        ; $53FB: $21 $78 $53
    add  hl, bc                                   ; $53FE: $09
    ld   c, l                                     ; $53FF: $4D
    ld   b, h                                     ; $5400: $44
    ld   a, [wDrawCommandsAltSize]                ; $5401: $FA $90 $DC
    ld   e, a                                     ; $5404: $5F
    add  $08                                      ; $5405: $C6 $08
    ld   [wDrawCommandsAltSize], a                ; $5407: $EA $90 $DC
    ld   d, $00                                   ; $540A: $16 $00
    ld   hl, wDrawCommandAlt                      ; $540C: $21 $91 $DC
    add  hl, de                                   ; $540F: $19
    ld   e, $08                                   ; $5410: $1E $08

.loop_5412
    ld   a, [bc]                                  ; $5412: $0A
    inc  bc                                       ; $5413: $03
    ld   [hl+], a                                 ; $5414: $22
    dec  e                                        ; $5415: $1D
    jr   nz, .loop_5412                           ; $5416: $20 $FA

    ld   [hl], $00                                ; $5418: $36 $00
    pop  bc                                       ; $541A: $C1
    ld   hl, wEntitiesPrivateState1Table          ; $541B: $21 $B0 $C2
    add  hl, bc                                   ; $541E: $09
    inc  [hl]                                     ; $541F: $34
    ld   a, [hl]                                  ; $5420: $7E
    cp   $09                                      ; $5421: $FE $09
    ret  nz                                       ; $5423: $C0

    call IncrementEntityState                     ; $5424: $CD $12 $3B
    ret                                           ; $5427: $C9

TunicFairyStateA::
func_036_5428::
    ld   de, wBGPal2                              ; $5428: $11 $18 $DC
    ld   hl, rSVBK                                ; $542B: $21 $70 $FF
    di                                            ; $542E: $F3

.loop_542F
    ld   [hl], $02                                ; $542F: $36 $02
    ld   a, [de]                                  ; $5431: $1A
    ld   [hl], $00                                ; $5432: $36 $00
    ld   [de], a                                  ; $5434: $12
    inc  de                                       ; $5435: $13
    ld   a, e                                     ; $5436: $7B
    and  $07                                      ; $5437: $E6 $07
    jr   nz, .loop_542F                           ; $5439: $20 $F4

    ld   a, $01                                   ; $543B: $3E $01
    ld   [wPaletteDataFlags], a                   ; $543D: $EA $D1 $DD
    ei                                            ; $5440: $FB
    ld   a, $3A                                   ; $5441: $3E $3A
    ldh  [hLinkPositionY], a                      ; $5443: $E0 $99
    call_open_dialog Dialog26C                    ; $5445
    call IncrementEntityState                     ; $544A: $CD $12 $3B
    ret                                           ; $544D: $C9

TunicFairyStateB::
    call func_036_5153                            ; $544E: $CD $53 $51
    ld   a, [wDialogState]                        ; $5451: $FA $9F $C1
    and  a                                        ; $5454: $A7
    ret  nz                                       ; $5455: $C0

    call UnloadEntity                             ; $5456: $CD $8D $3F
    call disableMovementInTransition              ; $5459: $CD $9E $0C
    ret                                           ; $545C: $C9

func_036_545D::
    ld   a, [wHasToadstool]                       ; $545D: $FA $4B $DB
    and  a                                        ; $5460: $A7
    ret  nz                                       ; $5461: $C0

    ld   e, $00                                   ; $5462: $1E $00
    ld   d, e                                     ; $5464: $53

jr_036_5465:
    ld   hl, wEntitiesTypeTable                   ; $5465: $21 $A0 $C3
    add  hl, de                                   ; $5468: $19
    ld   a, [hl]                                  ; $5469: $7E
    cp   $86                                      ; $546A: $FE $86
    jr   nz, .jr_5475                             ; $546C: $20 $07

    ld   hl, wEntitiesStatusTable                 ; $546E: $21 $80 $C2
    add  hl, de                                   ; $5471: $19
    ld   a, [hl]                                  ; $5472: $7E
    and  a                                        ; $5473: $A7
    ret  nz                                       ; $5474: $C0

.jr_5475
    inc  de                                       ; $5475: $13
    ld   a, e                                     ; $5476: $7B
    and  $0F                                      ; $5477: $E6 $0F
    jr   nz, jr_036_5465                          ; $5479: $20 $EA

    ld   a, ENTITY_FLOATING_ITEM                  ; $547B: $3E $86
    call SpawnNewEntity_trampoline                ; $547D: $CD $86 $3B
    ret  c                                        ; $5480: $D8

    ld   hl, wEntitiesPosXTable                   ; $5481: $21 $00 $C2
    add  hl, de                                   ; $5484: $19
    ld   [hl], $20                                ; $5485: $36 $20
    call GetRandomByte                            ; $5487: $CD $0D $28
    and  $01                                      ; $548A: $E6 $01
    jr   z, .jr_5490                              ; $548C: $28 $02

    ld   [hl], $88                                ; $548E: $36 $88

.jr_5490
    ld   a, [hl]                                  ; $5490: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5491: $21 $40 $C2
    add  hl, de                                   ; $5494: $19
    ld   [hl], $0C                                ; $5495: $36 $0C
    bit  7, a                                     ; $5497: $CB $7F
    jr   z, .jr_549D                              ; $5499: $28 $02

    ld   [hl], $F4                                ; $549B: $36 $F4

.jr_549D
    ld   hl, wEntitiesPosYTable                   ; $549D: $21 $10 $C2
    add  hl, de                                   ; $54A0: $19
    ld   [hl], $18                                ; $54A1: $36 $18
    ld   hl, wEntitiesSpeedYTable                 ; $54A3: $21 $50 $C2
    add  hl, de                                   ; $54A6: $19
    ld   [hl], $0C                                ; $54A7: $36 $0C
    ld   hl, wEntitiesPosZTable                   ; $54A9: $21 $10 $C3
    add  hl, de                                   ; $54AC: $19
    ld   [hl], $10                                ; $54AD: $36 $10
    ret                                           ; $54AF: $C9

func_036_54B0::
    ld   a, [wDialogState]                        ; $54B0: $FA $9F $C1
    and  a                                        ; $54B3: $A7
    ret  nz                                       ; $54B4: $C0

    ld   a, [wHasToadstool]                       ; $54B5: $FA $4B $DB
    and  a                                        ; $54B8: $A7
    ret  z                                        ; $54B9: $C8

    ld   a, [wBButtonSlot]                        ; $54BA: $FA $00 $DB
    cp   INVENTORY_MAGIC_POWDER                   ; $54BD: $FE $0C
    jr   nz, .jr_54C8                             ; $54BF: $20 $07

    ldh  a, [hJoypadState]                        ; $54C1: $F0 $CC
    and  J_B                                      ; $54C3: $E6 $20
    ret  z                                        ; $54C5: $C8

    jr   jr_036_54D3                              ; $54C6: $18 $0B

.jr_54C8
    ld   a, [wAButtonSlot]                        ; $54C8: $FA $01 $DB
    cp   INVENTORY_MAGIC_POWDER                   ; $54CB: $FE $0C
    ret  nz                                       ; $54CD: $C0

    ldh  a, [hJoypadState]                        ; $54CE: $F0 $CC
    and  J_A                                      ; $54D0: $E6 $10
    ret  z                                        ; $54D2: $C8

jr_036_54D3:
    ld   hl, wEntitiesHealthTable                 ; $54D3: $21 $60 $C3
    add  hl, bc                                   ; $54D6: $09
    ld   [hl], $00                                ; $54D7: $36 $00
    ld   hl, wEntitiesStatusTable                 ; $54D9: $21 $80 $C2
    add  hl, bc                                   ; $54DC: $09
    ld   a, $01                                   ; $54DD: $3E $01
    ld   [hl], a                                  ; $54DF: $77
    pop  af                                       ; $54E0: $F1
    ret                                           ; $54E1: $C9

GiantBuzzBlobEntityHandler::
    call label_394D                               ; $54E2: $CD $4D $39
    ld   a, c                                     ; $54E5: $79
    ld   [wD202], a                               ; $54E6: $EA $02 $D2
    call func_036_5844                            ; $54E9: $CD $44 $58
    ldh  a, [hActiveEntityStatus]                 ; $54EC: $F0 $EA
    cp   $05                                      ; $54EE: $FE $05
    jp   nz, label_036_5C3C                       ; $54F0: $C2 $3C $5C

    ld   a, [wMagicPowderCount]                   ; $54F3: $FA $4C $DB
    and  a                                        ; $54F6: $A7
    jr   nz, .jr_54FE                             ; $54F7: $20 $05

    push bc                                       ; $54F9: $C5
    call func_036_545D                            ; $54FA: $CD $5D $54
    pop  bc                                       ; $54FD: $C1

.jr_54FE
    call BossIntro                                ; $54FE: $CD $E8 $3E
    call DecrementEntityIgnoreHitsCountdown       ; $5501: $CD $56 $0C
    call ReturnIfNonInteractive_36                ; $5504: $CD $40 $6A
    ldh  a, [hActiveEntityState]                  ; $5507: $F0 $F0
    cp   $03                                      ; $5509: $FE $03
    jr   c, .jr_5510                              ; $550B: $38 $03

    call func_036_54B0                            ; $550D: $CD $B0 $54

.jr_5510
    ldh  a, [hActiveEntityState]                  ; $5510: $F0 $F0
    JP_TABLE                                      ; $5512
._00 dw func_036_5537                             ; $5513
._01 dw func_036_5561                             ; $5515
._02 dw func_036_5575                             ; $5517
._03 dw AvalaunchState1Handler                             ; $5519
._04 dw func_036_558E                             ; $551B
._05 dw func_036_55B1                             ; $551D
._06 dw func_036_5721                             ; $551F
._07 dw AvalaunchState1Handler                             ; $5521
._08 dw func_036_573E                             ; $5523
._09 dw func_036_578F                             ; $5525
._0A dw func_036_57AF                             ; $5527
._0B dw func_036_57C8                             ; $5529

AvalaunchState1Handler::
    ld   a, $01                                   ; $552B: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $552D: $E0 $A1
    call GetEntityTransitionCountdown             ; $552F: $CD $05 $0C
    ret  nz                                       ; $5532: $C0

    call IncrementEntityState                     ; $5533: $CD $12 $3B
    ret                                           ; $5536: $C9

func_036_5537::
    ld   a, [wC190]                               ; $5537: $FA $90 $C1
    and  a                                        ; $553A: $A7
    ret  z                                        ; $553B: $C8

    xor  a                                        ; $553C: $AF
    ld   hl, wEntitiesPrivateState1Table          ; $553D: $21 $B0 $C2
    add  hl, bc                                   ; $5540: $09
    ld   [hl], a                                  ; $5541: $77
    ld   a, $02                                   ; $5542: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5544: $E0 $A1
    ld   [wC167], a                               ; $5546: $EA $67 $C1
    ldh  a, [hFrameCounter]                       ; $5549: $F0 $E7
    and  $07                                      ; $554B: $E6 $07
    ret  nz                                       ; $554D: $C0

    call PointHLToEntitySpriteVariant             ; $554E: $CD $02 $6C
    inc  [hl]                                     ; $5551: $34
    ld   a, [hl]                                  ; $5552: $7E
    cp   $04                                      ; $5553: $FE $04
    ret  c                                        ; $5555: $D8

    xor  a                                        ; $5556: $AF
    ld   [hl], a                                  ; $5557: $77
    ld   a, $20                                   ; $5558: $3E $20
    call func_036_6C83                            ; $555A: $CD $83 $6C
    call IncrementEntityState                     ; $555D: $CD $12 $3B
    ret                                           ; $5560: $C9

func_036_5561::
    ld   a, $02                                   ; $5561: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5563: $E0 $A1
    ld   [wC167], a                               ; $5565: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $5568: $CD $05 $0C
    ret  nz                                       ; $556B: $C0

    call_open_dialog Dialog261                    ; $556C
    call IncrementEntityState                     ; $5571: $CD $12 $3B
    ret                                           ; $5574: $C9

func_036_5575::
    ld   a, $02                                   ; $5575: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5577: $E0 $A1
    ld   [wC167], a                               ; $5579: $EA $67 $C1
    ld   a, [wDialogState]                        ; $557C: $FA $9F $C1
    and  a                                        ; $557F: $A7
    ret  nz                                       ; $5580: $C0

    ld   a, $20                                   ; $5581: $3E $20
    call func_036_6C83                            ; $5583: $CD $83 $6C
    xor  a                                        ; $5586: $AF
    ld   [wC167], a                               ; $5587: $EA $67 $C1
    call IncrementEntityState                     ; $558A: $CD $12 $3B
    ret                                           ; $558D: $C9

func_036_558E::
    ld   a, $01                                   ; $558E: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5590: $E0 $A1
    ldh  a, [hFrameCounter]                       ; $5592: $F0 $E7
    and  $03                                      ; $5594: $E6 $03
    ret  nz                                       ; $5596: $C0

    call PointHLToEntitySpriteVariant             ; $5597: $CD $02 $6C
    inc  [hl]                                     ; $559A: $34
    ld   a, [hl]                                  ; $559B: $7E
    cp   $0B                                      ; $559C: $FE $0B
    ret  nz                                       ; $559E: $C0

    xor  a                                        ; $559F: $AF
    ld   [hl], a                                  ; $55A0: $77
    call IncrementEntityState                     ; $55A1: $CD $12 $3B
    ret                                           ; $55A4: $C9

Data_036_55A5::
    db   $FA, $FC

Data_036_55A7::
    db   $00, $04, $06, $04, $00, $FC, $FA, $FC

Data_036_55AF::
    db   $1C, $10

func_036_55B1::
    ld   a, [wDialogState]                        ; $55B1: $FA $9F $C1
    and  a                                        ; $55B4: $A7
    ret  nz                                       ; $55B5: $C0

    ld   hl, wEntitiesPrivateState1Table          ; $55B6: $21 $B0 $C2
    add  hl, bc                                   ; $55B9: $09
    ld   a, [hl]                                  ; $55BA: $7E
    and  a                                        ; $55BB: $A7
    jr   z, .jr_55E0                              ; $55BC: $28 $22

    call PointHLToEntitySpriteVariant             ; $55BE: $CD $02 $6C
    ld   a, [hl]                                  ; $55C1: $7E
    and  $01                                      ; $55C2: $E6 $01
    jr   nz, .jr_55E0                             ; $55C4: $20 $1A

    ld   [hl], a                                  ; $55C6: $77
    call PointHLToEntitySpeedX                    ; $55C7: $CD $EE $6B
    ld   [hl], a                                  ; $55CA: $77
    call PointHLToEntitySpeedY                    ; $55CB: $CD $F3 $6B
    ld   [hl], a                                  ; $55CE: $77
    ld   hl, wEntitiesPrivateState3Table          ; $55CF: $21 $D0 $C2
    add  hl, bc                                   ; $55D2: $09
    ld   [hl], $01                                ; $55D3: $36 $01
    ld   a, $20                                   ; $55D5: $3E $20
    call func_036_6C83                            ; $55D7: $CD $83 $6C
    ld   a, $07                                   ; $55DA: $3E $07
    call SetEntityState                           ; $55DC: $CD $07 $6C
    ret                                           ; $55DF: $C9

.jr_55E0
    call GetEntityTransitionCountdown             ; $55E0: $CD $05 $0C
    jr   nz, .jr_5603                             ; $55E3: $20 $1E

    call GetRandomByte                            ; $55E5: $CD $0D $28
    and  $3F                                      ; $55E8: $E6 $3F
    add  $30                                      ; $55EA: $C6 $30
    ld   [hl], a                                  ; $55EC: $77
    and  $07                                      ; $55ED: $E6 $07
    ld   e, a                                     ; $55EF: $5F
    ld   d, b                                     ; $55F0: $50
    ld   hl, Data_036_55A7                        ; $55F1: $21 $A7 $55
    add  hl, de                                   ; $55F4: $19
    ld   a, [hl]                                  ; $55F5: $7E
    call PointHLToEntitySpeedX                    ; $55F6: $CD $EE $6B
    ld   [hl], a                                  ; $55F9: $77
    ld   hl, Data_036_55A5                        ; $55FA: $21 $A5 $55
    add  hl, de                                   ; $55FD: $19
    ld   a, [hl]                                  ; $55FE: $7E
    call PointHLToEntitySpeedY                    ; $55FF: $CD $F3 $6B
    ld   [hl], a                                  ; $5602: $77

.jr_5603
    call UpdateEntityPosWithSpeed_36              ; $5603: $CD $62 $6A
    ld   de, Data_036_55AF                        ; $5606: $11 $AF $55
    call func_036_6C90                            ; $5609: $CD $90 $6C
    ld   hl, wEntitiesStateTable                  ; $560C: $21 $90 $C2
    add  hl, bc                                   ; $560F: $09
    ld   e, [hl]                                  ; $5610: $5E
    ld   hl, wEntitiesHealthTable                 ; $5611: $21 $60 $C3
    add  hl, bc                                   ; $5614: $09
    ld   d, [hl]                                  ; $5615: $56
    push de                                       ; $5616: $D5
    ld   [hl], $0F                                ; $5617: $36 $0F
    call label_3B39                               ; $5619: $CD $39 $3B
    pop  de                                       ; $561C: $D1
    ld   hl, wEntitiesHealthTable                 ; $561D: $21 $60 $C3
    add  hl, bc                                   ; $5620: $09
    ld   [hl], d                                  ; $5621: $72
    ld   hl, wEntitiesStateTable                  ; $5622: $21 $90 $C2
    add  hl, bc                                   ; $5625: $09
    ld   [hl], e                                  ; $5626: $73
    ld   hl, wEntitiesStatusTable                 ; $5627: $21 $80 $C2
    add  hl, bc                                   ; $562A: $09
    ld   [hl], $05                                ; $562B: $36 $05
    ld   hl, wEntitiesFlashCountdownTable         ; $562D: $21 $20 $C4
    add  hl, bc                                   ; $5630: $09
    ld   a, [hl]                                  ; $5631: $7E
    and  a                                        ; $5632: $A7
    jr   z, jr_036_5673                           ; $5633: $28 $3E

    xor  a                                        ; $5635: $AF
    ld   [hl], a                                  ; $5636: $77
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $5637: $21 $10 $C4
    add  hl, bc                                   ; $563A: $09
    ld   [hl], a                                  ; $563B: $77
    ld   a, [wC16E]                               ; $563C: $FA $6E $C1
    ld   hl, wSwordAnimationState                 ; $563F: $21 $37 $C1
    or   [hl]                                     ; $5642: $B6
    ld   hl, wActiveProjectileCount               ; $5643: $21 $4D $C1
    or   [hl]                                     ; $5646: $B6
    and  a                                        ; $5647: $A7
    jr   nz, .jr_5652                             ; $5648: $20 $08

    ld   hl, wEntitiesPrivateState1Table          ; $564A: $21 $B0 $C2
    add  hl, bc                                   ; $564D: $09
    ld   [hl], $01                                ; $564E: $36 $01
    jr   jr_036_5673                              ; $5650: $18 $21

.jr_5652
    ld   hl, wEntitiesPrivateState3Table          ; $5652: $21 $D0 $C2
    add  hl, bc                                   ; $5655: $09
    ld   a, [hl]                                  ; $5656: $7E
    and  a                                        ; $5657: $A7
    jr   nz, .jr_5661                             ; $5658: $20 $07

    ld   [hl], $01                                ; $565A: $36 $01
    call_open_dialog Dialog269                    ; $565C

.jr_5661
    ld   a, $10                                   ; $5661: $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $5663: $EA $3E $C1
    ld   a, $20                                   ; $5666: $3E $20
    call GetVectorTowardsLink_trampoline          ; $5668: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $566B: $F0 $D7
    ldh  [hLinkSpeedY], a                         ; $566D: $E0 $9B
    ldh  a, [hMultiPurpose1]                      ; $566F: $F0 $D8
    ldh  [hLinkSpeedX], a                         ; $5671: $E0 $9A

jr_036_5673:
    ldh  a, [hFrameCounter]                       ; $5673: $F0 $E7
    and  $0F                                      ; $5675: $E6 $0F
    ret  nz                                       ; $5677: $C0

    call PointHLToEntitySpriteVariant             ; $5678: $CD $02 $6C
    inc  [hl]                                     ; $567B: $34
    ld   a, [hl]                                  ; $567C: $7E
    cp   $04                                      ; $567D: $FE $04
    ret  nz                                       ; $567F: $C0

    xor  a                                        ; $5680: $AF
    ld   [hl], a                                  ; $5681: $77
    call GetRandomByte                            ; $5682: $CD $0D $28
    and  $03                                      ; $5685: $E6 $03
    ret  nz                                       ; $5687: $C0

    call IncrementEntityState                     ; $5688: $CD $12 $3B
    ret                                           ; $568B: $C9

Data_036_568C::
    db   $F8, $00, $E0, $F4, $02, $10, $0C, $FC, $00, $06, $F8, $00, $12, $0C, $02, $E0
    db   $F4, $FC, $00, $06

Data_036_56A0::
    db   $10, $0C, $E2, $F4, $00, $10, $0C, $10, $0C, $04, $E0, $F4, $10, $0C, $00, $E0
    db   $F4, $E2, $F4, $04

func_036_56B4::
    ld   hl, wEntitiesPrivateState2Table          ; $56B4: $21 $C0 $C2
    add  hl, bc                                   ; $56B7: $09
    inc  [hl]                                     ; $56B8: $34
    ld   a, [hl]                                  ; $56B9: $7E
    ld   hl, Data_036_568C                        ; $56BA: $21 $8C $56
    and  $01                                      ; $56BD: $E6 $01
    jr   nz, .jr_56C4                             ; $56BF: $20 $03

    ld   hl, Data_036_56A0                        ; $56C1: $21 $A0 $56

.jr_56C4
    call func_036_56CD                            ; $56C4: $CD $CD $56
    call func_036_56CD                            ; $56C7: $CD $CD $56
    call func_036_56CD                            ; $56CA: $CD $CD $56

func_036_56CD::
    push hl                                       ; $56CD: $E5
    ld   a, ENTITY_BOUNCING_BOULDER               ; $56CE: $3E $F5
    call SpawnNewEntity_trampoline                ; $56D0: $CD $86 $3B
    pop  hl                                       ; $56D3: $E1
    ret  c                                        ; $56D4: $D8

    push hl                                       ; $56D5: $E5
    ld   hl, wEntitiesStateTable                  ; $56D6: $21 $90 $C2
    add  hl, de                                   ; $56D9: $19
    ld   [hl], $02                                ; $56DA: $36 $02
    call PointHLToEntityPosX                      ; $56DC: $CD $23 $6C
    ld   a, [hl]                                  ; $56DF: $7E
    pop  hl                                       ; $56E0: $E1
    add  [hl]                                     ; $56E1: $86
    inc  hl                                       ; $56E2: $23
    push hl                                       ; $56E3: $E5
    ld   hl, wEntitiesPosXTable                   ; $56E4: $21 $00 $C2
    add  hl, de                                   ; $56E7: $19
    ld   [hl], a                                  ; $56E8: $77
    pop  hl                                       ; $56E9: $E1
    ld   a, [hl+]                                 ; $56EA: $2A
    push hl                                       ; $56EB: $E5
    ld   hl, wEntitiesSpeedXTable                 ; $56EC: $21 $40 $C2
    add  hl, de                                   ; $56EF: $19
    ld   [hl], a                                  ; $56F0: $77
    call PointHLToEntityPosY                      ; $56F1: $CD $28 $6C
    ld   a, [hl]                                  ; $56F4: $7E
    pop  hl                                       ; $56F5: $E1
    add  [hl]                                     ; $56F6: $86
    inc  hl                                       ; $56F7: $23
    push hl                                       ; $56F8: $E5
    ld   hl, wEntitiesPosYTable                   ; $56F9: $21 $10 $C2
    add  hl, de                                   ; $56FC: $19
    ld   [hl], a                                  ; $56FD: $77
    pop  hl                                       ; $56FE: $E1
    ld   a, [hl+]                                 ; $56FF: $2A
    push hl                                       ; $5700: $E5
    ld   hl, wEntitiesSpeedYTable                 ; $5701: $21 $50 $C2
    add  hl, de                                   ; $5704: $19
    ld   [hl], a                                  ; $5705: $77
    pop  hl                                       ; $5706: $E1
    ld   a, [hl+]                                 ; $5707: $2A
    push hl                                       ; $5708: $E5
    ld   hl, wEntitiesSpriteVariantTable          ; $5709: $21 $B0 $C3
    add  hl, de                                   ; $570C: $19
    ld   [hl], a                                  ; $570D: $77
    ld   hl, wEntitiesPrivateState1Table          ; $570E: $21 $B0 $C2
    add  hl, de                                   ; $5711: $19
    ld   [hl], a                                  ; $5712: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5713: $21 $40 $C3
    add  hl, de                                   ; $5716: $19
    ld   [hl], $12                                ; $5717: $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ; $5719: $21 $50 $C3
    add  hl, de                                   ; $571C: $19
    set  7, [hl]                                  ; $571D: $CB $FE
    pop  hl                                       ; $571F: $E1
    ret                                           ; $5720: $C9

func_036_5721::
    ldh  a, [hFrameCounter]                       ; $5721: $F0 $E7
    and  $03                                      ; $5723: $E6 $03
    ret  nz                                       ; $5725: $C0

    call PointHLToEntitySpriteVariant             ; $5726: $CD $02 $6C
    inc  [hl]                                     ; $5729: $34
    ld   a, [hl]                                  ; $572A: $7E
    cp   $03                                      ; $572B: $FE $03
    jr   z, .jr_5736                              ; $572D: $28 $07

    and  $01                                      ; $572F: $E6 $01
    ret  z                                        ; $5731: $C8

    call func_036_56B4                            ; $5732: $CD $B4 $56
    ret                                           ; $5735: $C9

.jr_5736
    xor  a                                        ; $5736: $AF
    ld   [hl], a                                  ; $5737: $77
    ld   a, $05                                   ; $5738: $3E $05
    call SetEntityState                           ; $573A: $CD $07 $6C
    ret                                           ; $573D: $C9

func_036_573E::
    ldh  a, [hFrameCounter]                       ; $573E: $F0 $E7
    and  $03                                      ; $5740: $E6 $03
    ret  nz                                       ; $5742: $C0

    call PointHLToEntitySpriteVariant             ; $5743: $CD $02 $6C
    inc  [hl]                                     ; $5746: $34
    ld   a, [hl]                                  ; $5747: $7E
    cp   $07                                      ; $5748: $FE $07
    ret  nz                                       ; $574A: $C0

    xor  a                                        ; $574B: $AF
    ld   [hl], a                                  ; $574C: $77
    call IncrementEntityState                     ; $574D: $CD $12 $3B
    ld   a, $F0                                   ; $5750: $3E $F0
    call func_036_6C83                            ; $5752: $CD $83 $6C
    ret                                           ; $5755: $C9

func_036_5756::
    ld   de, Data_036_55AF                        ; $5756: $11 $AF $55
    call func_036_6C90                            ; $5759: $CD $90 $6C
    call label_3B39                               ; $575C: $CD $39 $3B
    ld   hl, wEntitiesFlashCountdownTable         ; $575F: $21 $20 $C4
    add  hl, bc                                   ; $5762: $09
    ld   a, [hl]                                  ; $5763: $7E
    and  a                                        ; $5764: $A7
    ret  z                                        ; $5765: $C8

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $5766: $21 $10 $C4
    add  hl, bc                                   ; $5769: $09
    ld   a, [hl]                                  ; $576A: $7E
    and  a                                        ; $576B: $A7
    ret  nz                                       ; $576C: $C0

    call PointHLToEntitySpriteVariant             ; $576D: $CD $02 $6C
    ld   a, [hl]                                  ; $5770: $7E
    and  a                                        ; $5771: $A7
    ret  nz                                       ; $5772: $C0

    ld   [hl], a                                  ; $5773: $77
    ld   hl, wEntitiesFlashCountdownTable         ; $5774: $21 $20 $C4
    add  hl, bc                                   ; $5777: $09
    ld   [hl], a                                  ; $5778: $77

func_036_5779::
    xor  a                                        ; $5779: $AF
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $577A: $21 $10 $C4
    add  hl, bc                                   ; $577D: $09
    ld   [hl], a                                  ; $577E: $77
    ld   hl, wEntitiesPrivateState1Table          ; $577F: $21 $B0 $C2
    add  hl, bc                                   ; $5782: $09
    ld   [hl], a                                  ; $5783: $77
    ld   a, $20                                   ; $5784: $3E $20
    call func_036_6C83                            ; $5786: $CD $83 $6C
    ld   a, $03                                   ; $5789: $3E $03
    call SetEntityState                           ; $578B: $CD $07 $6C
    ret                                           ; $578E: $C9

func_036_578F::
    ldh  a, [hFrameCounter]                       ; $578F: $F0 $E7
    and  $07                                      ; $5791: $E6 $07
    jr   nz, .jr_57AB                             ; $5793: $20 $16

    call PointHLToEntitySpriteVariant             ; $5795: $CD $02 $6C
    inc  [hl]                                     ; $5798: $34
    ld   a, [hl]                                  ; $5799: $7E
    cp   $02                                      ; $579A: $FE $02
    jr   nz, .jr_57AB                             ; $579C: $20 $0D

    ld   a, $08                                   ; $579E: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $57A0: $CD $AA $3B
    call PointHLToEntitySpeedZ                    ; $57A3: $CD $F8 $6B
    ld   [hl], $20                                ; $57A6: $36 $20
    call IncrementEntityState                     ; $57A8: $CD $12 $3B

.jr_57AB
    call func_036_5756                            ; $57AB: $CD $56 $57
    ret                                           ; $57AE: $C9

func_036_57AF::
    call UpdateEntityPosWithSpeed_36              ; $57AF: $CD $62 $6A
    call func_036_6AEC                            ; $57B2: $CD $EC $6A
    call PointHLToEntitySpeedZ                    ; $57B5: $CD $F8 $6B
    dec  [hl]                                     ; $57B8: $35
    call PointHLToEntityPosZ                      ; $57B9: $CD $2D $6C
    ld   a, [hl]                                  ; $57BC: $7E
    bit  7, a                                     ; $57BD: $CB $7F
    ret  z                                        ; $57BF: $C8

    call PointHLToEntitySpriteVariant             ; $57C0: $CD $02 $6C
    inc  [hl]                                     ; $57C3: $34
    call IncrementEntityState                     ; $57C4: $CD $12 $3B
    ret                                           ; $57C7: $C9

func_036_57C8::
    ldh  a, [hFrameCounter]                       ; $57C8: $F0 $E7
    and  $07                                      ; $57CA: $E6 $07
    jr   nz, .jr_57E6                             ; $57CC: $20 $18

    call PointHLToEntitySpriteVariant             ; $57CE: $CD $02 $6C
    inc  [hl]                                     ; $57D1: $34
    ld   a, [hl]                                  ; $57D2: $7E
    cp   $04                                      ; $57D3: $FE $04
    jr   nz, .jr_57E6                             ; $57D5: $20 $0F

    xor  a                                        ; $57D7: $AF
    ld   [hl], a                                  ; $57D8: $77
    ld   a, $09                                   ; $57D9: $3E $09
    call SetEntityState                           ; $57DB: $CD $07 $6C
    call GetEntityTransitionCountdown             ; $57DE: $CD $05 $0C
    jr   nz, .jr_57E6                             ; $57E1: $20 $03

    call func_036_5779                            ; $57E3: $CD $79 $57

.jr_57E6
    call func_036_5756                            ; $57E6: $CD $56 $57
    ret                                           ; $57E9: $C9

Data_036_57EA:
    dw   Data_020_6938
    dw   Data_020_6950
    dw   Data_020_6968
    dw   Data_020_6950

Data_036_57F2:
    dw   Data_020_6938
    dw   Data_020_6950
    dw   Data_020_6968
    dw   Data_020_6950
    dw   Data_020_6938
    dw   Data_020_6950
    dw   Data_020_6968
    dw   Data_020_6950
    dw   Data_020_6938
    dw   Data_020_6950
    dw   Data_020_6980

Data_036_5808:
    dw   Data_020_6980
    dw   Data_020_6998
    dw   Data_020_6980
    dw   Data_020_69B0

Data_036_5810:
    dw   Data_020_6980
    dw   Data_020_69C8
    dw   Data_020_6980

Data_036_5816:
    dw   Data_020_6980
    dw   Data_020_6950
    dw   Data_020_6938
    dw   Data_020_6950
    dw   Data_020_6968
    dw   Data_020_6950
    dw   Data_020_6938

Data_036_5824:
    dw   Data_020_6938
    dw   Data_020_6950
    dw   Data_020_6968
    dw   Data_020_6950

Data_036_582C::
    dw   Data_036_57EA
    dw   Data_036_57EA
    dw   Data_036_57EA
    dw   Data_036_57EA
    dw   Data_036_57F2
    dw   Data_036_5808
    dw   Data_036_5810
    dw   Data_036_5810
    dw   Data_036_5816
    dw   Data_036_5824
    dw   Data_036_5824
    dw   Data_036_5824

func_036_5844::
    ld   d, $00                                   ; $5844: $16 $00
    ldh  a, [hActiveEntityState]                  ; $5846: $F0 $F0
    sla  a                                        ; $5848: $CB $27
    ld   e, a                                     ; $584A: $5F
    ld   hl, Data_036_582C                        ; $584B: $21 $2C $58
    call func_036_6C7E                            ; $584E: $CD $7E $6C
    push hl                                       ; $5851: $E5
    call PointHLToEntitySpriteVariant             ; $5852: $CD $02 $6C

.jr_5855
    ld   e, [hl]                                  ; $5855: $5E
    sla  e                                        ; $5856: $CB $23
    pop  hl                                       ; $5858: $E1
    call func_036_6C7E                            ; $5859: $CD $7E $6C
    ld   c, $06                                   ; $585C: $0E $06
    ld   a, $36                                   ; $585E: $3E $36
    call func_A5F                                 ; $5860: $CD $5F $0A
    ld   a, $06                                   ; $5863: $3E $06

.jr_5865
    call func_015_7964_trampoline                 ; $5865: $CD $A0 $3D
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5868: $21 $40 $C3
    add  hl, bc                                   ; $586B: $09
    ld   a, [hl]                                  ; $586C: $7E

.jr_586D
    push af                                       ; $586D: $F5
    or   $10                                      ; $586E: $F6 $10

.jr_5870
    ld   [hl], a                                  ; $5870: $77
    push hl                                       ; $5871: $E5
    call label_3CD9                               ; $5872: $CD $D9 $3C
    pop  hl                                       ; $5875: $E1
    pop  af                                       ; $5876: $F1
    ld   [hl], a                                  ; $5877: $77
    ret                                           ; $5878: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
; list overlapps with next list
;
; For this list:
; - Variant 0 is a single sprite, rendered by RenderActiveEntitySprite
; - Variant 1 is a double sprite, rendered by RenderActiveEntitySpritesPair
DungeonBookSpriteVariants::
.variant0
    db   $58, OAM_GBC_PAL_2 | OAM_DMG_PAL_0       ; $5879: $58 $02
.variant1
    db   $5A, OAM_GBC_PAL_0 | OAM_DMG_PAL_0       ; $587B: $5A $00
    db   $5A, OAM_GBC_PAL_0 | OAM_DMG_PAL_0 | OAM_X_FLIP ; $587D: $5A $20

ColorDungeonBookEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ; $587F: $F0 $F1
    and  a                                        ; $5881: $A7
    jr   z, .renderVariant0                       ; $5882: $28 $08
    ; Variant 1: render a sprite pair
    ld   de, DungeonBookSpriteVariants - 2        ; $5884: $11 $77 $58
    call RenderActiveEntitySpritesPair            ; $5887: $CD $C0 $3B
    jr   .renderEnd                               ; $588A: $18 $06
.renderVariant0
    ; Variant 0: render a single sprite
    ld   de, DungeonBookSpriteVariants            ; $588C: $11 $79 $58
    call RenderActiveEntitySprite                 ; $588F: $CD $77 $3C
.renderEnd

    ldh  a, [hActiveEntityState]                  ; $5892: $F0 $F0
    JP_TABLE                                      ; $5894
._00 dw func_036_58A1                             ; $5895
._01 dw func_036_58B9                             ; $5897
._02 dw func_036_58B9                             ; $5899
._03 dw func_036_58E4                             ; $589B
._04 dw func_036_5912                             ; $589D
._05 dw func_036_5930                             ; $589F

func_036_58A1::
    ld   a, [wC157]                               ; $58A1: $FA $57 $C1
    and  a                                        ; $58A4: $A7
    jr   z, .ret_58B8                             ; $58A5: $28 $11

    cp   $05                                      ; $58A7: $FE $05
    jr   nc, .ret_58B8                            ; $58A9: $30 $0D

    call PointHLToEntitySpeedY                    ; $58AB: $CD $F3 $6B
    ld   [hl], $14                                ; $58AE: $36 $14
    call PointHLToEntitySpeedZ                    ; $58B0: $CD $F8 $6B
    ld   [hl], $10                                ; $58B3: $36 $10
    call IncrementEntityState                     ; $58B5: $CD $12 $3B

.ret_58B8
    ret                                           ; $58B8: $C9

func_036_58B9::
    call UpdateEntityPosWithSpeed_36              ; $58B9: $CD $62 $6A
    call func_036_6AEC                            ; $58BC: $CD $EC $6A
    ldh  a, [hFrameCounter]                       ; $58BF: $F0 $E7
    and  $01                                      ; $58C1: $E6 $01
    jr   z, .jr_58CD                              ; $58C3: $28 $08

    call PointHLToEntitySpeedY                    ; $58C5: $CD $F3 $6B
    ld   a, [hl]                                  ; $58C8: $7E
    and  a                                        ; $58C9: $A7
    jr   z, .jr_58CD                              ; $58CA: $28 $01

    dec  [hl]                                     ; $58CC: $35

.jr_58CD
    call PointHLToEntitySpeedZ                    ; $58CD: $CD $F8 $6B
    dec  [hl]                                     ; $58D0: $35
    call PointHLToEntityPosZ                      ; $58D1: $CD $2D $6C
    ld   a, [hl]                                  ; $58D4: $7E
    bit  7, a                                     ; $58D5: $CB $7F
    jr   z, .ret_58E3                             ; $58D7: $28 $0A

    xor  a                                        ; $58D9: $AF
    ld   [hl], a                                  ; $58DA: $77
    call PointHLToEntitySpeedZ                    ; $58DB: $CD $F8 $6B
    ld   [hl], $10                                ; $58DE: $36 $10
    call IncrementEntityState                     ; $58E0: $CD $12 $3B

.ret_58E3
    ret                                           ; $58E3: $C9

func_036_58E4::
    ld   a, [wDialogState]                        ; $58E4: $FA $9F $C1
    and  a                                        ; $58E7: $A7
    jr   nz, ret_036_5911                         ; $58E8: $20 $27

    call func_036_6B8A                            ; $58EA: $CD $8A $6B
    cp   $07                                      ; $58ED: $FE $07
    jr   nc, ret_036_5911                         ; $58EF: $30 $20

    call func_036_6B9A                            ; $58F1: $CD $9A $6B
    cp   $0B                                      ; $58F4: $FE $0B
    jr   nc, ret_036_5911                         ; $58F6: $30 $19

    ldh  a, [hLinkDirection]                      ; $58F8: $F0 $9E

.jr_58FA
    cp   $02                                      ; $58FA: $FE $02
    jr   nz, ret_036_5911                         ; $58FC: $20 $13

    ld   hl, wC1AD                                ; $58FE: $21 $AD $C1
    ld   [hl], $01                                ; $5901: $36 $01
    ldh  a, [hJoypadState]                        ; $5903: $F0 $CC
    and  J_A                                      ; $5905: $E6 $10
    jr   z, ret_036_5911                          ; $5907: $28 $08

    call_open_dialog Dialog266                    ; $5909
    call IncrementEntityState                     ; $590E: $CD $12 $3B

ret_036_5911:
    ret                                           ; $5911: $C9

func_036_5912::
    ld   a, [wDialogState]                        ; $5912: $FA $9F $C1
    and  a                                        ; $5915: $A7
    ret  nz                                       ; $5916: $C0

    ld   a, [wDialogAskSelectionIndex]            ; $5917: $FA $77 $C1
    and  a                                        ; $591A: $A7
    jr   nz, .jr_592A                             ; $591B: $20 $0D

    call func_036_6C0D                            ; $591D: $CD $0D $6C
    call_open_dialog Dialog267                    ; $5920
    call IncrementEntityState                     ; $5925: $CD $12 $3B
    jr   ret_036_592F                             ; $5928: $18 $05

.jr_592A
    ld   a, $03                                   ; $592A: $3E $03
    call SetEntityState                           ; $592C: $CD $07 $6C

ret_036_592F:
    ret                                           ; $592F: $C9

func_036_5930::
    ld   a, [wDialogState]                        ; $5930: $FA $9F $C1
    and  a                                        ; $5933: $A7
    jr   nz, .ret_593E                            ; $5934: $20 $08

    call func_036_6C0D                            ; $5936: $CD $0D $6C
    ld   a, $03                                   ; $5939: $3E $03
    call SetEntityState                           ; $593B: $CD $07 $6C

.ret_593E
    ret                                           ; $593E: $C9

ColorGuardianBlueEntityHandler::
ColorGuardianRedEntityHandler::
    push bc                                       ; $593F: $C5
    sla  c                                        ; $5940: $CB $21
    sla  c                                        ; $5942: $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ; $5944: $21 $80 $D5
    add  hl, bc                                   ; $5947: $09
    inc  hl                                       ; $5948: $23
    inc  hl                                       ; $5949: $23
    ld   a, $06                                   ; $594A: $3E $06
    ld   [hl+], a                                 ; $594C: $22
    ld   [hl+], a                                 ; $594D: $22
    pop  bc                                       ; $594E: $C1
    ld   hl, wEntitiesHealthTable                 ; $594F: $21 $60 $C3
    add  hl, bc                                   ; $5952: $09
    ld   [hl], $FF                                ; $5953: $36 $FF
    call func_036_5AC8                            ; $5955: $CD $C8 $5A
    ld   a, [wDialogState]                        ; $5958: $FA $9F $C1
    and  a                                        ; $595B: $A7
    jr   nz, .jr_5964                             ; $595C: $20 $06

    call func_036_6B5C                            ; $595E: $CD $5C $6B
    call CheckLinkCollisionWithEnemy_trampoline   ; $5961: $CD $5A $3B

.jr_5964
    xor  a                                        ; $5964: $AF
    ld   hl, wEntitiesFlashCountdownTable         ; $5965: $21 $20 $C4
    add  hl, bc                                   ; $5968: $09
    ld   [hl], a                                  ; $5969: $77
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $596A: $21 $10 $C4
    add  hl, bc                                   ; $596D: $09
    ld   [hl], a                                  ; $596E: $77
    ld   a, [wGameplayType]                       ; $596F: $FA $95 $DB
    cp   $0B                                      ; $5972: $FE $0B
    ret  nz                                       ; $5974: $C0

    ld   a, [wDialogState]                        ; $5975: $FA $9F $C1
    and  a                                        ; $5978: $A7
    ret  nz                                       ; $5979: $C0

    ldh  a, [hActiveEntityState]                  ; $597A: $F0 $F0
    JP_TABLE                                      ; $597C
._00 dw func_036_59C3                             ; $597D
._01 dw func_036_5A0A                             ; $597F
._02 dw func_036_5A3B                             ; $5981
._03 dw func_036_5A40                             ; $5983
._04 dw func_036_5A7D                             ; $5985
._05 dw func_036_5A87                             ; $5987

func_036_5989::
    ld   hl, wEntitiesTypeTable                   ; $5989: $21 $A0 $C3
    add  hl, bc                                   ; $598C: $09
    ld   a, [hl]                                  ; $598D: $7E
    xor  $01                                      ; $598E: $EE $01
    ld   de, $FFFF                                ; $5990: $11 $FF $FF

.loop_5993
    inc  de                                       ; $5993: $13
    ld   hl, wEntitiesTypeTable                   ; $5994: $21 $A0 $C3
    add  hl, de                                   ; $5997: $19
    cp   [hl]                                     ; $5998: $BE
    jr   nz, .loop_5993                           ; $5999: $20 $F8

    ld   hl, wEntitiesStateTable                  ; $599B: $21 $90 $C2
    add  hl, de                                   ; $599E: $19
    ld   a, [hl]                                  ; $599F: $7E
    cp   $03                                      ; $59A0: $FE $03
    ret  nz                                       ; $59A2: $C0

    ld   hl, wEntitiesTypeTable                   ; $59A3: $21 $A0 $C3
    add  hl, bc                                   ; $59A6: $09
    ld   a, [hl]                                  ; $59A7: $7E
    call PointHLToEntitySpeedX                    ; $59A8: $CD $EE $6B
    ld   [hl], $FA                                ; $59AB: $36 $FA
    and  $01                                      ; $59AD: $E6 $01
    jr   nz, .jr_59B3                             ; $59AF: $20 $02

    ld   [hl], $06                                ; $59B1: $36 $06

.jr_59B3
    ld   a, $04                                   ; $59B3: $3E $04
    call SetEntitySpriteVariant                   ; $59B5: $CD $0C $3B
    ld   a, $01                                   ; $59B8: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $59BA: $E0 $A1
    ld   a, $05                                   ; $59BC: $3E $05
    call SetEntityState                           ; $59BE: $CD $07 $6C
    pop  af                                       ; $59C1: $F1
    ret                                           ; $59C2: $C9

func_036_59C3::
    call func_036_5989                            ; $59C3: $CD $89 $59
    call func_036_6B8A                            ; $59C6: $CD $8A $6B
    cp   $04                                      ; $59C9: $FE $04
    jr   nc, jr_036_5A00                          ; $59CB: $30 $33

    call func_036_6B9A                            ; $59CD: $CD $9A $6B
    cp   $0B                                      ; $59D0: $FE $0B
    jr   nc, jr_036_5A00                          ; $59D2: $30 $2C

    ld   a, e                                     ; $59D4: $7B
    and  $04                                      ; $59D5: $E6 $04
    jr   z, jr_036_5A00                           ; $59D7: $28 $27

    ld   hl, wC1AD                                ; $59D9: $21 $AD $C1
    ld   [hl], $01                                ; $59DC: $36 $01
    ldh  a, [hJoypadState]                        ; $59DE: $F0 $CC
    and  J_A                                      ; $59E0: $E6 $10
    jr   z, jr_036_5A00                           ; $59E2: $28 $1C

    ld   hl, wEntitiesPrivateState1Table          ; $59E4: $21 $B0 $C2
    add  hl, bc                                   ; $59E7: $09
    ld   a, $01                                   ; $59E8: $3E $01
    ld   [hl], a                                  ; $59EA: $77
    ld_dialog_low e, Dialog260 ; "Our colors are never the same" ; $59EB: $1E $60
    ldh  a, [hIsGBC]                              ; $59ED: $F0 $FE
    and  a                                        ; $59EF: $A7
    jr   nz, .jr_59F9                             ; $59F0: $20 $07

    call_open_dialog Dialog262 ; "I am sorry, no color" ; $59F2
    jr   jr_036_5A00                              ; $59F7: $18 $07

.jr_59F9
    ld   a, e                                     ; $59F9: $7B
    call OpenDialogInTable2                       ; $59FA: $CD $7C $23
    call IncrementEntityState                     ; $59FD: $CD $12 $3B

jr_036_5A00:
    ldh  a, [hFrameCounter]                       ; $5A00: $F0 $E7
    swap a                                        ; $5A02: $CB $37
    and  $01                                      ; $5A04: $E6 $01
    call SetEntitySpriteVariant                   ; $5A06: $CD $0C $3B
    ret                                           ; $5A09: $C9

func_036_5A0A::
    ldh  a, [hActiveEntityType]                   ; $5A0A: $F0 $EB
    sub  ENTITY_COLOR_GUARDIAN_BLUE               ; $5A0C: $D6 $F6
IF __PATCH_1__
    xor  $01
ENDC
    ld   e, a                                     ; $5A0E: $5F
    ld   a, [wDialogAskSelectionIndex]            ; $5A0F: $FA $77 $C1
    cp   e                                        ; $5A12: $BB
    jr   nz, .jr_5A1E                             ; $5A13: $20 $09

    call_open_dialog Dialog264                    ; $5A15
    call IncrementEntityState                     ; $5A1A: $CD $12 $3B
    ret                                           ; $5A1D: $C9

.jr_5A1E
    call PointHLToEntitySpeedX                    ; $5A1E: $CD $EE $6B
    ld   [hl], $FA                                ; $5A21: $36 $FA
    ld   a, e                                     ; $5A23: $7B
    and  a                                        ; $5A24: $A7
IF __PATCH_1__
    jr   nz, .jr_5A2B
ELSE
    jr   z, .jr_5A2B                              ; $5A25: $28 $04
ENDC

    ld   a, [hl]                                  ; $5A27: $7E
    cpl                                           ; $5A28: $2F
    inc  a                                        ; $5A29: $3C
    ld   [hl], a                                  ; $5A2A: $77

.jr_5A2B
    ld   a, $02                                   ; $5A2B: $3E $02
    call SetEntitySpriteVariant                   ; $5A2D: $CD $0C $3B
    call_open_dialog Dialog265                    ; $5A30
    ld   a, $03                                   ; $5A35: $3E $03
    call SetEntityState                           ; $5A37: $CD $07 $6C
    ret                                           ; $5A3A: $C9

func_036_5A3B::
    xor  a                                        ; $5A3B: $AF
    call SetEntityState                           ; $5A3C: $CD $07 $6C
    ret                                           ; $5A3F: $C9

func_036_5A40::
    ld   a, $02                                   ; $5A40: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5A42: $E0 $A1
    ld   [wC167], a                               ; $5A44: $EA $67 $C1
    call PointHLToEntityPosX                      ; $5A47: $CD $23 $6C
    ld_dialog_low e, Dialog25F ; "Do you have the powder?" ; $5A4A: $1E $5F
    ld   a, [hl]                                  ; $5A4C: $7E
    cp   $3C                                      ; $5A4D: $FE $3C
    jr   z, .jr_5A57                              ; $5A4F: $28 $06

    ld_dialog_low e, Dialog25E ; "The fairy queen is waiting" ; $5A51: $1E $5E
    cp   $63                                      ; $5A53: $FE $63
    jr   nz, jr_036_5A6A                          ; $5A55: $20 $13

.jr_5A57
    ld   a, [wGameplayType]                       ; $5A57: $FA $95 $DB
    cp   $0B                                      ; $5A5A: $FE $0B
    jr   nz, jr_036_5A6A                          ; $5A5C: $20 $0C

    xor  a                                        ; $5A5E: $AF
    ld   [wC167], a                               ; $5A5F: $EA $67 $C1
    ld   a, e                                     ; $5A62: $7B
    call OpenDialogInTable2                       ; $5A63: $CD $7C $23
    call IncrementEntityState                     ; $5A66: $CD $12 $3B
    ret                                           ; $5A69: $C9

jr_036_5A6A:
    call UpdateEntityPosWithSpeed_36              ; $5A6A: $CD $62 $6A
    call PointHLToEntitySpriteVariant             ; $5A6D: $CD $02 $6C
    ldh  a, [hFrameCounter]                       ; $5A70: $F0 $E7
    srl  a                                        ; $5A72: $CB $3F
    srl  a                                        ; $5A74: $CB $3F
    srl  a                                        ; $5A76: $CB $3F
    and  $01                                      ; $5A78: $E6 $01
    xor  [hl]                                     ; $5A7A: $AE
    ld   [hl], a                                  ; $5A7B: $77
    ret                                           ; $5A7C: $C9

func_036_5A7D::
    ldh  a, [hFrameCounter]                       ; $5A7D: $F0 $E7
    swap a                                        ; $5A7F: $CB $37
    and  $01                                      ; $5A81: $E6 $01
    call SetEntitySpriteVariant                   ; $5A83: $CD $0C $3B
    ret                                           ; $5A86: $C9

func_036_5A87::
    call PointHLToEntityPosX                      ; $5A87: $CD $23 $6C
    ld   a, [hl]                                  ; $5A8A: $7E
    cp   $50                                      ; $5A8B: $FE $50
    jr   nz, jr_036_5A6A                          ; $5A8D: $20 $DB

    xor  a                                        ; $5A8F: $AF
    call SetEntityState                           ; $5A90: $CD $07 $6C
    ret                                           ; $5A93: $C9

Unknown077SpriteVariantsPartE:
    db   $40, $03
    db   $42, $03
    db   $42, $23
    db   $40, $23
    db   $48, $03
    db   $4A, $03
    db   $4C, $03
    db   $4E, $03
    db   $4A, $23
    db   $48, $23
    db   $4E, $23
    db   $4C, $23

Unknown077SpriteVariantsPartD:
    db   $40, $02
    db   $42, $02
    db   $42, $22
    db   $40, $22
    db   $4A, $22
    db   $48, $22
    db   $4E, $22
    db   $4C, $22
    db   $48, $02
    db   $4A, $02
    db   $4C, $02
    db   $4E, $02

Unknown077SpriteVariantsCombiner::
    dw   Unknown077SpriteVariantsPartE
    dw   Unknown077SpriteVariantsPartD

func_036_5AC8::
    ld   d, $00                                   ; $5AC8: $16 $00
    ldh  a, [hActiveEntityType]                   ; $5ACA: $F0 $EB
    sub  ENTITY_COLOR_GUARDIAN_BLUE               ; $5ACC: $D6 $F6
    sla  a                                        ; $5ACE: $CB $27
    ld   e, a                                     ; $5AD0: $5F
    ld   hl, Unknown077SpriteVariantsCombiner     ; $5AD1: $21 $C4 $5A
    add  hl, de                                   ; $5AD4: $19
    ld   e, [hl]                                  ; $5AD5: $5E
    inc  hl                                       ; $5AD6: $23
    ld   d, [hl]                                  ; $5AD7: $56
    call RenderActiveEntitySpritesPair            ; $5AD8: $CD $C0 $3B
    ret                                           ; $5ADB: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown078SpriteVariants::
.variant0
    db $40, $01
    db $40, $21
.variant1
    db $42, $01
    db $42, $21

label_036_5AE4:
    ld   de, Unknown078SpriteVariants             ; $5AE4: $11 $DC $5A
    call RenderActiveEntitySpritesPair            ; $5AE7: $CD $C0 $3B
    call ReturnIfNonInteractive_36                ; $5AEA: $CD $40 $6A
    call DecrementEntityIgnoreHitsCountdown       ; $5AED: $CD $56 $0C
    call label_3B39                               ; $5AF0: $CD $39 $3B
    call UpdateEntityPosWithSpeed_36              ; $5AF3: $CD $62 $6A
    call func_036_6C15                            ; $5AF6: $CD $15 $6C
    jp   label_036_5BE8                           ; $5AF9: $C3 $E8 $5B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown079SpriteVariants::
.variant0
    db $74, $01
    db $76, $01
.variant1
    db $74, $04
    db $76, $04
.variant2
    db $70, $01
    db $72, $01
.variant3
    db $70, $04
    db $72, $04
.variant4
    db $76, $21
    db $74, $21
.variant5
    db $76, $24
    db $74, $24
.variant6
    db $78, $01
    db $7A, $01
.variant7
    db $78, $04
    db $7A, $04

jr_036_5B1C:
    ld   de, Unknown079SpriteVariants             ; $5B1C: $11 $FC $5A
    call RenderActiveEntitySpritesPair            ; $5B1F: $CD $C0 $3B
    call ReturnIfNonInteractive_36                ; $5B22: $CD $40 $6A
    call DecrementEntityIgnoreHitsCountdown       ; $5B25: $CD $56 $0C
    call label_3B39                               ; $5B28: $CD $39 $3B
    call UpdateEntityPosWithSpeed_36              ; $5B2B: $CD $62 $6A
    ld   hl, wEntitiesPrivateState1Table          ; $5B2E: $21 $B0 $C2
    add  hl, bc                                   ; $5B31: $09
    ldh  a, [hFrameCounter]                       ; $5B32: $F0 $E7
    and  $04                                      ; $5B34: $E6 $04
    srl  a                                        ; $5B36: $CB $3F
    srl  a                                        ; $5B38: $CB $3F
    or   [hl]                                     ; $5B3A: $B6
    call PointHLToEntitySpriteVariant             ; $5B3B: $CD $02 $6C
    ld   [hl], a                                  ; $5B3E: $77
    jp   label_036_5BE8                           ; $5B3F: $C3 $E8 $5B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BouncingBoulderSpriteVariants::
.variant0
    db $6C, $07
    db $6E, $07
.variant1
    db $6E, $27
    db $6C, $27
.variant2
    db $6E, $67
    db $6C, $67
.variant3
    db $6C, $47
    db $6E, $47

Data_036_5B52::
    db   $0C, $F4, $05, $FB

Data_036_5B56::
    db   $08, $0A, $06, $0C

Data_036_5B5A::
    db   $18, $20, $1C, $28

BouncingBoulderEntityHandler::
    ld   a, [wD202]                               ; $5B5E: $FA $02 $D2
    ld   e, a                                     ; $5B61: $5F
    ld   d, $00                                   ; $5B62: $16 $00
    ld   hl, wEntitiesStatusTable                 ; $5B64: $21 $80 $C2
    add  hl, de                                   ; $5B67: $19
    ld   a, [hl]                                  ; $5B68: $7E
    cp   $01                                      ; $5B69: $FE $01
    jr   nz, .jr_5B73                             ; $5B6B: $20 $06

    call func_036_6C89                            ; $5B6D: $CD $89 $6C
    call func_036_5CAB                            ; $5B70: $CD $AB $5C

.jr_5B73
    ldh  a, [hActiveEntityState]                  ; $5B73: $F0 $F0
    bit  1, a                                     ; $5B75: $CB $4F
    jr   nz, jr_036_5B1C                          ; $5B77: $20 $A3

    bit  2, a                                     ; $5B79: $CB $57
    jp   nz, label_036_5AE4                       ; $5B7B: $C2 $E4 $5A

    ld   de, BouncingBoulderSpriteVariants        ; $5B7E: $11 $42 $5B
    call RenderActiveEntitySpritesPair            ; $5B81: $CD $C0 $3B
    call ReturnIfNonInteractive_36                ; $5B84: $CD $40 $6A
    call DecrementEntityIgnoreHitsCountdown       ; $5B87: $CD $56 $0C
    call label_3B39                               ; $5B8A: $CD $39 $3B
    ldh  a, [hFrameCounter]                       ; $5B8D: $F0 $E7
    rra                                           ; $5B8F: $1F
    rra                                           ; $5B90: $1F
    rra                                           ; $5B91: $1F
    and  $03                                      ; $5B92: $E6 $03
    call SetEntitySpriteVariant                   ; $5B94: $CD $0C $3B
    call UpdateEntityPosWithSpeed_36              ; $5B97: $CD $62 $6A
    ldh  a, [hActiveEntityState]                  ; $5B9A: $F0 $F0
    bit  3, a                                     ; $5B9C: $CB $5F
    jr   nz, label_036_5BE8                       ; $5B9E: $20 $48

    call func_036_6AEC                            ; $5BA0: $CD $EC $6A
    call label_3CD9                               ; $5BA3: $CD $D9 $3C
    call PointHLToEntitySpeedZ                    ; $5BA6: $CD $F8 $6B
    dec  [hl]                                     ; $5BA9: $35
    dec  [hl]                                     ; $5BAA: $35
    call PointHLToEntityPosZ                      ; $5BAB: $CD $2D $6C
    ld   a, [hl]                                  ; $5BAE: $7E
    and  $80                                      ; $5BAF: $E6 $80
    jr   z, label_036_5BE8                        ; $5BB1: $28 $35

    ld   [hl], b                                  ; $5BB3: $70
    call GetRandomByte                            ; $5BB4: $CD $0D $28
    and  $03                                      ; $5BB7: $E6 $03
    ld   e, a                                     ; $5BB9: $5F
    ld   d, b                                     ; $5BBA: $50
    ld   hl, Data_036_5B52                        ; $5BBB: $21 $52 $5B
    add  hl, de                                   ; $5BBE: $19
    ld   a, [hl]                                  ; $5BBF: $7E
    call PointHLToEntitySpeedX                    ; $5BC0: $CD $EE $6B
    ld   [hl], a                                  ; $5BC3: $77
    call GetRandomByte                            ; $5BC4: $CD $0D $28
    and  $03                                      ; $5BC7: $E6 $03
    ld   e, a                                     ; $5BC9: $5F
    ld   d, b                                     ; $5BCA: $50
    ld   hl, Data_036_5B56                        ; $5BCB: $21 $56 $5B
    add  hl, de                                   ; $5BCE: $19
    ld   a, [hl]                                  ; $5BCF: $7E
    call PointHLToEntitySpeedY                    ; $5BD0: $CD $F3 $6B
    ld   [hl], a                                  ; $5BD3: $77
    call GetRandomByte                            ; $5BD4: $CD $0D $28
    and  $03                                      ; $5BD7: $E6 $03
    ld   e, a                                     ; $5BD9: $5F
    ld   d, b                                     ; $5BDA: $50
    ld   hl, Data_036_5B5A                        ; $5BDB: $21 $5A $5B
    add  hl, de                                   ; $5BDE: $19
    ld   a, [hl]                                  ; $5BDF: $7E
    call PointHLToEntitySpeedZ                    ; $5BE0: $CD $F8 $6B
    ld   [hl], a                                  ; $5BE3: $77
    ld   a, JINGLE_BIG_BUMP                       ; $5BE4: $3E $20
    ldh  [hJingle], a                             ; $5BE6: $E0 $F2

label_036_5BE8:
    ldh  a, [hActiveEntityPosX]                   ; $5BE8: $F0 $EE
    cp   $A8                                      ; $5BEA: $FE $A8
    jp   nc, func_036_6C89                        ; $5BEC: $D2 $89 $6C

    ldh  a, [hActiveEntityVisualPosY]             ; $5BEF: $F0 $EC
    cp   $84                                      ; $5BF1: $FE $84
    jp   nc, func_036_6C89                        ; $5BF3: $D2 $89 $6C

    ret                                           ; $5BF6: $C9

; Note: this entity, unlike most others, use 3 spriteslots (out of 4 available).
;
; In usual gameplay, only 2 spriteslots are updated during a room transition.
; The map transition code is special-cased for the color-dungeon to handle this.
AvalaunchEntityHandler::
    call label_394D                               ; $5BF7: $CD $4D $39
    ld   a, c                                     ; $5BFA: $79
    ld   [wD202], a                               ; $5BFB: $EA $02 $D2
    call func_036_5F75                            ; $5BFE: $CD $75 $5F
    call label_3CD9                               ; $5C01: $CD $D9 $3C
    ldh  a, [hActiveEntityStatus]                 ; $5C04: $F0 $EA
    cp   $05                                      ; $5C06: $FE $05
    jr   nz, label_036_5C3C                       ; $5C08: $20 $32

    call BossIntro                                ; $5C0A: $CD $E8 $3E
    call ReturnIfNonInteractive_36                ; $5C0D: $CD $40 $6A
    ld   a, [wC190]                               ; $5C10: $FA $90 $C1
    and  a                                        ; $5C13: $A7
    ret  z                                        ; $5C14: $C8

    ld   hl, wEntitiesFlashCountdownTable         ; $5C15: $21 $20 $C4
    add  hl, bc                                   ; $5C18: $09
    ld   a, [hl]                                  ; $5C19: $7E
    and  a                                        ; $5C1A: $A7
    jr   nz, .jr_5C23                             ; $5C1B: $20 $06

    xor  a                                        ; $5C1D: $AF
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $5C1E: $21 $10 $C4
    add  hl, bc                                   ; $5C21: $09
    ld   [hl], a                                  ; $5C22: $77

.jr_5C23
    ldh  a, [hActiveEntityState]                  ; $5C23: $F0 $F0
    JP_TABLE                                      ; $5C25
._00 dw AvalaunchState0Handler
._01 dw AvalaunchState1Handler
._02 dw AvalaunchState2Handler
._03 dw AvalaunchState3Handler
._04 dw AvalaunchState4Handler
._05 dw AvalaunchState5Handler
._06 dw AvalaunchState6Handler
._07 dw AvalaunchState7Handler
._08 dw AvalaunchState8Handler
._09 dw AvalaunchState9Handler
._0A dw AvalaunchStateAHandler

label_036_5C3C:
    ld   hl, wEntitiesPrivateState5Table          ; $5C3C: $21 $90 $C3
    add  hl, bc                                   ; $5C3F: $09
    ld   a, [hl]                                  ; $5C40: $7E
    JP_TABLE                                      ; $5C41
._00 dw func_036_5C48                             ; $5C42
._01 dw func_036_5C59                             ; $5C44
._02 dw func_036_5C69                             ; $5C46

func_036_5C48::
    call GetEntityTransitionCountdown             ; $5C48: $CD $05 $0C
    ld   [hl], $A0                                ; $5C4B: $36 $A0
    ld   hl, wEntitiesFlashCountdownTable         ; $5C4D: $21 $20 $C4
    add  hl, bc                                   ; $5C50: $09
    ld   [hl], $FF                                ; $5C51: $36 $FF

func_036_5C53::
    ld   hl, wEntitiesPrivateState5Table          ; $5C53: $21 $90 $C3
    add  hl, bc                                   ; $5C56: $09
    inc  [hl]                                     ; $5C57: $34
    ret                                           ; $5C58: $C9

func_036_5C59::
    call GetEntityTransitionCountdown             ; $5C59: $CD $05 $0C
    ret  nz                                       ; $5C5C: $C0

    ld   [hl], $C0                                ; $5C5D: $36 $C0
    ld   hl, wEntitiesFlashCountdownTable         ; $5C5F: $21 $20 $C4
    add  hl, bc                                   ; $5C62: $09
    ld   [hl], $FF                                ; $5C63: $36 $FF
    call func_036_5C53                            ; $5C65: $CD $53 $5C
    ret                                           ; $5C68: $C9

func_036_5C69::
    call GetEntityTransitionCountdown             ; $5C69: $CD $05 $0C
    jr   z, .jr_5C72                              ; $5C6C: $28 $04

    call func_036_5C8B                            ; $5C6E: $CD $8B $5C
    ret                                           ; $5C71: $C9

.jr_5C72
    ld   a, $1A                                   ; $5C72: $3E $1A
    ldh  [hNoiseSfx], a                           ; $5C74: $E0 $F4
    call label_27DD                               ; $5C76: $CD $DD $27
    call DidKillEnemy                             ; $5C79: $CD $50 $3F
    xor  a                                        ; $5C7C: $AF
    ld   [wC167], a                               ; $5C7D: $EA $67 $C1
    ld   hl, wColorDungeonRoomStatus              ; $5C80: $21 $E0 $DD
    ldh  a, [hMapRoom]                            ; $5C83: $F0 $F6
    ld   e, a                                     ; $5C85: $5F
    ld   d, b                                     ; $5C86: $50
    add  hl, de                                   ; $5C87: $19
    set  5, [hl]                                  ; $5C88: $CB $EE
    ret                                           ; $5C8A: $C9

func_036_5C8B::
    and  $07                                      ; $5C8B: $E6 $07
    ret  nz                                       ; $5C8D: $C0

    call GetRandomByte                            ; $5C8E: $CD $0D $28
    and  $1F                                      ; $5C91: $E6 $1F
    sub  $10                                      ; $5C93: $D6 $10
    ld   e, a                                     ; $5C95: $5F
    ld   hl, hActiveEntityPosX                    ; $5C96: $21 $EE $FF
    add  [hl]                                     ; $5C99: $86
    ld   [hl], a                                  ; $5C9A: $77
    call GetRandomByte                            ; $5C9B: $CD $0D $28
    and  $1F                                      ; $5C9E: $E6 $1F
    sub  $14                                      ; $5CA0: $D6 $14
    ld   e, a                                     ; $5CA2: $5F
    ld   hl, hActiveEntityVisualPosY              ; $5CA3: $21 $EC $FF
    add  [hl]                                     ; $5CA6: $86
    ld   [hl], a                                  ; $5CA7: $77
    call ReturnIfNonInteractive_36.allowInactiveEntity ; $5CA8: $CD $46 $6A

func_036_5CAB::
    ldh  a, [hActiveEntityPosX]                   ; $5CAB: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $5CAD: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $5CAF: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $5CB1: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $5CB3: $3E $02
    call AddTranscientVfx                         ; $5CB5: $CD $C7 $0C
    ld   a, $13                                   ; $5CB8: $3E $13
    ldh  [hNoiseSfx], a                           ; $5CBA: $E0 $F4
    ret                                           ; $5CBC: $C9

func_036_5CBD::
    call label_3B39                               ; $5CBD: $CD $39 $3B
    ld   hl, wEntitiesFlashCountdownTable         ; $5CC0: $21 $20 $C4
    add  hl, bc                                   ; $5CC3: $09
    ld   a, [hl]                                  ; $5CC4: $7E
    and  a                                        ; $5CC5: $A7
    ret  z                                        ; $5CC6: $C8

IF __PATCH_0__
    call func_036_6B8A
    ld d, $20
    cp d
    jr nc, .jr_5CD9

    call func_036_6B9A
    ld d, $20
    cp d
    jr nc, .jr_5CD9
ENDC

    ld   a, $10                                   ; $5CC7: $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $5CC9: $EA $3E $C1
    ld   a, $20                                   ; $5CCC: $3E $20
    call GetVectorTowardsLink_trampoline          ; $5CCE: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $5CD1: $F0 $D7
    ldh  [hLinkSpeedY], a                         ; $5CD3: $E0 $9B
    ldh  a, [hMultiPurpose1]                      ; $5CD5: $F0 $D8
    ldh  [hLinkSpeedX], a                         ; $5CD7: $E0 $9A

.jr_5CD9
    ld   a, $30                                   ; $5CD9: $3E $30
    call func_036_6C83                            ; $5CDB: $CD $83 $6C
    ld   hl, wEntitiesPrivateState2Table          ; $5CDE: $21 $C0 $C2
    add  hl, bc                                   ; $5CE1: $09
    ld   [hl], $06                                ; $5CE2: $36 $06
    ld   a, $08                                   ; $5CE4: $3E $08
    call SetEntityState                           ; $5CE6: $CD $07 $6C
    and  a                                        ; $5CE9: $A7
    ret                                           ; $5CEA: $C9

AvalaunchState0Handler::
    ld   a, $10                                   ; $5CEB: $3E $10
    call func_036_6C83                            ; $5CED: $CD $83 $6C
    call IncrementEntityState                     ; $5CF0: $CD $12 $3B
    ret                                           ; $5CF3: $C9

AvalaunchState2Handler::
    call_open_dialog Dialog26A                    ; $5CF4: $3E $6A $CD $7C $23
    call IncrementEntityState                     ; $5CF9: $CD $12 $3B
    ret                                           ; $5CFC: $C9

    ld   a, [wDialogState]                        ; $5CFD: $FA $9F $C1
    and  a                                        ; $5D00: $A7
    ret  nz                                       ; $5D01: $C0

    ld   a, $10                                   ; $5D02: $3E $10
    call func_036_6C83                            ; $5D04: $CD $83 $6C
    call IncrementEntityState                     ; $5D07: $CD $12 $3B
    ret                                           ; $5D0A: $C9

AvalaunchState3Handler::
    call func_036_5CBD                            ; $5D0B: $CD $BD $5C
    ret  nz                                       ; $5D0E: $C0

    call GetEntityTransitionCountdown             ; $5D0F: $CD $05 $0C
    ret  nz                                       ; $5D12: $C0

    xor  a                                        ; $5D13: $AF
    call PointHLToEntitySpeedX                    ; $5D14: $CD $EE $6B
    ld   [hl], a                                  ; $5D17: $77
    call PointHLToEntitySpeedY                    ; $5D18: $CD $F3 $6B
    ld   [hl], a                                  ; $5D1B: $77
    ld   hl, wEntitiesPrivateState3Table          ; $5D1C: $21 $D0 $C2
    add  hl, bc                                   ; $5D1F: $09
    call GetRandomByte                            ; $5D20: $CD $0D $28
    and  [hl]                                     ; $5D23: $A6
    jr   nz, .jr_5D39                             ; $5D24: $20 $13

    ld   [hl], $01                                ; $5D26: $36 $01
    call PointHLToEntitySpeedZ                    ; $5D28: $CD $F8 $6B
    ld   [hl], $18                                ; $5D2B: $36 $18
    ld   hl, wEntitiesPrivateState2Table          ; $5D2D: $21 $C0 $C2
    add  hl, bc                                   ; $5D30: $09
    ld   [hl], $00                                ; $5D31: $36 $00
    ld   a, $09                                   ; $5D33: $3E $09
    call SetEntityState                           ; $5D35: $CD $07 $6C
    ret                                           ; $5D38: $C9

.jr_5D39
    ld   a, $20                                   ; $5D39: $3E $20
    call func_036_6C83                            ; $5D3B: $CD $83 $6C
    ld   hl, wEntitiesPrivateState1Table          ; $5D3E: $21 $B0 $C2
    add  hl, bc                                   ; $5D41: $09
    ld   [hl], $06                                ; $5D42: $36 $06
    call PointHLToEntityDirection                 ; $5D44: $CD $FD $6B
    ld   [hl], $03                                ; $5D47: $36 $03
    call IncrementEntityState                     ; $5D49: $CD $12 $3B
    call GetRandomByte                            ; $5D4C: $CD $0D $28
    and  $01                                      ; $5D4F: $E6 $01
    jr   z, .jr_5D62                              ; $5D51: $28 $0F

    ld   [hl], $06                                ; $5D53: $36 $06
    call PointHLToEntitySpeedX                    ; $5D55: $CD $EE $6B
    call GetRandomByte                            ; $5D58: $CD $0D $28
    and  $01                                      ; $5D5B: $E6 $01
    jr   nz, jr_036_5D65                          ; $5D5D: $20 $06

    ld   [hl], $C0                                ; $5D5F: $36 $C0
    ret                                           ; $5D61: $C9

.jr_5D62
    call PointHLToEntitySpeedY                    ; $5D62: $CD $F3 $6B

jr_036_5D65:
    ld   [hl], $40                                ; $5D65: $36 $40
    ret                                           ; $5D67: $C9

AvalaunchState4Handler::
    call func_036_5CBD                            ; $5D68: $CD $BD $5C
    ret  nz                                       ; $5D6B: $C0

    call GetEntityTransitionCountdown             ; $5D6C: $CD $05 $0C
    jr   nz, .ret_5D97                            ; $5D6F: $20 $26

    call UpdateEntityPosWithSpeed_36              ; $5D71: $CD $62 $6A
    call label_3B23                               ; $5D74: $CD $23 $3B
    call func_036_6C0D                            ; $5D77: $CD $0D $6C
    ld   a, $20                                   ; $5D7A: $3E $20
    call func_036_6C83                            ; $5D7C: $CD $83 $6C
    ld   hl, wEntitiesPrivateState1Table          ; $5D7F: $21 $B0 $C2
    add  hl, bc                                   ; $5D82: $09
    dec  [hl]                                     ; $5D83: $35
    ld   a, [hl]                                  ; $5D84: $7E
    and  a                                        ; $5D85: $A7
    jr   nz, .ret_5D97                            ; $5D86: $20 $0F

    ld   [hl], $06                                ; $5D88: $36 $06
    call PointHLToEntitySpeedY                    ; $5D8A: $CD $F3 $6B
    ld   [hl], $C0                                ; $5D8D: $36 $C0
    ld   a, $30                                   ; $5D8F: $3E $30
    call func_036_6C83                            ; $5D91: $CD $83 $6C
    call IncrementEntityState                     ; $5D94: $CD $12 $3B

.ret_5D97
    ret                                           ; $5D97: $C9

AvalaunchState5Handler::
    call func_036_5CBD                            ; $5D98: $CD $BD $5C
    ret  nz                                       ; $5D9B: $C0

    call GetEntityTransitionCountdown             ; $5D9C: $CD $05 $0C
    jr   nz, .ret_5DC2                            ; $5D9F: $20 $21

    call UpdateEntityPosWithSpeed_36              ; $5DA1: $CD $62 $6A
    call label_3B23                               ; $5DA4: $CD $23 $3B
    call func_036_6C0D                            ; $5DA7: $CD $0D $6C
    ld   a, $20                                   ; $5DAA: $3E $20
    call func_036_6C83                            ; $5DAC: $CD $83 $6C
    ld   hl, wEntitiesPrivateState1Table          ; $5DAF: $21 $B0 $C2
    add  hl, bc                                   ; $5DB2: $09
    dec  [hl]                                     ; $5DB3: $35
    ld   a, [hl]                                  ; $5DB4: $7E
    and  a                                        ; $5DB5: $A7
    jr   nz, .ret_5DC2                            ; $5DB6: $20 $0A

    ld   a, $30                                   ; $5DB8: $3E $30
    call func_036_6C83                            ; $5DBA: $CD $83 $6C
    ld   a, $03                                   ; $5DBD: $3E $03
    call SetEntityState                           ; $5DBF: $CD $07 $6C

.ret_5DC2
    ret                                           ; $5DC2: $C9

AvalaunchState6Handler::
    call func_036_5CBD                            ; $5DC3: $CD $BD $5C
    ret  nz                                       ; $5DC6: $C0

    call GetEntityTransitionCountdown             ; $5DC7: $CD $05 $0C
    ret  nz                                       ; $5DCA: $C0

    call UpdateEntityPosWithSpeed_36              ; $5DCB: $CD $62 $6A
    call label_3B23                               ; $5DCE: $CD $23 $3B
    call func_036_6C0D                            ; $5DD1: $CD $0D $6C
    ld   a, $20                                   ; $5DD4: $3E $20
    call func_036_6C83                            ; $5DD6: $CD $83 $6C
    ld   hl, wEntitiesPrivateState1Table          ; $5DD9: $21 $B0 $C2
    add  hl, bc                                   ; $5DDC: $09
    dec  [hl]                                     ; $5DDD: $35
    ld   a, [hl]                                  ; $5DDE: $7E
    and  a                                        ; $5DDF: $A7
    ret  nz                                       ; $5DE0: $C0

    ld   [hl], $06                                ; $5DE1: $36 $06
    call PointHLToEntitySpeedX                    ; $5DE3: $CD $EE $6B
    ld   a, [hl]                                  ; $5DE6: $7E
    cpl                                           ; $5DE7: $2F
    inc  a                                        ; $5DE8: $3C
    ld   [hl], a                                  ; $5DE9: $77
    ld   a, $30                                   ; $5DEA: $3E $30
    call func_036_6C83                            ; $5DEC: $CD $83 $6C
    call IncrementEntityState                     ; $5DEF: $CD $12 $3B
    ret                                           ; $5DF2: $C9

AvalaunchState7Handler::
    call func_036_5CBD                            ; $5DF3: $CD $BD $5C
    ret  nz                                       ; $5DF6: $C0

    call GetEntityTransitionCountdown             ; $5DF7: $CD $05 $0C
    ret  nz                                       ; $5DFA: $C0

    call UpdateEntityPosWithSpeed_36              ; $5DFB: $CD $62 $6A
    call label_3B23                               ; $5DFE: $CD $23 $3B
    call func_036_6C0D                            ; $5E01: $CD $0D $6C
    ld   a, $20                                   ; $5E04: $3E $20
    call func_036_6C83                            ; $5E06: $CD $83 $6C
    ld   hl, wEntitiesPrivateState1Table          ; $5E09: $21 $B0 $C2
    add  hl, bc                                   ; $5E0C: $09
    dec  [hl]                                     ; $5E0D: $35
    ld   a, [hl]                                  ; $5E0E: $7E
    and  a                                        ; $5E0F: $A7
    ret  nz                                       ; $5E10: $C0

    ld   a, $30                                   ; $5E11: $3E $30
    call func_036_6C83                            ; $5E13: $CD $83 $6C
    ld   a, $03                                   ; $5E16: $3E $03
    call SetEntityState                           ; $5E18: $CD $07 $6C
    ret                                           ; $5E1B: $C9

AvalaunchState8Handler::
    call GetEntityTransitionCountdown             ; $5E1C: $CD $05 $0C
    ret  nz                                       ; $5E1F: $C0

    call func_036_6C0D                            ; $5E20: $CD $0D $6C
    ld   a, $08                                   ; $5E23: $3E $08
    call func_036_6C83                            ; $5E25: $CD $83 $6C
    ld   hl, wEntitiesPrivateState2Table          ; $5E28: $21 $C0 $C2
    add  hl, bc                                   ; $5E2B: $09
    dec  [hl]                                     ; $5E2C: $35
    ld   a, [hl]                                  ; $5E2D: $7E
    and  a                                        ; $5E2E: $A7
    ret  nz                                       ; $5E2F: $C0

    ld   [hl], $01                                ; $5E30: $36 $01
    xor  a                                        ; $5E32: $AF
    call PointHLToEntitySpeedX                    ; $5E33: $CD $EE $6B
    ld   [hl], a                                  ; $5E36: $77
    call PointHLToEntitySpeedY                    ; $5E37: $CD $F3 $6B
    ld   [hl], a                                  ; $5E3A: $77
    call PointHLToEntitySpeedZ                    ; $5E3B: $CD $F8 $6B
    ld   [hl], $18                                ; $5E3E: $36 $18
    call IncrementEntityState                     ; $5E40: $CD $12 $3B
    call PointHLToEntityPosX                      ; $5E43: $CD $23 $6C
    ld   a, [hl]                                  ; $5E46: $7E
    call PointHLToEntitySpeedX                    ; $5E47: $CD $EE $6B
    cp   $50                                      ; $5E4A: $FE $50
    jr   z, .jr_5E53                              ; $5E4C: $28 $05

    jr   nc, jr_036_5E56                          ; $5E4E: $30 $06

    ld   [hl], $10                                ; $5E50: $36 $10
    ret                                           ; $5E52: $C9

.jr_5E53
    call PointHLToEntitySpeedY                    ; $5E53: $CD $F3 $6B

jr_036_5E56:
    ld   [hl], $F0                                ; $5E56: $36 $F0
    ret                                           ; $5E58: $C9

AvalaunchState9Handler::
    call UpdateEntityPosWithSpeed_36              ; $5E59: $CD $62 $6A
    call label_3B23                               ; $5E5C: $CD $23 $3B
    call PointHLToEntitySpeedX                    ; $5E5F: $CD $EE $6B
    ld   a, [hl]                                  ; $5E62: $7E
    and  a                                        ; $5E63: $A7
    jr   z, jr_036_5E81                           ; $5E64: $28 $1B

    call PointHLToEntityPosX                      ; $5E66: $CD $23 $6C
    and  $80                                      ; $5E69: $E6 $80
    jr   nz, .jr_5E74                             ; $5E6B: $20 $07

    ld   a, [hl]                                  ; $5E6D: $7E
    cp   $50                                      ; $5E6E: $FE $50
    jr   c, jr_036_5E81                           ; $5E70: $38 $0F

    jr   jr_036_5E79                              ; $5E72: $18 $05

.jr_5E74
    ld   a, [hl]                                  ; $5E74: $7E
    cp   $50                                      ; $5E75: $FE $50
    jr   nc, jr_036_5E81                          ; $5E77: $30 $08

jr_036_5E79:
    ld   a, $50                                   ; $5E79: $3E $50
    ld   [hl], a                                  ; $5E7B: $77
    call PointHLToEntitySpeedX                    ; $5E7C: $CD $EE $6B
    xor  a                                        ; $5E7F: $AF
    ld   [hl], a                                  ; $5E80: $77

jr_036_5E81:
    call PointHLToEntitySpeedZ                    ; $5E81: $CD $F8 $6B
    dec  [hl]                                     ; $5E84: $35
    call func_036_6AEC                            ; $5E85: $CD $EC $6A
    ld   a, [hl]                                  ; $5E88: $7E
    bit  7, a                                     ; $5E89: $CB $7F
    jr   z, ret_036_5EC1                          ; $5E8B: $28 $34

    xor  a                                        ; $5E8D: $AF
    ld   [hl], a                                  ; $5E8E: $77
    ld   hl, wEntitiesFlashCountdownTable         ; $5E8F: $21 $20 $C4
    add  hl, bc                                   ; $5E92: $09
    ld   [hl], a                                  ; $5E93: $77
    ld   a, $30                                   ; $5E94: $3E $30
    ld   [wC157], a                               ; $5E96: $EA $57 $C1
    ld   a, $04                                   ; $5E99: $3E $04
    ld   [wC158], a                               ; $5E9B: $EA $58 $C1
    call func_036_5EC2                            ; $5E9E: $CD $C2 $5E
    ld   hl, wEntitiesPrivateState2Table          ; $5EA1: $21 $C0 $C2
    add  hl, bc                                   ; $5EA4: $09
    ld   a, [hl]                                  ; $5EA5: $7E
    and  a                                        ; $5EA6: $A7
    jr   z, .jr_5EAC                              ; $5EA7: $28 $03

    call func_036_5EC2                            ; $5EA9: $CD $C2 $5E

.jr_5EAC
    call PointHLToEntitySpriteVariant             ; $5EAC: $CD $02 $6C
    ld   a, [hl]                                  ; $5EAF: $7E
    and  $01                                      ; $5EB0: $E6 $01
    jr   nz, .jr_5EB6                             ; $5EB2: $20 $02

    ld   a, $80                                   ; $5EB4: $3E $80

.jr_5EB6
    and  $80                                      ; $5EB6: $E6 $80
    ld   [hl], a                                  ; $5EB8: $77
    ld   a, $20                                   ; $5EB9: $3E $20
    call func_036_6C83                            ; $5EBB: $CD $83 $6C
    call IncrementEntityState                     ; $5EBE: $CD $12 $3B

ret_036_5EC1:
    ret                                           ; $5EC1: $C9

func_036_5EC2::
    xor  a                                        ; $5EC2: $AF
    ld   e, a                                     ; $5EC3: $5F
    ld   d, a                                     ; $5EC4: $57
    ldh  [hMultiPurpose0], a                      ; $5EC5: $E0 $D7

jr_036_5EC7:
    ld   hl, wEntitiesTypeTable                   ; $5EC7: $21 $A0 $C3
    add  hl, de                                   ; $5ECA: $19
    ld   a, [hl]                                  ; $5ECB: $7E
    cp   $F5                                      ; $5ECC: $FE $F5
    jr   nz, .jr_5EDC                             ; $5ECE: $20 $0C

    ld   hl, wEntitiesStatusTable                 ; $5ED0: $21 $80 $C2
    add  hl, de                                   ; $5ED3: $19
    ld   a, [hl]                                  ; $5ED4: $7E
    and  a                                        ; $5ED5: $A7
    jr   z, .jr_5EDC                              ; $5ED6: $28 $04

    ld   hl, hMultiPurpose0                       ; $5ED8: $21 $D7 $FF
    inc  [hl]                                     ; $5EDB: $34

.jr_5EDC
    inc  de                                       ; $5EDC: $13
    ld   a, e                                     ; $5EDD: $7B
    and  $0F                                      ; $5EDE: $E6 $0F
    jr   nz, jr_036_5EC7                          ; $5EE0: $20 $E5

    ldh  a, [hMultiPurpose0]                      ; $5EE2: $F0 $D7
    cp   $06                                      ; $5EE4: $FE $06
    ret  nc                                       ; $5EE6: $D0

    ld   a, ENTITY_BOUNCING_BOULDER               ; $5EE7: $3E $F5
    call SpawnNewEntity_trampoline                ; $5EE9: $CD $86 $3B
    ret  c                                        ; $5EEC: $D8

    call GetRandomByte                            ; $5EED: $CD $0D $28
    rla                                           ; $5EF0: $17
    rla                                           ; $5EF1: $17
    rla                                           ; $5EF2: $17
    rla                                           ; $5EF3: $17
    and  $70                                      ; $5EF4: $E6 $70
    add  $18                                      ; $5EF6: $C6 $18
    ld   hl, wEntitiesPosXTable                   ; $5EF8: $21 $00 $C2
    add  hl, de                                   ; $5EFB: $19
    ld   [hl], a                                  ; $5EFC: $77
    ld   hl, wEntitiesPosYTable                   ; $5EFD: $21 $10 $C2
    add  hl, de                                   ; $5F00: $19
    ld   [hl], $10                                ; $5F01: $36 $10
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5F03: $21 $40 $C3
    add  hl, de                                   ; $5F06: $19
    ld   [hl], $12                                ; $5F07: $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ; $5F09: $21 $50 $C3
    add  hl, de                                   ; $5F0C: $19
    set  7, [hl]                                  ; $5F0D: $CB $FE
    ld   hl, wEntitiesStateTable                  ; $5F0F: $21 $90 $C2
    add  hl, de                                   ; $5F12: $19
    inc  [hl]                                     ; $5F13: $34
    ret                                           ; $5F14: $C9

AvalaunchStateAHandler::
    ld   a, [wIsLinkInTheAir]                     ; $5F15: $FA $46 $C1
    and  a                                        ; $5F18: $A7
    jr   nz, .jr_5F26                             ; $5F19: $20 $0B

    ld   a, $01                                   ; $5F1B: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5F1D: $E0 $A1
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_6A       ; $5F1F: $3E $6A
    ldh  [hLinkAnimationState], a                 ; $5F21: $E0 $9D
    ld   [wC167], a                               ; $5F23: $EA $67 $C1

.jr_5F26
    call GetEntityTransitionCountdown             ; $5F26: $CD $05 $0C
    ret  nz                                       ; $5F29: $C0

    xor  a                                        ; $5F2A: $AF
    ld   [wC167], a                               ; $5F2B: $EA $67 $C1
    ld   a, $04                                   ; $5F2E: $3E $04
    call func_036_6C83                            ; $5F30: $CD $83 $6C
    call PointHLToEntitySpriteVariant             ; $5F33: $CD $02 $6C
    inc  [hl]                                     ; $5F36: $34
    ld   a, [hl]                                  ; $5F37: $7E
    and  $0F                                      ; $5F38: $E6 $0F
    cp   $03                                      ; $5F3A: $FE $03
    jr   nz, .jr_5F43                             ; $5F3C: $20 $05

    push af                                       ; $5F3E: $F5
    call func_036_5EC2                            ; $5F3F: $CD $C2 $5E
    pop  af                                       ; $5F42: $F1

.jr_5F43
    cp   $06                                      ; $5F43: $FE $06
    jr   c, .ret_5F58                             ; $5F45: $38 $11

    ld   a, [hl]                                  ; $5F47: $7E
    swap a                                        ; $5F48: $CB $37
    srl  a                                        ; $5F4A: $CB $3F
    srl  a                                        ; $5F4C: $CB $3F
    srl  a                                        ; $5F4E: $CB $3F
    and  $01                                      ; $5F50: $E6 $01
    ld   [hl], a                                  ; $5F52: $77
    ld   a, $03                                   ; $5F53: $3E $03
    call SetEntityState                           ; $5F55: $CD $07 $6C

.ret_5F58
    ret                                           ; $5F58: $C9

Data_036_5F59::
    dw   Data_020_68B8
    dw   Data_020_68D8

Data_036_5F5D::
    dw   Data_020_6918
    dw   Data_020_68B8
    dw   Data_020_68D8
    dw   Data_020_68F8
    dw   Data_020_68D8
    dw   Data_020_68B8

Data_036_5F69::
    dw   Data_020_68F8
    dw   Data_020_68D8
    dw   Data_020_68B8
    dw   Data_020_6918
    dw   Data_020_68B8
    dw   Data_020_68D8

func_036_5F75::
    ld   d, $00                                   ; $5F75: $16 $00
    call PointHLToEntitySpriteVariant             ; $5F77: $CD $02 $6C
    ld   e, [hl]                                  ; $5F7A: $5E
    ldh  a, [hActiveEntityState]                  ; $5F7B: $F0 $F0
    cp   $0A                                      ; $5F7D: $FE $0A
    jr   c, .jr_5F8D                              ; $5F7F: $38 $0C

    ld   hl, Data_036_5F5D                        ; $5F81: $21 $5D $5F
    sla  e                                        ; $5F84: $CB $23
    jr   nc, jr_036_5F92                          ; $5F86: $30 $0A

    ld   hl, Data_036_5F69                        ; $5F88: $21 $69 $5F
    jr   jr_036_5F92                              ; $5F8B: $18 $05

.jr_5F8D
    sla  e                                        ; $5F8D: $CB $23
    ld   hl, Data_036_5F59                        ; $5F8F: $21 $59 $5F

jr_036_5F92:
    call func_036_6C7E                            ; $5F92: $CD $7E $6C
    ld   c, $08                                   ; $5F95: $0E $08
    ld   a, $36                                   ; $5F97: $3E $36
    call func_A5F                                 ; $5F99: $CD $5F $0A
    ld   a, $08                                   ; $5F9C: $3E $08
    call func_015_7964_trampoline                 ; $5F9E: $CD $A0 $3D
    ret                                           ; $5FA1: $C9

FlyingHopperBombsEntityHandler::
HopperEntityHandler::
    call func_036_6219                            ; $5FA2: $CD $19 $62
    call ReturnIfNonInteractive_36                ; $5FA5: $CD $40 $6A
    call label_3B70                               ; $5FA8: $CD $70 $3B
    call UpdateEntityPosWithSpeed_36              ; $5FAB: $CD $62 $6A
    call label_3CD9                               ; $5FAE: $CD $D9 $3C
    ld   hl, wEntitiesFlashCountdownTable         ; $5FB1: $21 $20 $C4
    add  hl, bc                                   ; $5FB4: $09
    ld   a, [hl]                                  ; $5FB5: $7E
    and  a                                        ; $5FB6: $A7
    jr   nz, .jr_5FBF                             ; $5FB7: $20 $06

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $5FB9: $21 $10 $C4
    add  hl, bc                                   ; $5FBC: $09
    ld   [hl], $00                                ; $5FBD: $36 $00

.jr_5FBF
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $5FBF: $21 $10 $C4
    add  hl, bc                                   ; $5FC2: $09
    ld   a, [hl]                                  ; $5FC3: $7E
    push af                                       ; $5FC4: $F5
    push hl                                       ; $5FC5: $E5
    ld   [hl], $01                                ; $5FC6: $36 $01

.jr_5FC8
    call label_3B23                               ; $5FC8: $CD $23 $3B
    pop  hl                                       ; $5FCB: $E1
    pop  af                                       ; $5FCC: $F1
    ld   [hl], a                                  ; $5FCD: $77
    ldh  a, [hActiveEntityState]                  ; $5FCE: $F0 $F0
    JP_TABLE                                      ; $5FD0
._00 dw HopperState0Handler
._01 dw HopperState1Handler
._02 dw HopperState2Handler
._03 dw HopperState3Handler
._04 dw HopperState4Handler

HopperState4Handler::
    call PointHLToEntitySpeedZ                    ; $5FDB: $CD $F8 $6B
    dec  [hl]                                     ; $5FDE: $35
    ld   a, [hl]                                  ; $5FDF: $7E
    ldh  [hMultiPurpose0], a                      ; $5FE0: $E0 $D7
    call func_036_6AEC                            ; $5FE2: $CD $EC $6A
    ld   a, [hl]                                  ; $5FE5: $7E
    bit  7, a                                     ; $5FE6: $CB $7F
    jr   z, ret_036_604E                          ; $5FE8: $28 $64

    ldh  a, [hMultiPurpose0]                      ; $5FEA: $F0 $D7
    bit  7, a                                     ; $5FEC: $CB $7F
    jr   z, ret_036_604E                          ; $5FEE: $28 $5E

    ld   e, $04                                   ; $5FF0: $1E $04
    call GetRandomByte                            ; $5FF2: $CD $0D $28
    and  $01                                      ; $5FF5: $E6 $01
    jr   z, .jr_5FFB                              ; $5FF7: $28 $02

    ld   e, $FC                                   ; $5FF9: $1E $FC

.jr_5FFB
    call PointHLToEntitySpeedX                    ; $5FFB: $CD $EE $6B
    ld   [hl], e                                  ; $5FFE: $73
    call PointHLToEntityDirection                 ; $5FFF: $CD $FD $6B
    ld   [hl], $00                                ; $6002: $36 $00
    bit  7, e                                     ; $6004: $CB $7B
    jr   nz, .jr_6009                             ; $6006: $20 $01

    inc  [hl]                                     ; $6008: $34

.jr_6009
    ld   e, $03                                   ; $6009: $1E $03
    call GetRandomByte                            ; $600B: $CD $0D $28
    and  $01                                      ; $600E: $E6 $01
    jr   z, .jr_6014                              ; $6010: $28 $02

    ld   e, $FD                                   ; $6012: $1E $FD

.jr_6014
    call PointHLToEntitySpeedY                    ; $6014: $CD $F3 $6B
    ld   [hl], e                                  ; $6017: $73
    call PointHLToEntitySpeedZ                    ; $6018: $CD $F8 $6B
    ld   [hl], $14                                ; $601B: $36 $14
    ld   a, JINGLE_FEATHER_JUMP                   ; $601D: $3E $0D
    ldh  [hJingle], a                             ; $601F: $E0 $F2

func_036_6021::
    ld   d, $00                                   ; $6021: $16 $00
    call PointHLToEntityDirection                 ; $6023: $CD $FD $6B
    ld   e, [hl]                                  ; $6026: $5E
    call PointHLToEntityPosX                      ; $6027: $CD $23 $6C
    ld   a, [hl]                                  ; $602A: $7E
    ldh  [hMultiPurpose0], a                      ; $602B: $E0 $D7
    call PointHLToEntityPosY                      ; $602D: $CD $28 $6C
    ld   a, [hl]                                  ; $6030: $7E
    ldh  [hMultiPurpose1], a                      ; $6031: $E0 $D8
    ld   a, $36                                   ; $6033: $3E $36
    call func_020_4874_trampoline                 ; $6035: $CD $DE $09
    ld   hl, wRoomObjects                         ; $6038: $21 $11 $D7
    add  hl, de                                   ; $603B: $19
    ld   a, [hl]                                  ; $603C: $7E
    cp   $53                                      ; $603D: $FE $53
    jr   z, .jr_6049                              ; $603F: $28 $08

    cp   $55                                      ; $6041: $FE $55
    jr   z, .jr_6049                              ; $6043: $28 $04

    cp   $54                                      ; $6045: $FE $54
    jr   nz, ret_036_604E                         ; $6047: $20 $05

.jr_6049
    ld   a, $36                                   ; $6049: $3E $36
    call func_020_4954_trampoline                 ; $604B: $CD $E9 $09

ret_036_604E:
    ret                                           ; $604E: $C9

HopperState3Handler::
    xor  a                                        ; $604F: $AF
    call PointHLToEntitySpeedX                    ; $6050: $CD $EE $6B
    ld   [hl], a                                  ; $6053: $77
    call PointHLToEntitySpeedY                    ; $6054: $CD $F3 $6B
    ld   [hl], a                                  ; $6057: $77
    call PointHLToEntitySpriteVariant             ; $6058: $CD $02 $6C
    ld   [hl], a                                  ; $605B: $77
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $605C: $21 $10 $C4
    add  hl, bc                                   ; $605F: $09
    ld   [hl], a                                  ; $6060: $77
    call IncrementEntityState                     ; $6061: $CD $12 $3B
    ret                                           ; $6064: $C9

func_036_6065::
    ld   hl, wEntitiesFlashCountdownTable         ; $6065: $21 $20 $C4
    add  hl, bc                                   ; $6068: $09
    ld   a, [hl]                                  ; $6069: $7E
    and  a                                        ; $606A: $A7
    jr   z, .jr_607A                              ; $606B: $28 $0D

    ld   a, $03                                   ; $606D: $3E $03
    call SetEntityState                           ; $606F: $CD $07 $6C
    ld   hl, wEntitiesHealthGroup                 ; $6072: $21 $D0 $C4
    add  hl, bc                                   ; $6075: $09
    ld   [hl], $00                                ; $6076: $36 $00
    jr   ret_036_6083                             ; $6078: $18 $09

.jr_607A
    ldh  a, [hFrameCounter]                       ; $607A: $F0 $E7
    and  $07                                      ; $607C: $E6 $07
    jr   nz, ret_036_6083                         ; $607E: $20 $03

    call func_036_6C0D                            ; $6080: $CD $0D $6C

ret_036_6083:
    ret                                           ; $6083: $C9

func_036_6084::
    call func_036_6B8A                            ; $6084: $CD $8A $6B
    cp   $10                                      ; $6087: $FE $10
    jr   nc, ret_036_60B2                         ; $6089: $30 $27

    ldh  [hMultiPurpose0], a                      ; $608B: $E0 $D7
    ld   a, e                                     ; $608D: $7B
    ldh  [hMultiPurpose1], a                      ; $608E: $E0 $D8
    call func_036_6B9A                            ; $6090: $CD $9A $6B
    cp   $10                                      ; $6093: $FE $10
    jr   nc, ret_036_60B2                         ; $6095: $30 $1B

    call PointHLToEntitySpeedY                    ; $6097: $CD $F3 $6B
    ld   [hl], $10                                ; $609A: $36 $10
    bit  1, e                                     ; $609C: $CB $4B
    jr   z, .jr_60A2                              ; $609E: $28 $02

    ld   [hl], $F0                                ; $60A0: $36 $F0

.jr_60A2
    call PointHLToEntitySpeedX                    ; $60A2: $CD $EE $6B
    ld   [hl], $10                                ; $60A5: $36 $10
    bit  0, e                                     ; $60A7: $CB $43
    jr   z, .jr_60AD                              ; $60A9: $28 $02

    ld   [hl], $F0                                ; $60AB: $36 $F0

.jr_60AD
    ld   a, $02                                   ; $60AD: $3E $02
    call SetEntityState                           ; $60AF: $CD $07 $6C

ret_036_60B2:
    ret                                           ; $60B2: $C9

Data_036_60B3::
    db   $08, $0C, $F8, $F4, $02, $00, $FE, $00

HopperState0Handler::
    call func_036_6065                            ; $60BB: $CD $65 $60
    call GetRandomByte                            ; $60BE: $CD $0D $28
    and  $07                                      ; $60C1: $E6 $07
    ld   e, a                                     ; $60C3: $5F
    ld   d, $00                                   ; $60C4: $16 $00
    ld   hl, Data_036_60B3                        ; $60C6: $21 $B3 $60
    add  hl, de                                   ; $60C9: $19
    ld   a, [hl]                                  ; $60CA: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $60CB: $21 $B0 $C2
    add  hl, bc                                   ; $60CE: $09
    ld   [hl], a                                  ; $60CF: $77
    call PointHLToEntityPosX                      ; $60D0: $CD $23 $6C
    ld   a, [hl]                                  ; $60D3: $7E
    sub  $40                                      ; $60D4: $D6 $40
    ld   hl, wEntitiesPrivateState1Table          ; $60D6: $21 $B0 $C2
    add  hl, bc                                   ; $60D9: $09
    bit  7, a                                     ; $60DA: $CB $7F
    jr   z, .jr_60EC                              ; $60DC: $28 $0E

    cp   $D0                                      ; $60DE: $FE $D0
    jr   nc, jr_036_60F8                          ; $60E0: $30 $16

    ld   a, [hl]                                  ; $60E2: $7E
    bit  7, a                                     ; $60E3: $CB $7F
    jr   z, jr_036_60F8                           ; $60E5: $28 $11

    cpl                                           ; $60E7: $2F
    inc  a                                        ; $60E8: $3C
    ld   [hl], a                                  ; $60E9: $77
    jr   jr_036_60F8                              ; $60EA: $18 $0C

.jr_60EC
    cp   $30                                      ; $60EC: $FE $30
    jr   c, jr_036_60F8                           ; $60EE: $38 $08

    ld   a, [hl]                                  ; $60F0: $7E
    bit  7, a                                     ; $60F1: $CB $7F
    jr   nz, jr_036_60F8                          ; $60F3: $20 $03

    cpl                                           ; $60F5: $2F
    inc  a                                        ; $60F6: $3C
    ld   [hl], a                                  ; $60F7: $77

jr_036_60F8:
    ld   a, [hl]                                  ; $60F8: $7E
    call PointHLToEntityDirection                 ; $60F9: $CD $FD $6B
    ld   [hl], $00                                ; $60FC: $36 $00
    bit  7, a                                     ; $60FE: $CB $7F
    jr   nz, .jr_6103                             ; $6100: $20 $01

    inc  [hl]                                     ; $6102: $34

.jr_6103
    call GetRandomByte                            ; $6103: $CD $0D $28
    and  $07                                      ; $6106: $E6 $07
    ld   e, a                                     ; $6108: $5F
    ld   d, $00                                   ; $6109: $16 $00
    ld   hl, Data_036_60B3                        ; $610B: $21 $B3 $60
    add  hl, de                                   ; $610E: $19
    ld   a, [hl]                                  ; $610F: $7E
    ld   hl, wEntitiesPrivateState2Table          ; $6110: $21 $C0 $C2
    add  hl, bc                                   ; $6113: $09
    ld   [hl], a                                  ; $6114: $77
    call PointHLToEntityPosY                      ; $6115: $CD $28 $6C
    ld   a, [hl]                                  ; $6118: $7E
    sub  $40                                      ; $6119: $D6 $40
    ld   hl, wEntitiesPrivateState2Table          ; $611B: $21 $C0 $C2
    add  hl, bc                                   ; $611E: $09
    bit  7, a                                     ; $611F: $CB $7F
    jr   z, .jr_6131                              ; $6121: $28 $0E

    cp   $E0                                      ; $6123: $FE $E0
    jr   nc, jr_036_613D                          ; $6125: $30 $16

    ld   a, [hl]                                  ; $6127: $7E
    bit  7, a                                     ; $6128: $CB $7F
    jr   z, jr_036_613D                           ; $612A: $28 $11

    cpl                                           ; $612C: $2F
    inc  a                                        ; $612D: $3C
    ld   [hl], a                                  ; $612E: $77
    jr   jr_036_613D                              ; $612F: $18 $0C

.jr_6131
    cp   $20                                      ; $6131: $FE $20
    jr   c, jr_036_613D                           ; $6133: $38 $08

    ld   a, [hl]                                  ; $6135: $7E
    bit  7, a                                     ; $6136: $CB $7F
    jr   nz, jr_036_613D                          ; $6138: $20 $03

    cpl                                           ; $613A: $2F
    inc  a                                        ; $613B: $3C
    ld   [hl], a                                  ; $613C: $77

jr_036_613D:
    call IncrementEntityState                     ; $613D: $CD $12 $3B
    call func_036_6084                            ; $6140: $CD $84 $60
    ret                                           ; $6143: $C9

HopperState1Handler::
    call func_036_6065                            ; $6144: $CD $65 $60
    ldh  a, [hFrameCounter]                       ; $6147: $F0 $E7
    and  $01                                      ; $6149: $E6 $01
    jr   z, jr_036_6181                           ; $614B: $28 $34

    ld   hl, wEntitiesPrivateState1Table          ; $614D: $21 $B0 $C2
    add  hl, bc                                   ; $6150: $09
    ld   a, [hl]                                  ; $6151: $7E
    ld   e, a                                     ; $6152: $5F
    call PointHLToEntitySpeedX                    ; $6153: $CD $EE $6B
    cp   [hl]                                     ; $6156: $BE
    jr   z, .jr_6160                              ; $6157: $28 $07

    dec  [hl]                                     ; $6159: $35
    bit  7, a                                     ; $615A: $CB $7F
    jr   nz, .jr_6160                             ; $615C: $20 $02

    inc  [hl]                                     ; $615E: $34
    inc  [hl]                                     ; $615F: $34

.jr_6160
    ld   hl, wEntitiesPrivateState2Table          ; $6160: $21 $C0 $C2
    add  hl, bc                                   ; $6163: $09
    ld   a, [hl]                                  ; $6164: $7E
    ld   d, a                                     ; $6165: $57
    call PointHLToEntitySpeedY                    ; $6166: $CD $F3 $6B
    cp   [hl]                                     ; $6169: $BE
    jr   z, .jr_6173                              ; $616A: $28 $07

    dec  [hl]                                     ; $616C: $35
    bit  7, a                                     ; $616D: $CB $7F
    jr   nz, .jr_6173                             ; $616F: $20 $02

    inc  [hl]                                     ; $6171: $34
    inc  [hl]                                     ; $6172: $34

.jr_6173
    ld   a, [hl]                                  ; $6173: $7E
    cp   d                                        ; $6174: $BA
    jr   nz, jr_036_6181                          ; $6175: $20 $0A

    call PointHLToEntitySpeedX                    ; $6177: $CD $EE $6B
    ld   a, [hl]                                  ; $617A: $7E
    cp   e                                        ; $617B: $BB
    jr   nz, jr_036_6181                          ; $617C: $20 $03

    call IncrementEntityState                     ; $617E: $CD $12 $3B

jr_036_6181:
    call func_036_6084                            ; $6181: $CD $84 $60
    ret                                           ; $6184: $C9

HopperState2Handler::
    call func_036_6065                            ; $6185: $CD $65 $60
    ldh  a, [hFrameCounter]                       ; $6188: $F0 $E7
    and  $01                                      ; $618A: $E6 $01
    jr   z, jr_036_6205                           ; $618C: $28 $77

    call PointHLToEntitySpeedX                    ; $618E: $CD $EE $6B
    ld   a, [hl]                                  ; $6191: $7E
    and  a                                        ; $6192: $A7
    jr   z, .jr_619C                              ; $6193: $28 $07

    inc  [hl]                                     ; $6195: $34
    bit  7, a                                     ; $6196: $CB $7F
    jr   nz, .jr_619C                             ; $6198: $20 $02

    dec  [hl]                                     ; $619A: $35
    dec  [hl]                                     ; $619B: $35

.jr_619C
    call PointHLToEntitySpeedY                    ; $619C: $CD $F3 $6B
    ld   a, [hl]                                  ; $619F: $7E
    and  a                                        ; $61A0: $A7
    jr   z, .jr_61AA                              ; $61A1: $28 $07

    inc  [hl]                                     ; $61A3: $34
    bit  7, a                                     ; $61A4: $CB $7F
    jr   nz, .jr_61AA                             ; $61A6: $20 $02

    dec  [hl]                                     ; $61A8: $35
    dec  [hl]                                     ; $61A9: $35

.jr_61AA
    ld   a, [hl]                                  ; $61AA: $7E
    and  a                                        ; $61AB: $A7
    jr   nz, jr_036_6205                          ; $61AC: $20 $57

    call PointHLToEntitySpeedX                    ; $61AE: $CD $EE $6B
    ld   a, [hl]                                  ; $61B1: $7E
    and  a                                        ; $61B2: $A7
    jr   nz, jr_036_6205                          ; $61B3: $20 $50

    ld   a, $10                                   ; $61B5: $3E $10
    call func_036_6C83                            ; $61B7: $CD $83 $6C
    xor  a                                        ; $61BA: $AF
    call SetEntityState                           ; $61BB: $CD $07 $6C
    ld   a, [wHasPlacedBomb]                      ; $61BE: $FA $4E $C1
    and  a                                        ; $61C1: $A7
    jr   nz, jr_036_6205                          ; $61C2: $20 $41

    call GetRandomByte                            ; $61C4: $CD $0D $28
    and  $03                                      ; $61C7: $E6 $03
    jr   nz, jr_036_6205                          ; $61C9: $20 $3A

    ld   a, ENTITY_BOMB                           ; $61CB: $3E $02
    call SpawnNewEntity_trampoline                ; $61CD: $CD $86 $3B
    jr   c, jr_036_6205                           ; $61D0: $38 $33

    ld   hl, wEntitiesOptions1Table               ; $61D2: $21 $30 $C4
    add  hl, de                                   ; $61D5: $19
    res  0, [hl]                                  ; $61D6: $CB $86
    call PointHLToEntityPosX                      ; $61D8: $CD $23 $6C
    ld   a, [hl]                                  ; $61DB: $7E
    ld   hl, wEntitiesPosXTable                   ; $61DC: $21 $00 $C2
    add  hl, de                                   ; $61DF: $19
    ld   [hl], a                                  ; $61E0: $77
    call PointHLToEntityPosY                      ; $61E1: $CD $28 $6C
    ld   a, [hl]                                  ; $61E4: $7E
    ld   hl, wEntitiesPosYTable                   ; $61E5: $21 $10 $C2
    add  hl, de                                   ; $61E8: $19
    ld   [hl], a                                  ; $61E9: $77
    call PointHLToEntityPosZ                      ; $61EA: $CD $2D $6C
    ld   a, [hl]                                  ; $61ED: $7E
    ld   hl, wEntitiesPosZTable                   ; $61EE: $21 $10 $C3
    add  hl, de                                   ; $61F1: $19
    ld   [hl], a                                  ; $61F2: $77
    ld   hl, wEntitiesSpeedZTable                 ; $61F3: $21 $20 $C3
    add  hl, de                                   ; $61F6: $19
    ld   [hl], $08                                ; $61F7: $36 $08
    ld   hl, wEntitiesTransitionCountdownTable    ; $61F9: $21 $E0 $C2
    add  hl, de                                   ; $61FC: $19
    ld   [hl], $48                                ; $61FD: $36 $48
    ld   hl, wEntitiesPrivateState4Table          ; $61FF: $21 $40 $C4
    add  hl, de                                   ; $6202: $19
    ld   [hl], $01                                ; $6203: $36 $01

jr_036_6205:
    call func_036_6084                            ; $6205: $CD $84 $60
    ret                                           ; $6208: $C9

Data_036_6209::
    dw   Data_020_6838
    dw   Data_020_6848
    dw   Data_020_6858
    dw   Data_020_6868
    dw   Data_020_6878
    dw   Data_020_6888
    dw   Data_020_6898
    dw   Data_020_68A8

func_036_6219::
    ld   d, $00                                   ; $6219: $16 $00
    call PointHLToEntitySpriteVariant             ; $621B: $CD $02 $6C
    ld   a, [hl]                                  ; $621E: $7E
    sla  a                                        ; $621F: $CB $27
    ld   e, a                                     ; $6221: $5F
    ld   hl, Data_036_6209                        ; $6222: $21 $09 $62
    add  hl, de                                   ; $6225: $19
    push hl                                       ; $6226: $E5
    call PointHLToEntityDirection                 ; $6227: $CD $FD $6B
    ld   a, [hl]                                  ; $622A: $7E
    sla  a                                        ; $622B: $CB $27
    sla  a                                        ; $622D: $CB $27
    ld   e, a                                     ; $622F: $5F
    pop  hl                                       ; $6230: $E1
    call func_036_6C7E                            ; $6231: $CD $7E $6C
    ld   c, $04                                   ; $6234: $0E $04
    ld   a, $36                                   ; $6236: $3E $36
    call func_A5F                                 ; $6238: $CD $5F $0A
    ld   a, $04                                   ; $623B: $3E $04
    call func_015_7964_trampoline                 ; $623D: $CD $A0 $3D
    ret                                           ; $6240: $C9

RotoswitchRedEntityHandler::
RotoswitchYellowEntityHandler::
RotoswitchBlueEntityHandler::
    ld   hl, wEntitiesHealthTable                 ; $6241: $21 $60 $C3
    add  hl, bc                                   ; $6244: $09
    ld   [hl], $FF                                ; $6245: $36 $FF
    call func_036_63C2                            ; $6247: $CD $C2 $63
    call func_036_6B5C                            ; $624A: $CD $5C $6B
    ld   a, [wRoomEventEffectExecuted]            ; $624D: $FA $8F $C1
    and  a                                        ; $6250: $A7
    jr   z, .jr_625F                              ; $6251: $28 $0C

    xor  a                                        ; $6253: $AF
    ld   hl, wEntitiesFlashCountdownTable         ; $6254: $21 $20 $C4
    add  hl, bc                                   ; $6257: $09
    ld   [hl], a                                  ; $6258: $77
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $6259: $21 $10 $C4
    add  hl, bc                                   ; $625C: $09
    ld   [hl], a                                  ; $625D: $77
    ret                                           ; $625E: $C9

.jr_625F
    ldh  a, [hActiveEntityState]                  ; $625F: $F0 $F0
    bit  7, a                                     ; $6261: $CB $7F
    ret  nz                                       ; $6263: $C0

    ldh  a, [hActiveEntityState]                  ; $6264: $F0 $F0
    JP_TABLE                                      ; $6266
._00 dw RotoswitchState0Handler
._01 dw RotoswitchState1Handler
._02 dw RotoswitchState2Handler

RotoswitchState0Handler::
    call ReturnIfNonInteractive_36                ; $626D: $CD $40 $6A
    call label_3B70                               ; $6270: $CD $70 $3B

.jr_6273
    call label_3B23                               ; $6273: $CD $23 $3B
    call PointHLToEntitySpriteVariant             ; $6276: $CD $02 $6C
    ld   a, [hl]                                  ; $6279: $7E
    and  $03                                      ; $627A: $E6 $03
    jr   nz, .ret_629E                            ; $627C: $20 $20

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $627E: $21 $10 $C4
    add  hl, bc                                   ; $6281: $09
    ld   a, [hl]                                  ; $6282: $7E
    and  a                                        ; $6283: $A7
    jr   z, .ret_629E                             ; $6284: $28 $18

    ld   a, $04                                   ; $6286: $3E $04
    call func_036_6C83                            ; $6288: $CD $83 $6C
    call PointHLToEntitySpriteVariant             ; $628B: $CD $02 $6C
    inc  [hl]                                     ; $628E: $34
    xor  a                                        ; $628F: $AF
    ld   hl, wEntitiesFlashCountdownTable         ; $6290: $21 $20 $C4
    add  hl, bc                                   ; $6293: $09
    ld   [hl], a                                  ; $6294: $77
    call func_036_629F                            ; $6295: $CD $9F $62
    call IncrementEntityState                     ; $6298: $CD $12 $3B
    call IncrementEntityState                     ; $629B: $CD $12 $3B

.ret_629E
    ret                                           ; $629E: $C9

func_036_629F::
    call PointHLToEntityPosX                      ; $629F: $CD $23 $6C
    ld   a, [hl]                                  ; $62A2: $7E
    ldh  [hMultiPurpose0], a                      ; $62A3: $E0 $D7
    call PointHLToEntityPosY                      ; $62A5: $CD $28 $6C
    ld   a, [hl]                                  ; $62A8: $7E
    ldh  [hMultiPurpose1], a                      ; $62A9: $E0 $D8
    ld   de, $00                                  ; $62AB: $11 $00 $00

jr_036_62AE:
    ld   a, e                                     ; $62AE: $7B
    sub  c                                        ; $62AF: $91
    jr   z, jr_036_631A                           ; $62B0: $28 $68

    ld   hl, wEntitiesTypeTable                   ; $62B2: $21 $A0 $C3
    add  hl, de                                   ; $62B5: $19
    ld   a, [hl]                                  ; $62B6: $7E
    cp   $EF                                      ; $62B7: $FE $EF
    jr   z, .jr_62C3                              ; $62B9: $28 $08

    cp   $F0                                      ; $62BB: $FE $F0
    jr   z, .jr_62C3                              ; $62BD: $28 $04

    cp   $F1                                      ; $62BF: $FE $F1
    jr   nz, jr_036_631A                          ; $62C1: $20 $57

.jr_62C3
    ld   hl, wEntitiesStateTable                  ; $62C3: $21 $90 $C2
    add  hl, de                                   ; $62C6: $19
    inc  [hl]                                     ; $62C7: $34
    ld   hl, wEntitiesPosXTable                   ; $62C8: $21 $00 $C2
    add  hl, de                                   ; $62CB: $19
    ldh  a, [hMultiPurpose0]                      ; $62CC: $F0 $D7
    cp   [hl]                                     ; $62CE: $BE
    jr   nz, jr_036_62EA                          ; $62CF: $20 $19

    ldh  a, [hMapRoom]                            ; $62D1: $F0 $F6
    cp   UNKNOWN_ROOM_0A                          ; $62D3: $FE $0A
    jr   nz, jr_036_630A                          ; $62D5: $20 $33

    ld   hl, wEntitiesPosYTable                   ; $62D7: $21 $10 $C2
    add  hl, de                                   ; $62DA: $19
    ldh  a, [hMultiPurpose1]                      ; $62DB: $F0 $D8
    sub  [hl]                                     ; $62DD: $96
    bit  7, a                                     ; $62DE: $CB $7F
    jr   z, .jr_62E4                              ; $62E0: $28 $02

    cpl                                           ; $62E2: $2F
    inc  a                                        ; $62E3: $3C

.jr_62E4
    cp   $20                                      ; $62E4: $FE $20
    jr   nz, jr_036_62EA                          ; $62E6: $20 $02

    jr   jr_036_630A                              ; $62E8: $18 $20

jr_036_62EA:
    ld   hl, wEntitiesPosYTable                   ; $62EA: $21 $10 $C2
    add  hl, de                                   ; $62ED: $19
    ldh  a, [hMultiPurpose1]                      ; $62EE: $F0 $D8
    cp   [hl]                                     ; $62F0: $BE
    jr   nz, jr_036_631A                          ; $62F1: $20 $27

    ldh  a, [hMapRoom]                            ; $62F3: $F0 $F6
    cp   UNKNOWN_ROOM_0A                          ; $62F5: $FE $0A
    jr   nz, jr_036_630A                          ; $62F7: $20 $11

    ld   hl, wEntitiesPosXTable                   ; $62F9: $21 $00 $C2
    add  hl, de                                   ; $62FC: $19
    ldh  a, [hMultiPurpose0]                      ; $62FD: $F0 $D7
    sub  [hl]                                     ; $62FF: $96
    bit  7, a                                     ; $6300: $CB $7F
    jr   z, .jr_6306                              ; $6302: $28 $02

    cpl                                           ; $6304: $2F
    inc  a                                        ; $6305: $3C

.jr_6306
    cp   $20                                      ; $6306: $FE $20
    jr   nz, jr_036_631A                          ; $6308: $20 $10

jr_036_630A:
    ld   hl, wEntitiesSpriteVariantTable          ; $630A: $21 $B0 $C3
    add  hl, de                                   ; $630D: $19
    inc  [hl]                                     ; $630E: $34
    ld   hl, wEntitiesTransitionCountdownTable    ; $630F: $21 $E0 $C2
    add  hl, de                                   ; $6312: $19
    ld   [hl], $04                                ; $6313: $36 $04
    ld   hl, wEntitiesStateTable                  ; $6315: $21 $90 $C2
    add  hl, de                                   ; $6318: $19
    inc  [hl]                                     ; $6319: $34

jr_036_631A:
    inc  de                                       ; $631A: $13
    ld   a, e                                     ; $631B: $7B
    and  $0F                                      ; $631C: $E6 $0F
    jr   nz, jr_036_62AE                          ; $631E: $20 $8E

    ret                                           ; $6320: $C9

RotoswitchState1Handler::
    ld   de, $00                                  ; $6321: $11 $00 $00

jr_036_6324:
    ld   hl, wEntitiesTypeTable                   ; $6324: $21 $A0 $C3
    add  hl, de                                   ; $6327: $19
    ld   a, [hl]                                  ; $6328: $7E
    cp   $EF                                      ; $6329: $FE $EF
    jr   z, .jr_6335                              ; $632B: $28 $08

    cp   $F0                                      ; $632D: $FE $F0
    jr   z, .jr_6335                              ; $632F: $28 $04

    cp   $F1                                      ; $6331: $FE $F1
    jr   nz, jr_036_634A                          ; $6333: $20 $15

.jr_6335
    ld   hl, wEntitiesStateTable                  ; $6335: $21 $90 $C2
    add  hl, de                                   ; $6338: $19
    ld   a, [hl]                                  ; $6339: $7E
    cp   $00                                      ; $633A: $FE $00
    jr   nz, jr_036_634A                          ; $633C: $20 $0C

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $633E: $21 $10 $C4
    add  hl, bc                                   ; $6341: $09
    xor  a                                        ; $6342: $AF
    ld   [hl], a                                  ; $6343: $77
    ld   a, $00                                   ; $6344: $3E $00
    call SetEntityState                           ; $6346: $CD $07 $6C
    ret                                           ; $6349: $C9

jr_036_634A:
    inc  de                                       ; $634A: $13
    ld   a, e                                     ; $634B: $7B
    and  $0F                                      ; $634C: $E6 $0F
    jr   nz, jr_036_6324                          ; $634E: $20 $D4

    ret                                           ; $6350: $C9

RotoswitchState2Handler::
    call GetEntityTransitionCountdown             ; $6351: $CD $05 $0C
    jr   nz, ret_036_6381                         ; $6354: $20 $2B

    call PointHLToEntitySpriteVariant             ; $6356: $CD $02 $6C
    ldh  a, [hMapRoom]                            ; $6359: $F0 $F6
    cp   ROOM_OW_MARIN_BRIDGE                     ; $635B: $FE $08
    jr   z, .jr_6364                              ; $635D: $28 $05

    call func_036_6382                            ; $635F: $CD $82 $63
    jr   jr_036_6366                              ; $6362: $18 $02

.jr_6364
    ld   a, [hl]                                  ; $6364: $7E
    inc  a                                        ; $6365: $3C

jr_036_6366:
    ld   [hl], a                                  ; $6366: $77
    cp   $0C                                      ; $6367: $FE $0C
    jr   nz, .jr_636C                             ; $6369: $20 $01

    xor  a                                        ; $636B: $AF

.jr_636C
    ld   [hl], a                                  ; $636C: $77
    and  $03                                      ; $636D: $E6 $03
    jr   nz, .jr_637C                             ; $636F: $20 $0B

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $6371: $21 $10 $C4
    add  hl, bc                                   ; $6374: $09
    xor  a                                        ; $6375: $AF
    ld   [hl], a                                  ; $6376: $77
    ld   a, $00                                   ; $6377: $3E $00
    call SetEntityState                           ; $6379: $CD $07 $6C

.jr_637C
    ld   a, $04                                   ; $637C: $3E $04
    call func_036_6C83                            ; $637E: $CD $83 $6C

ret_036_6381:
    ret                                           ; $6381: $C9

func_036_6382::
    ld   a, [hl]                                  ; $6382: $7E
    inc  a                                        ; $6383: $3C
    cp   $02                                      ; $6384: $FE $02
    ret  nz                                       ; $6386: $C0

    ld   a, $06                                   ; $6387: $3E $06
    ret                                           ; $6389: $C9

    ld   a, [hl]                                  ; $638A: $7E
    inc  a                                        ; $638B: $3C
    cp   $0A                                      ; $638C: $FE $0A
    ret  nz                                       ; $638E: $C0

    ld   a, $02                                   ; $638F: $3E $02
    ret                                           ; $6391: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown090SpriteVariants::
.variant0
    db $70, $02
    db $70, $22
.variant1
    db $72, $02
    db $74, $02
.variant2
    db $76, $01
    db $76, $21
.variant3
    db $74, $21
    db $72, $21
.variant4
    db $70, $01
    db $70, $21
.variant5
    db $72, $01
    db $74, $01
.variant6
    db $76, $03
    db $76, $23
.variant7
    db $74, $23
    db $72, $23
.variant8
    db $70, $03
    db $70, $23
.variant9
    db $72, $03
    db $74, $03
.variant10
    db $76, $02
    db $76, $22
.variant11
    db $74, $22
    db $72, $22

func_036_63C2::
    ld   de, Unknown090SpriteVariants             ; $63C2: $11 $92 $63
    call RenderActiveEntitySpritesPair            ; $63C5: $CD $C0 $3B
    ret                                           ; $63C8: $C9

ColorGhoulRedEntityHandler::
ColorGhoulGreenEntityHandler::
ColorGhoulBlueEntityHandler::
    call func_036_6629                            ; $63C9: $CD $29 $66
    ldh  a, [hActiveEntityStatus]                 ; $63CC: $F0 $EA
    cp   $05                                      ; $63CE: $FE $05
    call ReturnIfNonInteractive_36                ; $63D0: $CD $40 $6A
    call PointHLToEntitySpriteVariant             ; $63D3: $CD $02 $6C
    ld   a, [hl]                                  ; $63D6: $7E
    and  a                                        ; $63D7: $A7
    jr   z, .jr_63DD                              ; $63D8: $28 $03

    call label_3B39                               ; $63DA: $CD $39 $3B

.jr_63DD
    ld   a, [wC190]                               ; $63DD: $FA $90 $C1
    and  a                                        ; $63E0: $A7
    ret  z                                        ; $63E1: $C8

    ldh  a, [hActiveEntityState]                  ; $63E2: $F0 $F0
    JP_TABLE                                      ; $63E4
._00 dw ColorGhoulState0Handler
._01 dw ColorGhoulState1Handler
._02 dw ColorGhoulState2Handler
._03 dw ColorGhoulState3Handler
._04 dw ColorGhoulCommonStateHandler
._05 dw ColorGhoulCommonStateHandler
._06 dw ColorGhoulCommonStateHandler
._07 dw ColorGhoulCommonStateHandler
._08 dw ColorGhoulCommonStateHandler
._09 dw ColorGhoulCommonStateHandler
._0A dw ColorGhoulCommonStateHandler
._0B dw ColorGhoulStateBHandler

ColorGhoulState0Handler::
    call IncrementEntityState
    ret                                           ; $6400: $C9

ColorGhoulState1Handler::
    call PointHLToEntityDirection                 ; $6401: $CD $FD $6B
    ld   [hl], $00                                ; $6404: $36 $00
    call func_036_6B8A                            ; $6406: $CD $8A $6B
    cp   $28                                      ; $6409: $FE $28
    jp   nc, label_036_6423                       ; $640B: $D2 $23 $64

    ldh  a, [hLinkPositionX]                      ; $640E: $F0 $98
    call func_036_6C46                            ; $6410: $CD $46 $6C
    call func_036_6B9A                            ; $6413: $CD $9A $6B
    cp   $28                                      ; $6416: $FE $28
    jp   nc, label_036_6423                       ; $6418: $D2 $23 $64

    ldh  a, [hLinkPositionY]                      ; $641B: $F0 $99
    call func_036_6C54                            ; $641D: $CD $54 $6C
    call IncrementEntityState                     ; $6420: $CD $12 $3B

label_036_6423:
    ret                                           ; $6423: $C9

Data_036_6424::
    db   $10, $0C, $0E

ColorGhoulState2Handler::
    ld   hl, Data_036_6424
    ldh  a, [hActiveEntityType]                   ; $642A: $F0 $EB
    sub  ENTITY_COLOR_GHOUL_RED                   ; $642C: $D6 $EC
    ld   e, a                                     ; $642E: $5F
    ld   d, $00                                   ; $642F: $16 $00
    add  hl, de                                   ; $6431: $19
    ld   a, [hl]                                  ; $6432: $7E
    call PointHLToEntitySpeedX                    ; $6433: $CD $EE $6B
    ld   [hl], a                                  ; $6436: $77
    call PointHLToEntitySpeedY                    ; $6437: $CD $F3 $6B
    ld   [hl], a                                  ; $643A: $77
    call PointHLToEntityPosX                      ; $643B: $CD $23 $6C
    ld   e, [hl]                                  ; $643E: $5E
    call func_036_6C62                            ; $643F: $CD $62 $6C
    sub  e                                        ; $6442: $93
    ldh  [hMultiPurpose0], a                      ; $6443: $E0 $D7
    call PointHLToEntitySpeedX                    ; $6445: $CD $EE $6B
    and  a                                        ; $6448: $A7
    jr   nz, .jr_644C                             ; $6449: $20 $01

    ld   [hl], a                                  ; $644B: $77

.jr_644C
    bit  7, a                                     ; $644C: $CB $7F
    jr   z, .jr_6454                              ; $644E: $28 $04

    ld   a, [hl]                                  ; $6450: $7E
    cpl                                           ; $6451: $2F
    inc  a                                        ; $6452: $3C
    ld   [hl], a                                  ; $6453: $77

.jr_6454
    call PointHLToEntityPosY                      ; $6454: $CD $28 $6C
    ld   e, [hl]                                  ; $6457: $5E
    call func_036_6C70                            ; $6458: $CD $70 $6C
    sub  e                                        ; $645B: $93
    ldh  [hMultiPurpose1], a                      ; $645C: $E0 $D8
    call PointHLToEntitySpeedY                    ; $645E: $CD $F3 $6B
    and  a                                        ; $6461: $A7
    jr   nz, .jr_6465                             ; $6462: $20 $01

    ld   [hl], a                                  ; $6464: $77

.jr_6465
    bit  7, a                                     ; $6465: $CB $7F
    jr   z, .jr_646D                              ; $6467: $28 $04

    ld   a, [hl]                                  ; $6469: $7E
    cpl                                           ; $646A: $2F
    inc  a                                        ; $646B: $3C
    ld   [hl], a                                  ; $646C: $77

.jr_646D
    ldh  a, [hMultiPurpose0]                      ; $646D: $F0 $D7
    and  $FE                                      ; $646F: $E6 $FE
    ld   e, a                                     ; $6471: $5F
    ldh  a, [hMultiPurpose1]                      ; $6472: $F0 $D8
    and  $FE                                      ; $6474: $E6 $FE
    push af                                       ; $6476: $F5
    push de                                       ; $6477: $D5
    call UpdateEntityPosWithSpeed_36              ; $6478: $CD $62 $6A
    call label_3B23                               ; $647B: $CD $23 $3B
    pop  de                                       ; $647E: $D1
    pop  af                                       ; $647F: $F1
    or   e                                        ; $6480: $B3
    jr   nz, .jr_64A4                             ; $6481: $20 $21

    ld   a, $08                                   ; $6483: $3E $08
    call func_036_6C83                            ; $6485: $CD $83 $6C
    ld   a, $01                                   ; $6488: $3E $01
    call SetEntitySpriteVariant                   ; $648A: $CD $0C $3B
    call IncrementEntityState                     ; $648D: $CD $12 $3B
    call func_036_6B8A                            ; $6490: $CD $8A $6B
    call PointHLToEntityDirection                 ; $6493: $CD $FD $6B
    ld   a, e                                     ; $6496: $7B
    xor  $01                                      ; $6497: $EE $01
    ld   [hl], a                                  ; $6499: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $649A: $21 $40 $C3
    add  hl, bc                                   ; $649D: $09
    ld   a, [hl]                                  ; $649E: $7E
    and  $0F                                      ; $649F: $E6 $0F
    ld   [hl], a                                  ; $64A1: $77
    jr   ret_036_64B9                             ; $64A2: $18 $15

.jr_64A4
    ld   hl, wEntitiesCollisionsTable             ; $64A4: $21 $A0 $C2
    add  hl, bc                                   ; $64A7: $09
    ld   a, [hl]                                  ; $64A8: $7E
    and  a                                        ; $64A9: $A7
    jr   z, ret_036_64B9                          ; $64AA: $28 $0D

    ld   hl, wEntitiesPhysicsFlagsTable           ; $64AC: $21 $40 $C3
    add  hl, bc                                   ; $64AF: $09
    ld   a, [hl]                                  ; $64B0: $7E
    and  $DF                                      ; $64B1: $E6 $DF
    ld   [hl], a                                  ; $64B3: $77
    ld   a, $01                                   ; $64B4: $3E $01
    call SetEntityState                           ; $64B6: $CD $07 $6C

ret_036_64B9:
    ret                                           ; $64B9: $C9

Data_036_64BA::
    db   $04, $00, $02

ColorGhoulState3Handler::
    call GetEntityTransitionCountdown             ; $64BD: $CD $05 $0C
    jr   nz, .ret_64E6                            ; $64C0: $20 $24

    ld   a, $08                                   ; $64C2: $3E $08
    call func_036_6C83                            ; $64C4: $CD $83 $6C
    call PointHLToEntitySpriteVariant             ; $64C7: $CD $02 $6C
    inc  [hl]                                     ; $64CA: $34
    ld   a, [hl]                                  ; $64CB: $7E
    cp   $03                                      ; $64CC: $FE $03
    jr   nz, .ret_64E6                            ; $64CE: $20 $16

    ld   a, $10                                   ; $64D0: $3E $10
    call func_036_6C83                            ; $64D2: $CD $83 $6C
    ld   hl, Data_036_64BA                        ; $64D5: $21 $BA $64
    ldh  a, [hActiveEntityType]                   ; $64D8: $F0 $EB
    sub  ENTITY_COLOR_GHOUL_RED                   ; $64DA: $D6 $EC
    ld   e, a                                     ; $64DC: $5F
    ld   d, $00                                   ; $64DD: $16 $00
    add  hl, de                                   ; $64DF: $19
    ld   a, [hl]                                  ; $64E0: $7E
    call IncrementEntityState                     ; $64E1: $CD $12 $3B
    add  [hl]                                     ; $64E4: $86
    ld   [hl], a                                  ; $64E5: $77

.ret_64E6
    ret                                           ; $64E6: $C9

ColorGhoulCommonStateHandler::
    call GetEntityTransitionCountdown             ; $64E7: $CD $05 $0C
    ret  nz                                       ; $64EA: $C0

    call IncrementEntityState                     ; $64EB: $CD $12 $3B
    call PointHLToEntityDirection                 ; $64EE: $CD $FD $6B
    ld   a, [hl]                                  ; $64F1: $7E
    xor  $01                                      ; $64F2: $EE $01
    ld   [hl], a                                  ; $64F4: $77
    ld   a, $08                                   ; $64F5: $3E $08
    call func_036_6C83                            ; $64F7: $CD $83 $6C
    ldh  a, [hActiveEntityState]                  ; $64FA: $F0 $F0
    cp   $0A                                      ; $64FC: $FE $0A
    jr   c, .jr_6504                              ; $64FE: $38 $04

    call PointHLToEntitySpriteVariant             ; $6500: $CD $02 $6C
    dec  [hl]                                     ; $6503: $35

.jr_6504
    ret                                           ; $6504: $C9

; @FIXME Data disassembled as code
    ld   d, c                                     ; $6505: $51
    ld   d, b                                     ; $6506: $50
    ld   d, d                                     ; $6507: $52

ColorGhoulStateBHandler::
    call GetEntityTransitionCountdown             ; $6508: $CD $05 $0C
    jp   nz, label_036_6528                       ; $650B: $C2 $28 $65

    ld   a, $08                                   ; $650E: $3E $08
    call func_036_6C83                            ; $6510: $CD $83 $6C
    call PointHLToEntitySpriteVariant             ; $6513: $CD $02 $6C
    dec  [hl]                                     ; $6516: $35
    ld   a, [hl]                                  ; $6517: $7E
    and  a                                        ; $6518: $A7
    jr   nz, label_036_6528                       ; $6519: $20 $0D

    ld   a, $01                                   ; $651B: $3E $01
    call SetEntityState                           ; $651D: $CD $07 $6C
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6520: $21 $40 $C3
    add  hl, bc                                   ; $6523: $09
    ld   a, [hl]                                  ; $6524: $7E
    or   $D0                                      ; $6525: $F6 $D0
    ld   [hl], a                                  ; $6527: $77

label_036_6528:
    ret                                           ; $6528: $C9

Data_036_6529::
    db   $00, $00, $60, $02, $00, $08, $60, $22   ; $6529

Data_036_6531::
    db   $00, $00, $60, $00, $00, $08, $60, $20   ; $6531

Data_036_6539::
    db   $00, $00, $60, $03, $00, $08, $60, $23   ; $6539

Data_036_6541::
    db   $00, $00, $62, $02, $00, $08, $62, $22   ; $6541

Data_036_6549::
    db   $00, $00, $62, $00, $00, $08, $62, $20   ; $6549

Data_036_6551::
    db   $00, $00, $62, $03, $00, $08, $62, $23   ; $6551

Data_036_6559::
    db   $00, $00, $6C, $02, $00, $08, $6E, $02   ; $6559

Data_036_6561::
    db   $00, $08, $6C, $22, $00, $00, $6E, $22   ; $6561

Data_036_6569::
    db   $00, $00, $6C, $00, $00, $08, $6E, $00   ; $6569

Data_036_6571::
    db   $00, $08, $6C, $20, $00, $00, $6E, $20   ; $6571

Data_036_6579::
    db   $00, $00, $6C, $03, $00, $08, $6E, $03   ; $6579

Data_036_6581::
    db   $00, $08, $6C, $23, $00, $00, $6E, $23   ; $6581

Data_036_6589::
    db   $F0, $00, $64, $02, $F0, $08, $66, $02   ; $6589
    db   $00, $00, $68, $02, $00, $08, $6A, $02   ; $6591

Data_036_6599::
    db   $F0, $00, $66, $22, $F0, $08, $64, $22   ; $6599
    db   $00, $00, $6A, $22, $00, $08, $68, $22   ; $65A1

Data_036_65A9::
    db   $F0, $00, $64, $00, $F0, $08, $66, $00   ; $65A9
    db   $00, $00, $68, $00, $00, $08, $6A, $00   ; $65B1

Data_036_65B9::
    db   $F0, $00, $66, $20, $F0, $08, $64, $20   ; $65B9
    db   $00, $00, $6A, $20, $00, $08, $68, $20   ; $65C1

Data_036_65C9::
    db   $F0, $00, $64, $03, $F0, $08, $66, $03   ; $65C9
    db   $00, $00, $68, $03, $00, $08, $6A, $03   ; $65D1

Data_036_65D9::
    db   $F0, $00, $66, $23, $F0, $08, $64, $23   ; $65D9
    db   $00, $00, $6A, $23, $00, $08, $68, $23   ; $65E1

Data_036_65E9::
    dw   Data_036_6529
    dw   Data_036_6541
    dw   Data_036_6559
    dw   Data_036_6589

Data_036_65F1::
    dw   Data_036_6531
    dw   Data_036_6549
    dw   Data_036_6569
    dw   Data_036_65A9

Data_036_65F9::
    dw   Data_036_6539
    dw   Data_036_6551
    dw   Data_036_6579
    dw   Data_036_65C9

Data_036_6601::
    dw   Data_036_6529
    dw   Data_036_6541
    dw   Data_036_6561
    dw   Data_036_6599

Data_036_6609::
    dw   Data_036_6531
    dw   Data_036_6549
    dw   Data_036_6571
    dw   Data_036_65B9

Data_036_6611::
    dw   Data_036_6539
    dw   Data_036_6551
    dw   Data_036_6581
    dw   Data_036_65D9

Data_036_6619::
    dw   Data_036_65E9
    dw   Data_036_65F1
    dw   Data_036_65F9

Data_036_661F::
    dw   Data_036_6601
    dw   Data_036_6609
    dw   Data_036_6611

Data_036_6625::
    dw   Data_036_661F
    dw   Data_036_6619

func_036_6629::
    push bc                                       ; $6629: $C5
    ld   d, $00                                   ; $662A: $16 $00
    call PointHLToEntityDirection                 ; $662C: $CD $FD $6B
    ld   a, [hl]                                  ; $662F: $7E
    sla  a                                        ; $6630: $CB $27
    ld   e, a                                     ; $6632: $5F
    ld   hl, Data_036_6625                        ; $6633: $21 $25 $66
    call func_036_6C7E                            ; $6636: $CD $7E $6C
    ldh  a, [hActiveEntityType]                   ; $6639: $F0 $EB
    sub  ENTITY_COLOR_GHOUL_RED                   ; $663B: $D6 $EC
    sla  a                                        ; $663D: $CB $27
    ld   e, a                                     ; $663F: $5F
    call func_036_6C7E                            ; $6640: $CD $7E $6C
    push hl                                       ; $6643: $E5
    call PointHLToEntitySpriteVariant             ; $6644: $CD $02 $6C
    ld   a, [hl]                                  ; $6647: $7E
    sla  a                                        ; $6648: $CB $27
    ld   e, a                                     ; $664A: $5F
    pop  hl                                       ; $664B: $E1
    call func_036_6C7E                            ; $664C: $CD $7E $6C
    push hl                                       ; $664F: $E5
    call PointHLToEntitySpriteVariant             ; $6650: $CD $02 $6C
    ld   c, $02                                   ; $6653: $0E $02
    ld   a, [hl]                                  ; $6655: $7E
    cp   $03                                      ; $6656: $FE $03
    jr   c, .jr_665C                              ; $6658: $38 $02

    ld   c, $04                                   ; $665A: $0E $04

.jr_665C
    pop  hl                                       ; $665C: $E1
    push bc                                       ; $665D: $C5
    call RenderActiveEntitySpritesRect            ; $665E: $CD $E6 $3C
    pop  bc                                       ; $6661: $C1
    ld   a, c                                     ; $6662: $79
    call func_015_7964_trampoline                 ; $6663: $CD $A0 $3D
    pop  bc                                       ; $6666: $C1
    ret                                           ; $6667: $C9

ColorShellRedEntityHandler::
ColorShellGreenEntityHandler::
ColorShellBlueEntityHandler::
    call func_036_69D9                            ; $6668: $CD $D9 $69
    call ReturnIfNonInteractive_36                ; $666B: $CD $40 $6A
    ldh  a, [hActiveEntityState]                  ; $666E: $F0 $F0
    cp   $0C                                      ; $6670: $FE $0C
    jr   z, .jr_6677                              ; $6672: $28 $03

    call label_3B39                               ; $6674: $CD $39 $3B

.jr_6677
    ldh  a, [hActiveEntityState]                  ; $6677: $F0 $F0
     JP_TABLE                                      ; $6679
._00 dw ColorShellState0Handler
._01 dw ColorShellState1Handler
._02 dw ColorShellState2Handler
._03 dw ColorShellState3Handler
._04 dw ColorShellState4Handler
._05 dw ColorShellState5Handler
._06 dw ColorShellState6Handler
._07 dw ColorShellState7Handler
._08 dw ColorShellState8Handler
._09 dw ColorShellState9Handler
._0A dw ColorShellStateAHandler
._0B dw ColorShellStateBHandler
._0C dw ColorShellStateCHandler
._0D dw ColorShellStateDHandler

ColorShellState0Handler::
    call GetEntityTransitionCountdown             ; $6696: $CD $05 $0C
    jr   nz, .jr_66B0                             ; $6699: $20 $15

    call GetRandomByte                            ; $669B: $CD $0D $28
    and  $06                                      ; $669E: $E6 $06
    srl  a                                        ; $66A0: $CB $3F
    call PointHLToEntityDirection                 ; $66A2: $CD $FD $6B
    ld   [hl], a                                  ; $66A5: $77
    ld   a, $40                                   ; $66A6: $3E $40
    call func_036_6C83                            ; $66A8: $CD $83 $6C
    ld   a, $01                                   ; $66AB: $3E $01
    call SetEntityState                           ; $66AD: $CD $07 $6C

.jr_66B0
    call func_036_6B8A                            ; $66B0: $CD $8A $6B
    cp   $30                                      ; $66B3: $FE $30
    jp   nc, label_036_66C5                       ; $66B5: $D2 $C5 $66

    call func_036_6B9A                            ; $66B8: $CD $9A $6B
    cp   $30                                      ; $66BB: $FE $30
    jp   nc, label_036_66C5                       ; $66BD: $D2 $C5 $66

    ld   a, $01                                   ; $66C0: $3E $01
    call SetEntityState                           ; $66C2: $CD $07 $6C

label_036_66C5:
    ret                                           ; $66C5: $C9

func_036_66C6::
    call PointHLToEntityPosX                      ; $66C6: $CD $23 $6C
    ld   a, [hl]                                  ; $66C9: $7E
    cp   $16                                      ; $66CA: $FE $16
    jr   nc, .jr_66D2                             ; $66CC: $30 $04

    ld   a, $16                                   ; $66CE: $3E $16
    jr   jr_036_66D8                              ; $66D0: $18 $06

.jr_66D2
    cp   $89                                      ; $66D2: $FE $89
    jr   c, jr_036_66D9                           ; $66D4: $38 $03

    ld   a, $89                                   ; $66D6: $3E $89

jr_036_66D8:
    ld   [hl], a                                  ; $66D8: $77

jr_036_66D9:
    call PointHLToEntityPosY                      ; $66D9: $CD $28 $6C
    ld   a, [hl]                                  ; $66DC: $7E
    cp   $1E                                      ; $66DD: $FE $1E
    jr   nc, .jr_66E5                             ; $66DF: $30 $04

    ld   a, $1E                                   ; $66E1: $3E $1E
    jr   jr_036_66EB                              ; $66E3: $18 $06

.jr_66E5
    cp   $72                                      ; $66E5: $FE $72
    jr   c, jr_036_66EC                           ; $66E7: $38 $03

    ld   a, $72                                   ; $66E9: $3E $72

jr_036_66EB:
    ld   [hl], a                                  ; $66EB: $77

jr_036_66EC:
    ret                                           ; $66EC: $C9

    call GetRandomByte                            ; $66ED: $CD $0D $28
    and  $0F                                      ; $66F0: $E6 $0F
    ret  nz                                       ; $66F2: $C0

    xor  a                                        ; $66F3: $AF
    ldh  [hMultiPurpose0], a                      ; $66F4: $E0 $D7
    ld   e, $00                                   ; $66F6: $1E $00
    ld   d, e                                     ; $66F8: $53

jr_036_66F9:
    ld   hl, wEntitiesTypeTable                   ; $66F9: $21 $A0 $C3
    add  hl, de                                   ; $66FC: $19
    ld   a, [hl]                                  ; $66FD: $7E
    cp   $7D                                      ; $66FE: $FE $7D
    jr   nz, .jr_670D                             ; $6700: $20 $0B

    ld   hl, wEntitiesStatusTable                 ; $6702: $21 $80 $C2
    add  hl, de                                   ; $6705: $19
    ld   a, [hl]                                  ; $6706: $7E
    and  a                                        ; $6707: $A7
    ret  nz                                       ; $6708: $C0

    ld   hl, hMultiPurpose0                       ; $6709: $21 $D7 $FF
    inc  [hl]                                     ; $670C: $34

.jr_670D
    inc  de                                       ; $670D: $13
    ld   a, e                                     ; $670E: $7B
    and  $0F                                      ; $670F: $E6 $0F
    jr   nz, jr_036_66F9                          ; $6711: $20 $E6

    ld   a, ENTITY_GOPONGA_FLOWER_PROJECTILE      ; $6713: $3E $7D
    call SpawnNewEntity_trampoline                ; $6715: $CD $86 $3B
    ret  c                                        ; $6718: $D8

    call PointHLToEntityPosX                      ; $6719: $CD $23 $6C
    ld   a, [hl]                                  ; $671C: $7E
    ld   hl, wEntitiesPosXTable                   ; $671D: $21 $00 $C2
    add  hl, de                                   ; $6720: $19
    ld   [hl], a                                  ; $6721: $77
    call PointHLToEntityPosY                      ; $6722: $CD $28 $6C
    ld   a, [hl]                                  ; $6725: $7E
    ld   hl, wEntitiesPosYTable                   ; $6726: $21 $10 $C2
    add  hl, de                                   ; $6729: $19
    ld   [hl], a                                  ; $672A: $77
    push bc                                       ; $672B: $C5
    ld   c, e                                     ; $672C: $4B
    ld   b, d                                     ; $672D: $42
    ld   a, $10                                   ; $672E: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $6730: $CD $AA $3B
    pop  bc                                       ; $6733: $C1
    ret                                           ; $6734: $C9

Data_036_6735::
    db   $03, $FD, $00, $00

Data_036_6739::
    db   $00, $00, $FD, $03

ColorShellState1Handler::
    call PointHLToEntityDirection                 ; $673D: $CD $FD $6B
    ld   a, [hl]                                  ; $6740: $7E
    ld   e, a                                     ; $6741: $5F
    ld   d, $00                                   ; $6742: $16 $00
    ld   hl, Data_036_6735                        ; $6744: $21 $35 $67
    add  hl, de                                   ; $6747: $19
    ld   a, [hl]                                  ; $6748: $7E
    call PointHLToEntitySpeedX                    ; $6749: $CD $EE $6B
    ld   [hl], a                                  ; $674C: $77
    ld   hl, Data_036_6739                        ; $674D: $21 $39 $67
    add  hl, de                                   ; $6750: $19
    ld   a, [hl]                                  ; $6751: $7E
    call PointHLToEntitySpeedY                    ; $6752: $CD $F3 $6B
    ld   [hl], a                                  ; $6755: $77
    call UpdateEntityPosWithSpeed_36              ; $6756: $CD $62 $6A
    call label_3B23                               ; $6759: $CD $23 $3B
    call func_036_66C6                            ; $675C: $CD $C6 $66
    call GetEntityTransitionCountdown             ; $675F: $CD $05 $0C
    jr   nz, label_036_679F                       ; $6762: $20 $3B

    ld   a, $10                                   ; $6764: $3E $10
    call func_036_6C83                            ; $6766: $CD $83 $6C
    ld   a, $00                                   ; $6769: $3E $00
    jr   .jr_677F                                 ; $676B: $18 $12

    call func_036_6B8A                            ; $676D: $CD $8A $6B
    cp   $30                                      ; $6770: $FE $30
    jp   nc, label_036_679F                       ; $6772: $D2 $9F $67

    call func_036_6B9A                            ; $6775: $CD $9A $6B
    cp   $30                                      ; $6778: $FE $30
    jp   nc, label_036_679F                       ; $677A: $D2 $9F $67

    ld   a, $01                                   ; $677D: $3E $01

.jr_677F
    call SetEntityState                           ; $677F: $CD $07 $6C
    call func_036_6B8A                            ; $6782: $CD $8A $6B
    cp   $20                                      ; $6785: $FE $20
    jr   nc, label_036_679F                       ; $6787: $30 $16

    call func_036_6B9A                            ; $6789: $CD $9A $6B
    cp   $20                                      ; $678C: $FE $20
    jr   nc, label_036_679F                       ; $678E: $30 $0F

    ld   a, $0E                                   ; $6790: $3E $0E
    call ApplyVectorTowardsLink_trampoline        ; $6792: $CD $AA $3B
    ld   a, $20                                   ; $6795: $3E $20
    call func_036_6C83                            ; $6797: $CD $83 $6C
    ld   a, $02                                   ; $679A: $3E $02
    call SetEntityState                           ; $679C: $CD $07 $6C

label_036_679F:
    call func_036_6C15                            ; $679F: $CD $15 $6C
    ret                                           ; $67A2: $C9

ColorShellState2Handler::
    call GetEntityTransitionCountdown             ; $67A3: $CD $05 $0C
    jr   nz, jr_036_67D1                          ; $67A6: $20 $29

    ld   [hl], $18                                ; $67A8: $36 $18
    ld   a, $03                                   ; $67AA: $3E $03
    call SetEntityState                           ; $67AC: $CD $07 $6C
    jr   jr_036_67D1                              ; $67AF: $18 $20

Data_036_67B1::
    db   $02, $03, $01, $00

ColorShellState3Handler::
    call GetEntityTransitionCountdown             ; $67B5: $CD $05 $0C
    jr   nz, .jr_67C8                             ; $67B8: $20 $0E

    ld   a, $01                                   ; $67BA: $3E $01
    call SetEntityState                           ; $67BC: $CD $07 $6C
    xor  a                                        ; $67BF: $AF
    call PointHLToEntitySpeedX                    ; $67C0: $CD $EE $6B
    ld   [hl], a                                  ; $67C3: $77
    call PointHLToEntitySpeedY                    ; $67C4: $CD $F3 $6B
    ld   [hl], a                                  ; $67C7: $77

.jr_67C8
    call UpdateEntityPosWithSpeed_36              ; $67C8: $CD $62 $6A
    call label_3B23                               ; $67CB: $CD $23 $3B
    call func_036_66C6                            ; $67CE: $CD $C6 $66

jr_036_67D1:
    ldh  a, [hFrameCounter]                       ; $67D1: $F0 $E7
    and  $01                                      ; $67D3: $E6 $01
    jr   nz, .jr_67F1                             ; $67D5: $20 $1A

    call PointHLToEntitySpriteVariant             ; $67D7: $CD $02 $6C
    ld   a, [hl]                                  ; $67DA: $7E
    inc  a                                        ; $67DB: $3C
    and  $01                                      ; $67DC: $E6 $01
    ld   [hl], a                                  ; $67DE: $77
    and  a                                        ; $67DF: $A7
    jr   nz, .jr_67F1                             ; $67E0: $20 $0F

    call PointHLToEntityDirection                 ; $67E2: $CD $FD $6B
    ld   a, [hl]                                  ; $67E5: $7E
    push hl                                       ; $67E6: $E5
    ld   e, a                                     ; $67E7: $5F
    ld   d, $00                                   ; $67E8: $16 $00
    ld   hl, Data_036_67B1                        ; $67EA: $21 $B1 $67
    add  hl, de                                   ; $67ED: $19
    ld   a, [hl]                                  ; $67EE: $7E
    pop  hl                                       ; $67EF: $E1
    ld   [hl], a                                  ; $67F0: $77

.jr_67F1
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $67F1: $21 $10 $C4
    add  hl, bc                                   ; $67F4: $09
    ld   a, [hl]                                  ; $67F5: $7E
    and  a                                        ; $67F6: $A7
    jr   z, .jr_6806                              ; $67F7: $28 $0D

    ld   hl, wEntitiesPhysicsFlagsTable           ; $67F9: $21 $40 $C3
    add  hl, bc                                   ; $67FC: $09
    ld   a, [hl]                                  ; $67FD: $7E
    or   $80                                      ; $67FE: $F6 $80
    ld   [hl], a                                  ; $6800: $77
    ld   a, $04                                   ; $6801: $3E $04
    call SetEntityState                           ; $6803: $CD $07 $6C

.jr_6806
    ret                                           ; $6806: $C9

    ld   a, [hl]                                  ; $6807: $7E
    bit  7, a                                     ; $6808: $CB $7F
    jr   z, .jr_6813                              ; $680A: $28 $07

    add  d                                        ; $680C: $82
    bit  7, a                                     ; $680D: $CB $7F
    jr   nz, jr_036_6819                          ; $680F: $20 $08

    jr   jr_036_6818                              ; $6811: $18 $05

.jr_6813
    sub  d                                        ; $6813: $92
    bit  7, a                                     ; $6814: $CB $7F
    jr   z, jr_036_6819                           ; $6816: $28 $01

jr_036_6818:
    xor  a                                        ; $6818: $AF

jr_036_6819:
    ld   [hl], a                                  ; $6819: $77
    ret                                           ; $681A: $C9

ColorShellState4Handler::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $681B: $21 $10 $C4
    add  hl, bc                                   ; $681E: $09
    ld   [hl], $00                                ; $681F: $36 $00
    call IncrementEntityState                     ; $6821: $CD $12 $3B
    ret                                           ; $6824: $C9

ColorShellState5Handler::
    call label_3B23                               ; $6825: $CD $23 $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $6828: $21 $10 $C4
    add  hl, bc                                   ; $682B: $09
    ld   a, [hl]                                  ; $682C: $7E
    and  a                                        ; $682D: $A7
    jr   z, .jr_683F                              ; $682E: $28 $0F

    ld   hl, wEntitiesPhysicsFlagsTable           ; $6830: $21 $40 $C3
    add  hl, bc                                   ; $6833: $09
    ld   a, [hl]                                  ; $6834: $7E
    or   $80                                      ; $6835: $F6 $80
    ld   [hl], a                                  ; $6837: $77
    ld   a, $04                                   ; $6838: $3E $04
    call SetEntityState                           ; $683A: $CD $07 $6C
    jr   ret_036_6856                             ; $683D: $18 $17

.jr_683F
    ld   hl, wEntitiesPhysicsFlagsTable           ; $683F: $21 $40 $C3
    add  hl, bc                                   ; $6842: $09
    ld   a, [hl]                                  ; $6843: $7E
    or   $80                                      ; $6844: $F6 $80
    ld   [hl], a                                  ; $6846: $77
    ldh  a, [hActiveEntityStatus]                 ; $6847: $F0 $EA
    cp   $06                                      ; $6849: $FE $06
    jr   nc, ret_036_6856                         ; $684B: $30 $09

    ld   a, [hl]                                  ; $684D: $7E
    and  $7F                                      ; $684E: $E6 $7F
    ld   [hl], a                                  ; $6850: $77
    ld   a, $01                                   ; $6851: $3E $01
    call SetEntityState                           ; $6853: $CD $07 $6C

ret_036_6856:
    ret                                           ; $6856: $C9

ColorShellState6Handler::
    ld   e, $28                                   ; $6857: $1E $28
    call PointHLToEntityPosX                      ; $6859: $CD $23 $6C
    ld   a, [hl]                                  ; $685C: $7E
    cp   $50                                      ; $685D: $FE $50
    jr   c, .jr_6863                              ; $685F: $38 $02

    ld   e, $78                                   ; $6861: $1E $78

.jr_6863
    ld   [hl], e                                  ; $6863: $73
    ld   e, $30                                   ; $6864: $1E $30
    call PointHLToEntityPosY                      ; $6866: $CD $28 $6C
    ld   a, [hl]                                  ; $6869: $7E
    cp   $48                                      ; $686A: $FE $48
    jr   c, .jr_6870                              ; $686C: $38 $02

    ld   e, $60                                   ; $686E: $1E $60

.jr_6870
    ld   [hl], e                                  ; $6870: $73
    call PointHLToEntitySpeedZ                    ; $6871: $CD $F8 $6B
    ld   [hl], $10                                ; $6874: $36 $10
    jr   jr_036_688A                              ; $6876: $18 $12

ColorShellState7Handler::
    call PointHLToEntitySpeedZ                    ; $6878: $CD $F8 $6B
    dec  [hl]                                     ; $687B: $35
    call func_036_6AEC                            ; $687C: $CD $EC $6A
    ld   a, [hl]                                  ; $687F: $7E
    bit  7, a                                     ; $6880: $CB $7F
    jr   z, ret_036_688D                          ; $6882: $28 $09

    xor  a                                        ; $6884: $AF
    ld   [hl], a                                  ; $6885: $77
    call PointHLToEntitySpeedZ                    ; $6886: $CD $F8 $6B
    ld   [hl], a                                  ; $6889: $77

jr_036_688A:
    call IncrementEntityState                     ; $688A: $CD $12 $3B

ret_036_688D:
    ret                                           ; $688D: $C9

Data_036_688E::
    db   $5E, $59, $63

ColorShellState8Handler::
    ldh  a, [hActiveEntityType]                   ; $6891: $F0 $EB
    sub  ENTITY_COLOR_SHELL_RED                   ; $6893: $D6 $E9
    ld   e, a                                     ; $6895: $5F
    ld   d, $00                                   ; $6896: $16 $00
    ld   hl, Data_036_688E                        ; $6898: $21 $8E $68
    add  hl, de                                   ; $689B: $19
    ld   a, [hl]                                  ; $689C: $7E
    push af                                       ; $689D: $F5
    call func_036_6BCF                            ; $689E: $CD $CF $6B
    pop  af                                       ; $68A1: $F1
    dec  hl                                       ; $68A2: $2B
    cp   [hl]                                     ; $68A3: $BE
    jr   nz, .jr_68C3                             ; $68A4: $20 $1D

    ld   a, $0C                                   ; $68A6: $3E $0C
    call SetEntityState                           ; $68A8: $CD $07 $6C
    ld   hl, wEntitiesPhysicsFlagsTable           ; $68AB: $21 $40 $C3
    add  hl, bc                                   ; $68AE: $09
    ld   a, [hl]                                  ; $68AF: $7E
    or   $F0                                      ; $68B0: $F6 $F0
    ld   [hl], a                                  ; $68B2: $77
    call func_036_6BCF                            ; $68B3: $CD $CF $6B
    ldh  a, [hActiveEntityType]                   ; $68B6: $F0 $EB
    sub  ENTITY_COLOR_SHELL_RED                   ; $68B8: $D6 $E9
    add  $67                                      ; $68BA: $C6 $67
    ld   [hl], a                                  ; $68BC: $77
    ld   a, $04                                   ; $68BD: $3E $04
    ldh  [hNoiseSfx], a                           ; $68BF: $E0 $F4
    jr   ret_036_68EB                             ; $68C1: $18 $28

.jr_68C3
    ld   a, JINGLE_WRONG_ANSWER                   ; $68C3: $3E $1D
    ldh  [hJingle], a                             ; $68C5: $E0 $F2
    ld   e, $10                                   ; $68C7: $1E $10
    call PointHLToEntityPosX                      ; $68C9: $CD $23 $6C
    ld   a, [hl]                                  ; $68CC: $7E
    cp   $50                                      ; $68CD: $FE $50
    jr   c, .jr_68D3                              ; $68CF: $38 $02

    ld   e, $F0                                   ; $68D1: $1E $F0

.jr_68D3
    xor  a                                        ; $68D3: $AF
    call PointHLToEntitySpeedY                    ; $68D4: $CD $F3 $6B
    ld   [hl], a                                  ; $68D7: $77
    call PointHLToEntitySpeedX                    ; $68D8: $CD $EE $6B
    ld   [hl], e                                  ; $68DB: $73
    call PointHLToEntitySpeedZ                    ; $68DC: $CD $F8 $6B
    ld   [hl], $10                                ; $68DF: $36 $10
    ld   a, $18                                   ; $68E1: $3E $18
    call func_036_6C83                            ; $68E3: $CD $83 $6C
    ld   a, $09                                   ; $68E6: $3E $09
    call SetEntityState                           ; $68E8: $CD $07 $6C

ret_036_68EB:
    ret                                           ; $68EB: $C9

ColorShellState9Handler::
    call GetEntityTransitionCountdown             ; $68EC: $CD $05 $0C
    jr   nz, ret_036_691E                         ; $68EF: $20 $2D

    call PointHLToEntitySpeedX                    ; $68F1: $CD $EE $6B
    ld   a, [hl]                                  ; $68F4: $7E
    and  a                                        ; $68F5: $A7
    jr   z, .jr_68FB                              ; $68F6: $28 $03

    call UpdateEntityPosWithSpeed_36              ; $68F8: $CD $62 $6A

.jr_68FB
    call PointHLToEntitySpeedZ                    ; $68FB: $CD $F8 $6B
    dec  [hl]                                     ; $68FE: $35
    call func_036_6AEC                            ; $68FF: $CD $EC $6A
    call label_3B23                               ; $6902: $CD $23 $3B
    call PointHLToEntityPosZ                      ; $6905: $CD $2D $6C
    ld   a, [hl]                                  ; $6908: $7E
    bit  7, a                                     ; $6909: $CB $7F
    jr   z, ret_036_691E                          ; $690B: $28 $11

    xor  a                                        ; $690D: $AF
    ld   [hl], a                                  ; $690E: $77
    call PointHLToEntitySpeedZ                    ; $690F: $CD $F8 $6B
    ld   [hl], $08                                ; $6912: $36 $08
    call PointHLToEntitySpeedX                    ; $6914: $CD $EE $6B
    sra  [hl]                                     ; $6917: $CB $2E
    ld   a, $0A                                   ; $6919: $3E $0A
    call SetEntityState                           ; $691B: $CD $07 $6C

ret_036_691E:
    ret                                           ; $691E: $C9

ColorShellStateAHandler::
    call UpdateEntityPosWithSpeed_36              ; $691F: $CD $62 $6A
    call PointHLToEntitySpeedZ                    ; $6922: $CD $F8 $6B
    dec  [hl]                                     ; $6925: $35
    call func_036_6AEC                            ; $6926: $CD $EC $6A
    push bc                                       ; $6929: $C5
    call label_3B23                               ; $692A: $CD $23 $3B
    pop  bc                                       ; $692D: $C1
    call PointHLToEntityPosZ                      ; $692E: $CD $2D $6C
    ld   a, [hl]                                  ; $6931: $7E
    bit  7, a                                     ; $6932: $CB $7F
    jr   z, .ret_693E                             ; $6934: $28 $08

    ld   a, $20                                   ; $6936: $3E $20
    call func_036_6C83                            ; $6938: $CD $83 $6C
    call IncrementEntityState                     ; $693B: $CD $12 $3B

.ret_693E
    ret                                           ; $693E: $C9

ColorShellStateBHandler::
    call GetEntityTransitionCountdown             ; $693F: $CD $05 $0C
    jr   nz, .ret_695B                            ; $6942: $20 $17

    xor  a                                        ; $6944: $AF
    ld   [hl], a                                  ; $6945: $77
    call PointHLToEntitySpeedZ                    ; $6946: $CD $F8 $6B
    ld   [hl], a                                  ; $6949: $77
    call PointHLToEntitySpeedX                    ; $694A: $CD $EE $6B
    ld   [hl], a                                  ; $694D: $77
    ld   a, $01                                   ; $694E: $3E $01
    call SetEntityState                           ; $6950: $CD $07 $6C
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6953: $21 $40 $C3
    add  hl, bc                                   ; $6956: $09
    ld   a, [hl]                                  ; $6957: $7E
    and  $7F                                      ; $6958: $E6 $7F
    ld   [hl], a                                  ; $695A: $77

.ret_695B
    ret                                           ; $695B: $C9

ColorShellStateCHandler::
    ld   e, $00                                   ; $695C: $1E $00
    ld   d, e                                     ; $695E: $53

jr_036_695F:
    ld   hl, wEntitiesTypeTable                   ; $695F: $21 $A0 $C3
    add  hl, de                                   ; $6962: $19
    ld   a, [hl]                                  ; $6963: $7E
    cp   $E9                                      ; $6964: $FE $E9
    jr   z, .jr_6970                              ; $6966: $28 $08

    cp   $EA                                      ; $6968: $FE $EA
    jr   z, .jr_6970                              ; $696A: $28 $04

    cp   $EB                                      ; $696C: $FE $EB
    jr   nz, jr_036_6981                          ; $696E: $20 $11

.jr_6970
    ld   hl, wEntitiesStatusTable                 ; $6970: $21 $80 $C2
    add  hl, de                                   ; $6973: $19
    ld   a, [hl]                                  ; $6974: $7E
    and  a                                        ; $6975: $A7
    jr   z, jr_036_6981                           ; $6976: $28 $09

    ld   hl, wEntitiesStateTable                  ; $6978: $21 $90 $C2
    add  hl, de                                   ; $697B: $19
    ld   a, [hl]                                  ; $697C: $7E
    cp   $0C                                      ; $697D: $FE $0C
    jr   c, ret_036_6999                          ; $697F: $38 $18

jr_036_6981:
    inc  e                                        ; $6981: $1C
    ld   a, e                                     ; $6982: $7B
    cp   $10                                      ; $6983: $FE $10
    jr   nz, jr_036_695F                          ; $6985: $20 $D8

    ld   a, $18                                   ; $6987: $3E $18
    call func_036_6C83                            ; $6989: $CD $83 $6C
    call IncrementEntityState                     ; $698C: $CD $12 $3B
    call func_036_6BCF                            ; $698F: $CD $CF $6B
    ldh  a, [hActiveEntityType]                   ; $6992: $F0 $EB
    sub  ENTITY_COLOR_SHELL_RED                   ; $6994: $D6 $E9
    add  $67                                      ; $6996: $C6 $67
    ld   [hl], a                                  ; $6998: $77

ret_036_6999:
    ret                                           ; $6999: $C9

Data_036_699A::
    db   $5F, $5A, $64

ColorShellStateDHandler::
    call GetEntityTransitionCountdown             ; $699D: $CD $05 $0C
    jr   nz, .ret_69CC                            ; $69A0: $20 $2A

    ldh  a, [hActiveEntityType]                   ; $69A2: $F0 $EB
    sub  ENTITY_COLOR_SHELL_RED                   ; $69A4: $D6 $E9
    ld   e, a                                     ; $69A6: $5F
    ld   d, $00                                   ; $69A7: $16 $00
    ld   hl, Data_036_699A                        ; $69A9: $21 $9A $69
    add  hl, de                                   ; $69AC: $19
    ld   a, [hl]                                  ; $69AD: $7E
    push af                                       ; $69AE: $F5
    call func_036_6BCF                            ; $69AF: $CD $CF $6B
    pop  af                                       ; $69B2: $F1
    ld   [hl], a                                  ; $69B3: $77
    call PointHLToEntityPosX                      ; $69B4: $CD $23 $6C
    ld   a, [hl]                                  ; $69B7: $7E
    ldh  [hMultiPurpose0], a                      ; $69B8: $E0 $D7
    call PointHLToEntityPosY                      ; $69BA: $CD $28 $6C
    ld   a, [hl]                                  ; $69BD: $7E
    call PointHLToEntityPosZ                      ; $69BE: $CD $2D $6C
    sub  [hl]                                     ; $69C1: $96
    ldh  [hMultiPurpose1], a                      ; $69C2: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $69C4: $3E $02
    call AddTranscientVfx                         ; $69C6: $CD $C7 $0C
    call DidKillEnemy.label_3F5E                  ; $69C9: $CD $5E $3F

.ret_69CC
    ret                                           ; $69CC: $C9

Data_036_69CD::
    dw   Data_020_6688
    dw   Data_020_66E8
    dw   Data_020_6748

Data_036_69D3::
    dw   Data_020_67A8
    dw   Data_020_67D8
    dw   Data_020_6808

func_036_69D9::
    ldh  a, [hActiveEntityType]                   ; $69D9: $F0 $EB
    sub  ENTITY_COLOR_SHELL_RED                   ; $69DB: $D6 $E9
    sla  a                                        ; $69DD: $CB $27
    ldh  [hMultiPurpose0], a                      ; $69DF: $E0 $D7
    ld   d, $00                                   ; $69E1: $16 $00
    call PointHLToEntitySpriteVariant             ; $69E3: $CD $02 $6C
    ldh  a, [hActiveEntityState]                  ; $69E6: $F0 $F0
    cp   $06                                      ; $69E8: $FE $06
    jr   nc, .jr_69F2                             ; $69EA: $30 $06

    ldh  a, [hActiveEntityStatus]                 ; $69EC: $F0 $EA
    cp   $05                                      ; $69EE: $FE $05
    jr   z, jr_036_6A0A                           ; $69F0: $28 $18

.jr_69F2
    ld   a, [hl]                                  ; $69F2: $7E
    ld   l, a                                     ; $69F3: $6F
    sla  a                                        ; $69F4: $CB $27
    add  l                                        ; $69F6: $85
    sla  a                                        ; $69F7: $CB $27
    sla  a                                        ; $69F9: $CB $27
    ld   e, a                                     ; $69FB: $5F
    push de                                       ; $69FC: $D5
    ldh  a, [hMultiPurpose0]                      ; $69FD: $F0 $D7
    ld   e, a                                     ; $69FF: $5F
    ld   hl, Data_036_69D3                        ; $6A00: $21 $D3 $69
    add  hl, de                                   ; $6A03: $19
    ld   a, [hl+]                                 ; $6A04: $2A
    ld   h, [hl]                                  ; $6A05: $66
    ld   l, a                                     ; $6A06: $6F
    pop  de                                       ; $6A07: $D1
    jr   jr_036_6A32                              ; $6A08: $18 $28

jr_036_6A0A:
    ld   a, [hl]                                  ; $6A0A: $7E
    ld   l, a                                     ; $6A0B: $6F
    sla  a                                        ; $6A0C: $CB $27
    add  l                                        ; $6A0E: $85
    sla  a                                        ; $6A0F: $CB $27
    sla  a                                        ; $6A11: $CB $27
    ld   e, a                                     ; $6A13: $5F
    push de                                       ; $6A14: $D5
    ldh  a, [hMultiPurpose0]                      ; $6A15: $F0 $D7
    ld   e, a                                     ; $6A17: $5F
    ld   hl, Data_036_69CD                        ; $6A18: $21 $CD $69
    add  hl, de                                   ; $6A1B: $19
    ld   a, [hl+]                                 ; $6A1C: $2A
    ld   h, [hl]                                  ; $6A1D: $66
    ld   l, a                                     ; $6A1E: $6F
    pop  de                                       ; $6A1F: $D1
Data_036_6A20::
    push hl                                       ; $6A20: $E5
    call PointHLToEntityDirection                 ; $6A21: $CD $FD $6B
    ld   a, [hl]                                  ; $6A24: $7E
    ld   l, a                                     ; $6A25: $6F
    sla  a                                        ; $6A26: $CB $27
Data_036_6A28::
    add  l                                        ; $6A28: $85
    sla  a                                        ; $6A29: $CB $27
    sla  a                                        ; $6A2B: $CB $27
    sla  a                                        ; $6A2D: $CB $27
    pop  hl                                       ; $6A2F: $E1
    add  hl, de                                   ; $6A30: $19
    ld   e, a                                     ; $6A31: $5F

jr_036_6A32:
    add  hl, de                                   ; $6A32: $19
    ld   c, $03                                   ; $6A33: $0E $03
    ld   a, $36                                   ; $6A35: $3E $36
    call func_A5F                                 ; $6A37: $CD $5F $0A
    ld   a, $03                                   ; $6A3A: $3E $03
    call func_015_7964_trampoline                 ; $6A3C: $CD $A0 $3D
    ret                                           ; $6A3F: $C9

; ----------------------------------------------------------------------
;
; ENTITY COMMON HELPERS
;
; These helpers are defined (with small variants) in most entity banks.
;
; ----------------------------------------------------------------------

; If the entity is disabled or the game is in a dialog or transition,
; return to the caller directly, skipping the rest of the code.
ReturnIfNonInteractive_36::
    ldh  a, [hActiveEntityStatus]                 ; $6A40: $F0 $EA
    cp   $05                                      ; $6A42: $FE $05
    jr   nz, .skip                                ; $6A44: $20 $1A

.allowInactiveEntity
    ld   a, [wGameplayType]                       ; $6A46: $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ; $6A49: $FE $07
    jr   z, .skip                                 ; $6A4B: $28 $13

    ld   a, [wDialogState]                        ; $6A4D: $FA $9F $C1
    ld   hl, wC1A8                                ; $6A50: $21 $A8 $C1
    or   [hl]                                     ; $6A53: $B6
    ld   hl, wInventoryAppearing                  ; $6A54: $21 $4F $C1
    or   [hl]                                     ; $6A57: $B6
    jr   nz, .skip                                ; $6A58: $20 $06

    ld   a, [wRoomTransitionState]                ; $6A5A: $FA $24 $C1
    and  a                                        ; $6A5D: $A7
    jr   z, .return                               ; $6A5E: $28 $01

.skip
    ; pop the return address to return to caller
    pop  af                                       ; $6A60: $F1

.return
    ret                                           ; $6A61: $C9

UpdateEntityPosWithSpeed_36::
    call AddEntitySpeedToPos_36                   ; $6A62: $CD $6F $6A
    push bc                                       ; $6A65: $C5
    ld   a, c                                     ; $6A66: $79
    add  $10                                      ; $6A67: $C6 $10
    ld   c, a                                     ; $6A69: $4F
    call AddEntitySpeedToPos_36                   ; $6A6A: $CD $6F $6A
    pop  bc                                       ; $6A6D: $C1
    ret                                           ; $6A6E: $C9

; Update the entity's position using its speed.
;
; The values in the entity speed tables are the number of pixels to
; move within 16 frames. For example, if it's 8, the entity will move
; 1 pixel every other frame (8/16). If it's -16, the entity will move
; -1 pixel every frame (-16/16).
;
; Inputs:
;   bc  entity index
AddEntitySpeedToPos_36::
    call PointHLToEntitySpeedX                    ; $6A6F: $CD $EE $6B
    ld   a, [hl]                                  ; $6A72: $7E
    and  a                                        ; $6A73: $A7
    ; No need to update the position if it's not moving
    ret  z                                        ; $6A74: $C8

    push af                                       ; $6A75: $F5
    ; Multiply speed by 16 so the carry is set if greater than $0F
    swap a                                        ; $6A76: $CB $37
    and  $F0                                      ; $6A78: $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ; $6A7A: $21 $60 $C2
    add  hl, bc                                   ; $6A7D: $09
    add  [hl]                                     ; $6A7E: $86
    ld   [hl], a                                  ; $6A7F: $77
    ; Save carry in bit 0 of d
    rl   d                                        ; $6A80: $CB $12
    call PointHLToEntityPosX                      ; $6A82: $CD $23 $6C
    pop  af                                       ; $6A85: $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ; $6A86: $1E $00
    bit  7, a                                     ; $6A88: $CB $7F
    jr   z, .positive                             ; $6A8A: $28 $02

    ld   e, $F0                                   ; $6A8C: $1E $F0

.positive
    swap a                                        ; $6A8E: $CB $37
    and  $0F                                      ; $6A90: $E6 $0F
    or   e                                        ; $6A92: $B3
    ; Get carry back from d
    rr   d                                        ; $6A93: $CB $1A
    adc  [hl]                                     ; $6A95: $8E
    ld   [hl], a                                  ; $6A96: $77
    ret                                           ; $6A97: $C9

func_036_6A98::
    ld   e, $00                                   ; $6A98: $1E $00
    ldh  a, [hLinkPositionY]                      ; $6A9A: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $6A9C: $21 $EF $FF
    sub  [hl]                                     ; $6A9F: $96
    add  $04                                      ; $6AA0: $C6 $04
    cp   $08                                      ; $6AA2: $FE $08
    jr   nc, jr_036_6AEA                          ; $6AA4: $30 $44

    ldh  a, [hLinkPositionX]                      ; $6AA6: $F0 $98
    ld   hl, hActiveEntityPosX                    ; $6AA8: $21 $EE $FF
    sub  [hl]                                     ; $6AAB: $96
    add  $10                                      ; $6AAC: $C6 $10
    cp   $18                                      ; $6AAE: $FE $18
    jr   nc, jr_036_6AEA                          ; $6AB0: $30 $38

    inc  e                                        ; $6AB2: $1C
    ldh  a, [hActiveEntityType]                   ; $6AB3: $F0 $EB
    cp   ENTITY_BEAR                              ; $6AB5: $FE $B5
    jr   z, .jr_6AC5                              ; $6AB7: $28 $0C

    push de                                       ; $6AB9: $D5
    call func_036_6BAB                            ; $6ABA: $CD $AB $6B
    ldh  a, [hLinkDirection]                      ; $6ABD: $F0 $9E
    xor  $01                                      ; $6ABF: $EE $01
    cp   e                                        ; $6AC1: $BB
    pop  de                                       ; $6AC2: $D1
    jr   nz, jr_036_6AEA                          ; $6AC3: $20 $25

.jr_6AC5
    ld   hl, wC1AD                                ; $6AC5: $21 $AD $C1
    ld   [hl], $01                                ; $6AC8: $36 $01
    ld   a, [wDialogState]                        ; $6ACA: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $6ACD: $21 $4F $C1
    or   [hl]                                     ; $6AD0: $B6
    ld   hl, wIsLinkInTheAir                      ; $6AD1: $21 $46 $C1
    or   [hl]                                     ; $6AD4: $B6
    ld   hl, wC134                                ; $6AD5: $21 $34 $C1
    or   [hl]                                     ; $6AD8: $B6
    jr   nz, jr_036_6AEA                          ; $6AD9: $20 $0F

    ld   a, [wWindowY]                            ; $6ADB: $FA $9A $DB
    cp   $80                                      ; $6ADE: $FE $80
    jr   nz, jr_036_6AEA                          ; $6AE0: $20 $08

    ldh  a, [hJoypadState]                        ; $6AE2: $F0 $CC
    and  J_A                                      ; $6AE4: $E6 $10
    jr   z, jr_036_6AEA                           ; $6AE6: $28 $02

    scf                                           ; $6AE8: $37
    ret                                           ; $6AE9: $C9

jr_036_6AEA:
    and  a                                        ; $6AEA: $A7
    ret                                           ; $6AEB: $C9

func_036_6AEC::
    call PointHLToEntitySpeedZ                    ; $6AEC: $CD $F8 $6B
    ld   a, [hl]                                  ; $6AEF: $7E
    and  a                                        ; $6AF0: $A7
    ret  z                                        ; $6AF1: $C8

    push af                                       ; $6AF2: $F5
    swap a                                        ; $6AF3: $CB $37
    and  $F0                                      ; $6AF5: $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ; $6AF7: $21 $30 $C3
    add  hl, bc                                   ; $6AFA: $09
    add  [hl]                                     ; $6AFB: $86
    ld   [hl], a                                  ; $6AFC: $77
    rl   d                                        ; $6AFD: $CB $12
    call PointHLToEntityPosZ                      ; $6AFF: $CD $2D $6C
    pop  af                                       ; $6B02: $F1
    ld   e, $00                                   ; $6B03: $1E $00
    bit  7, a                                     ; $6B05: $CB $7F
    jr   z, .jr_6B0B                              ; $6B07: $28 $02

    ld   e, $F0                                   ; $6B09: $1E $F0

.jr_6B0B
    swap a                                        ; $6B0B: $CB $37
    and  $0F                                      ; $6B0D: $E6 $0F
    or   e                                        ; $6B0F: $B3
    rr   d                                        ; $6B10: $CB $1A
    adc  [hl]                                     ; $6B12: $8E
    ld   [hl], a                                  ; $6B13: $77
    ret                                           ; $6B14: $C9

; If the entity is ignoring hits, apply its recoil velocity.
ApplyRecoilIfNeeded_36::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $6B15: $21 $10 $C4
    add  hl, bc                                   ; $6B18: $09
    ld   a, [hl]                                  ; $6B19: $7E
    and  a                                        ; $6B1A: $A7
    jr   z, .return                               ; $6B1B: $28 $3E

    dec  a                                        ; $6B1D: $3D
    ld   [hl], a                                  ; $6B1E: $77

    call label_3E8E                               ; $6B1F: $CD $8E $3E

    ;
    ; Temporarily replace the entity speed by the recoil speed
    ;

    call PointHLToEntitySpeedX                    ; $6B22: $CD $EE $6B
    ld   a, [hl]                                  ; $6B25: $7E
    push af                                       ; $6B26: $F5

    call PointHLToEntitySpeedY                    ; $6B27: $CD $F3 $6B
    ld   a, [hl]                                  ; $6B2A: $7E
    push af                                       ; $6B2B: $F5

    ld   hl, wEntitiesRecoilVelocityX             ; $6B2C: $21 $F0 $C3
    add  hl, bc                                   ; $6B2F: $09
    ld   a, [hl]                                  ; $6B30: $7E
    call PointHLToEntitySpeedX                    ; $6B31: $CD $EE $6B
    ld   [hl], a                                  ; $6B34: $77

    ld   hl, wEntitiesRecoilVelocityY             ; $6B35: $21 $00 $C4
    add  hl, bc                                   ; $6B38: $09
    ld   a, [hl]                                  ; $6B39: $7E
    call PointHLToEntitySpeedY                    ; $6B3A: $CD $F3 $6B
    ld   [hl], a                                  ; $6B3D: $77

    call UpdateEntityPosWithSpeed_36              ; $6B3E: $CD $62 $6A

    ld   hl, wEntitiesOptions1Table               ; $6B41: $21 $30 $C4
    add  hl, bc                                   ; $6B44: $09
    ld   a, [hl]                                  ; $6B45: $7E
    and  $20                                      ; $6B46: $E6 $20
    jr   nz, .restoreOriginalSpeed                ; $6B48: $20 $03

    call label_3B23                               ; $6B4A: $CD $23 $3B

.restoreOriginalSpeed
    call PointHLToEntitySpeedY                    ; $6B4D: $CD $F3 $6B
    pop  af                                       ; $6B50: $F1
    ld   [hl], a                                  ; $6B51: $77
    call PointHLToEntitySpeedX                    ; $6B52: $CD $EE $6B
    pop  af                                       ; $6B55: $F1
    ld   [hl], a                                  ; $6B56: $77
    pop  af                                       ; $6B57: $F1

    call StopEntityRecoilOnCollision              ; $6B58: $CD $AF $3E

.return
    ret                                           ; $6B5B: $C9

func_036_6B5C::
    call CheckLinkCollisionWithEnemy_trampoline   ; $6B5C: $CD $5A $3B
    jr   nc, jr_036_6B88                          ; $6B5F: $30 $27

    call CopyLinkFinalPositionToPosition          ; $6B61: $CD $BE $0C
    ld   a, [wC1A6]                               ; $6B64: $FA $A6 $C1
    and  a                                        ; $6B67: $A7
    jr   z, .jr_6B7B                              ; $6B68: $28 $11

    ld   e, a                                     ; $6B6A: $5F
    ld   d, b                                     ; $6B6B: $50
    ld   hl, wEntitiesPrivateState5Table+15       ; $6B6C: $21 $9F $C3
    add  hl, de                                   ; $6B6F: $19
    ld   a, [hl]                                  ; $6B70: $7E
    cp   $03                                      ; $6B71: $FE $03
    jr   nz, .jr_6B7B                             ; $6B73: $20 $06

    ld   hl, wEntitiesStatusTable + $0F           ; $6B75: $21 $8F $C2
    add  hl, de                                   ; $6B78: $19
    ld   [hl], $00                                ; $6B79: $36 $00

.jr_6B7B
    ld   a, [wIsRunningWithPegasusBoots]          ; $6B7B: $FA $4A $C1
    ld   e, a                                     ; $6B7E: $5F
    call ResetPegasusBoots                        ; $6B7F: $CD $B6 $0C
    call ClearLinkPositionIncrement               ; $6B82: $CD $8E $17
    ld   a, e                                     ; $6B85: $7B
    scf                                           ; $6B86: $37
    ret                                           ; $6B87: $C9

jr_036_6B88:
    and  a                                        ; $6B88: $A7
    ret                                           ; $6B89: $C9

func_036_6B8A::
    ld   e, $00                                   ; $6B8A: $1E $00
    ldh  a, [hLinkPositionX]                      ; $6B8C: $F0 $98
    call PointHLToEntityPosX                      ; $6B8E: $CD $23 $6C
    sub  [hl]                                     ; $6B91: $96
    bit  7, a                                     ; $6B92: $CB $7F
    jr   z, .ret_6B99                             ; $6B94: $28 $03

    inc  e                                        ; $6B96: $1C
    cpl                                           ; $6B97: $2F
    inc  a                                        ; $6B98: $3C

.ret_6B99
    ret                                           ; $6B99: $C9

func_036_6B9A::
    ld   e, $04                                   ; $6B9A: $1E $04
    ldh  a, [hLinkPositionY]                      ; $6B9C: $F0 $99
    call PointHLToEntityPosY                      ; $6B9E: $CD $28 $6C
    sub  [hl]                                     ; $6BA1: $96
    bit  7, a                                     ; $6BA2: $CB $7F
    jr   z, .ret_6BAA                             ; $6BA4: $28 $04

    ld   e, $02                                   ; $6BA6: $1E $02
    cpl                                           ; $6BA8: $2F
    inc  a                                        ; $6BA9: $3C

.ret_6BAA
    ret                                           ; $6BAA: $C9

func_036_6BAB::
    call func_036_6B8A                            ; $6BAB: $CD $8A $6B
    ld   d, a                                     ; $6BAE: $57
    push af                                       ; $6BAF: $F5
    ld   a, e                                     ; $6BB0: $7B
    ldh  [hMultiPurpose0], a                      ; $6BB1: $E0 $D7
    call func_036_6B9A                            ; $6BB3: $CD $9A $6B
    ld   d, a                                     ; $6BB6: $57
    ld   a, e                                     ; $6BB7: $7B
    xor  $06                                      ; $6BB8: $EE $06
    cp   $04                                      ; $6BBA: $FE $04
    jr   nz, .jr_6BC0                             ; $6BBC: $20 $02

    ld   a, $03                                   ; $6BBE: $3E $03

.jr_6BC0
    ldh  [hMultiPurpose1], a                      ; $6BC0: $E0 $D8
    ld   a, d                                     ; $6BC2: $7A
    pop  de                                       ; $6BC3: $D1
    cp   d                                        ; $6BC4: $BA
    jr   nc, .jr_6BCB                             ; $6BC5: $30 $04

    ldh  a, [hMultiPurpose0]                      ; $6BC7: $F0 $D7
    jr   jr_036_6BCD                              ; $6BC9: $18 $02

.jr_6BCB
    ldh  a, [hMultiPurpose1]                      ; $6BCB: $F0 $D8

jr_036_6BCD:
    ld   e, a                                     ; $6BCD: $5F
    ret                                           ; $6BCE: $C9

func_036_6BCF::
    call PointHLToEntityPosX                      ; $6BCF: $CD $23 $6C
    ld   a, [hl]                                  ; $6BD2: $7E
    sub  $01                                      ; $6BD3: $D6 $01
    and  $F0                                      ; $6BD5: $E6 $F0
    swap a                                        ; $6BD7: $CB $37
    ld   e, a                                     ; $6BD9: $5F
    call PointHLToEntityPosY                      ; $6BDA: $CD $28 $6C
    ld   a, [hl]                                  ; $6BDD: $7E
    sub  $07                                      ; $6BDE: $D6 $07
    and  $F0                                      ; $6BE0: $E6 $F0
    or   e                                        ; $6BE2: $B3
    ld   e, a                                     ; $6BE3: $5F
    ld   d, $00                                   ; $6BE4: $16 $00
    ld   hl, wRoomObjects                         ; $6BE6: $21 $11 $D7
    ld   a, h                                     ; $6BE9: $7C
    add  hl, de                                   ; $6BEA: $19
    ld   h, a                                     ; $6BEB: $67
    ld   a, [hl]                                  ; $6BEC: $7E
    ret                                           ; $6BED: $C9

PointHLToEntitySpeedX::
    ld   hl, wEntitiesSpeedXTable                 ; $6BEE: $21 $40 $C2
    add  hl, bc                                   ; $6BF1: $09
    ret                                           ; $6BF2: $C9

PointHLToEntitySpeedY::
    ld   hl, wEntitiesSpeedYTable                 ; $6BF3: $21 $50 $C2
    add  hl, bc                                   ; $6BF6: $09
    ret                                           ; $6BF7: $C9

PointHLToEntitySpeedZ::
    ld   hl, wEntitiesSpeedZTable                 ; $6BF8: $21 $20 $C3
    add  hl, bc                                   ; $6BFB: $09
    ret                                           ; $6BFC: $C9

PointHLToEntityDirection::
    ld   hl, wEntitiesDirectionTable              ; $6BFD: $21 $80 $C3
    add  hl, bc                                   ; $6C00: $09
    ret                                           ; $6C01: $C9

PointHLToEntitySpriteVariant::
    ld   hl, wEntitiesSpriteVariantTable          ; $6C02: $21 $B0 $C3
    add  hl, bc                                   ; $6C05: $09
    ret                                           ; $6C06: $C9

SetEntityState::
    ld   hl, wEntitiesStateTable                  ; $6C07: $21 $90 $C2
    add  hl, bc                                   ; $6C0A: $09
    ld   [hl], a                                  ; $6C0B: $77
    ret                                           ; $6C0C: $C9

func_036_6C0D::
    call PointHLToEntitySpriteVariant             ; $6C0D: $CD $02 $6C
    ld   a, [hl]                                  ; $6C10: $7E
    xor  $01                                      ; $6C11: $EE $01
    ld   [hl], a                                  ; $6C13: $77
    ret                                           ; $6C14: $C9

func_036_6C15::
    ldh  a, [hFrameCounter]                       ; $6C15: $F0 $E7
    and  $07                                      ; $6C17: $E6 $07
    ret  nz                                       ; $6C19: $C0

    call PointHLToEntitySpriteVariant             ; $6C1A: $CD $02 $6C
    ld   a, [hl]                                  ; $6C1D: $7E
    inc  a                                        ; $6C1E: $3C
    and  $01                                      ; $6C1F: $E6 $01
    ld   [hl], a                                  ; $6C21: $77
    ret                                           ; $6C22: $C9

PointHLToEntityPosX::
    ld   hl, wEntitiesPosXTable                   ; $6C23: $21 $00 $C2
    add  hl, bc                                   ; $6C26: $09
    ret                                           ; $6C27: $C9

PointHLToEntityPosY::
    ld   hl, wEntitiesPosYTable                   ; $6C28: $21 $10 $C2
    add  hl, bc                                   ; $6C2B: $09
    ret                                           ; $6C2C: $C9

PointHLToEntityPosZ::
    ld   hl, wEntitiesPosZTable                   ; $6C2D: $21 $10 $C3
    add  hl, bc                                   ; $6C30: $09
    ret                                           ; $6C31: $C9

func_036_6C32::
    ld   hl, wD030                                ; $6C32: $21 $30 $D0
    add  hl, bc                                   ; $6C35: $09
    ret                                           ; $6C36: $C9

func_036_6C37::
    ld   hl, wD040                                ; $6C37: $21 $40 $D0
    add  hl, bc                                   ; $6C3A: $09
    ret                                           ; $6C3B: $C9

    ld   hl, wD050                                ; $6C3C: $21 $50 $D0
    add  hl, bc                                   ; $6C3F: $09
    ret                                           ; $6C40: $C9

    ld   hl, wD060                                ; $6C41: $21 $60 $D0
    add  hl, bc                                   ; $6C44: $09
    ret                                           ; $6C45: $C9

func_036_6C46::
    ld   hl, rSVBK                                ; $6C46: $21 $70 $FF
    ld   [hl], $02                                ; $6C49: $36 $02
    push hl                                       ; $6C4B: $E5
    call func_036_6C32                            ; $6C4C: $CD $32 $6C
    ld   [hl], a                                  ; $6C4F: $77
    pop  hl                                       ; $6C50: $E1
    ld   [hl], $00                                ; $6C51: $36 $00
    ret                                           ; $6C53: $C9

func_036_6C54::
    ld   hl, rSVBK                                ; $6C54: $21 $70 $FF
    ld   [hl], $02                                ; $6C57: $36 $02
    push hl                                       ; $6C59: $E5
    call func_036_6C37                            ; $6C5A: $CD $37 $6C
    ld   [hl], a                                  ; $6C5D: $77
    pop  hl                                       ; $6C5E: $E1
    ld   [hl], $00                                ; $6C5F: $36 $00
    ret                                           ; $6C61: $C9

func_036_6C62::
    ld   hl, rSVBK                                ; $6C62: $21 $70 $FF
    ld   [hl], $02                                ; $6C65: $36 $02
    push hl                                       ; $6C67: $E5
    call func_036_6C32                            ; $6C68: $CD $32 $6C
    ld   a, [hl]                                  ; $6C6B: $7E
    pop  hl                                       ; $6C6C: $E1
    ld   [hl], $00                                ; $6C6D: $36 $00
    ret                                           ; $6C6F: $C9

func_036_6C70::
    ld   hl, rSVBK                                ; $6C70: $21 $70 $FF
    ld   [hl], $02                                ; $6C73: $36 $02
    push hl                                       ; $6C75: $E5
    call func_036_6C37                            ; $6C76: $CD $37 $6C
    ld   a, [hl]                                  ; $6C79: $7E
    pop  hl                                       ; $6C7A: $E1
    ld   [hl], $00                                ; $6C7B: $36 $00
    ret                                           ; $6C7D: $C9

func_036_6C7E::
    add  hl, de                                   ; $6C7E: $19
    ld   a, [hl+]                                 ; $6C7F: $2A
    ld   h, [hl]                                  ; $6C80: $66
    ld   l, a                                     ; $6C81: $6F
    ret                                           ; $6C82: $C9

func_036_6C83::
    ld   hl, wEntitiesTransitionCountdownTable    ; $6C83: $21 $E0 $C2
    add  hl, bc                                   ; $6C86: $09
    ld   [hl], a                                  ; $6C87: $77
    ret                                           ; $6C88: $C9

func_036_6C89::
    ld   hl, wEntitiesStatusTable                 ; $6C89: $21 $80 $C2
    add  hl, bc                                   ; $6C8C: $09
    ld   [hl], $00                                ; $6C8D: $36 $00
    ret                                           ; $6C8F: $C9

func_036_6C90::
    ld   a, [de]                                  ; $6C90: $1A
    ld   l, a                                     ; $6C91: $6F
    inc  de                                       ; $6C92: $13
    ld   a, [de]                                  ; $6C93: $1A
    ld   d, a                                     ; $6C94: $57
    ld   e, l                                     ; $6C95: $5D
    call PointHLToEntityPosX                      ; $6C96: $CD $23 $6C
    ld   a, [hl]                                  ; $6C99: $7E
    cp   $1C                                      ; $6C9A: $FE $1C
    jr   nc, .jr_6CA2                             ; $6C9C: $30 $04

    ld   a, $1C                                   ; $6C9E: $3E $1C
    jr   jr_036_6CAA                              ; $6CA0: $18 $08

.jr_6CA2
    add  e                                        ; $6CA2: $83
    cp   $A0                                      ; $6CA3: $FE $A0
    jr   c, jr_036_6CAB                           ; $6CA5: $38 $04

    ld   a, $A0                                   ; $6CA7: $3E $A0
    sub  e                                        ; $6CA9: $93

jr_036_6CAA:
    ld   [hl], a                                  ; $6CAA: $77

jr_036_6CAB:
    call PointHLToEntityPosY                      ; $6CAB: $CD $28 $6C
    ld   a, [hl]                                  ; $6CAE: $7E
    cp   $20                                      ; $6CAF: $FE $20
    jr   nc, .jr_6CB7                             ; $6CB1: $30 $04

    ld   a, $20                                   ; $6CB3: $3E $20
    jr   jr_036_6CBF                              ; $6CB5: $18 $08

.jr_6CB7
    add  e                                        ; $6CB7: $83
    cp   $80                                      ; $6CB8: $FE $80
    jr   c, ret_036_6CC0                          ; $6CBA: $38 $04

    ld   a, $80                                   ; $6CBC: $3E $80
    sub  e                                        ; $6CBE: $93

jr_036_6CBF:
    ld   [hl], a                                  ; $6CBF: $77

ret_036_6CC0:
    ret                                           ; $6CC0: $C9

Data_036_6CC1::
    db   $FF, $47, $39, $0E, $C7, $00, $00, $00   ; $6CC1

Data_036_6CC9::
    db   $8C, $31, $C4, $26, $24, $15, $00, $00   ; $6CC9

Data_036_6CD1::
    db   $FF, $47, $87, $7D, $83, $3C, $00, $00   ; $6CD1

Data_036_6CD9::
    db   $0D, $76, $45, $7D, $A4, $3C, $00, $00   ; $6CD9

Data_036_6CE1::
    db   $F3, $51, $00, $00, $6D, $0D, $17, $17   ; $6CE1

Data_036_6CE9::
    db   $F3, $51, $00, $00, $00, $7C, $AE, $7E   ; $6CE9

Data_036_6CF1::
    db   $FF, $47, $F3, $51, $67, $28, $00, $00   ; $6CF1

Data_036_6CF9::
    db   $FF, $47, $F3, $51, $67, $28, $00, $00   ; $6CF9

Data_036_6D01::
    db   $F3, $51, $00, $00, $B4, $01, $FF, $7F, $F3, $51, $00, $00, $A5, $7C, $FF, $7F

Data_036_6D11:: ; indexed by hMapRoom
    db   $00, $04, $00, $00, $00, $00, $00, $03, $00, $03, $01, $01, $00, $01, $01, $00
    db   $01, $00, $00, $02, $00, $00

Data_036_6D27::
    db   $80, $00, $07, $06, $00, $00, $07, $00, $00, $00, $00, $00, $05, $00, $00, $00
    db   $00, $07, $00, $00

Data_036_6D3B::
    dw   $0000
    dw   Data_036_6CC1
    dw   Data_036_6CC9
    dw   Data_036_6CD1
    dw   Data_036_6CD9
    dw   Data_036_6CE1
    dw   Data_036_6CE9
    dw   Data_036_6CF1
    dw   Data_036_6CF9

func_036_6D4D::
    ldh  a, [hMapId]                              ; $6D4D: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $6D4F: $FE $FF
    ret  nz                                       ; $6D51: $C0

    ld   d, $00                                   ; $6D52: $16 $00
    ldh  a, [hMapRoom]                            ; $6D54: $F0 $F6
    ld   e, a                                     ; $6D56: $5F
    ld   hl, Data_036_6D11                        ; $6D57: $21 $11 $6D
    add  hl, de                                   ; $6D5A: $19
    ld   a, [hl]                                  ; $6D5B: $7E
    and  a                                        ; $6D5C: $A7
    jr   z, .jr_6D78                              ; $6D5D: $28 $19

    sla  a                                        ; $6D5F: $CB $27
    ld   e, a                                     ; $6D61: $5F
    ld   hl, Data_036_6D3B                        ; $6D62: $21 $3B $6D
    add  hl, de                                   ; $6D65: $19
    ld   a, [hl+]                                 ; $6D66: $2A
    ld   h, [hl]                                  ; $6D67: $66
    ld   l, a                                     ; $6D68: $6F
    ld   de, wBGPal8                              ; $6D69: $11 $48 $DC
    ld   bc, $08                                  ; $6D6C: $01 $08 $00
    call CopyData                                 ; $6D6F: $CD $14 $29
    ld   a, $01                                   ; $6D72: $3E $01
    ld   [wPaletteDataFlags], a                   ; $6D74: $EA $D1 $DD
    ret                                           ; $6D77: $C9

.jr_6D78
    ld   hl, Data_036_6D27                        ; $6D78: $21 $27 $6D
    add  hl, de                                   ; $6D7B: $19
    ld   a, [hl]                                  ; $6D7C: $7E
    and  a                                        ; $6D7D: $A7
    ret  z                                        ; $6D7E: $C8

    bit  7, a                                     ; $6D7F: $CB $7F
    jr   z, .jr_6D8E                              ; $6D81: $28 $0B

    ld   hl, Data_036_6D01                        ; $6D83: $21 $01 $6D
    ld   de, wObjPal7                             ; $6D86: $11 $80 $DC
    ld   bc, $10                                  ; $6D89: $01 $10 $00
    jr   jr_036_6D9E                              ; $6D8C: $18 $10

.jr_6D8E
    sla  a                                        ; $6D8E: $CB $27
    ld   e, a                                     ; $6D90: $5F
    ld   hl, Data_036_6D3B                        ; $6D91: $21 $3B $6D
    add  hl, de                                   ; $6D94: $19
    ld   a, [hl+]                                 ; $6D95: $2A
    ld   h, [hl]                                  ; $6D96: $66
    ld   l, a                                     ; $6D97: $6F
    ld   de, wObjPal8                             ; $6D98: $11 $88 $DC
    ld   bc, $08                                  ; $6D9B: $01 $08 $00

jr_036_6D9E:
    call CopyData                                 ; $6D9E: $CD $14 $29
    ld   a, $02                                   ; $6DA1: $3E $02
    ld   [wPaletteDataFlags], a                   ; $6DA3: $EA $D1 $DD
    ret                                           ; $6DA6: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
TileGlintSpriteVariants::
.variant0
    db $FF, $00
    db $FF, $20
.variant1
    db $3A, $00
    db $3A, $20
.variant2
    db $3C, $00
    db $3C, $20
.varint3
    db $3C, $00
    db $3C, $20

Data_036_6DB7::
    db   $58, $78, $78, $28, $28, $28, $78, $58, $28, $78, $28, $78, $28, $78, $58, $58
    db   $28, $78, $28, $78

Data_036_6DCB::
    db   $40, $30, $50, $50, $30, $30, $50, $40, $50, $30, $50, $50, $30, $30, $40, $40
    db   $50, $30, $30, $50

Data_036_6DDF::
    db   $F2, $00, $3A, $00, $F2, $08, $3A, $20, $0E, $00, $3A, $00, $0E, $08, $3A, $20
    db   $F6, $0A, $3A, $00, $F6, $12, $3A, $20, $0A, $F6, $3A, $00, $0A, $FE, $3A, $20
    db   $00, $0E, $3A, $00, $00, $16, $3A, $20, $00, $F2, $3A, $00, $00, $FA, $3A, $20
    db   $0A, $0A, $3A, $00, $0A, $12, $3A, $20, $F6, $F6, $3A, $00, $F6, $FE, $3A, $20

TileGlintHiddenEntityHandler::
TileGlintShownEntityHandler::
    ldh  a, [hActiveEntityState]                  ; $6E1F: $F0 $F0
    and  a                                        ; $6E21: $A7
    jr   z, jr_036_6E3F                           ; $6E22: $28 $1B

    call GetEntityTransitionCountdown             ; $6E24: $CD $05 $0C
    jp   z, func_036_6C89                         ; $6E27: $CA $89 $6C

    rla                                           ; $6E2A: $17
    rla                                           ; $6E2B: $17
    and  $30                                      ; $6E2C: $E6 $30
    ld   e, a                                     ; $6E2E: $5F
    ld   d, b                                     ; $6E2F: $50
    ld   hl, Data_036_6DDF                        ; $6E30: $21 $DF $6D
    add  hl, de                                   ; $6E33: $19
    ld   c, $04                                   ; $6E34: $0E $04

.jr_6E36
    call RenderActiveEntitySpritesRect            ; $6E36: $CD $E6 $3C

.jr_6E39
    ld   a, $02                                   ; $6E39: $3E $02

.jr_6E3B
    call func_015_7964_trampoline                 ; $6E3B: $CD $A0 $3D
    ret                                           ; $6E3E: $C9

jr_036_6E3F:
    call ReturnIfNonInteractive_36                ; $6E3F: $CD $40 $6A
    ldh  a, [hActiveEntityType]                   ; $6E42: $F0 $EB
    cp   ENTITY_TILE_GLINT_SHOWN                  ; $6E44: $FE $8A
    jr   nz, .tileGlintShownEnd                   ; $6E46: $20 $0F

    ldh  a, [hFrameCounter]                       ; $6E48: $F0 $E7
    rra                                           ; $6E4A: $1F
    rra                                           ; $6E4B: $1F
    and  $03                                      ; $6E4C: $E6 $03
    call SetEntitySpriteVariant                   ; $6E4E: $CD $0C $3B
    ld   de, TileGlintSpriteVariants              ; $6E51: $11 $A7 $6D
    call RenderActiveEntitySpritesPair            ; $6E54: $CD $C0 $3B
.tileGlintShownEnd

    ld   hl, wEntitiesInertiaTable                ; $6E57: $21 $D0 $C3
    add  hl, bc                                   ; $6E5A: $09
    ldh  a, [hTileGlintAnimation]                 ; $6E5B: $F0 $B9
    ld   e, a                                     ; $6E5D: $5F
    sla  a                                        ; $6E5E: $CB $27
    sla  a                                        ; $6E60: $CB $27
    add  e                                        ; $6E62: $83
    add  [hl]                                     ; $6E63: $86
    ld   e, a                                     ; $6E64: $5F
    ld   d, b                                     ; $6E65: $50
    ld   hl, Data_036_6DB7                        ; $6E66: $21 $B7 $6D
    add  hl, de                                   ; $6E69: $19
    ld   a, [hl]                                  ; $6E6A: $7E
    ld   hl, wEntitiesPosXTable                   ; $6E6B: $21 $00 $C2
    add  hl, bc                                   ; $6E6E: $09
    ld   [hl], a                                  ; $6E6F: $77
    ld   hl, Data_036_6DCB                        ; $6E70: $21 $CB $6D
    add  hl, de                                   ; $6E73: $19
    ld   a, [hl]                                  ; $6E74: $7E
    ld   hl, wEntitiesPosYTable                   ; $6E75: $21 $10 $C2
    add  hl, bc                                   ; $6E78: $09
    ld   [hl], a                                  ; $6E79: $77
    call CopyEntityPositionToActivePosition       ; $6E7A: $CD $8A $3D
    ld   hl, wEntitiesPrivateState1Table          ; $6E7D: $21 $B0 $C2
    add  hl, bc                                   ; $6E80: $09
    ldh  a, [hObjectUnderLink]                    ; $6E81: $F0 $B8
    cp   [hl]                                     ; $6E83: $BE
    jr   z, jr_036_6ECD                           ; $6E84: $28 $47

    cp   $8D                                      ; $6E86: $FE $8D
    jr   nz, jr_036_6ECD                          ; $6E88: $20 $43

    call CheckLinkCollisionWithEnemy_trampoline   ; $6E8A: $CD $5A $3B
    jr   nc, jr_036_6EC8                          ; $6E8D: $30 $39

    ld   hl, wEntitiesInertiaTable                ; $6E8F: $21 $D0 $C3
    add  hl, bc                                   ; $6E92: $09
    ld   a, [hl]                                  ; $6E93: $7E
    cp   $04                                      ; $6E94: $FE $04
    jr   nz, .jr_6EA0                             ; $6E96: $20 $08

    call func_036_6C89                            ; $6E98: $CD $89 $6C
    call MarkTriggerAsResolved                    ; $6E9B: $CD $60 $0C
    jr   jr_036_6ECD                              ; $6E9E: $18 $2D

.jr_6EA0
    inc  [hl]                                     ; $6EA0: $34
    ld   a, JINGLE_VALIDATE                       ; $6EA1: $3E $13
    ldh  [hJingle], a                             ; $6EA3: $E0 $F2
    ld   a, ENTITY_TILE_GLINT_SHOWN               ; $6EA5: $3E $8A
    call SpawnNewEntity_trampoline                ; $6EA7: $CD $86 $3B
    jr   c, .jr_6EC6                              ; $6EAA: $38 $1A

    ldh  a, [hMultiPurpose0]                      ; $6EAC: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $6EAE: $21 $00 $C2
    add  hl, de                                   ; $6EB1: $19
    ld   [hl], a                                  ; $6EB2: $77
    ldh  a, [hMultiPurpose1]                      ; $6EB3: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $6EB5: $21 $10 $C2
    add  hl, de                                   ; $6EB8: $19
    ld   [hl], a                                  ; $6EB9: $77
    push bc                                       ; $6EBA: $C5
    ld   c, e                                     ; $6EBB: $4B
    ld   b, d                                     ; $6EBC: $42
    call IncrementEntityState                     ; $6EBD: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $6EC0: $CD $05 $0C
    ld   [hl], $18                                ; $6EC3: $36 $18
    pop  bc                                       ; $6EC5: $C1

.jr_6EC6
    jr   jr_036_6ECD                              ; $6EC6: $18 $05

jr_036_6EC8:
    ld   hl, wEntitiesInertiaTable                ; $6EC8: $21 $D0 $C3
    add  hl, bc                                   ; $6ECB: $09
    ld   [hl], b                                  ; $6ECC: $70

jr_036_6ECD:
    ldh  a, [hObjectUnderLink]                    ; $6ECD: $F0 $B8
    ld   hl, wEntitiesPrivateState1Table          ; $6ECF: $21 $B0 $C2
    add  hl, bc                                   ; $6ED2: $09
    ld   [hl], a                                  ; $6ED3: $77
    ret                                           ; $6ED4: $C9

PiranhaPlantEntityHandler::
    ld   hl, wEntitiesRecoilVelocityX             ; $6ED5: $21 $F0 $C3
    add  hl, bc                                   ; $6ED8: $09
    ld   [hl], b                                  ; $6ED9: $70
    ld   hl, wEntitiesRecoilVelocityY             ; $6EDA: $21 $00 $C4
    add  hl, bc                                   ; $6EDD: $09
    ld   [hl], b                                  ; $6EDE: $70
    call func_036_7022                            ; $6EDF: $CD $22 $70
    ld   a, [wGameplayType]                       ; $6EE2: $FA $95 $DB
    cp   $0B                                      ; $6EE5: $FE $0B
    ret  nz                                       ; $6EE7: $C0

    ld   a, [wTransitionSequenceCounter]          ; $6EE8: $FA $6B $C1
    cp   $04                                      ; $6EEB: $FE $04
    ret  nz                                       ; $6EED: $C0

    call ReturnIfNonInteractive_36                ; $6EEE: $CD $40 $6A
    ld   hl, wEntitiesPrivateState2Table          ; $6EF1: $21 $C0 $C2
    add  hl, bc                                   ; $6EF4: $09
    ld   a, [hl]                                  ; $6EF5: $7E
    and  a                                        ; $6EF6: $A7
    jr   nz, .jr_6F01                             ; $6EF7: $20 $08

    inc  [hl]                                     ; $6EF9: $34
    ldh  a, [hActiveEntityPosY]                   ; $6EFA: $F0 $EF
    ld   hl, wEntitiesPrivateState1Table          ; $6EFC: $21 $B0 $C2
    add  hl, bc                                   ; $6EFF: $09
    ld   [hl], a                                  ; $6F00: $77

.jr_6F01
    call ApplyRecoilIfNeeded_36                   ; $6F01: $CD $15 $6B
    ldh  a, [hActiveEntityState]                  ; $6F04: $F0 $F0
    JP_TABLE                                      ; $6F06
._00 dw PiranhaPlantState0Handler
._01 dw PiranhaPlantState1Handler
._02 dw PiranhaPlantState2Handler
._03 dw PiranhaPlantState3Handler

PiranhaPlantState0Handler::
    call GetEntityTransitionCountdown             ; $6F0F: $CD $05 $0C
    jr   nz, ret_036_6F2D                         ; $6F12: $20 $19

    ld   [hl], $40                                ; $6F14: $36 $40
    ld   e, $00                                   ; $6F16: $1E $00
    ldh  a, [hLinkPositionX]                      ; $6F18: $F0 $98
    call PointHLToEntityPosX                      ; $6F1A: $CD $23 $6C
    sub  [hl]                                     ; $6F1D: $96
    bit  7, a                                     ; $6F1E: $CB $7F
    jr   z, .jr_6F23                              ; $6F20: $28 $01

    inc  e                                        ; $6F22: $1C

.jr_6F23
    ld   d, a                                     ; $6F23: $57
    add  $10                                      ; $6F24: $C6 $10
    cp   $20                                      ; $6F26: $FE $20
    jr   c, ret_036_6F2D                          ; $6F28: $38 $03

    call IncrementEntityState                     ; $6F2A: $CD $12 $3B

ret_036_6F2D:
    ret                                           ; $6F2D: $C9

Data_036_6F2E::
    db   $04, $04, $03, $02, $01, $00, $00, $00

Data_036_6F36::
    db   $E0, $E0, $E8, $F0, $00, $00, $00, $00

PiranhaPlantState1Handler::
    call label_3B39                               ; $6F3E: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $6F41: $CD $05 $0C
    jr   nz, .jr_6F4C                             ; $6F44: $20 $06

    ld   [hl], $80                                ; $6F46: $36 $80
    call IncrementEntityState                     ; $6F48: $CD $12 $3B
    ret                                           ; $6F4B: $C9

.jr_6F4C
    rra                                           ; $6F4C: $1F
    rra                                           ; $6F4D: $1F
    rra                                           ; $6F4E: $1F
    and  $07                                      ; $6F4F: $E6 $07
    ld   e, a                                     ; $6F51: $5F
    ld   d, b                                     ; $6F52: $50
    ld   hl, Data_036_6F2E                        ; $6F53: $21 $2E $6F
    add  hl, de                                   ; $6F56: $19
    ld   a, [hl]                                  ; $6F57: $7E
    call SetEntitySpriteVariant                   ; $6F58: $CD $0C $3B
    ld   hl, Data_036_6F36                        ; $6F5B: $21 $36 $6F
    add  hl, de                                   ; $6F5E: $19
    ld   a, [hl]                                  ; $6F5F: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $6F60: $21 $B0 $C2
    add  hl, bc                                   ; $6F63: $09
    add  [hl]                                     ; $6F64: $86
    ld   hl, wEntitiesPosYTable                   ; $6F65: $21 $10 $C2
    add  hl, bc                                   ; $6F68: $09
    ld   [hl], a                                  ; $6F69: $77
    ret                                           ; $6F6A: $C9

PiranhaPlantState2Handler::
    call label_3B39                               ; $6F6B: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $6F6E: $CD $05 $0C
    jr   nz, .jr_6F78                             ; $6F71: $20 $05

    ld   [hl], $40                                ; $6F73: $36 $40
    call IncrementEntityState                     ; $6F75: $CD $12 $3B

.jr_6F78
    ld   e, $04                                   ; $6F78: $1E $04
    and  $10                                      ; $6F7A: $E6 $10
    jr   nz, .jr_6F7F                             ; $6F7C: $20 $01

    inc  e                                        ; $6F7E: $1C

.jr_6F7F
    ld   a, e                                     ; $6F7F: $7B
    call SetEntitySpriteVariant                   ; $6F80: $CD $0C $3B
    ret                                           ; $6F83: $C9

Data_036_6F84::
    db   $00, $00, $00, $00, $01, $02, $03, $05

Data_036_6F8C::
    db   $00, $00, $00, $00, $00, $F0, $E8, $E0

PiranhaPlantState3Handler::
    call label_3B39                               ; $6F94: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $6F97: $CD $05 $0C
    jr   nz, .jr_6FA3                             ; $6F9A: $20 $07

    ld   [hl], $40                                ; $6F9C: $36 $40
    call IncrementEntityState                     ; $6F9E: $CD $12 $3B
    ld   [hl], b                                  ; $6FA1: $70
    ret                                           ; $6FA2: $C9

.jr_6FA3
    rra                                           ; $6FA3: $1F
    rra                                           ; $6FA4: $1F
    rra                                           ; $6FA5: $1F
    and  $07                                      ; $6FA6: $E6 $07
    ld   e, a                                     ; $6FA8: $5F
    ld   d, b                                     ; $6FA9: $50
    ld   hl, Data_036_6F84                        ; $6FAA: $21 $84 $6F
    add  hl, de                                   ; $6FAD: $19
    ld   a, [hl]                                  ; $6FAE: $7E
    call SetEntitySpriteVariant                   ; $6FAF: $CD $0C $3B
    ld   hl, Data_036_6F8C                        ; $6FB2: $21 $8C $6F
    add  hl, de                                   ; $6FB5: $19
    ld   a, [hl]                                  ; $6FB6: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $6FB7: $21 $B0 $C2
    add  hl, bc                                   ; $6FBA: $09
    add  [hl]                                     ; $6FBB: $86
    ld   hl, wEntitiesPosYTable                   ; $6FBC: $21 $10 $C2
    add  hl, bc                                   ; $6FBF: $09
    ld   [hl], a                                  ; $6FC0: $77
    ret                                           ; $6FC1: $C9

Data_036_6FC2::
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $F0, $00, $74, $02, $F0, $08, $74, $22, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $00, $70, $02, $00, $08, $70, $22, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $00, $70, $02, $00, $08, $70, $22, $08, $00, $76, $00, $08, $08, $76, $20
    db   $00, $00, $70, $02, $00, $08, $70, $22, $10, $00, $72, $00, $10, $08, $72, $20
    db   $00, $00, $78, $02, $00, $08, $78, $22, $10, $00, $72, $00, $10, $08, $72, $20

func_036_7022::
    ldh  a, [hActiveEntitySpriteVariant]          ; $7022: $F0 $F1
    rla                                           ; $7024: $17
    rla                                           ; $7025: $17
    rla                                           ; $7026: $17
    rla                                           ; $7027: $17
    and  $F0                                      ; $7028: $E6 $F0
    ld   e, a                                     ; $702A: $5F
    ld   d, b                                     ; $702B: $50
    ld   hl, Data_036_6FC2                        ; $702C: $21 $C2 $6F
    add  hl, de                                   ; $702F: $19
    ld   c, $04                                   ; $7030: $0E $04
    call RenderActiveEntitySpritesRect            ; $7032: $CD $E6 $3C
    ret                                           ; $7035: $C9

Data_036_7036::
    db   $FF, $47, $19, $14, $0A, $10, $00, $00

func_036_703E::
    ld   hl, wObjPal8                             ; $703E: $21 $88 $DC
    ld   de, Data_036_7036                        ; $7041: $11 $36 $70

.loop_7044
    ld   a, [de]                                  ; $7044: $1A
    ld   [hl+], a                                 ; $7045: $22
    inc  de                                       ; $7046: $13
    ld   a, l                                     ; $7047: $7D
    and  $07                                      ; $7048: $E6 $07
    jr   nz, .loop_7044                           ; $704A: $20 $F8

    ld   a, $02                                   ; $704C: $3E $02
    ld   [wPaletteDataFlags], a                   ; $704E: $EA $D1 $DD
    ret                                           ; $7051: $C9

Data_036_7052::
    db   $08, $18, $08, $18

Data_036_7056::
    db   $10, $10, $20, $20

func_036_705A::
    push bc                                       ; $705A: $C5
    ld   c, $03                                   ; $705B: $0E $03
    ld   b, $00                                   ; $705D: $06 $00

jr_036_705F:
    ld   a, ENTITY_ENTITY_LIFTABLE_ROCK           ; $705F: $3E $05
    call SpawnNewEntity_trampoline                ; $7061: $CD $86 $3B
    jr   c, jr_036_708E                           ; $7064: $38 $28

    ld   hl, wEntitiesPrivateCountdown1Table      ; $7066: $21 $F0 $C2
    add  hl, de                                   ; $7069: $19
    ld   [hl], $0F                                ; $706A: $36 $0F
    ldh  a, [hIntersectedObjectLeft]              ; $706C: $F0 $CE
    ld   hl, Data_036_7052                        ; $706E: $21 $52 $70

.jr_7071
    add  hl, bc                                   ; $7071: $09
    add  [hl]                                     ; $7072: $86
    ld   hl, wEntitiesPosXTable                   ; $7073: $21 $00 $C2
    add  hl, de                                   ; $7076: $19
    ld   [hl], a                                  ; $7077: $77
    ldh  a, [hIntersectedObjectTop]               ; $7078: $F0 $CD

.jr_707A
    ld   hl, Data_036_7056                        ; $707A: $21 $56 $70
    add  hl, bc                                   ; $707D: $09
    add  [hl]                                     ; $707E: $86
    ld   hl, hMultiPurpose3                       ; $707F: $21 $DA $FF
    sub  [hl]                                     ; $7082: $96
    ld   hl, wEntitiesPosYTable                   ; $7083: $21 $10 $C2
    add  hl, de                                   ; $7086: $19
    ld   [hl], a                                  ; $7087: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $7088: $21 $40 $C3
    add  hl, de                                   ; $708B: $19
    ld   [hl], $C4                                ; $708C: $36 $C4

jr_036_708E:
    dec  c                                        ; $708E: $0D
    ld   a, c                                     ; $708F: $79
    cp   $FF                                      ; $7090: $FE $FF
    jr   nz, jr_036_705F                          ; $7092: $20 $CB

    pop  bc                                       ; $7094: $C1
    ret                                           ; $7095: $C9

Data_036_7096::
    db   $80, $26, $95, $63, $20, $3A, $75, $6B, $A0, $51, $35, $73, $08, $7D, $18, $7F
    db   $AD, $78, $F9, $7E, $50, $5C, $DA, $76, $12, $40, $BB, $6A, $15, $30, $BC, $66
    db   $17, $14, $BD, $5E, $D7, $04, $FD, $56, $37, $05, $1D, $57, $97, $09, $3D, $5B
    db   $F5, $09, $5C, $5B, $10, $0A, $5A, $5B, $4B, $06, $79, $57, $A0, $02, $95, $57

cycleInstrumentItemColor::
    ld   a, [wPaletteUnknownE]                    ; $70D6: $FA $D5 $DD
    ld   a, [wTransitionSequenceCounter]          ; $70D9: $FA $6B $C1
    cp   $04                                      ; $70DC: $FE $04
    ret  nz                                       ; $70DE: $C0

IF __PATCH_0__
    xor  a
    ld   [wObjPal1 + 1*2], a
ENDC

    ldh  a, [hIsGBC]                              ; $70DF: $F0 $FE
    and  a                                        ; $70E1: $A7
    ret  z                                        ; $70E2: $C8

    ldh  a, [hFrameCounter]                       ; $70E3: $F0 $E7
    srl  a                                        ; $70E5: $CB $3F
    and  $3C                                      ; $70E7: $E6 $3C
    ld   e, a                                     ; $70E9: $5F
    ld   d, $00                                   ; $70EA: $16 $00
    ld   hl, Data_036_7096                        ; $70EC: $21 $96 $70
    add  hl, de                                   ; $70EF: $19
    ld   de, wObjPal2 + 2*2                       ; $70F0: $11 $5C $DC

.loop_70F3
    ld   a, [hl+]                                 ; $70F3: $2A
    ld   [de], a                                  ; $70F4: $12
    inc  de                                       ; $70F5: $13
    ld   a, e                                     ; $70F6: $7B
    and  $03                                      ; $70F7: $E6 $03
    jr   nz, .loop_70F3                           ; $70F9: $20 $F8

    ld   a, $02                                   ; $70FB: $3E $02
    ld   [wPaletteDataFlags], a                   ; $70FD: $EA $D1 $DD
    ret                                           ; $7100: $C9

label_036_728B:
    ld   a, $02                                   ; $728B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $728D: $E0 $A1
    ld   a, e                                     ; $728F: $7B
    ld   [wGameplayType], a                       ; $7290: $EA $95 $DB
    xor  a                                        ; $7293: $AF
    ld   [wTransitionSequenceCounter], a          ; $7294: $EA $6B $C1
    ld   [wC16C], a                               ; $7297: $EA $6C $C1
    ld   [wGameplaySubtype], a                    ; $729A: $EA $96 $DB
    ret                                           ; $729D: $C9

EntityInitGenie::
    xor  a                                        ; $72AB: $AF
    ld   hl, wEntitiesPrivateState5Table          ; $72AC: $21 $90 $C3
    add  hl, bc                                   ; $72AF: $09
    ld   [hl], a                                  ; $72B0: $77
    ld   hl, wEntitiesPosXTable                   ; $72B1: $21 $00 $C2
    add  hl, bc                                   ; $72B4: $09
    ld   a, [hl]                                  ; $72B5: $7E
    add  $08                                      ; $72B6: $C6 $08
    ld   [hl], a                                  ; $72B8: $77
    ret                                           ; $72B9: $C9

IF __PATCH_3__
func_036_72D5:
    ldh  a, [hActiveEntityState]
    sub  $02
    JP_TABLE
._00 dw func_036_72e4
._01 dw func_036_72e4
._02 dw func_036_72eb
._03 dw func_036_72f3
._04 dw func_036_730a

func_036_72e4:
    ld   a, [wObjPal1 + 1*2]
    inc  a
    ret  nz

    jr   jr_036_7307

func_036_72eb:
    ld   a, [wDialogState]
    and  a
    jr   z, func_036_730a

    jr   jr_036_7307

func_036_72f3:
    ld   a, [wDialogState]
    and  a
    jr   nz, func_036_730a

    ld   hl, wObjPal3 + 2*2
    ld   a, $ff
    ld   [hl+], a
    ld   a, $7f
    ld   [hl], a
    ld   a, $02
    ld   [wPaletteDataFlags], a

jr_036_7307:
    call IncrementEntityState

func_036_730a:
    ld   a, $04
    ld   [wInvincibilityCounter], a
    ret
ENDC

; On Overworld, copy some palette data to OAM buffer
func_036_72BA::
    ld   a, [wPaletteDataFlags]                   ; $72BA: $FA $D1 $DD
    and  a                                        ; $72BD: $A7
    ret  nz                                       ; $72BE: $C0

    ldh  a, [hIsGBC]                              ; $72BF: $F0 $FE
    and  a                                        ; $72C1: $A7
    ret  z                                        ; $72C2: $C8

    ld   a, [wDE00]                               ; $72C3: $FA $00 $DE
    and  a                                        ; $72C6: $A7
    ret  z                                        ; $72C7: $C8

    ld   a, [wGameplayType]                       ; $72C8: $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ; $72CB: $FE $0B
    ret  nz                                       ; $72CD: $C0

    ld   a, [wGameplaySubtype]                    ; $72CE: $FA $96 $DB
    cp   GAMEPLAY_WORLD_INTERACTIVE               ; $72D1: $FE $07
    ret  nz                                       ; $72D3: $C0

    xor  a                                        ; $72D4: $AF
    ld   [wDE00], a                               ; $72D5: $EA $00 $DE

    ld   hl, wOAMBuffer                           ; $72D8: $21 $00 $C0
    ld   de, wDynamicOAMBuffer+$6C                ; $72DB: $11 $9C $C0
    ld   b, $14                                   ; $72DE: $06 $14

    ; Swap the content of HL and DE for $14 * 4 bytes
    ; (the loop is partially unrolled)
.loop
    ld   c, [hl]                                  ; $72E0: $4E
    ld   a, [de]                                  ; $72E1: $1A
    ld   [hl+], a                                 ; $72E2: $22
    ld   a, c                                     ; $72E3: $79
    ld   [de], a                                  ; $72E4: $12
    inc  de                                       ; $72E5: $13

    ld   c, [hl]                                  ; $72E6: $4E
    ld   a, [de]                                  ; $72E7: $1A
    ld   [hl+], a                                 ; $72E8: $22
    ld   a, c                                     ; $72E9: $79
    ld   [de], a                                  ; $72EA: $12
    inc  de                                       ; $72EB: $13

    ld   c, [hl]                                  ; $72EC: $4E
    ld   a, [de]                                  ; $72ED: $1A
    ld   [hl+], a                                 ; $72EE: $22
    ld   a, c                                     ; $72EF: $79
    ld   [de], a                                  ; $72F0: $12
    inc  de                                       ; $72F1: $13

    ld   c, [hl]                                  ; $72F2: $4E
    ld   a, [de]                                  ; $72F3: $1A
    ld   [hl+], a                                 ; $72F4: $22
    ld   a, c                                     ; $72F5: $79
    ld   [de], a                                  ; $72F6: $12

    ld   c, $07                                   ; $72F7: $0E $07
    ld   a, e                                     ; $72F9: $7B
    sub  c                                        ; $72FA: $91
    ld   e, a                                     ; $72FB: $5F

    dec  b                                        ; $72FC: $05
    jr   nz, .loop                                ; $72FD: $20 $E1

    ret                                           ; $72FF: $C9
