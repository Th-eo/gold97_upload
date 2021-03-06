	const_def 2 ; object constants
	const PEWTERMART_CLERK
	const PEWTERMART_YOUNGSTER
	const PEWTERMART_SUPER_NERD

PewterMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PewterMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_PEWTER
	closetext
	end

PewterMartYoungsterScript:
	jumptextfaceplayer PewterMartYoungsterText

PewterMartSuperNerdScript:
	jumptextfaceplayer PewterMartSuperNerdText

PewterMartYoungsterText:
	text "Hi! Check out my"
	line "GYARADOS!"

	para "I raised it from a"
	line "MAGIKARP. I can't"

	para "believe how strong"
	line "it has become."
	done

PewterMartSuperNerdText:
	text "Whew!"
	para "It's exceptionally"
	line "hot outside today!"
	para "I've come into the"
	line "MART just to get"
	para "away from all of"
	line "the heat."
	done

PewterMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, CIANWOOD_CITY, 4
	warp_event  5,  7, CIANWOOD_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMartClerkScript, -1
	object_event  4,  1, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMartYoungsterScript, -1
	object_event  9,  5, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMartSuperNerdScript, -1
