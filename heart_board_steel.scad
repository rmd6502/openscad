rotate([0,180,0]) union() {
	difference() {
		translate([-32.5,-1.75,0]) linear_extrude(3.5) resize([65,0,0],auto=true) import("outer_heart.dxf");
		translate([-23.5,5,0]) linear_extrude(3.5) resize([47,0,0],auto=true) import("inner_heart.dxf");
		translate([27.5,53,1.75]) cylinder(r=2.25,h=3.5,center=true,$fn=16);
		translate([-14,16,1.75]) cylinder(r=1.5,h=3.5,center=true,$fn=16);
		translate([-21.15,22,0]) rotate([0,10,19.4]) cube([2,24,4]);
		translate([19.2,22,-0.5]) rotate([0,-10,-19.4]) cube([2,24,4]);
		// For pointed tip comment this line and the last
		translate([-2.4,-1.75,0]) cube([5,2,3.5]);
	}
	translate([0,0,.8]) difference() {
		translate([-23.5,5,0]) linear_extrude(2.7) resize([47,0,0],auto=true) import("inner_heart.dxf");
		translate([-22,7,0]) linear_extrude(2.7) resize([44,0,0],auto=true) import("inner_heart.dxf");
	}
	translate([-27.5,53,-1]) cylinder(r=2,h=3.5,center=true,$fn=16);
	translate([14,16,-1]) cylinder(r=1.25,h=3.5,center=true,$fn=16);
	// for pointed tip comment this line and the indicated one above
    translate([0.16,1.25,0]) scale([1.1,.9,1]) linear_extrude(3.5) circle(2.2,$fn=20);
}
