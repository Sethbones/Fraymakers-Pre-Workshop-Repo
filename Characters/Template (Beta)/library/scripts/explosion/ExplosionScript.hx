
function update() {
    if (self.finalFramePlayed(PState.ACTIVE)){ //checks if the final frame of the current animation has played
        self.destroy(); //destroys object
    }
}