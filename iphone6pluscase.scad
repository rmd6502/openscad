// Copyright © 2015 Robert M. Diamond.  All Rights Reserved.

actualheight = 158.07;
actualwidth = 77.79;
actualdepth = 7.10;

radius = 10.3;

casethickness=1.6;
extra=.5;

$fn=50;

module phone(height=actualheight,width=actualwidth,depth=actualdepth,keepouts=true,controls=true,control_depth=4) {
    addend = extra*2 - depth;
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
		
		// controls
		if (controls) color("blue") {
                    // ringer switch
                    translate([-control_depth+extra,height-18.71-5.61-extra*2,-extra*2]) minkowski() {
                        rotate([0,-90,0]) cone(angle=120,surfaceDiameter=.1);
                        cube([control_depth,5.61+extra*2,4.53-2.57+extra*2]);
                    }
                    
                    // volume up
                    translate([-control_depth+extra,height-35.48-5.10-extra*2,-extra*2]) minkowski() {
                        rotate([0,-90,0]) cone(angle=120,surfaceDiameter=.1);
                        cube([control_depth,10.2+extra*2,4.53-2.57+extra*2]);
                    }
                    
                    // volume down
                    translate([-control_depth+extra,height-48.09-5.10-extra*2,-extra*2]) minkowski() {
                        rotate([0,-90,0]) cone(angle=120,surfaceDiameter=.1);
                        cube([control_depth,10.2+extra*2,4.53-2.57+extra*2]);
                    }
                    
                    // sleep/wake button
                    translate([width+extra,height-35.48-5.10-extra*2,-extra*2]) minkowski() {
                        rotate([0,90,0]) cone(angle=120,surfaceDiameter=.1);
                        cube([control_depth,10.2+extra*2,4.53-2.57+extra*2]);
                    }
		}
		
		if (keepouts) color("orange") {
			// audio jack
			translate([13.06,depth/2,0]) rotate([90,0,0]) cylinder(d=7,h=10+depth/2);
			// lightning connector
			translate([32.07,-14,-depth/2]) cube([13.65,14+depth/2,depth+extra]);
			// speaker
			translate([width-27.05,-10,-2.95/2]) cube([17.35,10+depth/2,2.95]);
			// Bottom mic
			translate([17.94,extra,0]) rotate([90,0,0]) cylinder(d=1.6,h=14);
			
			// home button
			translate([38.9,9.76,depth/2]) cone(angle=100,surfaceDiameter=7.3);
			
			// screen
			translate([4.71,18.63-extra*2,depth/2]) minkowski() {
                            cone(angle=60,surfaceDiameter=extra);
                            cube([68.36,121.54+extra*4,14]);
                        }
                    
			// front camera
			translate([28.25,height+extra*2-9.61,depth/2]) cone(angle=86,surfaceDiameter=3.8);
			
			// ALS
			translate([34.31,height+extra*2-5.15,depth/2]) cone(angle=120,surfaceDiameter=3.85);
			
			// Proximity
			translate([38.9,height+extra*2-5.15,depth/2]) cone(angle=120,surfaceDiameter=4.35);
			
			// earphone
			translate([38.9-10.7/2,height+extra*2-9.61,depth/2]) minkowski() {
                            cone(angle=90,surfaceDiameter=.1);
                            cube([10.7,1.2,14]);
                        }
			
			// rear camera
			translate([width-14.03,height+extra*2-7.2,-depth/2+extra]) rotate([0,180,0]) cone(angle=96.2,surfaceDiameter=5.16);
			
			// flash
			translate([width-26.08,height+extra*2-7.2,-depth/2+extra]) rotate([0,180,0]) cone(angle=125,surfaceDiameter=3.18);
			
			// rear mic
			translate([width-20.99,height+extra*2-7.2,-depth/2+extra]) rotate([0,180,0]) cylinder(d=1.6,h=14);
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

module cone(angle=90,surfaceDiameter=5,height=14)
{
	rotate_extrude() {
		polygon([[0,0],[surfaceDiameter,0],[height/tan(90-angle/2),height],[0,height]]);
	}
}

module case() {
    difference() {
        intersection() {
            translate([-8-extra,actualheight/2,actualdepth/2+actualheight*4-3]) difference() {
                rotate([90,0,90]) cylinder($fn=280,d=actualheight*8+8+radius+extra*2,h=actualwidth+8+radius+extra*2);
            rotate([90,0,90]) cylinder($fn=280,d=actualheight*8-20+radius+extra*2,h=actualwidth+8+radius+extra*2);
            }
            translate([-4,-4,0]) phone(height=actualheight+8,width=actualwidth+8,depth=actualdepth+12,keepouts=false,controls=false);
        }
    //    translate([-1.5,-1.5,-1.5+extra]) phone(keepouts=false,controls=false,width=actualwidth+3,depth=actualdepth+3,height=actualheight+3);
        translate([0,0,extra]) phone(depth=actualdepth+.25,width=actualwidth+.25,height=actualheight+.25,keepouts=true,control_depth=9);
    }
}

//difference() {
    case();
//    #translate([-casethickness-radius/2-2, -casethickness-radius/2, -actualdepth/2-2-radius/2]) cube([actualwidth+8+radius+extra*2, actualheight/2+radius*2+extra*2,actualdepth*3]);
//}