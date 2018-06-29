//-- Vehicle class --\\
function Vehicle(opts) {
	if(typeof opts === "undefined") opts = {};
	this.position = opts.position || new Vector;
}
Vehicle.prototype.max_speed = 100;

//-- Steering Behaviors --\\

/** @param desired Vector The vehicle's desired velocity. */
Vehicle.prototype.steer = function(desired) {
	desired = desired.limit(this.max_speed);
	var steering = desired.sub(this.velocity);
	return steering.limit(this.max_force);	
	var neighbors = [];
	var sqrD = Math.pow(this.perception, 2);
	vehicles.forEach(function(vehicle){
		if(vehicle == this) return;
	}, this);
}
