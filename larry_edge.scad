
$fn=100;

module larry() {
	translate( [-60,50,0]) {
		// body fill
		translate( [60,-65,0] ) circle( r=55 );
		difference() {
			// bottom of body
			color("limegreen") circle(r=160);
			// top of tail
			translate( [-67,12.5,0] ) circle(r=147.5);
			// top of wing
			translate( [12.5+36,-12.5+153,0] ) circle(r=147.5);
			// top of bottom half of beak
			translate( [-105+265,-105+188,0] ) circle( r=55 );
		}
		// head
		color("hotpink")  translate( [103.5,0,0] ) circle( r=56.5 );
		
		difference() {
			// bottom-most wing feather
			color("green") translate( [-105+104,-56,0] ) circle(r=55);
			translate( [-41,-18,0] ) circle(r=55);
		}
		
		difference() {
			// central wing feather
			color("darkblue") translate( [-105+84,-105+88,0] ) circle( r=55 );
			translate( [-105+57,-105+88+48,0] ) circle( r=55 );
			// clip central wing feather off top of body
			translate( [12.5+36,-12.5+153,0] ) circle(r=147.5);
		}
		
		difference() {
			// top of wing
			color("orange") translate( [-105+83,-105+129,0] ) circle( r=55 );
			translate( [12.5+36,-12.5+153,0] ) circle(r=147.5);
		}
		
		difference() {
			// bottom beak
			color("aqua") translate( [-12.5+82,-12.5+135,0] ) circle( r=147.5 );
			translate( [12.5+36,-12.5+153,0] ) circle(r=147.5);
			translate( [-105+265,-105+188,0] ) circle( r=55 );
			translate( [120,80] ) square( [100,200] );
		}
		
		difference() {
			// top beak
			color("firebrick") translate( [-105+232,-105+180,0] ) circle( r=55 );
			translate( [-12.5+122,-12.5+199,0] ) circle( r=147.5 );
		}
	}
}

linear_extrude(15) difference() {
	minkowski() {
		circle(r=3,center=true);
		larry();
	}
	larry();
}
