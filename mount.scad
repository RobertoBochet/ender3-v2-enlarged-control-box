module mount(size=10, height=7, hole_depth=7, hole_diameter=4)
{
    difference()
    {
        cylinder(h=height, d=size);
        translate([0,0,height-hole_depth]) cylinder(h=hole_depth+0.1, d=hole_diameter);
    };
};

mount();