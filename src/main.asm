; Root source file for the game.

; Build options
include "options.asm"

; Definitions
include "constants/constants.asm"

; Utilities functions and ROM header
include "code/header.asm"
include "code/macros.asm"
include "code/audio_macros.asm"

; Sources
section "Main", rom0[$0150]
include "code/bank0.asm"

section "bank1",romx[$4000],bank[$01]
include "code/file_save_screen.asm"
include "code/game_over.asm"
include "code/world_handler.asm"
include "code/bank1.asm"

section "bank2",romx[$4000],bank[$02]
include "code/bank2.asm"

section "bank3",romx[$4000],bank[$03]
include "data/entities/physics_flags.asm"
include "data/entities/hitbox_flags.asm"
include "data/entities/health_groups.asm"
include "code/entities/bank3.asm"

section "bank4",romx[$4000],bank[$04]
include "code/entities/bank4.asm"

section "bank5",romx[$4000],bank[$05]
include "code/entities/05_bow_wow.asm"
include "code/entities/05_cucco.asm"
include "code/entities/05_witch.asm"
include "code/entities/05_tarin.asm"
include "code/entities/05_marin.asm"
include "code/entities/05_raft_owner.asm"
include "code/entities/05_entity_67.asm"
include "code/entities/05_angler_fish.asm"
include "code/entities/05_evil_eagle.asm"
include "code/entities/05_hot_head.asm"
include "code/entities/05_dodongo_snake.asm"
include "code/entities/05_slime_eel.asm"
include "code/entities/05__helpers.asm"
include "code/entities/05_ghoma.asm"
include "code/entities/05_musical_note.asm"
include "code/entities/05_animal_d0.asm"

section "bank6",romx[$4000],bank[$06]
include "code/entities/bank6.asm"

section "bank7",romx[$4000],bank[$07]
include "code/entities/bank7.asm"

section "bank8",romx[$4000],bank[$08]
IndoorObjectsTilemap::
IF !__DMG_GFX__
include "data/objects_tilemaps/indoor.cgb.asm"
ELSE
include "data/objects_tilemaps/indoor.dmg.asm"
ENDC
ColorDungeonObjectsTilemap::
include "data/objects_tilemaps/color_dungeon.asm"
include "data/objects/physics.asm"
BGTilemaps::
include "data/backgrounds/tilemaps_list.asm"

; Maps and dialogs
section "bank9",romx[$4000],bank[$09]
OverworldRoomPointers::
include "data/maps/overworld.asm"
OverworldRoomsFirstHalf::
include "data/rooms/overworld_a.asm"
include "text/dialog_dx.asm"

section "bank0A", romx[$4000], bank[$0A]
IndoorsARoomPointers::
include "data/maps/indoors_a.asm"
IndoorsARooms::
include "data/rooms/indoors_a.asm"
ColorDungeonRoomPointers::
include "data/maps/color_dungeon.asm"
ColorDungeonRooms::
include "data/rooms/color_dungeon.asm"

section "bank0B", romx[$4000], bank[$0B]
IndoorsBRoomPointers::
include "data/maps/indoors_b.asm"
IndoorsBRooms::
include "data/rooms/indoors_b.asm"

section "bank0C",romx[$4000],bank[$0C]

IF !__DMG_GFX__
LinkCharacterTiles::
incbin "gfx/characters/oam_link_1.cgb.2bpp"
CharacterVfxTiles::
incbin "gfx/characters/oam_vfx.cgb.2bpp"
Items1Tiles::
incbin "gfx/items/items_1.cgb.2bpp"
InventoryEquipmentItemsTiles::
incbin "gfx/items/items_2.cgb.2bpp"
InventoryOverworldItemsTiles::
incbin "gfx/items/inventory_overworld_items.cgb.2bpp"
SirenInstrumentsTiles::
incbin "gfx/items/instruments.cgb.2bpp"
Overworld1Tiles::
incbin "gfx/world/overworld_1.cgb.2bpp"
OverworldLandscapeTiles::
incbin "gfx/world/overworld_landscape.cgb.2bpp"
LinkCharacter2Tiles::
incbin "gfx/characters/oam_link_2.cgb.2bpp"
SwitchBlockTiles::
incbin "gfx/items/switch_block.cgb.2bpp"
MushroomTiles::
incbin "gfx/items/mushroom.cgb.2bpp"
SlimeKeyTiles::
incbin "gfx/items/slime_key.cgb.2bpp"
PieceOfHeartMeterTiles::
incbin "gfx/items/piece_of_heart_meter.cgb.2bpp"
OcarinaSymbolsTiles::
incbin "gfx/items/ocarina_symbols.cgb.2bpp"
AnimatedTiles::
incbin "gfx/world/animated_tiles.w32.cgb.2bpp"
WorldMapTiles::
incbin "gfx/world/minimap.cgb.2bpp"

