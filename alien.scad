$fn=80;
union() {
	difference() {
		translate([-1,50,0]) resize([35,50,0],auto=true) rotate([90,0,0]) import("./ALIENWARE_LOGO.STL");
		translate([17.5,42,0]) difference() {
			cylinder(d=4,h=3);
			rotate_extrude() translate([2,0]) resize([1.2,3.7]) circle(3);
		}
		//translate([10,14,0]) rotate(135) resize([3.5,1.5,3]) cylinder(d=2,h=3);
		//translate([24,14,0]) rotate(45) resize([3.5,1.5,3]) cylinder(d=2,h=3);
	}
	translate([17.5,18,-8]) difference() {
		cylinder(d=25,h=8);
		translate([0,0,2]) cylinder(d=23,h=6);
		translate([-11.5,5,2]) cube([23,10,6]);
	}
}
