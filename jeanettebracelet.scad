innerCircumference=210;
thickness=2;
PI2 = 2 * 3.1515926;
innerRadius = innerCircumference / PI2;
outerRadius = innerRadius + thickness;
width = 15;

echo ("innerRadius ", innerRadius);
union() {
	render(2) difference() {
		cylinder(r=outerRadius, h=width,$fn=50);
		cylinder(r=innerRadius, h=width,$fn=50);
	
		translate([-outerRadius/2,-outerRadius+18,2.5]) rotate([90,0,0]) linear_extrude(20) resize([outerRadius,0,0],auto=true) import("Jeanette.dxf");
	}
	render(2) difference() {
		cylinder(r=innerRadius, h=width,$fn=50);
		cylinder(r=innerRadius-1, h=width,$fn=50);
	}
}
