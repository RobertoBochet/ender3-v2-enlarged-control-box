include <config.scad>;

cover_size = [box_size.x, box_size.y, cover_thickness] - [2*box_thickness, box_thickness, 0] + cover_tollerance;
cover_footprint = [cover_size.x, cover_size.y];
cover_footprint_half = [0.5*cover_footprint.x, 1*cover_footprint.y];

box_footprint = [box_size.x, box_size.y - box_cantilever_lenght];
box_footprint_half = [0.5*box_footprint.x, 1*box_footprint.y];

module fan()
{
    circle(d=fan_hole_diameter);
    translate([fan_screw_distance/2, fan_screw_distance/2, 0]) circle(d=fan_screw_diameter);
    translate([fan_screw_distance/2, -fan_screw_distance/2, 0]) circle(d=fan_screw_diameter);
    translate([-fan_screw_distance/2, fan_screw_distance/2, 0]) circle(d=fan_screw_diameter);
    translate([-fan_screw_distance/2, -fan_screw_distance/2, 0]) circle(d=fan_screw_diameter);
}

module half_footprint_cover()
{
    difference()
    {
        translate([0, box_thickness - cover_tollerance.y, 0]) square(cover_footprint_half);
        
        translate([box_footprint_half.x - support_radius - box_thickness, support_radius + box_thickness, 0])
            circle(d=support_screw_diameter);
        translate([box_footprint_half.x - support_radius - box_thickness, support_radius + box_thickness + 80, 0])
            circle(d=support_screw_diameter);
    }
}

module cover()
{
    linear_extrude(height=cover_size.z)
    difference()
    {
        union()
        {
            half_footprint_cover();
            mirror([1, 0, 0]) half_footprint_cover();
        }

        translate([0, 50,0]) fan();
    }
}

cover();

// insert box for debug, it will not be rendered
use <box.scad>;
% translate([0,0, -box_size.z + cover_size.z]) box();
