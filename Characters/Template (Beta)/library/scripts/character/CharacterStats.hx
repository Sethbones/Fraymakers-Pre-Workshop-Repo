{
	//---------Important Stats---------\\
	spriteContent: self.getResource().getContent("Template"), //Content id path of the sprite to load for this Character id derived from manifest
	name: "Bloxxy", //The unique name of the character. Used for finding the object.

	//---------Character Stats---------\\
	//the following mess needs organizing
	//Character Stats
	//These Variables control the character's stats and specific abilites
	gravity: 0.8,
	airdashAccelMultiplier: 0.3, //The percentage of airdash momentum that is added each frame during accel phase
	//airdashCameraShakeIntensity: 0, //How much camera shake the engine should apply at the beginning on your airdash //good for big characters otherwise don't
	airdashCancelSpeedConservation: 0.6, //The percentage of the airdash speed that will be conserved when canceling an airdash with an attack
	//airdashEffectOffsetX: 0, //X offset of the air dash effect center point relative to the horizontal center of the character’s body
	//airdashEffectOffsetY: 0, //Y offset of the air dash effect center point relative to the vertical center of the character’s body
	airdashEffectRadius: 10, //Radial distance away from the center point of the character that the air dash effect is drawn
	airdashEndlagLength: 6, //Number of frames at airdashEndlagSpeed
	airdashEndlagSpeed: 2, //Airdash endlag speed
	airdashFullspeedLength: 2, //Number of frames at airdashSpeedCap before deceleration starts
	airdashInitialSpeed: 10, //Airdash initial speed
	airdashLimit: 1, //Maximum number of times the character can air dash before landing (Set to 0 to disable, or -1 for infinite)
	airdashSpeedCap: 12.5, //Airdash max speed
	airdashStartupLength: 3, //Number of frames at airdashInitialSpeed (note, gravity is enabled) before acceleration
	//airdashTrailEffect: null, //The ID of the trail effect that you want airdashes to spawn //TODO
	//attackVoiceIds: null, //List of attack voice content ids. Calls to playAttackVoice() will choose one of these audio clips at random. //TODO
	//attackVoiceSilenceRate: 0.5, //The rate at which calls to playAttackVoice() should result in silence.
	//crawlSpeed: 0, //Character’s crawl speed. Set to a value above 1 to enable crawling.
	dashSpeed: 8, //Character’s initial run speed.
	//dodgeRollSpeed: 10, //Speed the character’s dodge roll begins at.
	//dodgeRollSpeedLength: 1, //How many frames of speed are applied during dodge roll.
	//dodgeRollSpeedStartFrame: 3, //Frame that dodge roll speed begins to be applied on.
	doubleJumpSpeeds: [ //array of a character’s double jumps. Values less or equal to 0 have no effect. The amount of entries mean how many double jumps the character will have.
		12
	],
	fastFallSpeed: 15, //The speed at which a character falls during a fast fall
	//floatDuration: 0, //How long the character can float. value above 1 to enable floating.
	//getupRollSpeed: 10, //Speed the character’s getup roll begins at.
	//getupRollSpeedLength: 1, //How many frames of speed are applied during getup roll.
	//getupRollSpeedStartFrame: 2, //Frame that getup roll speed begins to be applied on.
	//grabAirType: null, //The behaviour of performing GRAB while midair
	//holdToJump: FALSE, //If set to true, jumps after the second can be performed by holding jump.
	//hurtHeavySilenceRate: 0.5, //The rate at which calls to playHurtHeavyVoice() should result in silence.
	//hurtHeavyVoiceIds: null, //List of hurt heavy voice content ids. Calls to playHurtHeavyVoice() will choose one of these audio clips at random.
	//hurtLightSilenceRate: 0.5, //The rate at which calls to playHurtLightVoice() should result in silence.
	//hurtLightVoiceIds: null, //List of hurt light voice content ids. Calls to playHurtLightVoice() will choose one of these audio clips at random.
	//hurtMediumSilenceRate: 0.5, //The rate at which calls to playHurtMediumVoice() should result in silence.
	//hurtMediumVoiceIds: null, //List of hurt medium voice content ids. Calls to playHurtMediumVoice() will choose one of these audio clips at random.
	//initialGlideSpeed: 0, //Speed the character starts gliding at. value above 1 to enable gliding.
	jumpSpeed: 14, //Character’s grounded vertical jump speed. Values less than or equal to zero will disable the character’s ability to jump from the ground
	//jumpSpeedBackwardInitialXSpeed: 0, //Horizontal speed initially given if holding backward when jump startup ends. Set to greater than or equal to 0 to disable.
	//jumpSpeedForwardInitialXSpeed: 0, //Horizontal speed initially given if holding forward when jump startup ends. Set to less than or equal to 0 to disable.
	//koVoiceIds: null, //List of KO blast voice content ids. Calls to playKoVoice() will choose one of these audio clips at random.
	//koVoiceSilenceRate: 0.5, //The rate at which calls to playKoVoice() should result in silence.
	ledgeJumpXSpeed: 2.5, //2.5 //Horizontal speed boost the character gets when performing a ledge jump //until ledge jumps are figured out this does nothing
	ledgeJumpYSpeed: -10, // -10 //Vertical speed boost the character gets when performing a ledge jump //until ledge jumps are figured out this does nothing
	ledgeRollSpeed: 10, //Speed the character’s ledge roll begins at.
	ledgeRollSpeedLength: 1, //How many frames of speed are applied during ledge roll.
	ledgeRollSpeedStartFrame: 1, //Frame that ledge roll speed begins to be applied on.
	runSpeedAcceleration: 2, //Character’s run speed acceleration.
	runSpeedCap: 6, //Character’s max run speed.
	//shieldBackHeight: 90, //Height of the back shield graphic
	//shieldBackNineSliceContent: "global::vfx.vfx_shield_back", //Nine slice to use for the back shield
	//shieldBackWidth: 40, //Width of the back shield graphic
	//shieldBackXOffset: 0, //Horizontal offset of the character’s back shield relative to the center of their body dimensions
	//shieldBackYOffset: 0, //Vertical offset of the character’s back shield relative to the center of their body dimensions
	//shieldFrontHeight: 90, //Height of the front shield graphic
	//shieldFrontNineSliceContent: "global::vfx.vfx_shield_front", //Nine slice to use for the front shield
	//shieldFrontWidth: 40, //Width of the front shield graphic
	//shieldFrontXOffset: 0, //Horizontal offset of the character’s front shield relative to the center of their body dimensions
	//shieldFrontYOffset: 0, //Vertical offset of the character’s front shield relative to the center of their body dimensions
	shortHopSpeed: 10, //The speed of a short-hop.
	//techRollSpeed: 10, //Speed the character’s tech roll begins at.
	//techRollSpeedLength: 1, //How many frames of speed are applied during tech roll.
	//techRollSpeedStartFrame: 7, //Frame that tech roll speed begins to be applied on.
	walkSpeedAcceleration: 1.5, //Character’s walk speed acceleration.
	walkSpeedCap: 3, //Character’s max walk speed.
	walkSpeedInitial: 1, //Character’s initial walk speed
	aerialFriction: 0.25, //The deceleration speed of the game object if forward is not held and they’re in the air. //for some reason set to minus presumably accidental
	aerialSpeedAcceleration: 2, //Game object’s aerial drift acceleration (and deceleration if holding the opposite direction).
	aerialSpeedCap: 4, //Max horizontal speed when in the air.
	friction: 0.5, //Deceleration rate on the ground.
	terminalVelocity: 10, //The terminal velocity of the character. it's the limit of speed at which an Entity can fall. Please note that knockback is not taken into account.


	//---------General Stats-----------\\
	//DO NOT TOUCH STUFF HERE UNLESS YOU KNOW WHAT YOU'RE DOING

	//aerialFootPosition: 0, //Foot collision point based on the relative vertical distance from the object’s origin when the object is grounded. Note that positive numbers will have their signed flipped automatically since the foot position can never be beneath the object’s origin point, so you may use positive numbers as a shorthand. Game Objects can override this value on specific animation frames by containing an ECB baked into the animation.

	//aerialHeadPosition: 80, //Head collision point based on the relative vertical distance from the object’s origin when the object is grounded. Note that positive numbers will have their signed flipped automatically since the head position can never be beneath the object’s origin point, so you may use positive numbers as a shorthand. The head position will also be forced to be no lower than the foot. Game Objects can override this value on specific animation frames by containing an ECB baked into the animation.
	
	//aerialHipWidth: 25, //Width of wall collision detection area surrounding the object when the object is grounded. Game Objects can override this value on specific animation frames by containing an ECB baked into the animation.

	//aerialHipXOffset: 0, //Horizontally displaces the position of the hips from the base position of the object by the specified value when the object is grounded. At zero, the left and right hips are evenly displaced on both sides. Game Objects can override this value on specific animation frames by containing an ECB baked into the animation.

	//aerialHipYOffset: 0, //Vertically displaces the wall collision detection area on the object relative to the foot when the object is grounded. At zero, the hip is placed vertically halfway between the object’s head and foot. This is the base value which is used when no collision body data is available. Game Objects can override this value on specific animation frames by containing an ECB baked into the animation.

	//attackRatio: 1, //Multiplier that is applied to knockback which gets assigned to HitboxStats on attack hit. This is similar to damageRatio but is instead applied to outgoing attacks from this object. This is especially useful for scaling up difficulty during single player matches.
	//baseScaleX: 1, //Multiplies the base horizontal scale of the GameObject by the specified amount. The object will render by default at a multiple of baseScaleX and baseScaleY.
	
	//baseScaleY: 1, //Multiplies the base vertical   scale of the GameObject by the specified amount. The object will render by default at a multiple of baseScaleX and baseScaleY.
	
	//cameraBoxHeight: 75, //Height of the camera box surrounding the object. The top left of the camera box will always be positioned so that it is mirrored over the Y-axis, with the bottom of the box flushed against the X axis. Use cameraBoxOffsetY to adjust the Y positioning from there.

	//cameraBoxOffsetX: 25, //Offsets the X position of the camera box surrounding the object.
	
	//cameraBoxOffsetY: 0, //Offsets the Y position of the camera box surrounding the object.

	//cameraBoxWidth: 100, //Width of the camera box surrounding the object. The top left of the camera box will always be positioned so that it is mirrored over the Y-axis, with the bottom of the box flushed against the X axis. Use cameraBoxOffsetX to adjust the X positioning from there.

	//damageRatio: 1, //Multiplier that is applied to received knockback. This is similar to attackRatio but is instead applied to incoming attacks. This is especially useful for scaling up difficulty during single player matches.

	//deathBoundsDestroy: TRUE, //Whether or not to destroy the object when it touches a stage’s death bounds //good for non character objects like cursors

	//floorFootPosition: 0, //Foot collision point based on the relative vertical distance from the object’s origin when the object is grounded. Note that positive numbers will have their signed flipped automatically since the foot position can never be beneath the object’s origin point, so you may use positive numbers as a shorthand. Game Objects can override this value on specific animation frames by containing an ECB baked into the animation.

	//floorHeadPosition: 80, //Head collision point based on the relative vertical distance from the object’s origin when the object is grounded. Note that positive numbers will have their signed flipped automatically since the head position can never be beneath the object’s origin point, so you may use positive numbers as a shorthand. The head position will also be forced to be no lower than the foot. Game Objects can override this value on specific animation frames by containing an ECB baked into the animation.

	//floorHipWidth: 25, //Width of wall collision detection area surrounding the object while grounded. Game Objects can override this value on specific animation frames by containing an ECB baked into the animation.

	//floorHipXOffset: 0, //Horizontally displaces the position of the hips from the base position of the object by the specified value when the object is grounded. At zero, the left and right hips are evenly displaced on both sides. Game Objects can override this value on specific animation frames by containing an ECB baked into the animation.

	//floorHipYOffset: 0, //Vertically displaces the wall collision detection area on the object relative to the foot when the object is grounded. At zero, the hip is placed vertically halfway between the object’s head and foot. This is the base value which is used when no collision body data is available. Game Objects can override this value on specific animation frames by containing an ECB baked into the animation.

	//ghost: false,	//Whether or not to enable structure collisions.

	//groundSpeedCap: 15, //Max horizontal speed when in the air. //typo in the official docs, funny

	//immovable: FALSE, //Immovable objects are immune to windboxes and cannot be pushed by other solid entities. They will still push other solid objects if both the object and animation’s SOLID flag is true.

	//metadata: null, //Additional Metadata //what does even mean?, where?

	//shadows: TRUE, //Whether or not to enable shadows globally on the game object. //good for vampire characters or cursors

	//solid: TRUE, //Solid entities’ animations push other solid objects away unless their PUSH flag is false, and can be pushed by other solid objects unless their IMMOVABLE flag is true.

	//stateTransitionMapOverrides: //Map of states to animations/callbacks[ 
		//This is in the case the character you're making has less animations then the game requires. Note some states are broken at the moment
		//otherwise if your character has enough animations, ignore this chunk of code 
		//CState.ACTION => { animation: "action"}, //crashes game
		//CState.AERIAL_BACK => { animation: "aerial_back"},
		//CState.AERIAL_DOWN => { animation: "aerial_down"},
		//CState.AERIAL_FORWARD => { animation: "aerial_forward"},
		//CState.AERIAL_NEUTRAL => { animation: "aerial_neutral"},
		//CState.AERIAL_UP => { animation: "aerial_up"},
		//CState.AIRDASH_ACCELERATING => { animation: "airdash_accelerating"}, //crashes game
		//CState.AIRDASH_DECELERATING => { animation: "airdash_decelerating"}, //crashes game
		//CState.AIRDASH_DELAY => { animation: "airdash_delay"}, //crashes game
		//CState.AIRDASH_ENDING => { animation: "airdash_ending"}, //crashes game
		//CState.AIRDASH_FULL_SPEED => { animation: "airdash_full_speed"}, //crashes game
		//CState.AIRDASH_INITIAL => { animation: "airdash_initial"}, //crashes game
		//CState.ASLEEP => { animation: "asleep"}, //crashes game
		//CState.ASLEEP_OUT => { animation: "asleep_out"}, //crashes game
		//CState.ASSIST_CALL => { animation: "assist_call"}, //crashes game
		//CState.BURIED => { animation: "buried"}, //crashes game
		//CState.BURIED_OUT => { animation: "buried_out"}, //crashes game
		//CState.CRASH_ATTACK => { animation: "crash_attack"}, 
		//CState.CRASH_BOUNCE => { animation: "crash_bounce"}, 
		//CState.CRASH_GET_UP => { animation: "crash_get_up"},
		//CState.CRASH_LOOP => { animation: "crash_loop"},
		//CState.CRASH_ROLL => { animation: "crash_roll"},
		//CState.CRAWL_BACK => { animation: "crawl_back"},
		//CState.CRAWL_FORWARD => { animation: "crawl_forward"},
		//CState.CROUCH_IN => { animation: "crouch_in"},
		//CState.CROUCH_LOOP => { animation: "crouch_loop"},
		//CState.CROUCH_OUT => { animation: "crouch_out"},
		//CState.DASH => { animation: "dash"},
		//CState.DASH_ATTACK => { animation: "dash_attack"},
		//CState.DASH_PIVOT => { animation: "dash_pivot"},
		//CState.DISABLED => { animation: "disabled"},
		//CState.EMOTE => { animation: "emote"},
		//CState.FALL => { animation: "fall"},
		//CState.FALL_SPECIAL => { animation: "fall_special"},
		//CState.FROZEN => { animation: "frozen"}, //crashes game
		//CState.FROZEN_OUT => { animation: "frozen_out"}, //crashes game
		//CState.GRAB => { animation: "grab"},
		//CState.GRAB_HOLD => { animation: "grab_hold"},
		//CState.GRAB_PUMMEL => { animation: "grab_pummel"},
		//CState.HELD => { animation: "held"}, //doesn't seem to work
		//CState.HURT_HEAVY => { animation: "hurt_heavy"}, //doesn't seem to work
		//CState.HURT_HEAVY_HITSTOP => { animation: "hurt_heavy_hitstop"}, //doesn't seem to work
		//CState.HURT_LIGHT => { animation: "hurt_light"}, //doesn't seem to work 
		//CState.HURT_MEDIUM => { animation: "hurt_medium"}, //doesn't seem to work
		//CState.HURT_PARRY_STUN => { animation: "hurt_parry_stun"}, //doesn't seem to work
		//CState.INTRO => { animation: "intro"}, //doesn't seem to work
		//CState.JAB => { animation: "jab"},
		//CState.JUMP_IN => { animation: "jump_in"},
		//CState.JUMP_LOOP => { animation: "jump_loop"},
		//CState.JUMP_MIDAIR => { animation: "jump_midair"},
		//CState.JUMP_OUT => { animation: "jump_out"},
		//CState.JUMP_SQUAT => { animation: "jump_squat"},
		//CState.KO => { animation: "ko"},
		//CState.LAND => { animation: "land"}, //required atm
		//CState.LEDGE_ATTACK => { animation: "ledge_attack"},
		//CState.LEDGE_ATTACK_IN => { animation: "ledge_attack_in"},
		//CState.LEDGE_CLIMB => { animation: "ledge_climb"},
		//CState.LEDGE_IN => { animation: "ledge_in"},
		//CState.LEDGE_JUMP => { animation: "ledge_jump"},
		//CState.LEDGE_JUMP_IN => { animation: "ledge_jump_in"},
		//CState.LEDGE_LOOP => { animation: "ledge_loop"},
		//CState.LEDGE_ROLL => { animation: "ledge_roll"},
		//CState.LEDGE_ROLL_CLIMB => { animation: "ledge_roll_climb"},
		//CState.PARRY_FAIL => { animation: "parry_fail"}, //to enable parrying you don't, there's no documentaion yet 
		//CState.PARRY_IN => { animation: "parry_in"}, ////to enable parrying you don't, there's no documentaion yet 
		//CState.PARRY_SUCCESS => { animation: "parry_success"}, ////to enable parrying you don't, there's no documentaion yet 
		//CState.RELEASED => { animation: "released"}, //crashes game
		//CState.REVIVAL => { animation: "revival"},
		//CState.ROLL => { animation: "roll"},
		//CState.RUN => { animation: "run"},
		//CState.RUN_TURN => { animation: "run_turn"},
		//CState.SCREEN_KO => { animation: "screen_ko"},
		//CState.SHIELD_AIR => { animation: "shield_air"},
		//CState.SHIELD_BREAK => { animation: "shield_break"},
		//CState.SHIELD_HURT => { animation: "shield_hurt"},
		//CState.SHIELD_IN => { animation: "shield_in"},
		//CState.SHIELD_LOOP => { animation: "shield_loop"},
		//CState.SHIELD_OUT => { animation: "shield_out"},
		//CState.SKID => { animation: "skid"},
		//CState.SPECIAL_DOWN => { animation: "special_down"}, //does not work in air
		//CState.SPECIAL_NEUTRAL => { animation: "special_neutral"}, //does not work in air
		//CState.SPECIAL_SIDE => { animation: "special_side"}, //does not work in air
		//CState.SPECIAL_UP => { animation: "special_up"}, //does not work in air
		//CState.SPOT_DODGE => { animation: "spot_dodge"},
		//CState.STAND => { animation: "stand"},
		//CState.STAND_TURN => { animation: "stand_turn"},
		//CState.STAR_KO => { animation: "star_ko"},
		//CState.STRONG_DOWN_ATTACK => { animation: "strong_down_attack"},
		//CState.STRONG_DOWN_CHARGE => { animation: "strong_down_charge"},
		//CState.STRONG_DOWN_IN => { animation: "strong_down_in"},
		//CState.STRONG_FORWARD_ATTACK => { animation: "strong_forward_attack"},
		//CState.STRONG_FORWARD_CHARGE => { animation: "strong_forward_charge"},
		//CState.STRONG_FORWARD_IN => { animation: "strong_forward_in"},
		//CState.STRONG_UP_ATTACK => { animation: "strong_up_attack"},
		//CState.STRONG_UP_CHARGE => { animation: "strong_up_charge"},
		//CState.STRONG_UP_IN => { animation: "strong_up_in"},
		//CState.STUNNED => { animation: "stunned"}, //crashes game
		//CState.STUNNED_OUT => { animation: "stunned"}, //crashes game
		//CState.TECH => { animation: "tech"},
		//CState.TECH_CEILING => { animation: "tech_ceiling"},
		//CState.TECH_ROLL => { animation: "tech_roll"},
		//CState.TECH_WALL => { animation: "tech_wall"},
		//CState.THROW_BACK => { animation: "throw_back"},
		//CState.THROW_DOWN => { animation: "throw_down"},
		//CState.THROW_FORWARD => { animation: "throw_forward"},
		//CState.THROW_UP => { animation: "throw_up"},
		//CState.TILT_DOWN => { animation: "tilt_down"},
		//CState.TILT_FORWARD => { animation: "tilt_forward"},
		//CState.TILT_UP => { animation: "tilt_up"},
		//CState.TUMBLE => { animation: "tumble"},
		//CState.UNINITIALIZED => { animation: "uninitialized"},
		//CState.WALK_IN => { animation: "walk_in"},
		//CState.WALK_LOOP => { animation: "walk_loop"},
		//CState.WALK_OUT => { animation: "walk_out"} //technically ends here because the 2 animations under this crash the game
		//CState.WALL_CLING => { animation: "wall_cling"}, //crashes game
		//CState.WALL_JUMP => { animation: "wall_jump"} //crashes game
	//],

	//initialState: CState.STAND, //The initial state the object should be set to. //either CSTATE.STAND or CSTATE.INTRO, use other CStates with caution

	weight: 100 //Used to determine how hard the ground shakes when the Entity lands or hits a wall, also used to determine how light the Entity is for knockback velocity purposes.
	//the reason why its so low is because its very heavy and also because i have no idea what to with this so this works for now.

}