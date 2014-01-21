union() {
	rotate_extrude($fn=100) translate([-8.75,0,0]) rotate([0,0,-90]) difference() {
		resize([3,.7]) circle(1,$fn=30);
		translate([-1.5,-1]) square([3,1]);
	}
	translate([0,0,-1.5]) linear_extrude(.5) difference() {
		circle(r=9.5);
		circle(r=8.75);
		translate([-9.5,0,0]) square(19);
	}
}