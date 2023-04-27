var bottom_piece = self.makeInt(0);
//var test = self.makeString(self.getOwner().getAnimation() + "_blue");
//parts for reference:
//-1 - bloxx
//0 - orange dragon
//1 - gray golem
//2 - red knight
//3 - purple spider
//4 - blue gargoyle
//5 - green tornado ninja
//6 - white grappler
//7 - yellow gunman
//8 - pink Dragon
var xoffset = 0;
var yoffset = 0; //this is for the character parts that have sizes bigger than others (i.e bigger leg parts or bigger top parts)
var projcontainer = self.getViewRootContainer();

function initialize(){
	self.setCostumeIndex(self.getOwner().getCostumeIndex());
	bottom_piece = 1;
	self.getOwner().addEventListener(EntityEvent.STATE_CHANGE, animplay, {persistent:true});
	stage.getCharactersBackContainer().addChild(projcontainer); //puts it behind everything, the best one
	//Engine.log(self.getOwner().getAnimation() + "_blue");
	//if (self.getOwner().inState(CState.INTRO)){self.playAnimation("intro" + "blue");}
}

function animplay(){
	Engine.log(self.getOwner().getAnimation());

	if (bottom_piece == 0){
		self.playAnimation(self.getOwner().getAnimation() + "_orange");
	}
	else if (bottom_piece == 1){
		self.playAnimation(self.getOwner().getAnimation() + "_gray");
	}
	else if (bottom_piece == 2){
		self.playAnimation(self.getOwner().getAnimation() + "_red");
	}
	else if (bottom_piece == 3){
		self.playAnimation(self.getOwner().getAnimation() + "_purple");
	}
	else if (bottom_piece == 4){
		self.playAnimation(self.getOwner().getAnimation() + "_blue");
	}
}

function update() {

	//establish position
	var playerx = self.getOwner().getX();
	var playery = self.getOwner().getY();

	self.setX(playerx);
	self.setY(playery);

	if (self.getOwner().isFacingLeft()) {
		self.faceLeft();
	}
	else{
		self.faceRight();
	}


	//this is currently what is there for playing as other parts, until i figure out button combinations to select certain parts
	//ideally it would be in the character select screen but currently characters can't interact with the menu directly
	//so the current idea is to have it set so that in the intro animation the buttons control the top part while the stick controls the bottom part
	//but like 75 frames to select a character oof
	if (self.getOwner().inState(CState.EMOTE)){
		var randomnumber = Random.getInt(0,4);
		bottom_piece = randomnumber;
	}
}

function onTeardown() {
}