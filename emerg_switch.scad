$fn=100;
sphereRadius=45;
thickness=1;
switchbaseheight=3.61;
switchtotalheight=9.5;
switchbuttondiameter=3.51;
switchtravel=.012 * 25.4;
switchlenwid=5.99;
meltage=.25;
ridge=5;

outerdiam = (sphereRadius + ridge  + meltage)*2;
innerdiam = (sphereRadius + ridge - meltage)*2-thickness;

module base() {
	union() {
		difference() {
			cylinder(d=outerdiam,h=switchtotalheight+thickness*2);
			cylinder(d=innerdiam,h=switchtotalheight+thickness*2);
			rotate([0,0,90])translate([innerdiam/2-thickness,0,switchtotalheight]) rotate([0,90,0]) cylinder(d=thickness*2,h=3);
		}
		linear_extrude(thickness*2) difference() {
			circle(outerdiam/2);
			circle(sphereRadius+meltage);
		}
		for (angle=[0:120:359]) difference() {
			rotate(angle) translate([(innerdiam-ridge)/2+thickness,0,thickness]) cylinder(d=5,h=switchtotalheight+thickness);
			rotate(angle) translate([(innerdiam-ridge)/2+thickness,0,thickness*2]) cylinder(d=3,h=switchtotalheight);
		}
	}
}

module dome() {
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
				circle(sphereRadius+ridge-thickness);
				circle(sphereRadius-thickness-meltage);
			}
			for (angle=[0:120:359]) difference() {
			rotate(angle) translate([(innerdiam-ridge)/2+thickness,0,0]) cylinder(d=ridge+thickness,h=switchtotalheight+thickness);
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
	difference() {
		cylinder(d=outerdiam, h=thickness*2);
		for (angle=[0:120:359]) difference() {
			rotate(angle) translate([(innerdiam-ridge)/2+thickness,0,0]) cylinder(d=3,h=switchtotalheight);
		}
		#rotate([0,0,90])translate([0,0,thickness]) switch();
		translate([-switchlenwid/2 -meltage,-innerdiam/2+switchlenwid/2-thickness,thickness]) cube([switchlenwid+meltage*2,innerdiam/2-switchlenwid-meltage*2,1]);
		translate([-innerdiam/2+25,innerdiam/2-25,thickness]) linear_extrude(thickness) text(t="© 2014 Robert ◊",size=5,font="LiberationSans");
		translate([-innerdiam/2+20,innerdiam/2-35,thickness]) linear_extrude(thickness) text(t="All Rights Reserved",size=5,font="LiberationSans");
	}
}

//base();
//translate([0,0,thickness*5]) dome();
//translate([0,0,switchtotalheight+thickness*4]) rotate([180,0,0])  
bottom();
//switch();
