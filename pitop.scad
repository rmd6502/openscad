include <caseMeasurements.scad>

difference() {
    union() {
        cylinder(d=caseDiameter,h=caseThickness*2);
        render(2) translate([0,0,caseThickness*2]) difference() {
            cylinder(d=caseDiameter - caseThickness - .25,h=caseThickness * 2);
            cylinder(d=caseDiameter - caseThickness * 3,h=caseThickness * 2);
        }
    }
        translate([-caseDiameter/4,5,caseThickness-.05]) rotate([180,0,0]) resize([caseDiameter/2,0,0],auto=true) linear_extrude(caseThickness/2) import("beagle_logo_hdr_bottom.dxf");
        translate([-caseDiameter/4,5,caseThickness-.05]) rotate([180,0,0]) resize([caseDiameter/2,0,0],auto=true) linear_extrude(caseThickness) import("beagle_logo_hdr_middle.dxf");
        translate([-caseDiameter/4,5,caseThickness-.05]) rotate([180,0,0]) resize([caseDiameter/2,0,0],auto=true) linear_extrude(caseThickness*3/2) import("beagle_logo_hdr_top.dxf");

}
