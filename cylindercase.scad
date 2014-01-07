
gCylinderOD = 5.75 * 25.4/2;
gCylinderID = gCylinderOD - 4;
gCylinderHeight = 13 * 25.4;

gWallThickness = gCylinderOD - gCylinderID;
gDovetailHeight = 20;

gVentHoleWidth = 10;
gVentHoleHeight = 40;
gVentHoleCount = 16;

// max build height
gMaxHeight = 120;

gNumSections = ceil(gCylinderHeight / gMaxHeight);
echo ("Total of ",gNumSections,"sections");
if (currentSection != undef) {
	// Set the section number here
	cylinderSection(currentSection);
} else {
	// or view the whole thing...
	fullCylinder();
}

module fullCylinder() 
{
	difference() {
		// Outer Diameter
		cylinder(r=gCylinderOD,h=gCylinderHeight,$fn=70);
	
		// Inner Diameter
		translate([0,0,gWallThickness]) cylinder(r=gCylinderID,h=gCylinderHeight,$fn=30);
	
		// Vent holes
		for (angle=[0:360/gVentHoleCount:360]) {
			rotate([0,0,angle]) translate([0,-gVentHoleWidth/2,gWallThickness+.75]) 
			minkowski() {
				cube([gCylinderOD, gVentHoleWidth-.75, gVentHoleHeight-.75]);
				sphere(r=.75,$fn=10);
			}
		}
	}
}

cutoffPoint = 0;
module cylinderSection(sectionNumber) 
{
	if (sectionNumber < 0 || sectionNumber >= gNumSections) {
		echo ("Choose a number between 0 and ",gNumSections-1);
	} else {
		// overlap dovetail height
		assign (cutoffPoint = -sectionNumber * gMaxHeight + ((sectionNumber > 0) ? gDovetailHeight : 0)) {
	echo (sectionNumber,"cutoffpoint ",cutoffPoint);
		difference() {
			// Shift the full cylinder below the origin so the section of interest touches it
			translate([0,0,cutoffPoint]) fullCylinder();

			// Slice off everything below the origin
			translate([-gCylinderOD,-gCylinderOD,-sectionNumber * gMaxHeight]) cube([gCylinderOD*2,gCylinderOD*2,sectionNumber * gMaxHeight]);

			// Slice off everything above maxHeight
			translate([-gCylinderOD,-gCylinderOD,gMaxHeight]) cube([gCylinderOD*2,gCylinderOD*2,gCylinderHeight]);

			// Top dovetail
			if (sectionNumber < gNumSections - 1) {
				translate([0,0,gMaxHeight-gDovetailHeight]) difference() {
					cylinder(r=gCylinderOD+gWallThickness/2,h=gDovetailHeight,$fn=70);
					cylinder(r=gCylinderID+gWallThickness/2,h=gDovetailHeight,$fn=70);
				}
			}

			// Bottom dovetail
			if (sectionNumber > 0) {
				cylinder(r=gCylinderID+gWallThickness/2,h=gDovetailHeight,$fn=70);
			}
		}
	}
	}
}