ELSE
LinkCharacterTiles::
incbin "gfx/characters/oam_link_1.dmg.2bpp"
CharacterVfxTiles::
incbin "gfx/characters/oam_vfx.dmg.2bpp"
Items1Tiles::
incbin "gfx/items/items_1.dmg.2bpp"
InventoryEquipmentItemsTiles::
incbin "gfx/items/items_2.dmg.2bpp"
InventoryOverworldItemsTiles::
incbin "gfx/items/inventory_overworld_items.dmg.2bpp"
SirenInstrumentsTiles::
incbin "gfx/items/instruments.dmg.2bpp"
Overworld1Tiles::
incbin "gfx/world/overworld_1.dmg.2bpp"
OverworldLandscapeTiles::
incbin "gfx/world/overworld_landscape.dmg.2bpp"
LinkCharacter2Tiles::
incbin "gfx/characters/oam_link_2.dmg.2bpp"
SwitchBlockTiles::
incbin "gfx/items/switch_block.dmg.2bpp"
MushroomTiles::
incbin "gfx/items/mushroom.dmg.2bpp"
SlimeKeyTiles::
incbin "gfx/items/slime_key.dmg.2bpp"
PieceOfHeartMeterTiles::
incbin "gfx/items/piece_of_heart_meter.dmg.2bpp"
OcarinaSymbolsTiles::
incbin "gfx/items/ocarina_symbols.dmg.2bpp"
AnimatedTiles::
incbin "gfx/world/animated_tiles.w32.dmg.2bpp"
WorldMapTiles::
incbin "gfx/world/minimap.dmg.2bpp"
ENDC

section "bankOD",romx[$4000],bank[$0D]
IF !__DMG_GFX__
DungeonsTiles::
Dungeons1Tiles::
incbin "gfx/dungeons/doors.cgb.2bpp"
DungeonWallsATiles::
incbin "gfx/dungeons/walls/walls_a.cgb.2bpp"
DungeonWallsBTiles::
incbin "gfx/dungeons/walls/walls_b.cgb.2bpp"
DungeonWallsCTiles::
incbin "gfx/dungeons/walls/walls_c.cgb.2bpp"
DungeonWallsDTiles::
incbin "gfx/dungeons/walls/walls_d.cgb.2bpp"
DungeonWallsETiles::
incbin "gfx/dungeons/walls/walls_e.cgb.2bpp"
DungeonWallsFTiles::
incbin "gfx/dungeons/walls/walls_f.cgb.2bpp"

DungeonFloorATiles::
incbin "gfx/dungeons/floor/floor_a.cgb.2bpp"
DungeonFloorBTiles::
incbin "gfx/dungeons/floor/floor_b.cgb.2bpp"
DungeonFloorCTiles::
incbin "gfx/dungeons/floor/floor_c.cgb.2bpp"
DungeonFloorDTiles::
incbin "gfx/dungeons/floor/floor_d.cgb.2bpp"
DungeonFloorETiles::
incbin "gfx/dungeons/floor/floor_e.cgb.2bpp"
DungeonFloorFTiles::
incbin "gfx/dungeons/floor/floor_f.cgb.2bpp"
DungeonFloorGTiles::
incbin "gfx/dungeons/floor/floor_g.cgb.2bpp"
DungeonFloorHTiles::
incbin "gfx/dungeons/floor/floor_h.cgb.2bpp"
DungeonFloorITiles::
incbin "gfx/dungeons/floor/floor_i.cgb.2bpp"
DungeonFloorJTiles::
incbin "gfx/dungeons/floor/floor_j.cgb.2bpp"
DungeonFloorKTiles::
incbin "gfx/dungeons/floor/floor_k.cgb.2bpp"
DungeonFloorLTiles::
incbin "gfx/dungeons/floor/floor_l.cgb.2bpp"
WindfishFloorTiles::
incbin "gfx/dungeons/floor/windfish_floor.cgb.2bpp"

