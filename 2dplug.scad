inch=25.4;
sqwidth=(1+3/8)*inch;
sqheight=(1+1/8)*inch;

module 2dplug() {
    intersection() {
        circle(r=.6675*inch);
        translate([-sqwidth/2, -sqheight/2]) square([sqwidth, sqheight]);
    }
}

//linear_extrude(2) 2dplug();