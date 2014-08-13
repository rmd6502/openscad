scale(2.5) union() {
	intersection() {
	translate([-60,15,10]) rotate([90,0,90]) linear_extrude(80) resize([50,50]) import("/Users/rdiamond/Downloads/V_logo.dxf");
	translate([15,0,10]) rotate([90,0,180]) linear_extrude(80) resize([50,50]) import("/Users/rdiamond/Downloads/twitter-logo.dxf");
	}
	translate([-20,50,65]) rotate([0,90,0]) rotate_extrude($fn=80) {
		translate([6,0]) circle(3);
	}
}