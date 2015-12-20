$fn=20;

module bottom() {
    union() {
        difference() {
            translate([-3,-3,0]) cube([38.5,64,10]);
            translate([-2,-2,1]) cube([36.5,62,9.1]);
            translate([1,1,-0.1]) cylinder(d=3, h=1.2);
            translate([1,49,-0.1]) cylinder(d=3, h=1.2);
            translate([33,1,-0.1]) cylinder(d=3, h=1.2);
            translate([33,49,-0.1]) cylinder(d=3, h=1.2);
            translate([-3.1,0,4]) minkowski() {
                cube([2,11,6]);
                rotate([0,90,0]) cylinder(d=2,h=2);
            }
        }
        translate([19.3,2.6,1]) difference() {
            cylinder(d=5,h=4);
            cylinder(d=2.8,h=4.1);
        }
        translate([30.6,39.4,1]) difference() {
            cylinder(d=5,h=4);
            cylinder(d=2.8,h=4.1);
        }

    }
}

module top() {
    difference() {
        translate([-3,-3,14]) cube([38.5,64,1.3]);
        translate([26.8,5.3,12]) led();
        translate([26.8,12.8,12]) led();
        // Design for the top - deliberately not included
        translate ([17.6,40,14.8]) linear_extrude(0.6) resize([30,0,0],auto=true) import("topdesign.dxf");

    }
    difference() {
        translate([-1.5,-1.5,13]) cube([36,61.5,1]);
        translate([-0.5,-0.5,12.9]) cube([34,59.5,1.2]);
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