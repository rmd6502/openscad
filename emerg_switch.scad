$fn=80;
sphereRadius=35;
thickness=1;
switchbaseheight=3.61;
switchtotalheight=9.5;
switchbuttondiameter=3.51;
switchtravel=.012 * 25.4;
switchlenwid=5.99;
meltage=.25;
ridge=6;
chamfer_radius =.75;

outerdiam = (sphereRadius + ridge  + meltage)*2;
innerdiam = (sphereRadius + ridge - meltage)*2-thickness;

module base() {
	union() {
		 difference() {
			translate([0,0,thickness]) cylinder(d=outerdiam,h=switchtotalheight+thickness);
			translate([0,0,thickness]) cylinder(d=innerdiam,h=switchtotalheight+thickness);
			rotate([0,0,90])translate([innerdiam/2-thickness,0,switchtotalheight]) rotate([0,90,0]) cylinder(d=thickness*2,h=3);
		}

		difference() {
			linear_extrude(thickness*2) difference() {
				circle(outerdiam/2);
				circle(sphereRadius+meltage);
			}
			// chamfer
			rotate_extrude() translate([outerdiam/2-chamfer_radius*2, 0, switchtotalheight+thickness*2-chamfer_radius*2]) difference() {
				square(chamfer_radius*2);
				translate([0,chamfer_radius*2]) circle(chamfer_radius*2);
			}
		}
		
		render(2) for (angle=[0:120:359]) difference() {
			rotate(angle) translate([(innerdiam-ridge)/2+thickness,0,thickness]) cylinder(d=5.5,h=switchtotalheight+thickness);
			rotate(angle) translate([(innerdiam-ridge)/2+thickness,0,thickness*2]) cylinder(d=4,h=switchtotalheight);
		}
	}
}

module dome() {
	translate([0,0,-thickness*2]) union() {
		difference() {
			sphere(r=sphereRadius);
			sphere(r=sphereRadius-thickness);
			translate([-sphereRadius,-sphereRadius,0]) cube([2*sphereRadius,2*sphereRadius,sphereRadius]);
		}
		difference() {
			translate([0,0,-sphereRadius+thickness/2]) cylinder(d=switchbuttondiameter+thickness+meltage,h=sphereRadius+thickness*2-meltage*2);
			translate([0,0,thickness*2-switchtravel-meltage/2]) cylinder(d=switchbuttondiameter+meltage,h=switchtravel+meltage);
		}
	
		difference() {
			linear_extrude(thickness*2) difference() {
				circle(sphereRadius+ridge-thickness);
				circle(sphereRadius-thickness-meltage);
			}
			for (angle=[0:120:359]) difference() {
			rotate(angle) translate([(innerdiam-ridge)/2+thickness,0,0]) cylinder(d=ridge+thickness*2,h=switchtotalheight+thickness);
			}
		}
	}
}

module switch() {
	union() {
		translate([-switchlenwid/2 -meltage,-switchlenwid/2-meltage,0]) cube([switchlenwid+meltage*2,switchlenwid+meltage*2,switchbaseheight]);
		translate([-switchlenwid/2 -meltage-2.2,-switchlenwid/2-meltage+1.1,0]) cube([2.2,1.1,1]);
		translate([-switchlenwid/2 -meltage-2.2,switchlenwid/2-meltage-1.1,0]) cube([2.2,1.1,1]);
		translate([switchlenwid/2 +meltage,-switchlenwid/2-meltage+1.1,0]) cube([2.2,1.1,1]);
		translate([switchlenwid/2 +meltage,switchlenwid/2-meltage-1.1,0]) cube([2.2,1.1,1]);
		cylinder(d=switchbuttondiameter, h=switchtotalheight);
	}
}

module bottom() {
	render(2) difference() {
		cylinder(d=outerdiam, h=thickness*2);
		for (angle=[0:120:359]) difference() {
			rotate(angle) translate([(innerdiam-ridge)/2+thickness,0,0]) cylinder(d=4,h=switchtotalheight);
		}
		#rotate([0,0,90])translate([0,0,thickness]) switch();
		translate([-switchlenwid/2 -meltage,-innerdiam/2+switchlenwid/2-thickness,thickness]) cube([switchlenwid+meltage*2,innerdiam/2-switchlenwid-meltage*2,1]);
		translate([-innerdiam/2+18,innerdiam/2-18,thickness]) linear_extrude(thickness) text($fn=40, t="© 2014 Robert ◊",size=4,font="LiberationSans");
		translate([-innerdiam/2+15,innerdiam/2-25,thickness]) linear_extrude(thickness) text($fn=40, t="All Rights Reserved",size=4,font="LiberationSans");
	}
}

//base();
/* translate([0,0,thickness*5]) */dome();
//translate([0,0,switchtotalheight+thickness*5]) rotate([180,0,0])  
	//bottom();
//switch();