Dungeons2Tiles::
Dungeons2_00Tiles::
incbin "gfx/dungeons/dungeons_2/00.cgb.2bpp"
Dungeons2_01Tiles::
incbin "gfx/dungeons/dungeons_2/01.cgb.2bpp"
Dungeons2_02Tiles::
incbin "gfx/dungeons/dungeons_2/02.cgb.2bpp"
Dungeons2_03Tiles::
incbin "gfx/dungeons/dungeons_2/03.cgb.2bpp"
Dungeons2_04Tiles::
incbin "gfx/dungeons/dungeons_2/04.cgb.2bpp"
Dungeons2_05Tiles::
incbin "gfx/dungeons/dungeons_2/05.cgb.2bpp"
Dungeons2_06Tiles::
incbin "gfx/dungeons/dungeons_2/06.cgb.2bpp"
Dungeons2_07Tiles::
incbin "gfx/dungeons/dungeons_2/07.cgb.2bpp"
Dungeons2_08Tiles::
incbin "gfx/dungeons/dungeons_2/08.cgb.2bpp"
Dungeons2_09Tiles::
incbin "gfx/dungeons/dungeons_2/09.cgb.2bpp"
Dungeons2_0ATiles::
incbin "gfx/dungeons/dungeons_2/0A.cgb.2bpp"
Dungeons2_0BTiles::
incbin "gfx/dungeons/dungeons_2/0B.cgb.2bpp"
Dungeons2_0CTiles::
incbin "gfx/dungeons/dungeons_2/0C.cgb.2bpp"
Dungeons2_0DTiles::
incbin "gfx/dungeons/dungeons_2/0D.cgb.2bpp"
Dungeons2_0ETiles::
incbin "gfx/dungeons/dungeons_2/0E.cgb.2bpp"
Dungeons2_0FTiles::
incbin "gfx/dungeons/dungeons_2/0F.cgb.2bpp"
Dungeons2_17Tiles::
incbin "gfx/dungeons/dungeons_2/17.cgb.2bpp"
Dungeons2_18Tiles::
incbin "gfx/dungeons/dungeons_2/18.cgb.2bpp"
Dungeons2_19Tiles::
incbin "gfx/dungeons/dungeons_2/19.cgb.2bpp"
DungeonSideview1Tiles::
incbin "gfx/dungeons/sideview_1.cgb.2bpp"
DungeonSideview2Tiles::
incbin "gfx/dungeons/sideview_2.cgb.2bpp"
ELSE
DungeonsTiles::
Dungeons1Tiles::
incbin "gfx/dungeons/doors.dmg.2bpp"
DungeonWallsATiles::
incbin "gfx/dungeons/walls/walls_a.dmg.2bpp"
DungeonWallsBTiles::
incbin "gfx/dungeons/walls/walls_b.dmg.2bpp"
DungeonWallsCTiles::
incbin "gfx/dungeons/walls/walls_c.dmg.2bpp"
DungeonWallsDTiles::
incbin "gfx/dungeons/walls/walls_d.dmg.2bpp"
DungeonWallsETiles::
incbin "gfx/dungeons/walls/walls_e.dmg.2bpp"
DungeonWallsFTiles::
incbin "gfx/dungeons/walls/walls_f.dmg.2bpp"

DungeonFloorATiles::
incbin "gfx/dungeons/floor/floor_a.dmg.2bpp"
DungeonFloorBTiles::
incbin "gfx/dungeons/floor/floor_b.dmg.2bpp"
DungeonFloorCTiles::
incbin "gfx/dungeons/floor/floor_c.dmg.2bpp"
DungeonFloorDTiles::
incbin "gfx/dungeons/floor/floor_d.dmg.2bpp"
DungeonFloorETiles::
incbin "gfx/dungeons/floor/floor_e.dmg.2bpp"
DungeonFloorFTiles::
incbin "gfx/dungeons/floor/floor_f.dmg.2bpp"
DungeonFloorGTiles::
incbin "gfx/dungeons/floor/floor_g.dmg.2bpp"
DungeonFloorHTiles::
incbin "gfx/dungeons/floor/floor_h.dmg.2bpp"
DungeonFloorITiles::
incbin "gfx/dungeons/floor/floor_i.dmg.2bpp"
DungeonFloorJTiles::
incbin "gfx/dungeons/floor/floor_j.dmg.2bpp"
DungeonFloorKTiles::
incbin "gfx/dungeons/floor/floor_k.dmg.2bpp"
DungeonFloorLTiles::
incbin "gfx/dungeons/floor/floor_l.dmg.2bpp"
WindfishFloorTiles::
incbin "gfx/dungeons/floor/windfish_floor.dmg.2bpp"

