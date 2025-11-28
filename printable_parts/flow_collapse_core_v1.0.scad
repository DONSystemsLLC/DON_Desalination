
$fn = 200;  // High resolution

// --- Parameters ---
height = 20;
top_radius = 35;
bottom_radius = 15;
wall_thickness = 4;
exit_hole_radius = 6;

// --- Smooth Funnel Taper ---
difference() {
    // Outer curved funnel (from pulse chamber)
    cylinder(h=height, r1=top_radius, r2=bottom_radius);

    // Inner axial flow path
    translate([0, 0, 0])
        cylinder(h=height + 1, r1=top_radius - wall_thickness, r2=bottom_radius - wall_thickness);

    // Exit nozzle hole
    translate([0, 0, -1])
        cylinder(h=height + 2, r=exit_hole_radius);
}
