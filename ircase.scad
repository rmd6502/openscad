$fn=40;

module bottom() {
    union() {
        difference() {
            translate([-3,-3,0]) cube([38.5,64,10]);
            translate([-2,-2,1]) cube([36.5,62,9.1]);
            // four mounting screws
            translate([1,1,-0.1]) cylinder(d=3, h=1.2);
            translate([1,49,-0.1]) cylinder(d=3, h=1.2);
            translate([33,1,-0.1]) cylinder(d=3, h=1.2);
            translate([33,49,-0.1]) cylinder(d=3, h=1.2);
            // cutout for power
            translate([-3.1,0,5]) minkowski() {
                cube([2,11,6]);
                rotate([0,90,0]) cylinder(d=2,h=2);
            }
        }
        // mount board to case
        translate([19.3,2.6,1]) difference() {
            cylinder(d=5,h=4);
            cylinder(d=2.8,h=4.1);
        }
        // mount board to case
        translate([30.6,39.4,1]) difference() {
            cylinder(d=5,h=4);
            cylinder(d=2.8,h=4.1);
        }
        // screwhole for top
        translate([-0.5,30,0.9]) difference() {
            cylinder(h=9.1,d=4);
            translate([0,0,4]) cylinder(h=5.2,d=2.5);
        }
        translate([33,30,0.9]) difference() {
            cylinder(h=9.1,d=4);
            translate([0,0,4]) cylinder(h=5.2,d=2.5);
        }
    }
}

module top() {
    union() {
        difference() {
            translate([-3,-3,14]) cube([38.5,64,1.3]);
            translate([26.8,5.3,12]) led();
            translate([26.8,12.8,12]) led();
            // Design for the top - deliberately not included
            rotate([0,0,90]) translate ([15.6,50,14.8]) linear_extrude(0.6) resize([35,0,0],auto=true) import("zenith_1937.dxf");
            translate([-0.5,30,13.9]) cylinder(h=1.5,d=2.7);
            translate([33,30,13.9]) cylinder(h=1.5,d=2.7);
        }
        difference() {
            translate([-1.5,-1.5,13]) cube([36,61.5,1]);
            translate([-0.5,-0.5,12.9]) cube([34,59.5,1.2]);
            translate([-0.5,30,12.9]) cylinder(h=1.3,d=4.2);
            translate([33,30,12.9]) cylinder(h=1.3,d=4.2);
        }
    }
}

module led() {
    union() {
        cylinder(h=6.1, r=2.6);
        translate([0,0,6.1]) sphere(r=2.6);
        difference() {
            cylinder(r=3.1,h=1);
            translate([2.6, -3, -.1]) cube([2,6,1.2]);
        }
    }
}

//bottom();

top();