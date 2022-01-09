//Define kilogram in terms of itself. We can define this as arbitrary for now.
//kg = 1;
//Define meter in terms of pixels. 1 meter = 128 pixels.
m = 100;
//Define second in terms of frames. 1 second = 60 frames.
s = 60;

//Define gravity in terms of meters/second^2.
g = 0.6;
//Earth gravity: 0.3488

cf = 0;

//Define direction of force.
dx = 0;
dy = 0;

//Define unit vectors.
i = 0;
j = 0;

//Initiate fnetx and fnety as 0.
fnetx = 0;
fnety = 0;

//Set to false, inherited by child until variables set up. Then physics is switched on.
//Physics simulation toggle.
physics = false;
//Friction simulation toggle.
fsim = false;
//Rotation simulation toggle.
rsim = false;
// turn on and off logging.
logging = false;