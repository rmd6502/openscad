include <R-pi.scad>

diameter=sqrt(length * length + width * width) + 5;
thickness=1.5;
caseHeight=25;
standoffHeight = 6;
standoffDiameter=5;
standoffScrewDiameter=3;
mountingScrewDiameter1=5;
mountingScrewDiameter2=3;
mountingScrewHeight=3;
$fn=100;

difference() {
	union() {
		render(2) difference() {
			cylinder(d=diameter,h=caseHeight+thickness);
			translate([0,0,thickness]) cylinder(d=diameter-thickness*2,h=caseHeight);
			difference() {
				rotate_extrude()translate([diameter/2,.75,0])square(2,center=true);
				rotate_extrude()translate([diameter/2-1.5,1.5,0])circle(r=1.5);
			}
			rotate([0,0,50]) translate([diameter/2-6,0,thickness]) mountingScrewMinus();
			rotate([0,0,120]) translate([diameter/2-10,0,thickness]) mountingScrewMinus();
			rotate([0,0,230]) translate([diameter/2-10,0,thickness]) mountingScrewMinus();
			rotate([0,0,300]) translate([diameter/2-10,0,thickness]) mountingScrewMinus();
		}
		rotate([0,0,50]) translate([diameter/2-6,0,thickness]) mountingScrew();
		rotate([0,0,120]) translate([diameter/2-10,0,thickness]) mountingScrew();
		rotate([0,0,230]) translate([diameter/2-10,0,thickness]) mountingScrew();
		rotate([0,0,300]) translate([diameter/2-10,0,thickness]) mountingScrew();
		translate ([25.5-length/2, 18-width/2,thickness-0.1]) standoff();
		translate ([length-5-length/2, width-12.5-width/2, thickness-0.1]) standoff();
	}
	#translate([-length/2,-width/2,standoffHeight+thickness]) pi("B");
}

module standoff() 
{
	difference() {
		cylinder(d=standoffDiameter,h=standoffHeight);
		cylinder(d=standoffScrewDiameter,h=standoffHeight);
	}
}

module mountingScrew()
{
	render(2) difference() {
		cylinder(d=mountingScrewDiameter1+2,h=mountingScrewHeight);
		mountingScrewMinus();
	}
}

module mountingScrewMinus()
{
	translate([0,0,mountingScrewHeight-2]) cylinder(r1=mountingScrewDiameter2/2,r2=mountingScrewDiameter1/2,h=2);
	translate([0,0,-1-thickness]) cylinder(r=mountingScrewDiameter2/2,h=thickness+2);
}