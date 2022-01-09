//this function writes a number to a log file based on the log_type
if (logging = true) {
	function wlog(itxt, log_type) {
	
		if (log_type = "control") { txtfile = "controlforcelog.txt"; }
		else if (log_type = "friction") { txtfile = "frictionlog.txt"; }
		else if (log_type = "frictionforce") { txtfile = "frictionforcelog.txt"; }
		else if (log_type = "force") { txtfile = "forcelog.txt"; }
		else if (log_type = "vector") { txtfile = "vectorlog.txt"; }
		else { txtfile = "generic"; }
	
		glog = file_text_open_append(working_directory + txtfile);
		file_text_write_real(glog, itxt);
		file_text_close(glog);	
	}
}

//We wrap the whole engine in a big if statement so it lets the child entity declare variables first.
if (physics = true){
	
	//Define all variables.
	Ffx = 0; //N
	Ffy = 0; //N

	//Gravitational and Normal force definition.
	Fny = g; //N
	Fgy = -Fny; //N
	//Fnx =

	//Controller input. aka Phantom force.
	//Define x and y force in Newtons.
	Fcx = dx * xforce; //N
	Fcy = dy * yforce; //N

	Fx = 0; //N
	Fy = 0; //N

	Fx = Fx + Fcx; //N
	Fy = Fy + Fcy; //N

	if (logging = true) wlog(Fx, "control");

	//Gravity simulation.
	if (gsim = true) {
		Fy += Fgy; //N
	}

	//Friction simulation.
	if (fsim = true) {
		
		//Coefficients of friction (Just kinetic for now).
		cfx = cf; //Unitless
		//cfy = cf;
		
		//Calculate force of friction from coefficient of friction and perpendicular normal force.
		//Multiplied by sign of Fx to force friction force to be in opposite direction of force applied.
		if (i != 0) {
			Ffx = cfx * Fny; //N
			if (logging = true) wlog(Ffx, "friction");
			if (abs(i) < Ffx) {
				i = 0;
			} else {
				Fx = Fx - (sign(i) * Ffx); //N
				if (logging = true) wlog(Fx, "frictionforce");
			}

		}
	}
	
	//Define fnet as a final product. Used by friction engine in next frame, so separated from f.
	fnetx = Fx;
	fnety = Fy;
	fnet = (fnetx + fnety);

	//Net unit vector calculation. net force = net acceleration because input variables are mass dependent.
	if (fnet != 0) {
		i = i + fnetx; //m/s^2
		//I subtract here instead of add so that higher y-values are up. This will help make things easier to code.
		j = j - fnety;
	}

	//Rotation simulation. **PLACEHOLDER**
	if (rsim = true) {
		
	}

	//x collision with invisible walls.
	if (place_meeting(x+i,y, obj_invisiblewall)){
		while(!place_meeting(x+sign(i),y, obj_invisiblewall)){
			x = x + sign(i);
		}
		i = 0;
	}

	//y collision with invisible walls.
	if (place_meeting(x,y+j, obj_invisiblewall)){
		while(!place_meeting(x,y+sign(j), obj_invisiblewall)){
			y = y + sign(j);
		}
		j = 0;
	}
	
	//y collision with bounce material.
	if (place_meeting(x,y, obj_bouncematerial)){
		j = j - (Fny * 5);
	}
	

	//motion of child object determined by positions plus vectors. Always running.
	x = x + i;
	y = y + j;

	if (logging = true) wlog(fnetx, "force");
	if (logging = true) wlog(i, "vector");

}