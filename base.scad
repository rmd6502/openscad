$fn=100;
sphereRadius=45;
thickness=1;
switchbaseheight=3.61;
switchtotalheight=9.5;
switchbuttondiameter=3.51;
switchtravel=.012 * 25.4;
meltage=.25;
ridge=5;

outerdiam = sphereRadius + ridge * 2 + meltage*2;
innerdiam = sphereRadius + ridge * 2 - meltage*2-thickness;
render(2) union() {
	difference() {
		cylinder(d=outerdiam,h=switchtotalheight+thickness*2);
		cylinder(d=innerdiam,h=switchtotalheight+thickness*2);
		rotate([0,0,90])translate([innerdiam/2-thickness,0,switchtotalheight]) rotate([0,90,0]) cylinder(d=thickness*2,h=3);
	}
	linear_extrude(thickness*2) difference() {
		circle(outerdiam/2);
		circle(innerdiam/2-ridge+thickness/2);
	}
	for (angle=[0:120:359]) difference() {
		rotate(angle) translate([(innerdiam-4.5)/2,0,thickness]) cylinder(d=5,h=switchtotalheight+thickness);
		rotate(angle) translate([(innerdiam-4.5)/2,0,thickness*2]) cylinder(d=3,h=switchtotalheight);
	}
}