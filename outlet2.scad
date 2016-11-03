inch = 25.4;
width = 2.75 * inch;
height = 4.5 * inch;
depth = 6.4;

cyl = 8;
cyld = 1;

$fn=20;
difference() {
    intersection() {
        hull() {
            translate([cyl/2,cyl/2,0]) longsphere(cyl,depth*2);
            translate([width-cyl/2,cyl/2,0]) longsphere(cyl,depth*2);
            translate([cyl/2,height-cyl/2,0]) longsphere(cyl,depth*2);
            translate([width-cyl/2,height-cyl/2,0]) longsphere(cyl,depth*2);
        }
        cube([width, height, depth]);
    }
    translate([width/2, 8.75, 0]) screwhole(3);
    translate([width/2, height-8.75, 0]) screwhole(3);
    translate([3,3,-.1]) cube([width-6, height-6, depth-2+.2]);
    
    translate([(width-33.2+cyl/2)/2,(height-66.8+cyl/2)/2,0]) minkowski() {
        cube([33.2-cyl/2, 66.8-cyl/2,depth]);
        cylinder(d=cyl/2, h=cyld);
    }
}

module longsphere(diam, height) {
    resize([diam, diam, height]) sphere(diam/2);
}

module screwhole(diam) {
    translate([0,0,depth-2-0.1]) cylinder(d1=diam, d2=diam*2, h=2+.2);
    difference() {
        cylinder(d=diam*2, h=depth-2);
        cylinder(d=diam, h=depth-2);
    }
}