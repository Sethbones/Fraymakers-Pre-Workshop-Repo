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
	//ledge_jump_in: { influenceMultiplier: 1, nextAnimation: "jump_in" },
	special_side_air: { nextAnimation: "fall_special" }, //transitions move to special fall
	special_up_air: { singleUse: true },
	special_down: { singleUse: true },
	special_down_air: { singleUse: true }
}

//TODO Documentation
//remove influencemultiplier for jank movement