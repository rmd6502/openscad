$fn=80;
union() {
	difference() {
		translate([-1,50,0]) resize([35,50,5],auto=true) rotate([90,0,0]) import("./ALIENWARE_LOGO.STL");
		translate([17.5,42,0]) difference() {
			cylinder(d=4,h=5);
			rotate_extrude() translate([2,0]) resize([1.2,8]) circle(3);
		}
		//translate([10,14,0]) rotate(135) resize([3.5,1.5,3]) cylinder(d=2,h=3);
		//translate([24,14,0]) rotate(45) resize([3.5,1.5,3]) cylinder(d=2,h=3);
	}
	translate([17.5,18,-8.8]) difference() {
		union() {
			difference() {
				cylinder(d=25,h=9);
				translate([0,0,1]) cylinder(d=23,h=8);
			}
			translate([0,0,7.5])rotate_extrude() {
				translate([12.5,0]) difference() {
					square(1.5);
					translate([1.5,0]) circle(1.5);
				}
			}
		}
		translate([-13.5,5,1]) cube([27,10,8]);
	}
}
