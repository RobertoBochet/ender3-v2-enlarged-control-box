thick = 2;
base = [125, 105 + 20];
mount_hole_diameter = 4;
fan_hole_diameter = 5;

$fs=0.4;

module fan()
{
    circle(d=55);
    translate([25,25,0]) circle(d=fan_hole_diameter);
    translate([25,-25,0]) circle(d=fan_hole_diameter);
    translate([-25,25,0]) circle(d=fan_hole_diameter);
    translate([-25,-25,0]) circle(d=fan_hole_diameter);
}

linear_extrude(height=thick)
difference()
{
    translate([-base.x/2, -thick, 0])
    offset(r=-thick-0.5) square(base);
    translate([base.x/2 - thick - 10 ,10]) circle(d=mount_hole_diameter);
    translate([-base.x/2 + thick + 10 ,10]) circle(d=mount_hole_diameter);
    translate([base.x/2 - thick - 10 ,10 + 80]) circle(d=mount_hole_diameter);
    translate([-base.x/2 + thick + 10 ,10 + 80]) circle(d=mount_hole_diameter);
    translate([0, 50,0]) fan();
}