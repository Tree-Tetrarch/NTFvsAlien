/obj/item/explosives/grenade/spawnergrenade/facehugger

	name = "hugger delivery grenade"
	desc = "It is set to detonate in 5 seconds. It will unleash unleash a swarm of huggers."
	deliveryamt = 5

	hugger_list = list(
		/obj/item/clothing/mask/facehugger/larval,
		/mob/living/carbon/xenomorph/facehugger/chemical/aphrotoxin,
		/mob/living/carbon/xenomorph/facehugger/combat/resin)

/obj/item/explosives/grenade/spawnergrenade/facehugger/prime()

	// Custom nade logic - no longer flash, guarantee random dispersal action, and randomize type from list.
	var/turf/T = get_turf(src)
	playsound(T, 'sound/effects/phasein.ogg', 25, 1)

	for(var/i=1, i<=deliveryamt, i++)
		var/atom/movable/x = new pick(hugger_list)
		x.loc = T
		step(x, pick(NORTH,SOUTH,EAST,WEST))
		step(x, pick(NORTH,SOUTH,EAST,WEST))
		step(x, pick(NORTH,SOUTH,EAST,WEST))
	qdel(src)
