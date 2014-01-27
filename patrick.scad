union() {
translate([0,14,-.1]) intersection() {
	rotate([90,0,0]) linear_extrude(8) resize([48,0],auto=true) import ("/Users/rmd/Documents/Patrick.dxf");
	translate([24,-4,6]) linear_extrude(12,scale=[1,.25],center=true) square([48,8],center=true);
}
	translate([0,0,-3.6]) cube([48,20,1]);
//difference() {
	translate([0,10,-1.1])linear_extrude(3,scale=[1,.5],center=true) translate([0,-10]) square([48,20]);
	//translate([5.5,10,-10]) cylinder(r=3,h=10,$fn=20);
	//translate([17,10,-10]) cylinder(r=3,h=10,$fn=20);
	//translate([27,10,-10]) cylinder(r=3,h=10,$fn=20);
	//translate([40,10,-10]) cylinder(r=3,h=10,$fn=20);
//}
translate([29.6,8.5,7.4]) cube([.8,3,2]);
}