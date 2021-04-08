module mount(size=8, height=7, hole_depth=7, hole_diameter=4)
{
    difference()
    {
        cylinder(h=height, d=size);
        translate([0,0,height-hole_depth]) cylinder(h=hole_depth+0.1, d=hole_diameter);
    };
}

module mobo()
{
    translate([20, 67, 0]) mount();
    translate([3, 32, 0]) mount();
    translate([34, 30, 0]) mount();
    translate([82, 67, 0]) mount();
    translate([97, 3, 0]) mount();

    #translate([0,0,8]) square([100,70]);
    #translate([97,0,10]) square([3,70]);
}

module raspberry()
{
    translate([3.5,3.5,0]) mount();
    translate([3.5,52.5,0]) mount();
    translate([61.5,3.5,0]) mount();
    translate([61.5,52.5,0]) mount();

    #translate([0,0,8]) square([85, 56]);
    #translate([82,0,10]) square([3, 56]);
}

module step_down()
{
    translate([36.5,2.5,0]) mount();
    translate([7,18,0]) mount();

    #translate([0,0,8]) square([44, 21]);
}

module relay()
{
    translate([2.5,2.5,0]) mount();
    translate([47.5,2.5,0]) mount();

    #translate([0,0,8]) square([50, 25]);
}

relay();