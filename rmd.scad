use </Library/Fonts/GothamRnd-Bold.otf>
$fn=60;
intersection(render=2) {
translate([2,3,-24]) linear_extrude(25) text(size=20,t="R",font="GothamRoundedBold");
translate([0,0,4]) rotate([270,0,0]) linear_extrude(25) text(size=20,t="M",font="GothamRoundedBold");
translate([0,3,3.5]) rotate([0,90,0]) linear_extrude(25) text(size=20,t="D",font="GothamRoundedBold");
}