self.exports = {
    currentplayer: self.makeObject(null),
    player1Xcord: self.makeFloat(0),
	player2Xcord: self.makeFloat(0)
};

//CONSTANTS
var readDelay:Float = 60; //assuming 60fps, that means every 60 means 1 second
var movespeed:Float = 2.5;
var jumpheight:Float = 10;


var FIGHTBUTTON = {//this is to get around accidentaly typing and being one letter off and or mistyping (in general the plan is to turn these all into integers) 
    LEFT: "LEFT",
    RIGHT: "RIGHT",
    UP: "UP",
    DOWN: "DOWN",
    ATTACK: "ATTACK",
    SPECIAL: "SPECIAL"
};

var groundstate:Int = 1;
//0 - crouch
//1 - ground
//2 - air
var activeplayers = [];
var isAttacking:Bool = false;
var canMove:Bool = true; //a general use state for checking if any kind of movement is possible
var specialAinput:Array<string> = ["DOWN","RIGHT","ATTACK"];
var specialBinput:Array<string> = [];
var specialCinput:Array<string> = [];
var inputRead:Array<string> = [];
var spawnprojectile = self.makeObject(null);
var currentReadDelay = readDelay;
var charID:Int = 0;
//-1 - bloxxy
//0 - mari
//1 - luigi
//2 - yossy
//3 - peach
//4 - kinopio
//5 - donkey
//6 - nokonoko
//7 - koopa
//var FState:Int = 0;
//var charResource = self.getResource().getContent("KartLuigi");
//self.updateGameObjectStats({spriteContent: self.getResource().getContent("KartProjectiles")});
var FState = {//not to be confused with CState, this is basically CStates but for FrayFighter
    INTRO: 0,
    IDLE: 1,
    WALK_IN: 2,
    WALK_LOOP: 3,
    WALK_OUT: 4,
    CROUCH_IN: 5,
    CROUCH_LOOP: 6,
    CROUCH_OUT: 7,
    JUMP_IN: 8,
    JUMP_LOOP: 9,
    JUMP_OUT: 10,
    FALL_IN: 11,
    FALL_LOOP: 12,
    LAND: 13
};



function initialize(){
    self.addEventListener(GameObjectEvent.HIT_RECEIVED, ongettingthesmackdown, {persistent: true});
    Engine.log(self.getResource().getContent("TestCube"));
    Engine.log(self.getGameObjectStat("spriteContent"));
    //self.addEventListener(FState, onStateChange, {persistent: true});
    self.setState(PState.ACTIVE);
    Engine.log(self.getTotalFrames());
}