Dungeons2Tiles::
Dungeons2_00Tiles::
incbin "gfx/dungeons/dungeons_2/00.dmg.2bpp"
Dungeons2_01Tiles::
incbin "gfx/dungeons/dungeons_2/01.dmg.2bpp"
Dungeons2_02Tiles::
incbin "gfx/dungeons/dungeons_2/02.dmg.2bpp"
Dungeons2_03Tiles::
incbin "gfx/dungeons/dungeons_2/03.dmg.2bpp"
Dungeons2_04Tiles::
incbin "gfx/dungeons/dungeons_2/04.dmg.2bpp"
Dungeons2_05Tiles::
incbin "gfx/dungeons/dungeons_2/05.dmg.2bpp"
Dungeons2_06Tiles::
incbin "gfx/dungeons/dungeons_2/06.dmg.2bpp"
Dungeons2_07Tiles::
incbin "gfx/dungeons/dungeons_2/07.dmg.2bpp"
Dungeons2_08Tiles::
incbin "gfx/dungeons/dungeons_2/08.dmg.2bpp"
Dungeons2_09Tiles::
incbin "gfx/dungeons/dungeons_2/09.dmg.2bpp"
Dungeons2_0ATiles::
incbin "gfx/dungeons/dungeons_2/0A.dmg.2bpp"
Dungeons2_0BTiles::
incbin "gfx/dungeons/dungeons_2/0B.dmg.2bpp"
Dungeons2_0CTiles::
incbin "gfx/dungeons/dungeons_2/0C.dmg.2bpp"
Dungeons2_0DTiles::
incbin "gfx/dungeons/dungeons_2/0D.dmg.2bpp"
Dungeons2_0ETiles::
incbin "gfx/dungeons/dungeons_2/0E.dmg.2bpp"
Dungeons2_0FTiles::
incbin "gfx/dungeons/dungeons_2/0F.dmg.2bpp"
Dungeons2_17Tiles::
incbin "gfx/dungeons/dungeons_2/17.dmg.2bpp"
Dungeons2_18Tiles::
incbin "gfx/dungeons/dungeons_2/18.dmg.2bpp"
Dungeons2_19Tiles::
incbin "gfx/dungeons/dungeons_2/19.dmg.2bpp"
DungeonSideview1Tiles::
incbin "gfx/dungeons/sideview_1.dmg.2bpp"
DungeonSideview2Tiles::
incbin "gfx/dungeons/sideview_2.dmg.2bpp"
ENDC

section "bankOE",romx[$4000],bank[$0E]
IF !__DMG_GFX__
NpcTilesDataStart::
Npc1Tiles::
incbin "gfx/characters/oam_npc_1.cgb.2bpp"
ELSE
NpcTilesDataStart::
Npc1Tiles::
incbin "gfx/characters/oam_npc_1.dmg.2bpp"
ENDC

section "bankOF",romx[$4000],bank[$0F]
IF !__DMG_GFX__
MenuTiles::
incbin "gfx/menus/menu.cgb.2bpp"
SaveMenuTiles::
incbin "gfx/menus/save_menu.cgb.2bpp"
TitleLogoTitles::
incbin "gfx/intro/title.cgb.2bpp"
FontTiles::
incbin "gfx/fonts/font.cgb.2bpp"

Overworld2Tiles::
OverworldCameraShopTiles::
incbin "gfx/world/ow_camera_shop.cgb.2bpp"
OverworldTurtleRockTiles::
incbin "gfx/world/ow_turtle_rock.cgb.2bpp"
OverworldSeashellMansionTiles::
incbin "gfx/world/ow_seashell_mansion.cgb.2bpp"
OverworldMysteriousWoodsTiles::
incbin "gfx/world/ow_mysterious_woods.cgb.2bpp"
OverworldBeachTiles::
incbin "gfx/world/ow_beach.cgb.2bpp"
OverworldPrarieStoneHeadTiles::
incbin "gfx/world/ow_prarie_stone_head.cgb.2bpp"
OverworldMabeVillageTiles::
incbin "gfx/world/ow_mabe_village.cgb.2bpp"
OverworldKanaletCastleTiles::
incbin "gfx/world/ow_kanalet_castle.cgb.2bpp"
OverworldFaceShrineTiles::
incbin "gfx/world/ow_face_shrine.cgb.2bpp"
OverworldYarnaDesertTiles::
incbin "gfx/world/ow_yarna_desert.cgb.2bpp"
OverworldPrarieSouthTiles::
incbin "gfx/world/ow_prarie_south.cgb.2bpp"
OverworldEaglesTowerTiles::
incbin "gfx/world/ow_eagles_tower.cgb.2bpp"
OverworldRaftingGameTiles::
incbin "gfx/world/ow_rafting_game.cgb.2bpp"
OverworldAnglersTunnelTiles::
incbin "gfx/world/ow_anglers_tunnel.cgb.2bpp"
OverworldGopongoSwampTiles::
incbin "gfx/world/ow_gopongo_swamp.cgb.2bpp"
OverworldGraveyardTiles::
incbin "gfx/world/ow_graveyard.cgb.2bpp"
OverworldMarthasBayTiles::
incbin "gfx/world/ow_marthas_bay.cgb.2bpp"
OverworldEggTiles::
incbin "gfx/world/ow_egg.cgb.2bpp"
OverworldTaramanchMiddleTiles::
incbin "gfx/world/ow_taramanch_middle.cgb.2bpp"

