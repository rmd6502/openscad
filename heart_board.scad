rotate([0,180,0]) union() {
	difference() {
		translate([-30,0,0]) linear_extrude(2) resize([60,0,0],auto=true) import("outer_heart.dxf");
		translate([-23.5,5,0]) linear_extrude(2) resize([47,0,0],auto=true) import("inner_heart.dxf");
		translate([26.5,53,1]) cylinder(r=2.5,h=2,center=true,$fn=16);
		translate([-13,16,1]) cylinder(r=1.75,h=2,center=true,$fn=16);
		translate([-21.5,26.2,0]) rotate([0,10,19.4]) cube([2,20,3]);
		translate([19.5,26.2,-.5]) rotate([0,-10,-19.4]) cube([2,20,3]);
	}
	translate([0,0,1]) difference() {
		translate([-23.5,5,0]) linear_extrude(1) resize([47,0,0],auto=true) import("inner_heart.dxf");
		translate([-21,8,0]) linear_extrude(1) resize([42,0,0],auto=true) import("inner_heart.dxf");
	}
	translate([-26.5,53,-1]) cylinder(r=2,h=2,center=true,$fn=16);
	translate([13,16,-1]) cylinder(r=1.25,h=2,center=true,$fn=16);
}
