$fn=40;
rotate(a=360*$t,v=[0,1,0]) translate([-19,0,-5])
color("lightblue")
render(convexity=3) {
    union() {
        intersection() {
            linear_extrude(10) text("Robert", font="SignPainter:style=HouseScript",size=10);
            translate([-3,4.5,5]) scale([1,1.7,1]) rotate([0,90,0]) cylinder($fn=4,r=3.5,h=50);
        }
        translate([-.75,-3.1,2]) cube([29,3,6]);
    }
}