
unsupportedGameboyTilemap::
incbin "gfx/error/unsupported_tileset.tilemap"

unsupportedGameboyTileset::
incbin "gfx/error/unsupported_tileset.2bpp"

unsupportedGameboyErrorScreen::
	xor a
	ldh [hIsGBC], a
	ldh [rLCDC], a
	ld a, 0 | 1 << 2 | 2 << 4 | 3 << 6
	ldh [rBGP], a

	ld de, vTiles1
	ld hl, unsupportedGameboyTileset
	ld bc, TILE_SIZE * 16 * 6
	call CopyData

	ld de, vBGMap0
	ld hl, unsupportedGameboyTilemap
	ld b, 18
.loop
	push bc
	ld bc, 20
	call CopyData
	push hl
	ld hl, 12
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop bc
	dec b
	jr nz, .loop

	ld a, %10000000 | %00000001
	ldh [rLCDC], a

.haltLoop
	halt
	jp .haltLoop
