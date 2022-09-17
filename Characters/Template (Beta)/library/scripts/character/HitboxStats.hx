{
	aerial_back: {
		hitbox0: { damage: 12, angle: 10, baseKnockback: 30, knockbackGrowth: 50, hitstop: 15, limb: AttackLimb.BODY } //the hitbox angle is reversed for back attacks
	},
	aerial_down: {
		hitbox0: { damage: 14, angle: 270, baseKnockback: 30, knockbackGrowth: 40, hitstop: 10, limb: AttackLimb.BODY }
	},
	aerial_forward: {
		hitbox0: { damage: 8, angle: 25, baseKnockback: 30, knockbackGrowth: 55, hitstop: 10, limb: AttackLimb.BODY }
	},
	aerial_neutral: {
		hitbox0: { damage: 4, angle: 30, baseKnockback: 25, knockbackGrowth: 25, hitstop: 10, limb: AttackLimb.BODY }
	},
	aerial_up: {
		hitbox0: { damage: 6, angle: 90, baseKnockback: 40, knockbackGrowth: 35, hitstop: 10, limb: AttackLimb.BODY }
	},
	dash_attack: {
		hitbox0: { damage: 12, angle: 15, baseKnockback: 40, knockbackGrowth: 30, hitstop: 10, limb: AttackLimb.BODY }
	},
	jab1: {
		hitbox0: { damage: 4, angle: 60, baseKnockback: 30, knockbackGrowth: 40, hitstop: 10, limb: AttackLimb.BODY }
	},
	strong_down_attack: {
		hitbox0: { damage: 20, angle: 25, baseKnockback: 40, knockbackGrowth: 50, hitstop: 20, limb: AttackLimb.BODY } //needs direction based/two hitboxes i.e TODO
	},
	strong_forward_attack: {
		hitbox0: { damage: 7, angle: 315, baseKnockback: 10, knockbackGrowth: 15, hitstop: 10, limb: AttackLimb.BODY },
		hitbox1: { damage: 24, angle: 20, baseKnockback: 40, knockbackGrowth: 50, hitstop: 20, limb: AttackLimb.BODY }
	},
	strong_up_attack: {
		hitbox0: { damage: 18, angle: 90, baseKnockback: 40, knockbackGrowth: 50, hitstop: 20, limb: AttackLimb.BODY }
	},
	tilt_down: {
		hitbox0: { damage: 9, angle: 75, baseKnockback: 30, knockbackGrowth: 40, hitstop: 10, limb: AttackLimb.BODY }
	},
	tilt_forward: {
		hitbox0: { damage: 8, angle: 30, baseKnockback: 25, knockbackGrowth: 30, hitstop: 10, limb: AttackLimb.BODY }
	},
	tilt_up: {
		hitbox0: { damage: 9, angle: 90, baseKnockback: 30, knockbackGrowth: 30, hitstop: 10, limb: AttackLimb.BODY }
	},
	special_side: {
		hitbox0: { damage: 12, angle: 270, baseKnockback: 40, knockbackGrowth: 10, hitstop: 5, limb: AttackLimb.BODY }
	},
	special_side_air: {
		hitbox0: { damage: 12, angle: 270, baseKnockback: 40, knockbackGrowth: 10, hitstop: 5, limb: AttackLimb.BODY }
	}
}
//example
//animationname: {
//	hitboxnumber: { damage: 5, angle: 10, baseKnockback: 10, knockbackGrowth: 15, hitstop: 10, limb: AttackLimb.BODY }
//}
//---------Angle Referance---------\\
//for hitbox angles here's a referance
//
//                        90
//                -----------------
//             /          |          \
//    135   /             |             \   45
//        |               |               |
//      |                 |                 |
//     |                  |                  |
//    |                   |                   |
//   |                    |                    |
//   |                    |                    |
//180|--------------------|--------------------| 0
//   |                    |                    |
//   |                    |                    |
//    |                   |                   |
//     |                  |                  |
//      |                 |                 |
//        |               |               |
//    225   \             |             /   315
//             \          |          /
//                -----------------
//                       270
//
//
//
//                        90
//                -----------------
//             /          |          \
//          /             |             \
//        |\              |               |
//      |    \            |                 |
//     |        \         |                  |
//    |            \      |                   |
//   |                \   |                    |
//   |                   \|/                   |
//180|--------------------|--------------------| 0
//   |                   /|\                   |
//   |                    |                    |
//    |                   |                   |
//     |                  |                  |
//      |                 |                 |
//        |               |               |
//          \             |             /
//             \          |          /
//                -----------------
//                       270
//
//
//---------Hitbox Variables--------\\
// //needs organizing
//
//absorbable: (Default: FALSE Bool) When true, the hitbox is able to trigger absorb-related events when it connects with an absorb collision box. Absorb events are only receivable by projectiles, and the resulting behavior is determined by the individual projectile receiving the absorb event.

