$fn=60;
minkowski() {
	difference() {
		cube([50,50,10]);
		cylinder(d=40,h=10);
		translate([50,0,0]) cylinder(d=40,h=10);
		translate([50,50,0]) cylinder(d=40,h=10);
		translate([0,50,0]) cylinder(d=40,h=10);
	}
	sphere(r=1);
}