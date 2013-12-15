difference() {
	union() {
		linear_extrude(10, scale=.25,twist=40,slices=100)
			for (rot = [0 : 45 : 180])
				rotate(rot) square([100,3],center=true);
		cylinder(h=10,r1=8,r2=2.5,$fn=50);
		difference() {
			linear_extrude(2) circle(r=50,center=true);
			linear_extrude(2) circle(r=46,center=true);
		}
	}
	cylinder(h=5,r=4,$fn=50);
}