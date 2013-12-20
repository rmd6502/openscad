sides = 5;
angle = 360 / sides;
radius = 67;
rotate([0, 0, $t*angle]) render(convexity=2) union() {
	difference() {
		union() {
			linear_extrude(10, scale=.25,twist=20,slices=20) for (rot = [0 : angle : 360])
				rotate(rot) translate([0,-1.5,0]) square([radius,3],center=false);
			cylinder(h=10,r1=8,r2=2.5,$fn=30);
		}
		cylinder(h=8,r=1.5,$fn=20);
		difference() {
			cylinder(r=radius+.5,h=10,slices=50);
			cylinder(r=radius*.85,h=10, slices=50);
		}
	}
	translate([0,0,1.5]) rotate_extrude(convexity=10,slices=100) translate([radius*.85,0,0]) rotate([90,0,0]) circle(r=1.5,center=true,$fn=40);
}