ELSE
MenuTiles::
incbin "gfx/menus/menu.dmg.2bpp"
SaveMenuTiles::
incbin "gfx/menus/save_menu.dmg.2bpp"
TitleLogoTitles::
incbin "gfx/intro/title.dmg.2bpp"
FontTiles::
incbin "gfx/fonts/font.dmg.2bpp"

Overworld2Tiles::
OverworldCameraShopTiles::
incbin "gfx/world/ow_camera_shop.dmg.2bpp"
OverworldTurtleRockTiles::
incbin "gfx/world/ow_turtle_rock.dmg.2bpp"
OverworldSeashellMansionTiles::
incbin "gfx/world/ow_seashell_mansion.dmg.2bpp"
OverworldMysteriousWoodsTiles::
incbin "gfx/world/ow_mysterious_woods.dmg.2bpp"
OverworldBeachTiles::
incbin "gfx/world/ow_beach.dmg.2bpp"
OverworldPrarieStoneHeadTiles::
incbin "gfx/world/ow_prarie_stone_head.dmg.2bpp"
OverworldMabeVillageTiles::
incbin "gfx/world/ow_mabe_village.dmg.2bpp"
OverworldKanaletCastleTiles::
incbin "gfx/world/ow_kanalet_castle.dmg.2bpp"
OverworldFaceShrineTiles::
incbin "gfx/world/ow_face_shrine.dmg.2bpp"
OverworldYarnaDesertTiles::
incbin "gfx/world/ow_yarna_desert.dmg.2bpp"
OverworldPrarieSouthTiles::
incbin "gfx/world/ow_prarie_south.dmg.2bpp"
OverworldEaglesTowerTiles::
incbin "gfx/world/ow_eagles_tower.dmg.2bpp"
OverworldRaftingGameTiles::
incbin "gfx/world/ow_rafting_game.dmg.2bpp"
OverworldAnglersTunnelTiles::
incbin "gfx/world/ow_anglers_tunnel.dmg.2bpp"
OverworldGopongoSwampTiles::
incbin "gfx/world/ow_gopongo_swamp.dmg.2bpp"
OverworldGraveyardTiles::
incbin "gfx/world/ow_graveyard.dmg.2bpp"
OverworldMarthasBayTiles::
incbin "gfx/world/ow_marthas_bay.dmg.2bpp"
OverworldEggTiles::
incbin "gfx/world/ow_egg.dmg.2bpp"
OverworldTaramanchMiddleTiles::
incbin "gfx/world/ow_taramanch_middle.dmg.2bpp"
ENDC

section "bank10",romx[$4000],bank[$10]
IF !__DMG_GFX__
IntroTiles::
Intro1Tiles::
incbin "gfx/intro/intro_1.cgb.2bpp"
Intro2Tiles::
incbin "gfx/intro/intro_2.cgb.2bpp"
Intro3Tiles::
incbin "gfx/intro/intro_3.cgb.2bpp"
StaticPicturesTiles::
ChristineTiles::
incbin "gfx/scenes/christine.cgb.2bpp"
MarinBeachTiles::
incbin "gfx/scenes/marin_beach.cgb.2bpp"
MarinBeachWavesTiles::
incbin "gfx/scenes/marin_beach_waves.cgb.2bpp"
FontLargeTiles::
incbin "gfx/fonts/font_large.cgb.2bpp"
ReliefTiles::
incbin "gfx/scenes/relief.cgb.2bpp"
PaintingTiles::
incbin "gfx/scenes/painting.cgb.2bpp"
ELSE

