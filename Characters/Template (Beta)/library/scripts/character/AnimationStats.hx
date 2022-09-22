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
	tilt_forward: { allowTurn: true, chargeFramesMax: 560, shadows: false }, //chrageframes doesn't work //the shadows thing is here for now to test if the script is broken or not
	walk_loop:{ influenceMultiplier: 1 },
	special_side_air: { nextAnimation: "fall_special" }, //transitions move to special fall //on the realization that it needs to be nextstate not nextanimation as it does nothing
	special_up_air: { singleUse: true },
	special_down: { singleUse: true },
	special_down_air: { singleUse: true },
	ledge_jump_in: { influenceMultiplier: 1 },
	ledge_jump: { influenceMultiplier: 1, nextState: 15 } //required for ledge jumps to work
}

//example of a stat with everything
//statname: { attackId: 0, autoRotate: false, BodyStatus.NONE, bodyStatusStrength: 0, chargeFramesMax: 0, chargeFramesTotal: 0, AnimationEndType.AUTO, grabLimit: 1, gravityMultiplier: 1, immovable:false, interruptable:false, landAnimation:"landanimationname", LandType.NORMAL, leaveGroundCancel: false, metadata: the fuck is a dynamic, name:"uniqueanimname", nextAnimation: null, nextState: -1, pause: false, resetId: true, resetRotation: n/a, rotationspeed: n/a, shadows: true, slideOff: false, solid: true, storedChargePercent: 0, xSpeedConservation: 1, ySpeedConservation: 1, allowFastFall: false, allowJump, false, allowTurn: false, allowTurnOnFirstFrame: false, autocancel: false, doubleJumpCancel: false, grabLedgeBehind: true, influenceMultiplier: 0, singleUse: false }

//TODO Documentation
//------General Animation Stats------\\


//remove influencemultiplier for jank movement

//attackId (type:Int, default:0) Not to be set directly - unique attackId for the attack

//autoRotate (type:Bool, default:false) If true, the entity’s body rotates to match momentum.

//bodyStatus (type:BodyStatus, default:BodyStatus.NONE) Override’s the BodyStatus of the Entity for the duration of the animation.
//BodyStatus options:
//HEAVY_ARMOR - TODO
//INTANGIBLE - TODO
//INVINCIBLE - makes the player invincible
//INVINCIBLE_GRABBABLE - same as above but can be grabbed through it, not sure when you'll ever use this
//LAUNCH_RESISTANCE - TODO
//NONE - default, does nothing
//SUPER_ARMOR - unless the attack is strong enough there wont be any knockback

//bodyStatusStrength (type:Float, default:0) If heavyArmor or launchResistance, then this controls how much.

//chargeFramesMax (type:Int, default:0) Maximum number of frames the animation can be charged for. Setting this value to zero will disable charge incrementing //only works on strongs at the moment

//chargeFramesTotal (type:Int, default:0) Total number of frames the animation has been charged for //only works on strongs at the moment

//endType type:AnimationEndType, default:AnimationEndType.AUTO) Defines how the engine should handle the completion of this animation
//AnimationEndType options
//AUTO - Animation will change depending on the values of AnimationStats.nextState and AnimationStats.nextAnimation
//LOOP - Animation will repeat after it finishes
//NONE - Animation will stop on the final frame and take no further action

//grabLimit (type:Int, default:1) Limit of the amount of objects that can be grabbed during this animation

//gravityMultiplier (type:Float, default:1) Multiplier that is applied to the object’s gravity value

//immovable (type:Bool, default:false) Immovable animations do not take knockback from windboxes and cannot be pushed by other solid objects, but may still push other movable solid objects.

//interruptable (type:Bool, default:false) Not to be set directly - call self.allow(type:Interrupt() in the timeline. Allows the animation to be counted as a free state.

//landAnimation (type:String, default:null) If non-null, the name of the animation that will be jumped to when the object transitions from air to ground, regardless of landType. If null, the engine will use a land animation based on the landType

