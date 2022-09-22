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
	},
	grab_pummel:{
		hitbox0: { damage: 2, flinch: false, limb: AttackLimb.BODY }
	},
	throw_forward:{
		hitbox0: { damage: 5, angle: 0, baseKnockback: 65, knockbackGrowth: 25, hitstop: 10, limb: AttackLimb.BODY }
	},
	throw_back:{
		hitbox0: { damage: 7, angle: 0, baseKnockback: 75, knockbackGrowth: 30, hitstop: 10, limb: AttackLimb.BODY }
	},
	throw_down:{
		hitbox0: { damage: 6, angle: 270, baseKnockback: 75, knockbackGrowth: 25, hitstop: 10, limb: AttackLimb.BODY } // it would make more sense for balance reasons to make it throw up instead and be comboable from it, but i'm not good with balance so this is fine
	},
	throw_up:{
		hitbox0: { damage: 4, angle: 90, baseKnockback: 75, knockbackGrowth: 25, hitstop: 10, limb: AttackLimb.BODY }
	}
}
//example
//animationname: {
//	hitboxnumber: { damage: 5, angle: 10, baseKnockback: 10, knockbackGrowth: 15, hitstop: 10, limb: AttackLimb.BODY }
//}
//---------Angle Referance---------\\
//for hitbox angles here's a referance
//things to note:
// if an attack has the character turn around (specifically Back air and Back throw) then the hitbox angles are reversed (180 becoming 0, and vice versa)
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
// an example of a hitbox stat with everything
//attackname:{
//	hitboxnumber: {absorbable: false, angle: 0, attackId: 0, attackRatio: 0, attackStrength: null, baseKnockback: 0, bodyX: 0, bodyY: 0, damage: 0, directionalInfluence: true, disabled: false, element:null, flinch:true, forceTumbleFall:false,  hitEffectOverride: null, hitSoundOverride: null, hitstop: -1, hitstopMultiplier: 1, hitstopNudgeMultiplier: 1, hitstopOffset: 0, hitstun: -1, index: -1, jabResetType: null, knockbackGrowth: 0, limb: 0, maxChargeDamageMultiplier: null, metadata: i still have no idea what the fuck a dynamic is, owner: null, rawAngle: 0, rawDamage: 0, reflectable: false, reverse: false, reversibleAngle: true, selfHitstop: -1, selfHitstopOffset: 0, shieldDamageMultiplier: 1, stackKnockback: true}
//}
//---------Hitbox Variables--------\\
// //needs organizing
//
//absorbable: (type:Bool, Default:false) When true, the hitbox is able to trigger absorb-related events when it connects with an absorb collision box. Absorb events are only receivable by projectiles, and the resulting behavior is determined by the individual projectile receiving the absorb event.

//angle: (type:Float, Default:0) The angle of knockback. Expects an angle between 0 and 360, or alternatively a SpecialAngle value. Note that when a foe takes damage this number is modified in the resulting HIT_RECEIVED/HIT_DEALT GameObjectEvents. Use rawAngle if you want the original value.

//attackId: (type:Int, default:0) Attack identfier for the stats

//attackRatio: (type:Float, default:0) A multiplier that is applied to knockback after the final knockback calculation has been done.

//attackStrength: (type:Int, default:null))  Use this alongside the element to determine the hit sound and hit effect. //takes an integer for some reason because yes this makes sense could've been attackStrength.AUTO but fuckukcuf you i guess
//AttackStrength Options: //TODO 
//0
//1
//2
//3
//4
//AUTO - chooses automatically based on damage dealt (Untested)
//FATAL
//HEAVY
//LIGHT
//MEDIUM

//baseKnockback: (type:Float, default: 0) Base power.

//bodyX: (type:Float, default:0) X location of the owner GameObject. Generally this is auto-populated to match the position of the owner, except in cases HitboxStats were generated by hand in which case an owning object may not exist.

//bodyY: (type:Float, default:0) Y location of the owner GameObject. Generally this is auto-populated to match the position of the owner, except in cases HitboxStats were generated by hand in which case an owning object may not exist.

//damage: (type:Float, default:0) The amount of damage that the hitbox deals to foes.

//directionalInfluence: (type:Bool, default:true) Setting to false will disable post-hitstop directional influence among hit foes.

//disabled: (type:Bool, default:false) If true, the hitbox will behave as though it did not exist (it will not interact with other boxes).

//element: (type:Int, default:null) What element the attack is  //in the current version of the game these elements are not implemented yet so this part does nothing, you can use it if you're curious but the only thing you'll see is a bunch of debug text. also again with the integer thing my god WHY? whats wrong with Element.FIRE
//ELECTRIC
//FIRE
//ICE
//LAY //LAYS Chips?. i'm assuming that's supposed to be like sleeping, like laid to rest or something but in that case why not call it SLEEP
//MAGIC
//NORMAL
//POISON
//WIND

