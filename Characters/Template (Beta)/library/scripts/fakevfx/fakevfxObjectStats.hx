//its important to note that fraymakers has a shit load of macro functions this being one of them
STATE_IDLE = 0;
STATE_JUMP = 1;
STATE_FALL = 2;
STATE_SLAM = 3;
STATE_OUTRO = 4;

{
	spriteContent: self.getResource().getContent("Template"),
	initialState: STATE_IDLE,
	stateTransitionMapOverrides: [
		STATE_IDLE => {
			animation: "-----------------FAKE VFX------------------"
		},
		STATE_JUMP => {
			animation: "dust_small"
		},
		STATE_FALL => {
			animation: "fall"
		},
		STATE_SLAM => {
			animation: "slam"
		},
		STATE_OUTRO => {
			animation: "outro"
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
	deathBoundsDestroy: false, //required unless it deletes itself immediately on spawn
	ghost: true,
	inheritPalette: true,
	resizable: true
}
