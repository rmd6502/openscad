$fn=60;

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

caseWidth = 45;
caseLength = 64;
caseHeight = 27;

thickness = 1.5;
offsets = 5;

cableThickness = 6.7;

flangeWidth = 15;

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
            translate([screwDiameter,caseLength/4,-.1]) screwHole();
            translate([screwDiameter,3*caseLength/4,-.1]) screwHole();
        }
        translate([0,0,thickness]) rotate([0,-90,0])  linear_extrude(thickness,scale=[0,1]) square([thickness, caseLength]);
        translate([caseWidth, 0,0]) difference() {
            cube([flangeWidth, caseLength, thickness]);
            translate([flangeWidth-screwDiameter,caseLength/4,-.1]) screwHole();
            translate([flangeWidth-screwDiameter,3*caseLength/4,-.1]) screwHole();
        }
        translate([caseWidth,0,thickness]) rotate([0,0,0])  linear_extrude(thickness,scale=[0,1]) square([thickness, caseLength]);
        difference() {
            cube([caseWidth, caseLength, caseHeight]);
            translate([thickness, thickness, thickness]) cube([caseWidth-thickness*2, caseLength - thickness*2, caseHeight]);
            translate([26, thickness+.1, thickness+height+3]) rotate([90,0,0]) union() {
                cylinder(d=cableThickness, h=thickness+.2);
                translate([-cableThickness/2, 0, 0]) cube([cableThickness, caseHeight, thickness+.2]);
            }
            translate([13, thickness+.1, thickness+height+3]) rotate([90,0,0]) union() {
                cylinder(d=cableThickness, h=thickness+.2);
                translate([-cableThickness/2, 0, 0]) cube([cableThickness, caseHeight, thickness+.2]);
            }
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
        translate([13.5, thickness*1.5, height+thickness+2]) rotate([90,0,0]) difference() {
            translate([-cableThickness/2, 0, 0]) cube([cableThickness-1, caseHeight-cableThickness+thickness+1, thickness*2]);
            translate([-.5,0,0]) cylinder(d=cableThickness, h=thickness*2);
        }
        translate([26.5, thickness*1.5, height+thickness+2]) rotate([90,0,0]) difference() {
            translate([-cableThickness/2, 0, 0]) cube([cableThickness-1, caseHeight-cableThickness+thickness+1, thickness*2]);
            translate([-.5,0,0]) cylinder(d=cableThickness, h=thickness*2);
        }
    }
}


bottom();
//translate([-4,0,caseHeight+4]) rotate([0,180,0]) top();