function onStateChange(){

}
function update(){
    //hacky as fuck workaround to get rid of the offscreen indicator
    //basically puts them in an unreachable spot, then hides them
    self.exports.currentplayer.get().setX(0);
    self.exports.currentplayer.get().setY(-150);
    self.exports.currentplayer.get().getDamageCounterContainer().alpha = 0;
    self.exports.currentplayer.get().setVisible(false);


    //SPECIAL MOVE INPUT UPDATE
    if (self.isFacingLeft()){
        specialAinput = ["DOWN","LEFT","ATTACK"];
        specialBinput = ["RIGHT","RIGHT","SPECIAL"];
        specialCinput = ["RIGHT","LEFT","ATTACK"];

    }
    else if (self.isFacingRight()){
        specialAinput = ["DOWN","RIGHT","ATTACK"];
        specialBinput = ["LEFT","LEFT","SPECIAL"];
        specialCinput = ["LEFT","RIGHT","ATTACK"];
    }
    
    if (inputRead != []){
        currentReadDelay--;
        if (currentReadDelay <= 0){
            inputRead = [];
            currentReadDelay = readDelay;
        }
    }
    else{
        currentReadDelay = readDelay;
    }

    //Engine.log(inputRead);


    //CHARACTER DIRECTION FLIPPER
    if (self.exports.player1Xcord.get() < self.exports.player2Xcord.get()){
        //Engine.log("is to the left of the second player");
        self.faceRight();
    }
    else{
        //Engine.log("is to the right of the second player");
        self.faceLeft();
    }

    //ARRAY LIMITER
    if (inputRead.length > 6){//this is not an amazing way to do input buffers but i don't know any better way to be honest
    //buffer might be too small but i really dont want it too big
        inputRead.shift();
    }

    //FEEDING INPUT TO AN ARRAY
    if (self.exports.currentplayer.get().getPressedControls().DOWN){
        //inputRead.push(self.exports.currentplayer.get().getHeldControls().DOWN);
        inputRead.push("DOWN");
    }
    if (self.exports.currentplayer.get().getPressedControls().UP){
        //inputRead.push(self.exports.currentplayer.get().getHeldControls().UP);
        inputRead.push("UP");
    }
    if (self.exports.currentplayer.get().getPressedControls().LEFT){
       //inputRead.push(self.exports.currentplayer.get().getHeldControls().LEFT);
        inputRead.push("LEFT");
    }
    if (self.exports.currentplayer.get().getPressedControls().RIGHT){
        //inputRead.push(self.exports.currentplayer.get().getHeldControls().RIGHT);
        inputRead.push("RIGHT");
    }
    if (self.exports.currentplayer.get().getPressedControls().ATTACK){
        //inputRead.push(self.exports.currentplayer.get().getHeldControls().ATTACK);
        inputRead.push("ATTACK");
    }
    if (self.exports.currentplayer.get().getPressedControls().SPECIAL){
        //inputRead.push(self.exports.currentplayer.get().getHeldControls().SPECIAL);
        inputRead.push("SPECIAL");
    }
    //Engine.log(self.exports.player1Xcord.get());
    //Engine.log(self.exports.player2Xcord.get());
    //Engine.log(self.exports.currentplayer.get());
    //activeplayers = match.getPlayers();
    self.exports.currentplayer.get().pause();
    //Engine.log(self.exports.currentplayer.get().getHeldControls());
    var inputstr = inputRead.join("");
    var specialAstr = specialAinput.join("");
    var specialBstr = specialBinput.join("");
    var specialCstr = specialCinput.join("");
    
    //Engine.log(inputstr);
    //old special move code
    // if (inputstr == specialAstr){
    //     self.playAnimation("specialA");
    //     Engine.log("hadooken or whatever");
    //     isAttacking = true;
    //     inputRead = [];
    //     inputstr.indexOf()
    // }

    //MOVEMENT CODE
    if (canMove){

        //GROUNDSTATE CHANGER
        if (self.isOnFloor() == false){
            groundstate = 2; //set state to air
        }
        else if (groundstate != 0){
            groundstate = 1;
        }

        if (isAttacking == false) {

            if (groundstate == 1){//checks for when standing
                if(self.isOnFloor() && self.exports.currentplayer.get().getHeldControls().DOWN){
                   groundstate = 0;
                }
                else if (inputstr.indexOf(specialAstr) != -1){
                    playAttack("specialA", true, true);
                }
                else if (inputstr.indexOf(specialBstr) != -1){
                    playAttack("specialB", true, true);
                }
                else if (inputstr.indexOf(specialCstr) != -1){
                    playAttack("specialC", true, true);
                }
                else if(getLastInput("ATTACK")){
                    playAttack("stand_punch", true, true);
                }
                else if(getLastInput("SPECIAL")){
                    playAttack("stand_kick", true, true);
                }
                else if (self.exports.currentplayer.get().getHeldControls().RIGHT){
                    if (self.isFacingLeft()){
                        self.setXSpeed(-movespeed);
                    }
                    else if (self.isFacingRight()){
                       self.setXSpeed(movespeed); 
                    }
                playAnim("walk");
                }
                else if (self.exports.currentplayer.get().getHeldControls().LEFT){
                    if (self.isFacingLeft()){
                        self.setXSpeed(movespeed);
                    }
                    else if (self.isFacingRight()){
                       self.setXSpeed(-movespeed); 
                    }
                    playAnim("walk");
                }
                else{
                    self.setXSpeed(0);
                    playAnim("stand");
                }
            }

            if (groundstate == 0){ //checks for when crouching
                if (self.isOnFloor() && self.exports.currentplayer.get().getHeldControls().DOWN){
                    if(getLastInput("ATTACK")){
                        playAttack("crouch_punch", true, true);
                    }
                    else if(getLastInput("SPECIAL")){
                        playAttack("crouch_kick", true, true);
                    }
                    else{
                        self.setXSpeed(0);
                        playAnim("crouch");
                    }
                }
                
                else{
                    if (self.isOnFloor() && self.exports.currentplayer.get().getHeldControls().UP && self.exports.currentplayer.get().getHeldControls().RIGHT){
                        if (self.isFacingLeft()){
                            self.setXSpeed(-movespeed);
                        }
                        else if (self.isFacingRight()){
                            self.setXSpeed(movespeed); 
                        }
                    }
                    else if (self.isOnFloor() && self.exports.currentplayer.get().getHeldControls().UP && self.exports.currentplayer.get().getHeldControls().LEFT){
                        if (self.isFacingLeft()){
                            self.setXSpeed(movespeed);
                        }
                        else if (self.isFacingRight()){
                            self.setXSpeed(-movespeed); 
                        }
                    }
                    else{
                        groundstate = 1;
                    }
                }
            }

            if (groundstate == 2){//checks for when jumping
                if(getLastInput("ATTACK")){
                    playAttack("jump_punch", true, true);
                }
                else if(getLastInput("SPECIAL")){
                    playAttack("jump_kick", true, true);
                }
                else {playAnim("jump");}
            }

            if (self.isOnFloor() && self.exports.currentplayer.get().getHeldControls().UP){
                self.setYSpeed(-jumpheight);
                AudioClip.play(self.getResource().getContent("projectilesound"));
            }
    }
    //self.exports.currentplayer.get().getHeldControls();
    //Engine.log(self.exports.currentplayer.get().getXVelocity());
    }
}

