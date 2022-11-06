{
	spriteContent: self.getResource().getContent("Template"),
	stateTransitionMapOverrides: [
		PState.ACTIVE => {
			animation: "ko_effect"
		},
		PState.DESTROYING => {
			animation: "ko_effect"
		}
	],
	gravity: 0,
	friction: 0.2,
	groundSpeedCap: 11,
	aerialSpeedCap: 11,
	aerialFriction: 0,
	terminalVelocity: 11,
	floorHeadPosition: 40,
	floorHipWidth: 25,
	floorHipXOffset: 0,
	floorHipYOffset: 0,
	floorFootPosition: 0,
	aerialHeadPosition: 40,
	aerialHipWidth: 25,
	aerialHipXOffset: 0,
	aerialHipYOffset: 0,
	aerialFootPosition: 0,
	deathBoundsDestroy: false, //required unless shit goes boom
	ghost: true,
	inheritPalette: true,
	resizable: true
}
