{
	dash: { influenceMultiplier: 1 },
	dash_pivot: { influenceMultiplier: 1 },
	fall: { influenceMultiplier: 1 },
	//intro: { AnimationEndType.AUTO, nextAnimation: "stand" },
	jump_in: { influenceMultiplier: 1 },
	jump_loop: { influenceMultiplier: 1 },
	jump_midair: { influenceMultiplier: 1 },
	jump_out: { influenceMultiplier: 1 },
	run: { influenceMultiplier: 1 },
	run_turn: { influenceMultiplier: 1 },
	tilt_forward: { allowTurn: true, chargeFramesMax: 560, shadows: false }, //chrageframes doesn't work //108-TILT_FORWARD
	walk_loop:{ influenceMultiplier: 1 },
	special_side_air: { nextAnimation: "fall_special" }, //transitions move to special fall
	special_up_air: { singleUse: true },
	special_down: { singleUse: true },
	special_down_air: { singleUse: true },
	ledge_jump_in: { influenceMultiplier: 1 },
	ledge_jump: { influenceMultiplier: 1, nextState: 15 } //required for ledge jumps to work
}

//TODO Documentation
//remove influencemultiplier for jank movement

//nextstate maps: //TODO
//0
//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//11
//12
//13
//14
//15 - JUMP_IN
//16 - JUMP_LOOP
//17
//18
//19
//20
//21
//22
//23
//24
//25
//26
//27
//28
//29
//30
//31
//32 - LEDGE_JUMP_IN
//33 - LEDGE_JUMP
//34
//35
//36
//37
//38
//39
//40
//41
//42
//43
//44
//45
//46
//47
//48
//49
//50 - PARRY_SUCCESS
//51 - FALL?//either that or nothing?// could also be STAND
//52 - CRASH_LOOP //or some sort of crash animation //probably hurt_light
//53 - HURT_HEAVY
//54 - HURT_MEDIUM //for some reason goes to hurt heavy immediately
//55 - LEDGE_JUMP?
//56 - CRASH_BOUNCE
//57
//58
//59
//60
//61
//62
//63
//64
//65
//66
//67
//68
//69
//70
//71
//72
//73
//74