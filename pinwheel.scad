sides = 5;
angle = 360 / sides;
radius = 60;
rotate([0, 0, $t*angle]) render(convexity=2) difference() {
	union() {
		linear_extrude(10, scale=.25,twist=20,slices=20)
			for (rot = [0 : angle : 360])
				rotate(rot) translate([0,-1.5,0]) square([radius,3],center=false);
		cylinder(h=10,r1=8,r2=2.5,$fn=50);
		translate([0, 0, .8]) minkowski() {
			difference() {
				linear_extrude(2) circle(r=radius,center=true);
				linear_extrude(2) circle(r=radius-.5,center=true);
			}
			sphere(r=1,center=true);
		}
	}
	cylinder(h=8,r=2,$fn=50);
}