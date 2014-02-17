$fn=100;
beaglebone_width = 69.633;
beaglebone_height = 51.843;

union() {
	difference() {
		union() {
			difference() {
				cylinder(r=60,h=20);
				translate([0,0,1]) cylinder(r=59,h=19);
			}
			rotate_extrude()translate([59.5,20,0])circle(r=.5);
		}
		difference() {
			rotate_extrude()translate([59.25,.75,0])square(1.5,center=true);
			rotate_extrude()translate([58.5,1.5,0])circle(r=1.5);
		}
	}
	translate([-beaglebone_width/2,-beaglebone_height/2,1]) minkowski() { 
		linear_extrude(5) import("beaglebone_outline.dxf");
		cube(1);
	}
}