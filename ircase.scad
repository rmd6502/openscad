$fn=40;
board_width = 32.72;
board_length = 54.61;
board_height = 2;

module bottom() {
    union() {
        difference() {
            translate([-6.5,-3,0]) cube([42,64,10]);
            translate([-5.5,-2,1]) cube([40,62,9.1]);
            // four mounting screws
            translate([-3.5,1,-0.1]) cylinder(d=3, h=1.2);
            translate([-3.5,49,-0.1]) cylinder(d=3, h=1.2);
            translate([33,1,-0.1]) cylinder(d=3, h=1.2);
            translate([33,49,-0.1]) cylinder(d=3, h=1.2);
            // cutout for power
            translate([-6.6,0,5]) minkowski() {
                cube([2,11,6]);
                rotate([0,90,0]) cylinder(d=2,h=2);
            }
        }
        // mount board to case
        #translate([17.55,2.6,1]) difference() {
            cylinder(d=5,h=4);
            cylinder(d=2.8,h=4.1);
        }
        // mount board to case
        translate([28.85,39.4,1]) difference() {
            cylinder(d=5,h=4);
            cylinder(d=2.8,h=4.1);
        }
        //translate([-1.75,0,5]) cube([board_width, board_length, board_height]);
        
        // screwhole for top
        translate([-4,30,0.9]) difference() {
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
            translate([-6.5,-3,14]) cube([42,64,1.3]);
            translate([25.05,5.3,12]) led();
            translate([25.05,12.8,12]) led();
            // Design for the top - deliberately not included
            rotate([0,0,90]) translate ([15.6,53,14.6]) linear_extrude(0.8) resize([35,0,0],auto=true) import("./zenith_1937.dxf");
            translate([-4,30,13.9]) cylinder(h=1.5,d=2.7);
            translate([33,30,13.9]) cylinder(h=1.5,d=2.7);
        }
        difference() {
            translate([-5,-1.5,13]) cube([39.5,61.5,1]);
            translate([-4,-0.5,12.9]) cube([37.5,59.5,1.2]);
            translate([-4,30,12.9]) cylinder(h=1.3,d=4.2);
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

bottom();

/*rotate([0,180,0]) top() */;