IntroTiles::
Intro1Tiles::
incbin "gfx/intro/intro_1.dmg.2bpp"
Intro2Tiles::
incbin "gfx/intro/intro_2.dmg.2bpp"
Intro3Tiles::
incbin "gfx/intro/intro_3.dmg.2bpp"
StaticPicturesTiles::
ChristineTiles::
incbin "gfx/scenes/christine.dmg.2bpp"
MarinBeachTiles::
incbin "gfx/scenes/marin_beach.dmg.2bpp"
MarinBeachWavesTiles::
incbin "gfx/scenes/marin_beach_waves.dmg.2bpp"
FontLargeTiles::
incbin "gfx/fonts/font_large.dmg.2bpp"
ReliefTiles::
incbin "gfx/scenes/relief.dmg.2bpp"
PaintingTiles::
incbin "gfx/scenes/painting.dmg.2bpp"
ENDC

section "bank11",romx[$4000],bank[$11]
IF !__DMG_GFX__
Npc2Tiles::
incbin "gfx/characters/oam_npc_2.cgb.2bpp"
ELSE
Npc2Tiles::
incbin "gfx/characters/oam_npc_2.dmg.2bpp"
ENDC

section "bank12",romx[$4000],bank[$12]
IF !__DMG_GFX__
Npc3Tiles::
incbin "gfx/characters/oam_npc_3.cgb.2bpp"
NightmareTiles::
incbin "gfx/characters/oam_nightmare.cgb.2bpp"
Npc4Tiles::
incbin "gfx/characters/oam_npc_4.cgb.2bpp"
DungeonItemsTiles::
DungeonItemsATiles::
incbin "gfx/items/dungeon_a.cgb.2bpp"
DungeonItemsBTiles::
incbin "gfx/items/dungeon_b.cgb.2bpp"
DungeonItemsCTiles::
incbin "gfx/items/dungeon_c.cgb.2bpp"
DungeonItemsDTiles::
incbin "gfx/items/dungeon_d.cgb.2bpp"
HouseAItemsTiles::
incbin "gfx/items/house_a.cgb.2bpp"
HouseBItemsTiles::
incbin "gfx/items/house_b.cgb.2bpp"
InventoryIndoorItemsTiles::
incbin "gfx/items/inventory_indoor_items.cgb.2bpp"
DungeonMinimapTiles::
incbin "gfx/items/minimap_cgb.2bpp"
ELSE
Npc3Tiles::
incbin "gfx/characters/oam_npc_3.dmg.2bpp"
NightmareTiles::
incbin "gfx/characters/oam_nightmare.dmg.2bpp"
Npc4Tiles::
incbin "gfx/characters/oam_npc_4.dmg.2bpp"
DungeonItemsTiles::
DungeonItemsATiles::
incbin "gfx/items/dungeon_a.dmg.2bpp"
DungeonItemsBTiles::
incbin "gfx/items/dungeon_b.dmg.2bpp"
DungeonItemsCTiles::
incbin "gfx/items/dungeon_c.dmg.2bpp"
DungeonItemsDTiles::
incbin "gfx/items/dungeon_d.dmg.2bpp"
HouseAItemsTiles::
incbin "gfx/items/house_a.dmg.2bpp"
HouseBItemsTiles::
incbin "gfx/items/house_b.dmg.2bpp"
InventoryIndoorItemsTiles::
incbin "gfx/items/inventory_indoor_items.dmg.2bpp"
DungeonMinimapTiles::
incbin "gfx/items/minimap_dmg.2bpp"
ENDC

section "bank13",romx[$4000],bank[$13]
IF !__DMG_GFX__
EndingTiles::
EndingTiles1::
incbin "gfx/ending/ending_1.cgb.2bpp"
EaglesTowerTop1Tiles::
incbin "gfx/dungeons/eagles_tower_top_1.cgb.2bpp"
EndingTiles2::
incbin "gfx/ending/ending_2.cgb.2bpp"
EaglesTowerTop2Tiles::
incbin "gfx/dungeons/eagles_tower_top_2.cgb.2bpp"

ELSE
EndingTiles::
EndingTiles1::
incbin "gfx/ending/ending_1.dmg.2bpp"
EaglesTowerTop1Tiles::
incbin "gfx/dungeons/eagles_tower_top_1.dmg.2bpp"
EndingTiles2::
incbin "gfx/ending/ending_2.dmg.2bpp"
EaglesTowerTop2Tiles::
incbin "gfx/dungeons/eagles_tower_top_2.dmg.2bpp"
ENDC

