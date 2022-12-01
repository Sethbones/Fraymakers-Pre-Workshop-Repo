//this is dumb but desperate times call for desperate measures, so basically this might be removed the next update
//this handles vfx spawning, it doesn't work currently

STATE_IDLE = 0;
STATE_JUMP = 1;
STATE_FALL = 2;
STATE_SLAM = 3;
STATE_OUTRO = 4;

function initialize(){
    if (self.getOwner().playFrameLabel() == "dust_small" ){
        self.playAnimation("dust_small");
    }
    with (match.createProjectile("dust_small")) {
        self
    }
}

function update() {
    if (self.finalFramePlayed()){ //checks if the final frame of the current animation has played
        self.destroy(); //destroys object
    }
}