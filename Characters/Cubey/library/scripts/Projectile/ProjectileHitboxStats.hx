// Hitbox stats for Character Template Projectile
//hitbox1 is not a hitbox but an area detection hitbox
//i.e if you used godot its like area2d or a trigger hitbox in unity but worse
//debating on keeping it reflectable, its more than a bit buggy when reflectable
{
	projectileSpawn: {
	},
	projectileIdle: {
		//hitbox0: { damage: 6, knockbackGrowth: 30, baseKnockback: 65, angle: 80, reversibleAngle: false, directionalInfluence: false, reflectable: true, disabled: true, absorbable: true},
		hitbox0: { damage: 8, knockbackGrowth: 30, baseKnockback: 50, angle: SpecialAngle.AUTOLINK_WEAK, reversibleAngle: false, directionalInfluence: false, reflectable: true, disabled: true, absorbable: true},
		hitbox1:{ flinch: false, hitstop: 0, selfHitstop: 0, hitstopMultiplier: 0, hitEffectOverride: "#n/a", stackKnockback: false, reversibleAngle: false, absorbable: true, hitSoundOverride: "#n/a"}
	},
	projectileIdle_gold: {
		//hitbox0: { damage: 6, knockbackGrowth: 30, baseKnockback: 65, angle: 80, reversibleAngle: false, directionalInfluence: false, reflectable: true, disabled: true, absorbable: true},
		hitbox0: { damage: 8, knockbackGrowth: 30, baseKnockback: 50, angle: SpecialAngle.AUTOLINK_WEAK, reversibleAngle: false, directionalInfluence: false, reflectable: true, disabled: true, absorbable: true},
		hitbox1:{ flinch: false, hitstop: 0, selfHitstop: 0, hitstopMultiplier: 0, hitEffectOverride: "#n/a", stackKnockback: false, reversibleAngle: false, absorbable: true, hitSoundOverride: "#n/a"}
	},
	projectileDestroy: {
	}
}
