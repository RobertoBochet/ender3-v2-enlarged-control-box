$fs=0.4;

use <box.scad>;
use <mount.scad>;

difference()
{
    box();

    translate([60,18,20]) cube([3, 44, 30]);
    translate([46,2,-0.5]) cube([15, 5, 3]);
    translate([0,1,10]) cube([15,3,10], center=true);
}

translate([55,80,2])
rotate([0,0,180])
mobo();

translate([-25,123,11]) mirror([0,1,0]) relay();