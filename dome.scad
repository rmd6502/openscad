$fn=100;
sphereRadius=45;
thickness=1;
switchbaseheight=3.61;
switchtotalheight=9.5;
switchbuttondiameter=3.51;
switchtravel=.012 * 25.4;
meltage=.25;
ridge=5;

innerdiam = sphereRadius*2 + ridge - meltage + thickness;
union() {
	difference() {
		sphere(r=sphereRadius);
		sphere(r=sphereRadius-thickness);
		translate([-sphereRadius,-sphereRadius,0]) cube([2*sphereRadius,2*sphereRadius,sphereRadius]);
	}
	difference() {
		translate([0,0,-sphereRadius+.5]) cylinder(d=switchbuttondiameter+thickness+meltage,h=sphereRadius-.5);
		cylinder(d=switchbuttondiameter+meltage,h=switchtravel/2+meltage);
	}

	difference() {
		linear_extrude(thickness*2) difference() {
			circle(sphereRadius+ridge);
			circle(sphereRadius-thickness-meltage);
		}
		for (angle=[0:120:359]) difference() {
			rotate(angle) translate([(innerdiam-4.5)/2,0,0-.5]) cylinder(d=5,h=switchtotalheight+thickness);
		}
	}
}