//landType (type:LandType, default:LandType.NORMAL) Determines the behavior of the object when it transitions from air to ground.
//LandType options:
//CUSTOM - 	The engine will do nothing at all, except for allow the user to override with their own behaviour. //whatever that means
//LINK_FRAMES - The engine will perform landing-associated code, will change animations to the provided landAnimation but will preserve state. Additionally, the frame the entity was on will be skipped to. As much as possible, this new animation is treated as though it were the original animation, so some stat values are ignored.
//NONE - The engine will not handle landing at all, and you’ll instead just float above the ground.
//NORMAL - The engine will perform landing-associated code, and will attempt to send to the LAND state and change animations. Can be overridden.
//TOUCH - The engine will perform landing-associated code but otherwise will not do anything.

//leaveGroundCancel (type:Bool, default:false) If enabled the entity will have their animation canceled if they transition from grounded to aerial.

//metadata (type:Dynamic, default:null) Metadata passed into the attack

//name (type:String, default:null) The name of the attack animation.

//nextAnimation (type:String, default:null) Used in conjunction with AnimationEndType.AUTO. If provided, when the animation ends, the entity’s animation will be changed to this value

//nextState (type:Int, default:-1) Used in conjunction with AnimationEndType.AUTO. If provided, when the animation ends, the entity’s state will be changed to this value
//nextstate maps: //TODO //116 states total
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
	//54 - HURT_MEDIUM //for some reason goes to hurt heavy immediately afterwards
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
	//75
	//76
	//77
	//78
	//79
	//80
	//81
	//82
	//83
	//84
	//85
	//86
	//87
	//88
	//89
	//90
	//91
	//92
	//93
	//94
	//95
	//96
	//97
	//98
	//99
	//100
	//101
	//102
	//103
	//104
	//105
	//106
	//107
	//108
	//109
	//110
	//111
	//112
	//113
	//114
	//115
	//116
//pause (type:Bool, default:false) When set to true, animation playback is halted on the current frame.

//resetId (type:Bool, default:true) When true, the current AnimationStats attackId will be reset on the first frame.

//resetRotation (type:Bool, default:n/a) When true, the rotation of the object will be reset on the first frame.

//rotationSpeed (type:Float, default:n/a) When a non-zero value, the object will rotate at the specified speed. Positive values will rotate clockwise, while negative values will rotate counter-clockwise. Note that if the object is flipped horizontally, the direction of the rotation will also be flipped.

//shadows (type:Bool, default:true Whether or not to enable shadows on this particular animation

//slideOff (type:Bool, default:false Whether or not the character can slide off the edge of a floor.

//solid (type:Bool, default:true) Set to true and the object will push other solid animations when hurtboxes overlap, unless those objects are immovable or non-solid.

//storedChargePercent (type:Float, default:0) Not to be set directly - tracks the previously stored charge percentage

//xSpeedConservation (type:Float, default:1) Percentage of non-KB X Speed kept on frame 1

//ySpeedConservation (type:Float, default:1) Percentage of non-KB Y Speed kept on frame 1



//-Character Specific Animation Stats-\\


//allowFastFall (type:Bool, default:false) When true the character will accept fast fall inputs while in the air during the animation.

//allowJump (type:Bool, default:false) When true the character will be able to jump cancel the animation.

//allowTurn (type:Bool, default:false) When true the character will be capable of flipping their direction faced on the first frame of the animation when the opposite direction is tapped prior to the animation.

//allowTurnOnFirstFrame (type:Bool, default:false) When true the character will be capable of flipping their direction faced by tapping a left or right direction for the duration of the animation.

//autocancel (type:Bool, default:false) When true, landing during this animation will ignore the value of landAnimation and send the character to the default landing animation.

//doubleJumpCancel (type:Bool, default:false) Set to true to make upward momentum from a double jump cancel when this move is used.

//grabLedgeBehind (type:Bool, default:true) If set to true the entity will be able to grab ledges from behind them if the type of object allows.

//influenceMultiplier (type:Float, default:0) How much influence the character has over their momentum during this animation.

//singleUse (type:Bool, default:false) Set to true for attack animations that can only be used once when initiated in mid-air.



//--Assist Specific Animation Stats---\\
//what do you mean there's nothing?