$fn=50;
resize([0,40,0],auto=true) union() {
	translate([-32,-47,0]) resize([100,0,0],auto=true) linear_extrude(5) import ("rooster.dxf");
	difference() {
		translate([40,8,2]) rotate([90,0,0]) cylinder(d=4,h=60);
		translate([39.25,-52,0]) cube([1.5,3,4]);
	}
	cube([95,4,4]);
	translate([12,-5.5,0]) linear_extrude(4) polygon(points=[[0,0],[-25,7.5],[0,15],[-10,7.5],[0,0]]);
}