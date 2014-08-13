//translate([70,70,0]) cylinder(d=140,h=20);

$fn=30;

union() {
	difference() {
		translate([0,3.4,0]) cube([89,60.6,24]);
		translate([2,5.4,2]) cube([85,56.6,23]);
		#translate([3,3,2]) extpi();
	}
	translate([6.5,9,2]) standoff();
	translate([6.5,58,2]) standoff();
	translate([64.5,9,2]) standoff();
	translate([64.5,58,2]) standoff();
}

module extpi()
{
	union() {
		import("Raspberry_Pi_Model_B+_3D_Assy_STL_Binary.STL");
		// usb
		translate([6.5,-9.7,3]) cube([8.3,13,3]);
		// HDMI
		translate([24,-10,3]) cube([15.9,13,6.7]);
		// Audio/Composite
		translate([53.5,3,6.2]) rotate([90,0,0]) cylinder(d=6.5,h=13);
		// ethernet
		translate([84,4.5,3]) cube([15,16.5,14]);
		// usb 1,2
		translate([84,24,3.3]) cube([15,15,16]);
		// usb 3,4
		translate([84,42,3.3]) cube([15,15,16]);
	}
}

module standoff() 
{
	difference() {
		union() {
			cylinder(d=4.5,h=2);
			cylinder(d=2.5,h=3.2);
		}
		cylinder(d=1,h=3.5);
	}
}
