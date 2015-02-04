difference() {
	translate([52.7,0,5]) rotate([0,180,0]) resize ([0,60,5],auto=true) import("/Users/rmd/Downloads/Sams_Owl.STL");
	translate([13.5,10,2]) linear_extrude(3.1) text($fn=60,text="CS",size=15,font="Baskerville Old Face");
	translate([13,8,3]) difference() {
		cube([26,18.4,2.1]);
		translate([.5,.5,0]) cube([25,17.4,2.1]);
	}
}