//angle: (Default: 0) The angle of knockback. Expects an angle between 0 and 360, or alternatively a SpecialAngle value. Note that when a foe takes damage this number is modified in the resulting HIT_RECEIVED/HIT_DEALT GameObjectEvents. Use rawAngle if you want the original value.

//attackId: 0 (default: 0) Attack identfier for the stats

//attackRatio: 0 (default: 0) A multiplier that is applied to knockback after the final knockback calculation has been done.

//attackStrength: (default:null, type:Int)  Use this alongside the element to determine the hit sound and hit effect.
//AttackStrength Options:
//AUTO
//FATAL
//HEAVY
//LIGHT
//MEDIUM

//baseKnockback: (default: 0, type:float) Base power. type:float

//bodyX	(default:0, type:Float) X location of the owner GameObject. Generally this is auto-populated to match the position of the owner, except in cases HitboxStats were generated by hand in which case an owning object may not exist.

//bodyY	(default:0, type:Float) Y location of the owner GameObject. Generally this is auto-populated to match the position of the owner, except in cases HitboxStats were generated by hand in which case an owning object may not exist.

//damage: Float	0 The amount of damage that the hitbox deals to foes.

//directionalInfluence: Bool	TRUE	Setting to false will disable post-hitstop directional influence among hit foes.

//disabled: Bool	FALSE	If true, the hitbox will behave as though it did not exist (it will not interact with other boxes).

//element: Int	null	What element the attack is			@see AttackElement

//flinch: Bool	TRUE	Setting to false will make the move not break grabs nor send the foe into the hurt animation.

//forceTumbleFall: Bool	FALSE	When true, the attack will always cause foes to go into their tumble state when hit.

//hitEffectOverride: String null Use a custom hit Vfx. By default, the engine assumes this is an animation name from from the GlobalVfx sprite (See GlobalVfx constnats). You can however use other Vfx animations by specifying the full content id of the Vfx sprite followed by a hash “#” specifying the animation you want to play. (e.g. “namespace::resource.spriteId#animationId”)

//hitSoundOverride:	String	null	How long the foe will be held in place before knockback is applied.

//hitstop:	Int	-1	Determines how many frames the victim will be held in place before knockback is applied. When negative this value is automatically calculated.

//hitstopMultiplier:	Float	1	Multiplier that affects both hitstop and selfHitstop.

//hitstopNudgeMultiplier:	Float	1	Multiplier for how far foes can nudge while in hitstop.

//hitstopOffset:	Int	0	Used in conjunction with a negative hitstop stat, adds a flat amount of hitstop independent of how hitstop is calculated.

//hitstun:	Int	-1	How long the foe will be unable to attack after knockback is applied. When positive, this is the number of frames the foe will remain in hitstun. When negative, this works like a multiplier against the automatically calculated hitstun value. For example, a value of -0.5 would result in a multiplier of 0.5 against the calculated hitstun. By leaving it at its default of -1, you will get 100% of the calculated hitstun.

//index:	Int	-1	The numerical index of the hitbox that can be used to identify which hitbox was involved in a hit.

//jabResetType:	Int	null	Allows the Hitbox to be armored by launch resistance or heavy armor.

//knockbackGrowth:	Float	0	Growth of the power correlated to damage.

//limb:	Int	null	What the attacker is attacking with.	@see AttackLimb
//options: TODO



//maxChargeDamageMultiplier:	Float	null	Multiplier used for maximum charge if the move is chargeable

//metadata:	Dynamic	null	Additional metadata.

//owner:	GameObject	null	The GameObjectApi instance that owns the hitbox.

//rawAngle:	Float	0	The raw angle value of the hitbox that always starts equal to the “angle” stat. Cannot be assigned, but you can use it to determine the original angle of the hitbox in cases where the actual trajectory of the foe isn’t desired.

//rawDamage:	Float	0	The raw damage value of the hitbox. Is unaffected by staling and cannot be assigned.

//reflectable:	Bool	FALSE	When true, the hitbox is able to trigger reflect-related events when it connects with a reflect box. Reflect events are only receivable by projectiles and items, and the resulting behavior is determined by the individual object receiving the reflect event.

//reverse:	Bool	FALSE	When true, the hitbox will automatically reverse and flip most other object types objects upon a successful hit.

//reversibleAngle:	Bool	TRUE	When true, if the hitbox connects behind the origin of the attacker then the resulting angle will be flipped horizontally.

//selfHitstop:	Int	-1	Determines how many frames the attacker will be held in place before knockback is applied. When negative this value is automatically calculated.

//selfHitstopOffset:	Int	0	Used in conjunction with a negative selfHitstop stat, adds a flat amount of hitstop independent of how selfHitstop is calculated.

//shieldDamageMultiplier:	Float	1	Multiplier for shield damage.

//shieldable:	Bool	TRUE	When true, the hitbox is able to be shielded by foes.

//shieldstunMultiplier:	Float	1	Multiplier for shieldstun.

//stackKnockback:	Bool	TRUE	Setting to false will disable knockback stacking.

