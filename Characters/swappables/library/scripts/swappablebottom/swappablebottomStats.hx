// Animation stats for Character Template Projectile
{
	spriteContent: self.getResource().getContent("swappablebottom"),
	stateTransitionMapOverrides: [
		PState.ACTIVE => {
			animation: "stand_orange"
		},
		PState.DESTROYING => {
			animation: "stand_orange"
		}
	],	
	shadows: true,
	deathBoundsDestroy: false,
	ghost: true
}
