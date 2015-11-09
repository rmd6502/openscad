include <raspberry-pi-b-plus-case/pi_b_plus.scad>

boardThickness=1.33;
boardWidth=56;
boardLength=85;

avWidth=7.05;
avLength=14.90;
avHeight=7.38-boardThickness;
avRadius=avWidth/2;
avOverHang=-2.30;
avYset=boardLength-53.5+(avWidth/2);
avRotate=-90;

hdmiWidth=11.37;
hdmiLength=15.07;
hdmiHeight=7.86-boardThickness;
hdmiOverHang=-1.9;		//1.66
hdmiYset=boardLength-32-(hdmiWidth/2);
hdmiRotate=-90;

miniusbWidth=5.59;
miniusbLength=8.04;
miniusbHeight=4.22-boardThickness;
miniusbOverHang=-1.9;	// 1.09
miniusbYset=boardLength-10.6-(miniusbWidth/2);

cutOutExtrude = 30;

$fn=100;
diam = sqrt(85*85 + 56*56)+11;
echo("Diameter ",diam);
chord = sqrt(diam*diam-87*87);
height = 26;
lidheight=3;

module bottom() {
    union() {
        difference() {
            union() {
                difference() {
                    // base
                    translate([85/2,56/2,-2.5]) cylinder(d=diam,h=height);
                    
                    // hollow it out
                    translate([85/2,56/2,0.5]) cylinder(d=diam-4,h=height+.5);
                    
                    // cutoff for usb and ether
                    translate([87,56/2-chord/2,-2.7]) cube([25,chord,height+.4]);
                }
                // add flat panel for usb and ether
                translate([87-2.5,56/2-chord/2+1.5,-2.5]) cube([2.5,chord-3,height]);
                
            translate([85/2+diam*.7071/2-6.5,56/2+diam*.7071/2-6.5,-1.5]) screw_hole(height-1);
            translate([85/2+diam*.7071/2-6.5,56/2-diam*.7071/2+6.5,-1.5]) screw_hole(height-1);
            translate([85/2-diam/2+7.5,56/2+18,-1.5]) screw_hole(height-1);
            }
            
            // The pi itself
            #translate([82.5,0,4.55]) rotate([0,0,90]) pi_board(cutOutExtrude,7.5);
            
            translate([16,-12,-2.6]) cylinder(d=3,h=4);
            translate([16,65,-2.6]) cylinder(d=3,h=4);
            translate([65,-12,-2.6]) cylinder(d=3,h=4);
            translate([65,65,-2.6]) cylinder(d=3,h=4);
        }
        // screw holes
        translate([1,3.5,-.5]) screw_hole();
        translate([1,49+3.5,-.5]) screw_hole();
        translate([2+57,3.5,-.5]) screw_hole();
        translate([2+57,3.5+49,-.5]) screw_hole();
    }
}
    
module top()
{
    union() {
        difference() {
            // base
            translate([85/2,56/2,-2.5]) cylinder(d=diam,h=lidheight);
            
            // cutoff for usb and ether
            translate([87,56/2-chord/2,-2.7]) cube([25,chord,lidheight+.4]);
            translate([85/2+diam*.7071/2-6.5,56/2+diam*.7071/2-6.5,-2.55]) cylinder(d=3.5,h=lidheight+.2);
            translate([85/2+diam*.7071/2-6.5,56/2-diam*.7071/2+6.5,-2.55]) cylinder(d=3.5,h=lidheight+.2);
            translate([85/2-diam/2+7.5,56/2-18,-2.55]) cylinder(d=3.5,h=lidheight+.2);
            // cover art
        }
        translate([0,0,lidheight]) difference() {
            // base
            translate([85/2,56/2,-2.5]) cylinder(d=diam-4.5,h=lidheight-1);
            translate([85/2,56/2,-2.7]) cylinder(d=diam-6.5,h=lidheight-.7);
            // cutoff for screw post
            translate([85/2-diam/2+7.5,56/2-18,-2.6]) cylinder(d=7.5,h=lidheight+.2);
            
            // cutoff for usb and ether
            translate([84.5,56/2-chord/2,-2.7]) cube([25,chord,lidheight-.6]);
        }
    }
}

module screw_hole(h=5)
{
    difference() {
        cylinder(d=6.2,h=h);
        cylinder(d=2.75,h=h+.1);
    }
}

bottom();
translate([0,diam/2-.4,height+2]) rotate([180,0,0]) top();
