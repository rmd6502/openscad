rotate([90,0,0]) union() {
	intersection() {
			linear_extrude(5) resize([60,0,0],auto=true) import("/Users/rmd/Documents/matthew.dxf");
		translate([-1,5.75,2.4]) scale([1,3,1]) rotate([0,90,0])cylinder(r=2.2,h=62,$fn=70);
	}

	difference() {
		translate([-2.5,-2.66,2.5]) rotate([0,90,0]) cylinder(h=65,r=3,$fn=40);
		translate([-3,-11.83,-1]) cube([66,7,7]);
	}
}