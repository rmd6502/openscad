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
	if (keepouts) color("red") {
		// audio jack
		translate([13.06,depth/2,0]) rotate([90,0,0]) cylinder(d=6.5,h=10+depth/2);
		// lightning connector
		translate([32.07,-14,-depth/2]) cube([13.65,14+depth/2,depth+extra]);
		// speaker
		translate([width-27.05,-10,-2.95/2]) cube([17.35,10+depth/2,2.95]);
		// Bottom mic
		translate([17.94,0,0]) rotate([90,0,0]) cylinder(d=1.6,h=14);
		
		// home button
		translate([38.9,9.76+7.3,depth/2+extra]) cone(angle=100,surfaceDiameter=7.3);
		
		// screen
		translate([4.71,18.63,depth/2+extra]) cube([68.36,121.54,14]);
		// front camera
		translate([28.25,height+extra*2-9.61,depth/2+extra]) cone(angle=86,surfaceDiameter=3.8);
		
		// ALS
		translate([34.31,height+extra*2-5.15,depth/2+extra]) cone(angle=120,surfaceDiameter=3.85);
		
		// Proximity
		translate([38.9,height+extra*2-5.15,depth/2+extra]) cone(angle=120,surfaceDiameter=4.35);
		
		// earphone
		translate([38.9-10.7/2,height+extra*2-9.61,depth/2+extra]) cube([10.7,1.2,14]);
		
		// rear camera
		translate([14.03,height+extra*2-7.2,-depth/2]) rotate([0,180,0]) cone(angle=96.2,surfaceDiameter=5.16);
		
		// flash
		translate([26.08,height+extra*2-7.2,-depth/2]) rotate([0,180,0]) cone(angle=125,surfaceDiameter=3.18);
		
		// rear mic
		translate([20.99,height+extra*2-7.2,-depth/2]) rotate([0,180,0]) cylinder(d=1.6,h=14);
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

module cone(angle=90,surfaceDiameter=5,height=14)
{
	rotate_extrude() {
		polygon([[0,0],[surfaceDiameter,0],[height/tan(90-angle/2),height],[0,height]]);
	}	
}
