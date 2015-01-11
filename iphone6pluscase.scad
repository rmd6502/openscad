height = 158.07;
width = 77.79;
depth = 7.10;

radius = 10.3;

casethickness=1.6;
extra=.5;

addend = extra*2 - depth;
$fn=50;

keepouts = true;

union() {
	translate([depth/2,depth/2,0]) difference() {
		minkowski() {
			difference() {
				cube([width+addend,height+addend,extra]);
				roundCorner(angle=180,radius=radius+addend,thickness=extra);
				translate([0,height-radius,0]) roundCorner(angle=90,radius=radius+addend,thickness=extra);
				translate([width-radius,0,0]) roundCorner(angle=270,radius=radius+addend,thickness=extra);
				translate([width-radius,height-radius,0]) roundCorner(radius=radius+addend,thickness=extra);
			}
			rotate([90,0,0]) sphere(d=depth);
		}
	}
	if (keepouts) {
		// audio jack
		translate([13.06,depth/2,0]) rotate([90,0,0]) cylinder(d=6.5,h=10+depth/2);
		// lightning connector
		translate([32.07,-14,-depth/2]) cube([13.65,14+depth/2,depth+extra]);
		// speaker
		translate([width-27.05,-10,-2.95/2]) cube([17.35,10+depth/2,2.95]);
		// home button
		translate([38.9,9.76+7.3,(depth+extra)/2]) rotate_extrude() {
			polygon([[0,0],[7.3,0],[14*sin(100),14],[0,14]]);
		}
	}
}

module roundCorner(angle=0,radius=1,thickness=1)
{
	factor = sqrt(2);
	translate([(radius-radius*cos(angle+45)*factor)/2,(radius-radius*sin(angle+45)*factor)/2,-.02]) rotate([0,0,angle]) difference() {
		cube([radius+.02,radius+.02,thickness+.04]);
		cylinder(r=radius,h=thickness+.04);
	}
}