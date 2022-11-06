//Script for a projectile that comes out when the player is ko'd
//this creates 8 projectiles each going in seperate directions

function initialize(){
    //required for projectile colors because inheritPalette is broken or too undocumented to be useful
	self.setCostumeIndex(self.getOwner().getCostumeIndex());
}

function update() {
    if (self.finalFramePlayed(PState.ACTIVE)){ //checks if the final frame of the current animation has played
        self.destroy(); //destroys object
    }
}

function onTeardown(){
}