use </Library/Fonts/Arial Rounded Bold.ttf>

intersection() {
	translate([0,18,0]) rotate([90,0,0]) linear_extrude(20) text(text="M", font="Arial Rounded MT Bold", size=15.0);
	translate([3,0,-2])rotate([0,0,0]) linear_extrude(20) text(text="J", font="Arial Rounded MT Bold", size=15.0);
	translate([0,1,0.5]) rotate([90,0,90]) linear_extrude(20) text(text="♥︎", font="Arial", size=17);
}