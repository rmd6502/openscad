use </Users/rmd/Library/Fonts/OpenSansEmoji.ttf>

union() {
	translate([0,4,2]) linear_extrude(2) text(font="OpenSansEmoji",size=12,t="💉🔪👃");
	cube([59,23,2]);
	translate([30,27,1]) {
		rotate_extrude($fn=70) {
			translate([4,0,0]) circle(1);
		}
	}
}