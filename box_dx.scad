use <box.scad>;
use <mount.scad>;

module raspberry()
{
    translate([3.5,3.5,0]) mount();
    translate([3.5,52.5,0]) mount();
    translate([61.5,3.5,0]) mount();
    translate([61.5,52.5,0]) mount();

    #translate([0,0,8]) square([85, 56]);
    #translate([82,0,10]) square([3, 56]);
}

box();

translate([50, 65, 0])
rotate([0,0,180])
raspberry();