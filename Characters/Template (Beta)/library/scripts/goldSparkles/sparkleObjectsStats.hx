{
	spriteContent: self.getResource().getContent("Template"),
	stateTransitionMapOverrides: [
		PState.ACTIVE => {
			animation: "sparkles"
		},
		PState.DESTROYING => {
			animation: "sparkles"
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
	ghost: true
}