section "bank14",romx[$4000],bank[$14]
include "data/events/dungeons.asm"
include "data/maps/layouts.asm"
include "data/chests/chests.asm"
include "code/bank14.asm"
include "text/dialog_1.asm"
include "text/dialog_200.asm"

section "bank15",romx[$4000],bank[$15]
include "code/entities/bank15.asm"

section "bank16",romx[$4000],bank[$16]
include "data/entities/pointers_table.asm"
include "data/entities/indoors_a.asm"
include "data/entities/indoors_b.asm"
include "data/entities/overworld.asm"
include "data/entities/color_dungeon.asm"
include "text/dialog_2.asm"

section "bank17",romx[$4000],bank[$17]
include "code/credits.asm"

section "bank18",romx[$4000],bank[$18]
include "code/entities/18_mamu_and_frogs.asm"
include "code/entities/18_manbo_and_fishes.asm"
include "code/entities/18_mermaid_statue.asm"
include "code/entities/18_zora.asm"
include "code/entities/18_mr_write.asm"
include "code/entities/18_grandma_ulrira.asm"
include "code/entities/18_papahls_wife.asm"
include "code/entities/18_mad_batter.asm"
include "code/entities/18__helpers_1.asm"
include "code/entities/18_bunny_d3.asm"
include "code/entities/18_animal_d2.asm"
include "code/entities/18_bunny_calling_marin.asm"
include "code/entities/18_moving_block_mover.asm"
include "code/entities/18_walrus.asm"
include "code/entities/18_marin_as_follower.asm"
include "code/entities/18_text_debugger.asm"
include "code/entities/18_south_face_shrine_door.asm"
include "code/entities/18_owl_statue.asm"
include "code/entities/18_marin_at_tal_tal_heights.asm"
include "code/entities/18_marin_at_the_shore.asm"
include "code/entities/18_maze_signpost.asm"
include "code/entities/18_zombie.asm"
include "code/entities/18_blaino.asm"
include "code/entities/18_vire.asm"
include "code/entities/18_grim_creeper.asm"
include "code/entities/18_turtle_rock_head.asm"
include "code/entities/18_buzz_blob.asm"
include "code/entities/18_bomber.asm"
include "code/entities/18_magic_powder_sprinkle.asm"
include "code/entities/18__helpers_2.asm"
include "code/entities/18_hookshot_chain.asm"
include "code/entities/18__helpers_3.asm"

section "bank19",romx[$4000],bank[$19]
include "code/entities/bank19.asm"

section "bank1A",romx[$4000],bank[$1A]
OverworldRoomsSecondHalf::
include "data/rooms/overworld_b.asm"
include "data/object_attributes/pointers.asm"
include "data/object_attributes/overworld_banks.asm"
include "code/object_attributes.asm"
OverworldObjectsTilemap::
IF !__DMG_GFX__
include "data/objects_tilemaps/overworld.cgb.asm"
ELSE
include "data/objects_tilemaps/overworld.dmg.asm"
ENDC
include "code/entities/1A_anglers_tunnel_door.asm"

section "bank1B",romx[$4000],bank[$1B]
include "code/audio/music_1.asm"
section "Music tracks section 1B/2",romx[$5000],bank[$1B] ; TODO: organize these better
include "data/music/music_tracks_data_1b_2.asm"
section "Music tracks section 1B/3",romx[$7100],bank[$1B]
include "data/music/music_tracks_data_1b_3.asm"

section "bank1C",romx[$4000],bank[$1C]
db BANK_1C_VAR ; Extra byte present in the original ROM
include "data/dialogs/dialog_pointers.asm"
include "data/text_box_data.asm"
include "data/ascii_to_tile.asm"
include "data/dialogs/dialog_banks.asm"
include "code/dialog_letters.asm"
include "text/dialog_3.asm"
include "text/dialog_000.asm"

section "bank1D", romx[$4000], bank[$1D]
include "text/dialog_4.asm"
include "text/dialog_100.asm"

section "bank1E", romx[$4000], bank[$1E]
include "code/audio/music_2.asm"
section "Music tracks section 1E/2",romx[$5000],bank[$1E]
include "data/music/music_tracks_data_1e_2.asm"
section "Music tracks section 1E/3",romx[$7000],bank[$1E]
include "data/music/music_tracks_data_1e_3.asm"

section "bank1F", romx[$4000], bank[$1F]
include "code/audio/sfx_entry_point.asm"
section "sfx pointers table", romx[$4100], bank[$1F]
include "data/sfx/pointers_table.asm"
include "code/audio/sfx.asm"
section "sfx fade", romx[$7F80], bank[$1F]
include "code/audio/sfx_fade.asm"

