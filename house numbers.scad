// Prints house numbers, with outlines and holes.
// Copyright (c) 2016 Robert M Diamond all rights reserved.
// License: Creative Commons, free to use for all purposes.

// Got the font off dafont.com, Megadeth by Shane McFee
$fn=40;
module stencil() {
    difference() {
        cube([130,160,2]);
        translate([10,29,-.1]) linear_extrude(2.2) text(text="7",font="Megadeth:style=Cryptic", size=152);
    }
}

module outline(thickness=2) {
    difference() {
        offset(r=thickness) children();
        children();
    }
}

module countersunk(h=4.75) {
    union() {
        translate([0,0,-0.1]) cylinder(r=1, h=h+.1);
        translate([0,0,h/2]) cylinder(r=2,h=h/2+.1);
    }
}

//linear_extrude(4) outline(4.25) text(text="7",font="Megadeth:style=Cryptic", size=152);
difference() {
    union() {
        color([.7,.7,.7,1]) linear_extrude(.5) outline(4.5) offset(r=-.25)
        text(text="The Diamonds",font="My Underwood:style=Regular", size=50);
        color([.2,.2,.2,1]) linear_extrude(4.75) offset(r=-.25) text(text="The Diamonds",font="My Underwood:style=Regular", size=50);
    }
    translate([60,115,0]) countersunk();
    translate([30,10,0]) countersunk();
}