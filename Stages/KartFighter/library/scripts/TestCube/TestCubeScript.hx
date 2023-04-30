self.exports = {
    currentplayer: self.makeObject(null),
    player1Xcord: self.makeFloat(0),
	player2Xcord: self.makeFloat(0)
};

var activeplayers = [];
var movespeed:Float = 2.5;
var jumpheight:Float = 10;
var isAttacking:Bool = false;
var groundstate:Int = 1;
//0 - crouch
//1 - ground
//2 - air
var inputdelay:Float = 0.01; //currently not implemented, this is a workaround for moves being able to be spammed causing states to mix, like if you hold crouch and punch you can still jump
var currentInputDelay:Float = inputdelay;
var canMove:Bool = true;
var specialAinput:Array<string> = ["DOWN","RIGHT","ATTACK"];
var specialBinput:Array<string> = [];
var specialCinput:Array<string> = [];
var inputRead:Array<string> = [];
var spawnprojectile = self.makeObject(null);
var readDelay:Float = 50;
var charID:Int = 0;
//-1 - bloxxy
//0 - mari
//1 - luig
//2 - yossy
//3 - peach
//4 - kinopio
//5 - donkey
//6 - nokonoko
//7 - bowser

function initialize(){
    self.addEventListener(GameObjectEvent.HIT_RECEIVED, ongettingthesmackdown, {persistent: true});
    self.setState(PState.ACTIVE);
}

function update(){
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
        readDelay--;
        if (readDelay <= 0){
            inputRead = [];
            readDelay = 50;
        }
    }
    else{
        readDelay = 50;
    }

    //Engine.log(inputRead);


    //CHARACTER DIRECTION FLIPPER
    if (self.exports.player1Xcord.get() < self.exports.player2Xcord.get()){
        //Engine.log("is to the left of the sceond of player");
        self.faceRight();
        //self.setScaleX(-1);
        //self.setScaleX(-1);
    }
    else{
        //self.flip();
        //self.setScaleX(1);
        //Engine.log("is to the right of the sceond of player");
        self.faceLeft();
        //self.flip();
        //self.setScaleX(1);
    }

    //ARRAY LIMITER
    if (inputRead.length > 6){//this is not an amazing way to do input buffers but i don't know any better way to be honest
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
    Engine.log(inputstr);

    if (inputstr.indexOf(specialAstr) != -1){
        self.playAnimation("specialA");
        Engine.log("hadooken or whatever");
        isAttacking = true;
        inputRead = [];
    }
    else if (inputstr.indexOf(specialBstr) != -1){
        self.playAnimation("specialB");
        Engine.log("flying kick or whatever");
        isAttacking = true;
        inputRead = [];
    }
    else if (inputstr.indexOf(specialCstr) != -1){
        self.playAnimation("specialC");
        Engine.log("hadooken or whatever");
        isAttacking = true;
        inputRead = [];
    }
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
        if (isAttacking == false) {
            if (groundstate == 1){//checks for when standing
                if(self.isOnFloor() && self.exports.currentplayer.get().getHeldControls().DOWN){
                groundstate = 0;
                }
                else if (self.exports.currentplayer.get().getPressedControls().ATTACK && isAttacking == false){
                    isAttacking = true;
                    playAnim("stand_punch");
                }
                else if (self.exports.currentplayer.get().getPressedControls().SPECIAL && isAttacking == false){
                    isAttacking = true;
                    playAnim("stand_kick");
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
                if (self.exports.currentplayer.get().getPressedControls().ATTACK && isAttacking == false){
                    isAttacking = true;
                    playAnim("crouch_punch");
                }
                else if (self.exports.currentplayer.get().getPressedControls().SPECIAL && isAttacking == false){
                    isAttacking = true;
                    playAnim("crouch_kick");
                }
                else if (self.isOnFloor() && self.exports.currentplayer.get().getHeldControls().DOWN){
                    self.setXSpeed(0);
                    playAnim("crouch");
                }
                
                else{
                    groundstate = 1;
                }
            }

            if (groundstate == 2){//checks for when jumping
                if (self.exports.currentplayer.get().getPressedControls().ATTACK && isAttacking == false){
                    isAttacking = true;
                    playAnim("jump_punch");
                }
                else if (self.exports.currentplayer.get().getPressedControls().SPECIAL && isAttacking == false){
                    isAttacking = true;
                    playAnim("jump_kick");
                }
                else {playAnim("jump");}
            }
            
            if (self.isOnFloor() == false){
                groundstate = 2; //set state to air
            }
            else if (groundstate != 0){
                groundstate = 1;
            }

            if (self.isOnFloor() && self.exports.currentplayer.get().getHeldControls().UP){
                self.setYSpeed(-jumpheight);
            }
    }
    //self.exports.currentplayer.get().getHeldControls();
    //Engine.log(self.exports.currentplayer.get().getXVelocity());
    }
}

function ongettingthesmackdown(event){
    //HURT ANIMATIONS
    if (event.data.self.getDamage() > 10){
        self.playAnimation("hurt_heavy");
        event.data.self.setXSpeed(-7.5);
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

function playAnim(animplayer:string){
    //this is so the animation doesn't repeat itself after being played
    //Engine.log(self.getAnimation());
    if (self.getAnimation() != animplayer){
        self.playAnimation(animplayer);
    }

}

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

// function compareArrays(arr1:Array<string>, arr2:Array<string>) {
//     if (arr1.length != arr2.length) {
//         return false;
//     }
//     for (i = 0; i < arr1.length; i++) {
//         if (arr1[i] != arr2[i]) {
//         return false;
//         }
//     }

//     return true;
// }