//flinch: (type:Bool, default:true) Setting to false will make the move not break grabs nor send the foe into the hurt animation.

//forceTumbleFall: (type:Bool, default:false) When true, the attack will always cause foes to go into their tumble state when hit.

//hitEffectOverride: (type:String, default:null) Use a custom hit Vfx. By default, the engine assumes this is an animation name from from the GlobalVfx sprite (See GlobalVfx constnats). You can however use other Vfx animations by specifying the full content id of the Vfx sprite followed by a hash “#” specifying the animation you want to play. (e.g. “namespace::resource.spriteId#animationId”)

//hitSoundOverride: (type:String, default:null) How long the foe will be held in place before knockback is applied.

//hitstop: (type:Int, default:-1) Determines how many frames the victim will be held in place before knockback is applied. When negative this value is automatically calculated.

//hitstopMultiplier: (type:Float, default:1) Multiplier that affects both hitstop and selfHitstop.

//hitstopNudgeMultiplier: (type:Float, default:1) Multiplier for how far foes can nudge while in hitstop.

//hitstopOffset: (type:Int, default:0) Used in conjunction with a negative hitstop stat, adds a flat amount of hitstop independent of how hitstop is calculated.

//hitstun: (type:Int, default:-1) How long the foe will be unable to attack after knockback is applied. When positive, this is the number of frames the foe will remain in hitstun. When negative, this works like a multiplier against the automatically calculated hitstun value. For example, a value of -0.5 would result in a multiplier of 0.5 against the calculated hitstun. By leaving it at its default of -1, you will get 100% of the calculated hitstun.

//index: (type:Int, default:-1) The numerical index of the hitbox that can be used to identify which hitbox was involved in a hit.

//jabResetType: (type:Int, default:null) Allows the Hitbox to be armored by launch resistance or heavy armor.

//knockbackGrowth: (type:Float, default:0) Growth of the power correlated to damage.



//limb: (type:Int, default:null) What the attacker is attacking with. //integer are fun arent they?
//limb options: TODO
//BATTERING
//BODY
//FIST
//FOOT
//HEAD
//SWORD
//UNDEFINED //uh yes my favorite limb, i̸̢̯̩͓̹͌̈̌͘l̴̖̑̌̉̀̈̀̚l̷̘̮̔͆̓̅̿̍̏͠e̴̛̙̦̙͈͂̐̍̋̉̉̓̌̉̓̕͠g̷̡̛̪̝͍̟̭̈́̇̋̽͌͑̃̈́̄̽́͗̚ͅä̵̹̬̫́̒̓̏̍̏͗͑̔̌͜ļ̴̧͕͓̯̳̟̫͔͍̬̲̬͌̈́̓̒ͅ

//maxChargeDamageMultiplier: (type:Float, default:null) Multiplier used for maximum charge if the move is chargeable

//metadata: (type:Dynamic, default:null) Additional metadata.

//owner: (type:GameObject, default:null) The GameObjectApi instance that owns the hitbox. if null, its the owner

//rawAngle: (type:Float, default:0) The raw angle value of the hitbox that always starts equal to the “angle” stat. Cannot be assigned, but you can use it to determine the original angle of the hitbox in cases where the actual trajectory of the foe isn’t desired.

//rawDamage: (type:Float, default:0) The raw damage value of the hitbox. Is unaffected by staling and cannot be assigned.

//reflectable: (type:Bool, default:false) When true, the hitbox is able to trigger reflect-related events when it connects with a reflect box. Reflect events are only receivable by projectiles and items, and the resulting behavior is determined by the individual object receiving the reflect event.

//reverse: (type:Bool, default:false) When true, the hitbox will automatically reverse and flip most other object types objects upon a successful hit.

//reversibleAngle: (type:Bool, default:true) When true, if the hitbox connects behind the origin of the attacker then the resulting angle will be flipped horizontally.

//selfHitstop: (type:Int, default:-1) Determines how many frames the attacker will be held in place before knockback is applied. When negative this value is automatically calculated.

//selfHitstopOffset: (type:Int, default:0) Used in conjunction with a negative selfHitstop stat, adds a flat amount of hitstop independent of how selfHitstop is calculated.

//shieldDamageMultiplier: (type:Float, default:1) Multiplier for shield damage.

//shieldable: (type:Bool, default:true) When true, the hitbox is able to be shielded by foes.

//shieldstunMultiplier: (type:Float, default:1) Multiplier for shieldstun.

//stackKnockback: (type:Bool, default:true) Setting to false will disable knockback stacking.