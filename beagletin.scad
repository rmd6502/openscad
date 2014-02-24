include <beagleboneblack.scad>
include <caseMeasurements.scad>

module support(holePos)
{
	render(2) translate([holePos[0]-boardLength/2+boardOffsetLength, holePos[1]-boardWidth/2+boardOffsetWidth, 1]) difference() {
		cylinder(r=holeR*1.5,h=supportHeight);
		cylinder(r=screwR, h=supportHeight);
	}
}

union() {
	difference() {
		render(2) union() {
			difference() {
				cylinder(d=caseDiameter,h=caseHeight);
				translate([0,0,1]) cylinder(d=caseDiameter-2,h=caseHeight-1);
			}
			rotate_extrude()translate([caseDiameter/2-.5,caseHeight,0])circle(r=.5);
		}
		render(2) difference() {
			rotate_extrude()translate([caseDiameter/2-.75,.75,0])square(1.5,center=true);
			rotate_extrude()translate([caseDiameter/2-1.5,1.5,0])circle(r=1.5);
		}
		#translate([-boardLength/2+boardOffsetLength,-boardWidth/2+boardOffsetWidth,supportHeight+1]) beagleboneblack();
	}
	support(hole1Pos);
	support(hole2Pos);
	support(hole3Pos);
	support(hole4Pos);
	
}
