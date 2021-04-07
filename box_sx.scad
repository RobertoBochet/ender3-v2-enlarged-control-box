use <box.scad>;
use <mount.scad>;

module mobo()
{
    translate([20, 67, 0]) mount();
    translate([3, 32, 0]) mount();
    translate([34, 30, 0]) mount();
    translate([82, 67, 0]) mount();
    translate([97, 3, 0]) mount();

    #translate([0,0,8]) square([100,70]);
    #translate([97,0,10]) square([3,70]);
};


box();
translate([-50,10,0])
mobo();