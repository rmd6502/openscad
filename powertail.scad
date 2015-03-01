/* [Global] */

// Bottom is the main box, top is the cover
part = "fit";  // [bottom:The main box,top:The cover,both:Both box and cover next to each other,fit:Both box and cover as they fit together]

/* [Box Parameters] */

caseWidth = 45;
caseLength = 64;
caseHeight = 27;

thickness = 1.5;

// The height of the standoffs for the board
offsets = 5;

// The thickness of the power wires
cableThickness = 6.7;

// The width of the mounting flanges
flangeWidth = 15;

/* [Board Parameters] */

width = 38;
length = 51;
height = 1.6;

terminalHeight = 9.75;
terminalWidth = 30;
terminalDepth = 7.5;

relayHeight = 17.25;
relayWidth = 15;
relayDepth = 18.75;

screwDiameter = 3;

cornerRadius = 3;
cornerHeight = 0.1;

/* [Hidden] */
$fn = 60;

module board() {
    union() {
        difference() {
            minkowski() {
                translate([cornerRadius, cornerRadius, 0]) cube([width-cornerRadius*2, length-cornerRadius*2, height-cornerHeight]);
                cylinder(r=cornerRadius, h = cornerHeight);
            }
            translate([1.25+screwDiameter/2,1.25+screwDiameter/2,-.1]) screwHole();
            translate([width - 1.25 - screwDiameter/2,1.25+screwDiameter/2,-.1]) screwHole();
            translate([width - 1.25 - screwDiameter/2,length - 1.25 - screwDiameter/2,-.1]) screwHole();
            translate([1.25+screwDiameter/2,length - 1.25 - screwDiameter/2,-.1]) screwHole();
        }
        translate([3.5,4,height]) cube([terminalWidth,terminalDepth,terminalHeight]);
        translate([3.5,13,height]) cube([relayWidth, relayDepth, relayHeight]);
        translate([20.5,13,height]) cube([relayWidth, relayDepth, relayHeight]);
    }
}

module screwHole() {
    cylinder(d=screwDiameter, h=height+.2);
}


module bottom() {
    union() {
        // flanges
        translate([-flangeWidth, 0,0]) difference() {
            cube([flangeWidth, caseLength, thickness]);
            translate([screwDiameter*1.5,caseLength/4,-.1]) screwHole();
            translate([screwDiameter*1.5,3*caseLength/4,-.1]) screwHole();
        }
        translate([0,0,thickness]) rotate([0,-90,0])  linear_extrude(thickness,scale=[0,1]) square([thickness, caseLength]);
        translate([caseWidth, 0,0]) difference() {
            cube([flangeWidth, caseLength, thickness]);
            translate([flangeWidth-screwDiameter*1.5,caseLength/4,-.1]) screwHole();
            translate([flangeWidth-screwDiameter*1.5,3*caseLength/4,-.1]) screwHole();
        }
        translate([caseWidth,0,thickness]) rotate([0,0,0])  linear_extrude(thickness,scale=[0,1]) square([thickness, caseLength]);
        difference() {
            cube([caseWidth, caseLength, caseHeight]);
            translate([thickness, thickness, thickness]) cube([caseWidth-thickness*2, caseLength - thickness*2, caseHeight]);
            
            // slots for cables
            translate([26, thickness+.1, thickness*2+height+offsets+cableThickness/2]) rotate([90,0,0]) union() {
                cylinder(d=cableThickness, h=thickness+.2);
                translate([-cableThickness/2, 0, 0]) cube([cableThickness, caseHeight, thickness+.2]);
            }
            translate([13, thickness+.1, thickness*2+height+offsets+cableThickness/2]) rotate([90,0,0]) union() {
                cylinder(d=cableThickness, h=thickness+.2);
                translate([-cableThickness/2, 0, 0]) cube([cableThickness, caseHeight, thickness+.2]);
            }
            
            // The board
            #translate([(caseWidth-width)/2, (caseLength - length)/2, thickness+offsets]) board();
    
        }
        translate([(caseWidth-width)/2+1.25+screwDiameter/2, (caseLength - length)/2+1.25+screwDiameter/2, thickness]) difference() {
            cylinder(d=6, h=offsets);
            cylinder(d=3, h=offsets);
        }
        translate([(caseWidth-width)/2+width-(1.25+screwDiameter/2), (caseLength - length)/2+1.25+screwDiameter/2, thickness]) difference() {
            cylinder(d=6, h=offsets);
            cylinder(d=3, h=offsets);
        }
        translate([(caseWidth-width)/2+1.25+screwDiameter/2,(caseLength - length)/2+length-(1.25+screwDiameter/2), thickness]) difference() {
            cylinder(d=6, h=offsets);
            cylinder(d=3, h=offsets);
        }
        translate([(caseWidth-width)/2+width-(1.25+screwDiameter/2), (caseLength - length)/2+length-(1.25+screwDiameter/2), thickness]) difference() {
            cylinder(d=6, h=offsets);
            cylinder(d=3, h=offsets);
        }
        // screw holes for top
        translate([thickness/2+3, thickness/2+3, thickness]) difference() {
            cylinder(d=6,h=caseHeight-thickness);
            translate([0,0,caseHeight/2]) cylinder(d=3,h=caseHeight-thickness);
        }
        translate([caseWidth-thickness/2-3, thickness/2+3, thickness]) difference() {
            cylinder(d=6,h=caseHeight-thickness);
            translate([0,0,caseHeight/2]) cylinder(d=3,h=caseHeight-thickness);
        }
    }
}

module top() {
    translate([-4,0,caseHeight+thickness]) rotate([0,180,0]) union() {
        difference() {
            translate([-thickness,-thickness,caseHeight]) cube([caseWidth+thickness*2,caseLength/2,thickness]);
            translate([thickness/2+3, thickness/2+3, thickness]) difference() {
                translate([0,0,caseHeight/2]) cylinder(d=3.5,h=caseHeight-thickness);
            }
            translate([caseWidth-thickness/2-3, thickness/2+3, thickness]) difference() {
                translate([0,0,caseHeight/2]) cylinder(d=3.5,h=caseHeight-thickness);
            }
        }
        translate([13.5, thickness*1.5, height+thickness+offsets]) rotate([90,0,0]) difference() {
            translate([-cableThickness/2, 0, 0]) cube([cableThickness-1, caseHeight-cableThickness+thickness*2+1-offsets, thickness*2]);
            translate([-.5,0,0]) cylinder(d=cableThickness, h=thickness*2);
        }
        translate([26.5, thickness*1.5, height+thickness+offsets]) rotate([90,0,0]) difference() {
            translate([-cableThickness/2, 0, 0]) cube([cableThickness-1, caseHeight-cableThickness+thickness*2+1-offsets, thickness*2]);
            translate([-.5,0,0]) cylinder(d=cableThickness, h=thickness*2);
        }
    }
}


if (part == "bottom" || part == "both" || part == "fit") {
    bottom();
}
if (part == "both") {
    translate([-caseWidth-10,0,0]) top();
} else if (part == "fit") {
    translate([-4,0,caseHeight+4]) rotate([0,180,0]) top();
} else if (part == "top") {
    top();
}
