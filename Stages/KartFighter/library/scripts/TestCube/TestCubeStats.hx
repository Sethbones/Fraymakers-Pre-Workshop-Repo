{
	spriteContent: self.getResource().getContent("TestCube"),
	stateTransitionMapOverrides: [
		PState.ACTIVE => {
			animation: "stand"
		},
		PState.DESTROYING => {
			animation: "stand"
		}
	],
	baseScaleX: 2,
	baseScaleY: 2,
    gravity: 0.5,
	//friction: 0.2,
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
	aerialFootPosition: 0
}