//EVENTLISTENER FUNCTIONS
function ongettingthesmackdown(event){
    //HURT ANIMATIONS
    if (event.data.self.getDamage() >= 10){
        self.playAnimation("hurt_heavy");
        event.data.self.setXSpeed(-3);
        event.data.self.setYSpeed(-10);
    }
    else{
        self.playAnimation("hurt");
        event.data.self.setXSpeed(-5);
    }
    Engine.log("ow");
    Engine.log(event.data.self.getDamage());
    event.data.self.setDamage(0);
    canMove = false;
}


//HELPER FUNCTIONS
//basically these functions exist to make the job easier
function playAnim(animplayer:string){
    //this is so the animation doesn't repeat itself after being played
    //Engine.log(self.getAnimation());

    if (self.getAnimation() != animplayer){
        self.playAnimation(animplayer);
    }

}

function playAttack(animation:string, clearBuffer:boolean = false, isAttack:boolean = false){
    //needs checks for overheads and combo cancels and guard ignore as well as a bunch of other shite the should probably be in options:{}
    //if isAttackFinished //plans for combos, and also for replacing or adding onto isAttacking 
    //also considering baking everything into playAnim
    playAnim(animation);
    if (clearBuffer == true){
        inputRead = [];
    }
    if (isAttack == true){
        isAttacking = true;
    }
}

// function spawnprojectile(ContentID:string = "KartProjectiles",Xoffset:Float = 0, Yoffset:Float = 0, Speed:Float = 5){
function spawnprojectile(){
    //var spawnprojectile = self.makeObject(null);
    var projectileshot = match.createProjectile(self.getResource().getContent("KartProjectiles"), self);
    projectileshot.setXSpeed(5);
    projectileshot.setY(50);
    
    //self.getViewRootContainer().addChild("KartProjectiles");
    //match.createProjectile(self.getResource().getContent("KartProjectiles"), self);
    //match.createProjectile(self.getResource().getContent("KartProjectiles"));
    //Engine.log("Kabom");
}

function getLastInput(input:string){ //test
    //gets the last input done by the user and compares it to the function input string
    if (inputRead.length != 0 && inputRead[inputRead.length - 1] == input){
        return true;
    }
    else{
        return false;
    }
}