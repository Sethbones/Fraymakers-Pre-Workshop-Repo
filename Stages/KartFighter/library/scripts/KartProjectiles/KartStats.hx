{
	spriteContent: self.getResource().getContent("KartProjectiles"),
	stateTransitionMapOverrides: [
		PState.ACTIVE => {
			animation: "mehriprojectile"
		},
		PState.DESTROYING => {
			animation: "mehriprojectile"
		}
	],
	baseScaleX: 2,
	baseScaleY: 2,
    //gravity: 0.5,
	friction: 0,
    solid: false,
	ghost: true,
	groundSpeedCap: 11,
	aerialSpeedCap: 11,
	aerialFriction: 0,
	terminalVelocity: 11
}