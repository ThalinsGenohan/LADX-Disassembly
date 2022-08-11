section "Tiles 0", vram[$8000], BANK[0]
vTiles0::
vTilesSpriteslots equ $8400
vTilesSpriteslot1 equ $8400
vTilesSpriteslot2 equ $8500
vTilesSpriteslot3 equ $8600
vTilesSpriteslot4 equ $8700

section "Tiles 1", vram[$8800], BANK[0]
vTiles1::

section "Tiles 2", vram[$9000], BANK[0]
vTiles2::
vTilesSwitchBlockA equ $9040
vTilesSwitchBlockB equ $9080

section "BG Map 0", vram[$9800], BANK[0]
vBGMap0::

section "BG Map 1", vram[$9C00], BANK[0]
vBGMap1::

section "Tiles 3", vram[$8000], BANK[1]
vTiles3::

section "Tiles 4", vram[$8800], BANK[1]
vTiles4::

section "Tiles 5", vram[$9000], BANK[1]
vTiles5::

section "Attribute Map 0", vram[$9800], BANK[1]
vAttrMap0::

section "Attribute Map 1", vram[$9C00], BANK[1]
vAttrMap1::
