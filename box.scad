base = [125, 105];
thick = 2;
height = 40;
mount_height = 12;
mount_hole_depth = 7;
mount_hole_diameter = 4;

module halfbox()
{
	hbase = [base.x/2, base.y];

	cube([hbase.x, hbase.y, thick]);

	let(z=thick)
	{
		translate([0,0,z])
		linear_extrude(height=9-z)
		difference()
		{
			square(hbase);
			translate([0,thick,0])
				square(hbase - [thick,2*thick]);
		};
	};

	let(z=9)
	{
		translate([0,0,z])
		linear_extrude(height=thick)
		difference() {
			square([hbase.x, hbase.y + 20]);
			translate([0, thick, 0]) square(hbase - [thick,2*thick]);
		};
	};

	let(z=11)
	{
		translate([0,0,z])
		linear_extrude(height=height-z)
		difference() {
			square([hbase.x, hbase.y + 20]);
			translate([0, thick, 0])
				square(hbase - [thick,thick - 20]);
		};
	};

	
	let(z=height - thick - mount_height, r=5)
	{
		translate([hbase.x - r - thick,r + thick,z])
		difference()
		{
			linear_extrude(height=mount_height)
			hull()
			{
				polygon([[-r,-r], [r, -r], [r,r]]);
				circle(r=r);
			};

			translate([0,0,mount_height - mount_hole_diameter])
			linear_extrude(height=mount_hole_depth)
			circle(d=mount_hole_diameter);
		};

		translate([hbase.x - r - thick,r + thick + 80,z])
		difference()
		{
			linear_extrude(height=mount_height)
			hull()
			{
				polygon([[r,-r], [0, 0], [r,r]]);
				circle(r=r);
			};

			translate([0,0,mount_height - mount_hole_diameter])
			linear_extrude(height=mount_hole_depth)
			circle(d=mount_hole_diameter);
		};

	};
};

module box()
{
	halfbox();
	mirror(v=[1,0,0]) halfbox();
};

box();