$fs=0.4;

use <box.scad>;
use <mount.scad>;

difference()
{
    box();

    translate([-45,-0.5,36]) cube([20,3,5]);
    translate([0,1,10]) cube([15,3,10], center=true);
};

translate([50, 65, 2])
rotate([0,0,180])
raspberry();

translate([-50,72,2]) step_down();

translate([-25,121,11]) mirror([0,1,0]) relay();