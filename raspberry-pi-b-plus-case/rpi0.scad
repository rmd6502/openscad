$fn=40;

boardThickness=1.33;

miniusbWidth=5.59;
miniusbLength=8.04;
miniusbboardThickness=4.22-boardThickness;
miniusbOverHang=-1.9;	// 1.09

hdmiWidth=11.37;
hdmiLength=15.07;
hdmiboardThickness=7.86-boardThickness;
hdmiOverHang=-1.9;		//1.66

union() {
    difference() {
        linear_extrude(boardThickness) minkowski() {
            square([23,58]);
            circle(r=3.5);
        }
        screw_hole();
        translate([0,58,0]) screw_hole();
        translate([23,0,0]) screw_hole();
        translate([23,58,0]) screw_hole();
    }
    // GPIO
    translate([-2.5,4,boardThickness]) cube([5,50,3]);
    
    // micro HDMI
    
    // USB A
    
    // USB B
    
    // MicroSD
}

module screw_hole() {
    translate([0,0,-0.1]) union() {
        cylinder(d=2.75,h=boardThickness+0.2);
        translate([0,0,boardThickness-0.2]) cylinder(d=6,h=0.7);
    }
}