$fn=200; // High-res smoothness

// --- Parameters ---
ring_height = 30;
outer_radius = 45;
inner_radius = 20;
wall_thickness = 5;
inlet_count = 6;
inlet_radius = 3;
inlet_depth = 5;
inlet_twist = 30; // degrees

// --- Base Ring with Toroidal Cut ---
difference() {
    // Outer conic ring
    cylinder(h=ring_height, r1=outer_radius, r2=outer_radius * 0.85);

    // Inner cavity (torus effect with top taper)
    translate([0, 0, -1])
        cylinder(h=ring_height + 2, r1=inner_radius, r2=inner_radius * 0.85);
}

// --- Spiral Inlets ---
for (i = [0:360/inlet_count:359]) {
    rotate([0, 0, i])
    translate([outer_radius - inlet_depth, 0, ring_height - 8])
        rotate([0, 90, 0])
            cylinder(h=inlet_depth, r=inlet_radius);
}
