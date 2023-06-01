//this is a basic script for a gold alt/gold sparkles on a character
//this is designed to be as drop in as possible



//drop this in function update()
	if (self.getCostumeIndex() == 11){ //set it to the index of the gold alt, if unsure put Engine.log(self.getCostumeIndex()); in function initialize() and check what number it prints when using the gold alt
        goldAltLogic();
    }




//drop this in the bottom of the object's script file
//----\GOLD ALT LOGIC/----
var timeBetweenSparkles:Int = 8;
var currentTimeBetweenSparkles = timeBetweenSparkles;
var currentAnim = self.getAnimation();
function goldAltLogic(){

    if(currentTimeBetweenSparkles > 0){
        currentTimeBetweenSparkles--;
    }

    if (currentTimeBetweenSparkles == 0){
        match.createVfx(new VfxStats({spriteContent: "global::vfx.vfx", animation: "vfx_gold_sparkle", x: Random.getFloat(self.getCharacterStat("floorHipWidth") * (-1) ,self.getCharacterStat("floorHipWidth")), y: Random.getFloat(self.getCharacterStat("floorHeadPosition") * (-1),0) }), self);
        currentTimeBetweenSparkles = timeBetweenSparkles;
    }

    //custom gold alt animations playback
    //optional for people that want to make gold alt specific animations
    if (self.getAnimation() != currentAnim){
        Engine.log("animation changed");
        currentAnim = self.getAnimation();
        if (self.inState(CState.STAND)){
            self.playAnimation("gold_stand");
        }
        //if you're crazy and want to make gold alt specific animations for each animation the character has then go ahead
        //but if you're a normal person you can leave this part commented out
        //self.playAnimation(self.getAnimation() + "_gold");
    }
}