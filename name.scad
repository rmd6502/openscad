union() {
	difference() {
		translate([-1, 4, 0]) rotate([0,90,0]) cylinder(h=80,r=5,$fn=50);
		linear_extrude(5) import ("name.dxf");
		translate([-2,-1,-5]) cube([93,10,5]);
	}
	translate([-1,-1,-2]) cube([80,10,2]);
}
