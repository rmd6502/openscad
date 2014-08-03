use </Library/Fonts/Arial Rounded Bold.ttf>

union() {
	intersection() {
		translate([0,18,0]) rotate([90,0,0]) linear_extrude(20) text(t="R", font="ArialRoundedMTBold", size=15.0);
		rotate([90,0,90]) linear_extrude(20) text(t="M", font="ArialRoundedMTBold", size=15.0);
		translate([0,1.5,-2]) rotate([0,0,0]) linear_extrude(20) text(t="D", font="ArialRoundedMTBold", size=15.5);
	}
	translate([11.1,5.6,5]) cube([1,6,3]);
}