include <config.scad>;

module fan()
{
    circle(d=fan_hole_diameter);
    translate([fan_screw_distance/2,fan_screw_distance/2,0]) circle(d=fan_screw_diameter);
    translate([fan_screw_distance/2,-fan_screw_distance/2,0]) circle(d=fan_screw_diameter);
    translate([-fan_screw_distance/2,fan_screw_distance/2,0]) circle(d=fan_screw_diameter);
    translate([-fan_screw_distance/2,-fan_screw_distance/2,0]) circle(d=fan_screw_diameter);
}

module half_cover()
{
    linear_extrude(height=cover_size.z)
    difference()
    {
        echo(cover_base_half.y);
	    translate([0, box_thickness - cover_tollerance.y, 0]) square(cover_base_half);
        translate([box_base_half.x - support_radius - box_thickness, support_radius + box_thickness, 0]) circle(d=support_screw_diameter);
        translate([box_base_half.x - support_radius - box_thickness, support_radius + box_thickness + 80, 0]) circle(d=support_screw_diameter);

        translate([0, 50,0]) fan();
    }

}

module cover()
{
    half_cover();
    mirror([1, 0, 0]) half_cover();
}

cover();


// insert box for debug, it will not be rendered
use <box.scad>;
% translate([0,0, -box_size.z + cover_size.z]) box();