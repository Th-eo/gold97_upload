	const_def 2 ; object constants
;	const BLACKTHORNCITY_SUPER_NERD1
;	const BLACKTHORNCITY_SUPER_NERD2
;	const BLACKTHORNCITY_GRAMPS1
;	const BLACKTHORNCITY_GRAMPS2
	const BLACKTHORNCITY_BLACK_BELT
	const BLACKTHORNCITY_COOLTRAINER_F1
	const BLACKTHORNCITY_YOUNGSTER1
	const BLACKTHORNCITY_SANTOS
	const BLACKTHORNCITY_COOLTRAINER_F2

BlackthornCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Santos

.FlyPoint:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	return

.Santos:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .SantosAppears
	disappear BLACKTHORNCITY_SANTOS
	return

.SantosAppears:
	appear BLACKTHORNCITY_SANTOS
	return

BlackthornBlackBeltScript:
	jumptextfaceplayer BlackBeltText_WeirdRadio



BlackthornCooltrainerF1Script:
	jumptextfaceplayer BlackthornCooltrainerF1Text

BlackthornYoungsterScript:
	jumptextfaceplayer BlackthornYoungsterText

BlackthornCooltrainerF2Script:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .HotshotWow
	writetext BlackthornCooltrainerF2TextNotWow
	waitbutton
	closetext
	end
	
.HotshotWow
	writetext BlackthornCooltrainerF2Text
	waitbutton
	closetext
	end

SantosScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue .Saturday
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	buttonsound
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext SantosGivesGiftText
	buttonsound
	verbosegiveitem SPELL_TAG
	iffalse .Done
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	writetext SantosGaveGiftText
	waitbutton
	closetext
	end

.Saturday:
	writetext SantosSaturdayText
	waitbutton
.Done:
	closetext
	end

.NotSaturday:
	writetext SantosNotSaturdayText
	waitbutton
	closetext
	end

BlackthornCitySign:
	jumptext BlackthornCitySignText

BlackthornGymSign:
;	verbosegiveitem HM_WHIRLPOOL
	jumptext BlackthornGymSignText

MoveDeletersHouseSign:
	jumptext MoveDeletersHouseSignText

DragonDensSign:
	jumptext DragonDensSignText

BlackthornCityTrainerTips:
	jumptext BlackthornCityTrainerTipsText

BlackthornCityPokecenterSign:
	;setmapscene ROUTE_36_RUINS_OF_ALPH_GATE, SCENE_DEFAULT
	;clearevent EVENT_GAVE_KENYA
	jumpstd pokecentersign

BlackthornCityMartSign:
	jumpstd martsign

BlackBeltText_WeirdRadio:
	text "PRYCE is the GYM"
	line "LEADER here."
	para "He puts on a cold"
	line "as ice exterior,"
	para "but he has a heart"
	line "of gold."
	done

BlackthornCooltrainerF1Text:
	text "Are you going to"
	line "make your #MON"
	cont "forget some moves?"
	para "The MOVE DELETER's"
	line "house is just west"
	cont "of here."
	done

BlackthornYoungsterText:
	text "There are lots of"
	line "ICE type #MON"
	para "in the DEEPWATER"
	line "PASSAGE."
	done

MeetSantosText:
	text "SANTOS: …"

	para "It's Saturday…"

	para "I'm SANTOS of"
	line "Saturday…"
	done

SantosGivesGiftText:
	text "You can have this…"
	done

SantosGaveGiftText:
	text "SANTOS: …"

	para "SPELL TAG…"

	para "Ghost-type moves"
	line "get stronger…"

	para "It will frighten"
	line "you…"
	done

SantosSaturdayText:
	text "SANTOS: …"

	para "See you again on"
	line "another Saturday…"

	para "I won't have any"
	line "more gifts…"
	done

SantosNotSaturdayText:
	text "SANTOS: Today's"
	line "not Saturday…"
	done

BlackthornCooltrainerF2Text:
	text "Wow, you went"
	line "through the"
	cont "DEEPWATER PASSAGE?"
	para "You must be a real"
	line "hotshot trainer!"
	done
	
BlackthornCooltrainerF2TextNotWow:
	text "I've never gone up"
	line "to NORTH ISLAND."
	para "Traveling through"
	line "the DEEPWATER"
	para "PASSAGE is too"
	line "intimidating."
	done

BlackthornCitySignText:
	text "BLUE FOREST"

	para "A Quiet Snowy"
	line "Retreat"
	done

BlackthornGymSignText:
	text "BLUE FOREST"
	line "#MON GYM"
	cont "LEADER: PRYCE"

	para "The Icy Chill"
	line "Elder"
	done

MoveDeletersHouseSignText:
	text "MOVE DELETER'S"
	line "HOUSE"
	done

DragonDensSignText:
	text "DEEPWATER PASSAGE"
	line "South Entrance"
	done

BlackthornCityTrainerTipsText:
	text "TRAINER TIPS"

	para "A #MON holding"
	line "a MIRACLEBERRY"

	para "will cure itself"
	line "of any status"
	cont "problem."
	done

BlackthornCity_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 26, 21, MAHOGANY_GYM, 1
	warp_event  9,  9, BLACKTHORN_DRAGON_SPEECH_HOUSE, 1
	warp_event 19, 13, BLACKTHORN_EMYS_HOUSE, 1
	warp_event 25,  6, BLACKTHORN_MART, 2
	warp_event 13, 18, BLACKTHORN_POKECENTER_1F, 1
	;warp_event 13, 18, ICE_PATH_1F, 1
	warp_event  3, 22, MOVE_DELETERS_HOUSE, 1
	warp_event 27, 11, BLUEFOREST_HOUSE_1, 1
	warp_event  5,  5, DRAGONS_DEN_1F, 1
	warp_event 18,  3, ROUTE_29_ROUTE_46_GATE, 3
	warp_event 19,  3, ROUTE_29_ROUTE_46_GATE, 4
	warp_event 27, 21, MAHOGANY_GYM, 2

	db 0 ; coord events

	db 7 ; bg events
	bg_event  2, 26, BGEVENT_READ, BlackthornCitySign
	bg_event 28, 22, BGEVENT_READ, BlackthornGymSign
	bg_event  0, 18, BGEVENT_READ, MoveDeletersHouseSign
	bg_event  4,  8, BGEVENT_READ, DragonDensSign
	bg_event  0, 17, BGEVENT_READ, BlackthornCityTrainerTips
	bg_event 26,  6, BGEVENT_READ, BlackthornCityMartSign
	bg_event 14, 18, BGEVENT_READ, BlackthornCityPokecenterSign

	db 5 ; object events
;	object_event 15,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
;	object_event 23,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
;	object_event  4,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps1Script, EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
;	object_event  6,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps2Script, EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	object_event 26, 23, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornBlackBeltScript, -1
	object_event 16, 23, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF1Script, -1
	object_event 13, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornYoungsterScript, -1
	object_event 16,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLACKTHORN_CITY_SANTOS_OF_SATURDAY
	object_event 25, 16, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF2Script, -1
