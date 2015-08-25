// conversion from inches to mm
INCH = 25.4;

// plastic wall thickness
thickness = 2;

// board thickness
boardThickness = 0.375 * INCH;

// depth for board cover
boardDepth = 2 * INCH;

// spacing square size
spacing = boardThickness + thickness * 2;

// shrinkage allowance
shrinkage = .3;

// radius of joins
radius = 15;

module thruBoard()
{
    translate([-thickness - shrinkage - boardThickness/2,-boardDepth-spacing/2,0]) difference() {
        cube([thickness * 2 + boardThickness + shrinkage * 2, boardDepth * 2 + spacing, boardDepth + shrinkage]);
        translate([thickness, -shrinkage, thickness - shrinkage]) cube([boardThickness + shrinkage * 2, boardDepth + shrinkage * 2, boardDepth + shrinkage]);
        translate([thickness, boardDepth + spacing - shrinkage, thickness - shrinkage]) cube([boardThickness + shrinkage * 2, boardDepth + shrinkage * 2, boardDepth + shrinkage]);
    }
}


module single()
{
    translate([-thickness - shrinkage - boardThickness/2,shrinkage*2,0])difference() {
        cube([thickness * 2 + boardThickness + shrinkage * 2, boardDepth + spacing/2, boardDepth + thickness - shrinkage]);
        #translate([thickness, spacing/2 - shrinkage, thickness - shrinkage]) cube([boardThickness + shrinkage * 2, boardDepth + shrinkage * 2, boardDepth + shrinkage]);
    }
}

module centerSquare()
{
    translate([-spacing/2 - shrinkage,-spacing/2 - shrinkage,0]) cube([spacing + shrinkage * 2,spacing + shrinkage * 2,boardDepth - shrinkage + thickness]);
}

module join()
{
    translate([spacing/2+shrinkage,spacing/2+shrinkage,0])difference() {
            cube([radius+shrinkage,radius+shrinkage,boardDepth+thickness-shrinkage]);
            translate([radius, radius, -shrinkage]) cylinder($fn=50,r=radius,h=boardDepth+thickness+shrinkage);
    }
}

module hexCorner()
{
    union() {
        single();
        rotate([0,0,120]) single();
        rotate([0,0,240]) single();
    }
}

module L2()
{
    union() {
        single();
        rotate([0,0,90]) single();
        centerSquare();
        rotate([0,0,90]) join();
    }
}

module R2()
{
    union() {
        single();
        rotate([0,0,-90]) single();
        centerSquare();
        join();
    }
}

L2();