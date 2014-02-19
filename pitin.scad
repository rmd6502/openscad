include <beagleboneblack.scad>

$fn=100;
case_height = 25;
screwR = 0.75;
supportHeight = 5.5;

module support(holePos)
{
	render(2) translate([holePos[0]-boardLength/2-.155*inch, holePos[1]-boardWidth/2+.5, 1]) difference() {
		cylinder(r=holeR,h=supportHeight);
		cylinder(r=screwR, h=supportHeight);
	}
}

union() {
	difference() {
		render(2) union() {
			difference() {
				cylinder(r=60,h=case_height);
				translate([0,0,1]) cylinder(r=59,h=case_height-1);
			}
			rotate_extrude()translate([59.5,case_height,0])circle(r=.5);
		}
		render(2) difference() {
			rotate_extrude()translate([59.25,.75,0])square(1.5,center=true);
			rotate_extrude()translate([58.5,1.5,0])circle(r=1.5);
		}
		#translate([-boardLength/2-.155*inch,-boardWidth/2+.5,supportHeight+1]) beagleboneblack();
	}
	support(hole1Pos);
	support(hole2Pos);
	support(hole3Pos);
	support(hole4Pos);
	
}
