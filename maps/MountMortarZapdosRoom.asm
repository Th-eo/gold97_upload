	const_def 2 ; object constants
	const MOUNT_MORTAR_ZAPDOS

MountMortarZapdosRoom_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Zapdos

.Zapdos:
	checkevent EVENT_EXPLODING_TRAP_3
	iftrue .NoAppearZ
	checkitem RED_SCALE; change this to whatever becomes the tri-wing
	iftrue .AppearZ
	jump .NoAppearZ

.AppearZ:
	appear MOUNT_MORTAR_ZAPDOS
	return

.NoAppearZ:
	disappear MOUNT_MORTAR_ZAPDOS
	return
	
	
ZapdosScript:
	faceplayer
	opentext
	writetext ZapdosText
	cry ZAPDOS
	pause 15
	closetext
	setevent EVENT_EXPLODING_TRAP_3
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDKANTO
	loadwildmon ZAPDOS, 40
	startbattle
	disappear MOUNT_MORTAR_ZAPDOS
	reloadmapafterbattle
	end
	
ZapdosText:
	text "Zyah!"
	done

MountMortarZapdosRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7, 15, MOUNT_MORTAR_1F_INSIDE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  5, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ZapdosScript, EVENT_EXPLODING_TRAP_8