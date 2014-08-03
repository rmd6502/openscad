apple_outline();

module apple_outline() {
	difference() {
		minkowski() {
			linear_extrude(1) apple();
			cube(2);
		}
		translate([1,1,-1]) linear_extrude(4) apple();
	}
}

module apple() {
import("/Users/rmd/Documents/apple bar sinister.dxf");
}