section "bank20",romx[$4000],bank[$20]
include "code/entities/_handlers.asm"
include "code/bank20.asm"

section "bank21",romx[$4000],bank[$21]
include "code/palettes.asm"

section "bank22",romx[$4000],bank[$22]
include "data/object_attributes/overworld_a.asm"

section "bank23",romx[$4000],bank[$23]
include "data/object_attributes/indoors_a.asm"
include "code/bank23.asm"

section "bank24",romx[$4000],bank[$24]
include "data/object_attributes/indoors_b.asm"
include "code/background_colors.asm"
include "data/backgrounds/palettes.asm"
include "code/overworld_macros.asm"

section "bank25",romx[$4000],bank[$25]
include "data/object_attributes/overworld_b.asm"

section "bank26",romx[$4000],bank[$26]
include "data/rooms_gbc_overlays/overworld_a.asm"

section "bank27",romx[$4000],bank[$27]
include "data/rooms_gbc_overlays/overworld_b.asm"
include "data/object_attributes/overworld_c.asm"
include "code/bank27.asm"

section "bank28",romx[$4000],bank[$28]

section "bank29",romx[$4000],bank[$29]

section "bank2A",romx[$4000],bank[$2A]

section "bank2B",romx[$4000],bank[$2B]

section "bank2C",romx[$4000],bank[$2C]

section "bank2D",romx[$4000],bank[$2D]

section "bank2E",romx[$4000],bank[$2E]

section "bank2F",romx[$4000],bank[$2F]

section "bank30",romx[$4000],bank[$30]

section "bank31",romx[$4000],bank[$31]

section "bank32",romx[$4000],bank[$32]

section "bank33",romx[$4000],bank[$33]

section "bank34",romx[$4000],bank[$34]
incbin "gfx/menus/print.2bpp"

section "bank35",romx[$4000],bank[$35]
ColorDungeonNpcTiles::
incbin "gfx/characters/oam_color_dungeon.2bpp"
ColorDungeonTiles::
incbin "gfx/dungeons/color_dungeon.2bpp"
CameraShopIndoorTiles::
incbin "gfx/dungeons/camera_shop.2bpp"
PhotoAlbumTiles:: ; Needed for credits?
incbin "gfx/photos/photo_album.2bpp"
EndingCGBAltTiles::
incbin "gfx/ending/ending.cgb.alt.2bpp"

section "bank36",romx[$4000],bank[$36]
include "code/entities/bank36.asm"

section "bank37",romx[$4000],bank[$37]

section "bank38",romx[$4000],bank[$38]
PhotographerTiles::
incbin "gfx/characters/oam_photographer.2bpp"
CreditsRollTiles::
incbin "gfx/ending/credits_roll.2bpp"
TitleDXTiles::
IF !__DMG_GFX__
incbin "gfx/intro/title_dx.cgb.2bpp"
ELSE
incbin "gfx/intro/title_dx.dmg.2bpp"
ENDC
MarinPortraitTiles::
incbin "gfx/ending/oam_marin_portrait.2bpp"
MarinPortraitOverlayTiles::
incbin "gfx/ending/oam_marin_portrait_overlay.2bpp"
TitleDXOAMTiles::
incbin "gfx/intro/oam_title_dx.2bpp"
ThanksForPlayingTiles::
incbin "gfx/ending/thanks_for_playing.2bpp"

section "bank39",romx[$4000],bank[$39]

section "bank3A",romx[$4000],bank[$3A]

section "bank3B",romx[$4000],bank[$3B]

section "bank3C",romx[$4000],bank[$3C]
SGBFrameTilesA:
include "data/super_gameboy/frame_tiles_a.asm"
SGBFrameTilesB:
include "data/super_gameboy/frame_tiles_b.asm"
SGBFrameTilemap:
include "data/super_gameboy/frame_tilemap.asm"
include "data/super_gameboy/frame_palette_1.asm"
include "data/super_gameboy/frame_palette_2.asm"
include "data/super_gameboy/frame_palette_3.asm"
include "data/super_gameboy/commands.asm"
include "code/super_gameboy.asm"

section "bank3D",romx[$4000],bank[$3D]
include "code/unsupported_gameboy.asm"

; Unused banks; make blank sections so they are filled with $00 instead of $ff to match
; the rom
section "bank3E",romx[$4000],bank[$3E]
section "bank3F",romx[$4000],bank[$3F]
include "text/dialog_5.asm"
