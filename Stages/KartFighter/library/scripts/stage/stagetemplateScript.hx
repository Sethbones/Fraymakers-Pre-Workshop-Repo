self.exports = {
    player1: self.makeObject(null),
    player2: self.makeObject(null),
	player1Xcord: null,
	player2Xcord: null
};
// API Script for Stage Template

var CLOUD_BACK_2_X_SPEED = 0.05; // Cloud back 2 scroll speed
var CLOUD_BACK_2_WIDTH = 1542; // Determines loop point, should match physical size based on stats scaling
var CLOUD_BACK_1_X_SPEED = 0.075; // Cloud back 1 scroll speed
var CLOUD_BACK_1_WIDTH = 1542; // Determines loop point, should match physical size based on stats scaling
// Vars
var cloudBack2XOffset = self.makeFloat(0);
var cloudBack1XOffset = self.makeFloat(0);
//var tester = match.createProjectile(self.getResource().getContent("TestCube"));
var isGameStarted:Bool = false;
var currentplayers = match.getPlayers();
var p1 = match.createProjectile(self.getResource().getContent("TestCube"));
var p2 = match.createProjectile(self.getResource().getContent("TestCube"));

function initialize(){
	//currentplayers = match.getPlayers();
	//currentplayers[0].getDamageCounterContainer().alpha = 1;
	camera.setMode(2);
	//1 - hyper zoom
	//2 - static on camera bounds
	//3 - static on middle?
	//4+ - nothing
	// Don't animate the stage itself (we'll pause on one version for hazards on, and another version for hazards off)
	self.pause();
	if (match.getMatchSettingsConfig().hazards) {
		// Hazards are on, enable the platform beneath the stage
		match.createStructure(self.getResource().getContent("stagetemplateMovingPlatform"));
		self.playLabel("hazardson");
	}
}

function update(){
	//camera.getBackgroundContainer().alpha = 0; //removes the background, go figure
	//camera.getBackgroundContainers().alpha = 0;
	//camera.getForegroundContainer().alpha = 0;
	//self.getCharactersContainer().alpha = 0;
	currentplayers = match.getPlayers();
	// currentplayers[0].getDamageCounterContainer().alpha = 0;
	// currentplayers[1].getDamageCounterContainer().alpha = 0;
	// currentplayers[0].setVisible(false);
	//currentplayers[0].setAlpha(0); //hides the character
	//currentplayers[0].getOffscreenIndicator().getSpriteContainer().remove(); //colors the offscreen indicator purple, yeah i dont even know
	//currentplayers[1].getOffscreenIndicator().removeShaderEffects;
	//camera.deleteTarget(currentplayers[1]);
	//hideOffscreenIndicators();
	//currentplayers[0].getOffscreenIndicator().getSpriteContainer().alpha = 0;
	//currentplayers[0].getOwner().getOwner().getOwner().getOwner().getOwner().getOwner().getOwner().getOwner().setAlpha(0); //cant say i didn't try
	self.exports.player1.set(currentplayers[0]);
	self.exports.player2.set(currentplayers[1]);
	// Engine.log(self.exports.player1.get(currentplayers[0]));
	// Engine.log(self.exports.player1.get(currentplayers[1]));
	//Engine.log(tester.getY());
	if (isGameStarted == false){
		if (self.exports.player1.get() != null){
			// var p1 = match.createProjectile(self.getResource().getContent("TestCube"));
			// var p2 = match.createProjectile(self.getResource().getContent("TestCube"));
			p1.exports.currentplayer.set(self.exports.player1.get());
			p2.exports.currentplayer.set(self.exports.player2.get());
			isGameStarted = true;
			// if (self.exports.player2.get() != null){
			// 	playerAss();
			// 	isGameStarted = true;
			// }
		}
	}
	scrollBackgrounds();
	p1.exports.player1Xcord.set(p1.getX());
	p1.exports.player2Xcord.set(p2.getX());
	p2.exports.player1Xcord.set(p2.getX());
	p2.exports.player2Xcord.set(p1.getX());
}

function playerAss(){//comedy
	
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

