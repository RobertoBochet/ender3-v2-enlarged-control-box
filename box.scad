include <config.scad>;

box_footprint = [box_size.x, box_size.y - box_cantilever_lenght];
box_footprint_half = [0.5*box_footprint.x, 1*box_footprint.y];
box_size_half = [0.5*box_size.x, 1*box_size.y, box_size.z];

module halfbox()
{
	cube([box_footprint_half.x, box_footprint_half.y, box_thickness]);

	let(z=box_thickness)
	{
		translate([0, 0, z])
		linear_extrude(height=9-z)
		difference()
		{
			square(box_footprint_half);

			translate([0, box_thickness, 0])
			square(box_footprint_half - [box_thickness, 2*box_thickness]);
		}
	}

	let(z=9)
	{
		translate([0, 0, z])
		linear_extrude(height=box_thickness)
		difference() {
			square([box_size_half.x, box_size_half.y]);

			translate([0, box_thickness, 0]) square(box_footprint_half - [box_thickness, 2*box_thickness]);
			translate([40, box_footprint_half.y + 10, 0]) circle(d=mount_hole_diameter);
		}
	}

	let(z=11)
	{
		translate([0, 0, z])
		difference()
		{
			linear_extrude(height=box_size.z - z)
			difference() {
				square([box_size_half.x, box_size_half.y]);
				translate([0, box_thickness, 0]) square(box_size_half - [box_thickness, box_thickness]);
			}

			translate([35, -0.1, box_size.z - z - 10])
			rotate([-90,0,0])
			linear_extrude(height=box_thickness + 0.2)
				circle(d=mount_hole_diameter);
		}
	}

	
	let(z=box_size.z - box_thickness - support_height)
	{
		translate([box_footprint_half.x - support_radius - box_thickness, support_radius + box_thickness, z])
		difference()
		{
			linear_extrude(height=support_height)
			hull()
			{
				polygon([[-support_radius, -support_radius], [support_radius, -support_radius], [support_radius, support_radius]]);
				circle(r=support_radius);
			}

			translate([0, 0, support_height - support_hole_diameter])
			linear_extrude(height=support_hole_depth)
			circle(d=support_hole_diameter);
		}

		translate([box_footprint_half.x - support_radius - box_thickness, support_radius + box_thickness + 80, z])
		difference()
		{
			linear_extrude(height=support_height)
			hull()
			{
				polygon([[support_radius, -support_radius], [0, 0], [support_radius, support_radius]]);
				circle(r=support_radius);
			}

			translate([0, 0, support_height - support_hole_diameter])
			linear_extrude(height=support_hole_depth)
			circle(d=support_hole_diameter);
		}

	}
}

module box()
{
	halfbox();
	mirror(v=[1,0,0]) halfbox();
}

box();
