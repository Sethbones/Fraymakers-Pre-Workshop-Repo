// API Script for Stage Template

var CLOUD_BACK_2_X_SPEED = 0.05; // Cloud back 2 scroll speed
var CLOUD_BACK_2_WIDTH = 1542; // Determines loop point, should match physical size based on stats scaling
var CLOUD_BACK_1_X_SPEED = 0.075; // Cloud back 1 scroll speed
var CLOUD_BACK_1_WIDTH = 1542; // Determines loop point, should match physical size based on stats scaling

// Vars
var cloudBack2XOffset = self.makeFloat(0);
var cloudBack1XOffset = self.makeFloat(0);

function initialize(){
	// Don't animate the stage itself (we'll pause on one version for hazards on, and another version for hazards off)
	self.pause();

	if (match.getMatchSettingsConfig().hazards) {
		// Hazards are on, enable the platform beneath the stage
		match.createStructure(self.getResource().getContent("stagetemplateMovingPlatform"));
		self.playLabel("hazardson");
	}

}

function update(){
		scrollBackgrounds();
}

function scrollBackgrounds() {
	cloudBack2XOffset.set((cloudBack2XOffset.get() + CLOUD_BACK_2_X_SPEED) % CLOUD_BACK_2_WIDTH);
	cloudBack1XOffset.set((cloudBack1XOffset.get() + CLOUD_BACK_1_X_SPEED) % CLOUD_BACK_1_WIDTH);
	camera.setBackgroundOffset(1, cloudBack2XOffset.get(), 0);
	camera.setBackgroundOffset(2, cloudBack1XOffset.get(), 0);
}

function onTeardown(){
}
function onKill(){
}
function onStale(){
}
function afterPushState(){
}
function afterPopState(){
}
function afterFlushStates(){
}

