// API Script for Assist Template Projectile
//this creates a missile like projectile, basically accelerating from 0 to 15

function initialize(){

}

function update() {
    if (self.finalFramePlayed(PState.ACTIVE)){
        Engine.log("dead");
        self.destroy();
    }
}

function onTeardown(){

}