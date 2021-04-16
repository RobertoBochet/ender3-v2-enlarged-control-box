$fs=0.4;

box_tollerance = [0, -2, 0];
box_size = [125, 125, 40] + box_tollerance;
box_base = [box_size.x, box_size.y - 20];
box_thickness = 2;

support_height = 12;
support_hole_depth = 10;
support_hole_diameter = 4.5;
support_screw_diameter = 3.5;
support_radius = 5;

mount_hole_diameter = 4;

cover_tollerance = [-1, -0.5, 0];
cover_size = [box_size.x, box_size.y, 1.6] - [2*box_thickness, box_thickness, 0] + cover_tollerance;
cover_base = [cover_size.x, cover_size.y];
cover_hole_diameter = 4.5;

fan_hole_diameter = 55;
fan_screw_diameter = 5;
fan_screw_distance = 50; 

box_base_half = [0.5*box_base.x, 1*box_base.y];
cover_base_half = [0.5*cover_base.x, 1*cover_base.y];