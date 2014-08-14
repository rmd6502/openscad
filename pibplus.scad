//translate([70,70,0]) cylinder(d=140,h=20);

$fn=30;

union() {
	difference() {
		translate([0,3.4,0]) cube([90,62,24]);
		translate([2,5.4,2]) cube([87,59,23]);
		#translate([4.5,4.5,2]) extpi();
	}
	translate([8,10.5,2]) standoff();
	translate([8,59.5,2]) standoff();
	translate([66,10.5,2]) standoff();
	translate([66,59.5,2]) standoff();
}

module extpi()
{
	union() {
		import("Raspberry_Pi_Model_B+_3D_Assy_STL_Binary.STL");
		// usb
		translate([5.7,-9.7,2]) cube([10,15,5]);
		// HDMI
		translate([21.5,-10,2]) cube([19.9,13,8.7]);
		// Audio/Composite
		translate([53.5,3,6.2]) rotate([90,0,0]) cylinder(d=8.5,h=13);
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
