var top_piece = self.makeInt(0);
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
var charcontainer = self.getOwner().getViewRootContainer();
var projcontainer = self.getViewRootContainer();

//self.getResource().getContent("charactertemplate"); //testing testing not working testing

function initialize(){
	self.setCostumeIndex(self.getOwner().getCostumeIndex());
	top_piece = 4;
	self.getOwner().addEventListener(EntityEvent.STATE_CHANGE, animplay, {persistent:true});
	//Engine.log(self.getOwner().getAnimation() + "_blue");
	//if (self.getOwner().inState(CState.INTRO)){self.playAnimation("intro" + "blue");}
	//stage.getCharactersContainer().addChild(projcontainer); //does nothing of note, puts it behind projectiles, in front of characters
    stage.getCharactersBackContainer().addChild(projcontainer); //puts it behind everything, the best one
    //stage.getCharactersFrontContainer().addChild(projcontainer); //put itself in front of everything
    //self.getOwner().getDamageCounterContainer().addChild(projcontainer); //basically only used for meter gimmicks
    //self.getOwner().getViewRootContainer().addChild(projcontainer); //the most stable of the what the fucks
    //self.getOwner().getTopLayer().addChild(projcontainer); //what the fuck
    //self.getOwner().getBottomLayer().addChild(projcontainer); //no seriously what the fuck
    //self.getOwner().getStaticBottomLayer().addChild(projcontainer); //the same as viewrootcontainer
    //self.getOwner().getStaticTopLayer().addChild(projcontainer);
	//stage.getCharactersContainer(charcontainer).addChild(projcontainer); //does the same as the normal
	//self.getOwner().getViewRootContainer().addChildAt(projcontainer, 1);
}

function animplay(){
	Engine.log(self.getOwner().getAnimation());

	if (top_piece == 0){
		self.playAnimation(self.getOwner().getAnimation() + "_orange");
	}
	else if (top_piece == 1){
		self.playAnimation(self.getOwner().getAnimation() + "_gray");
	}
	else if (top_piece == 2){
		self.playAnimation(self.getOwner().getAnimation() + "_red");
	}
	else if (top_piece == 3){
		self.playAnimation(self.getOwner().getAnimation() + "_purple");
	}
	else if (top_piece == 4){
		self.playAnimation(self.getOwner().getAnimation() + "_blue");
	}
}

function update() {
	NEUTRAL_SPECIAL_COOLDOWN = 0;

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
		top_piece = randomnumber;
	}
}

function onTeardown() {
}