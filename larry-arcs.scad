
$fn=100;

module larry() {
	translate( [-60,50,0]) {
		// body fill
		linear_extrude(10) translate( [60,-65,0] ) circle( r=55 );
		difference() {
			// bottom of body
			linear_extrude(5) circle(r=160);
			// top of tail
			linear_extrude(10) translate( [-67,12.5,0] ) circle(r=147.5);
			// top of wing
			linear_extrude(20)translate( [12.5+36,-12.5+153,0] ) circle(r=147.5);
			// top of bottom half of beak
			linear_extrude(15) translate( [-105+265,-105+188,0] ) circle( r=55 );
		}
		// head
		linear_extrude(8) translate( [103.5,0,0] ) circle( r=56.5 );
		
		linear_extrude(20) difference() {
			// bottom-most wing feather
			translate( [-105+104,-56,0] ) circle(r=55);
			translate( [-41,-18,0] ) circle(r=55);
		}
		
		linear_extrude(25) difference() {
			// central wing feather
			translate( [-105+84,-105+88,0] ) circle( r=55 );
			translate( [-105+57,-105+88+48,0] ) circle( r=55 );
			// clip central wing feather off top of body
			translate( [12.5+36,-12.5+153,0] ) circle(r=147.5);
		}
		
		linear_extrude(15) difference() {
			// top of wing
			color("orange") translate( [-105+83,-105+129,0] ) circle( r=55 );
			translate( [12.5+36,-12.5+153,0] ) circle(r=147.5);
		}
		
		linear_extrude(10) difference() {
			// bottom beak
			color("teal") translate( [-12.5+82,-12.5+135,0] ) circle( r=147.5 );
			translate( [12.5+36,-12.5+153,0] ) circle(r=147.5);
			translate( [-105+265,-105+188,0] ) circle( r=55 );
			translate( [120,80] ) square( [100,200] );
		}
		
		linear_extrude(5) difference() {
			// top beak
			color("firebrick") translate( [-105+232,-105+180,0] ) circle( r=55 );
			translate( [-12.5+122,-12.5+199,0] ) circle( r=147.5 );
		}
	}
}

larry();