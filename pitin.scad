$fn=100;

difference() {
	union() {
		difference() {
			cylinder(r=60,h=20);
			translate([0,0,2]) cylinder(r=58,h=18);
		}
		rotate_extrude()translate([59,20,0])circle(r=1);
	}
	difference() {
		rotate_extrude()translate([59.25,.75,0])square(1.5,center=true);
		rotate_extrude()translate([58.5,1.5,0])circle(r=1.5);
	}
}