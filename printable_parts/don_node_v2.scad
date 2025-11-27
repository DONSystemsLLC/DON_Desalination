// DON Node v2 – Organic Geometry Series
// Units: mm

$fn = 96; // smoothness

// ---------- Generic helpers ----------

module tube(od=20, id=10, h=10, center=false) {
    difference() {
        cylinder(d=od, h=h, center=center);
        cylinder(d=id, h=h+0.2, center=center);
    }
}

module frustum( d1=20, d2=10, h=20, center=false ) {
    cylinder(h=h, d1=d1, d2=d2, center=center);
}

module frustum_tube(od1=30, od2=20, id1=20, id2=10, h=20, center=false) {
    difference() {
        frustum(d1=od1, d2=od2, h=h, center=center);
        frustum(d1=id1, d2=id2, h=h+0.2, center=center);
    }
}

// ---------- Global parameters (from YAML) ----------

unit_mm = 1;

// sensor_mount_clip
sensor_od           = 60;
sensor_id           = 40;
sensor_h            = 10;
sensor_wall         = 2.5;

// housing_cap
housing_od          = 80;
housing_id          = 60;
housing_h           = 15;
housing_inlet_count = 6;
housing_inlet_d     = 10;

// pulse_chamber_ring
pulse_od_top        = 90;
pulse_id_base       = 40;
pulse_h             = 30;
pulse_channel_count = 6;
pulse_channel_d     = 8;  // chosen (not in manifest)
pulse_channel_tilt  = 15; // degrees

// flow_collapse_core
flow_od_top         = 70;
flow_od_base        = 50;
flow_h              = 20;
flow_wall           = 3;

// mid_ring_adapter
mid_ring_od         = 65;
mid_ring_id         = 40;
mid_ring_h          = 10;

// output_cone
output_top_d        = 60;
output_base_d       = 20;
output_h            = 25;
output_exit_id      = 12;

// base_mount_plate
base_d              = 70;
base_h              = 10;
base_hole_count     = 3;  // "3–5 symmetrical holes" → pick 3
base_hole_d         = 5;
base_hole_radius    = 25;

// ---------- Modules ----------

// 1) Sensor mount clip
module sensor_mount_clip(
    od = sensor_od,
    id = sensor_id,
    h  = sensor_h
) {
    tube(od=od, id=id, h=h);
}

// 2) Housing cap with inlets
module housing_cap(
    od = housing_od,
    id = housing_id,
    h  = housing_h,
    inlet_count = housing_inlet_count,
    inlet_d = housing_inlet_d
) {
    difference() {
        // main cap body (simple hollow cylinder)
        tube(od=od, id=id, h=h);

        // inlet bores around perimeter
        for (i = [0 : 360/inlet_count : 360-360/inlet_count]) {
            rotate([0,90,i])
                translate([0,0,od/2])
                    cylinder(d=inlet_d, h=od, center=true);
        }
    }
}

// 3) Pulse chamber ring
module pulse_chamber_ring(
    od_top = pulse_od_top,
    id_base = pulse_id_base,
    h = pulse_h,
    channel_count = pulse_channel_count,
    channel_d = pulse_channel_d,
    channel_tilt = pulse_channel_tilt
) {
    // Approximate as a tapered ring with helical-ish channels
    difference() {
        // outer conical shell
        frustum_tube(
            od1 = od_top,
            od2 = od_top * 0.8,   // arbitrary taper
            id1 = id_base * 1.1,  // flare inner slightly
            id2 = id_base,
            h   = h
        );

        // spiral-ish channels: rotated & tilted cylinders
        for (i = [0 : 360/channel_count : 360-360/channel_count]) {
            rotate([channel_tilt, 0, i])
                translate([ (id_base + (od_top-id_base)/2)/2, 0, h/2 ])
                    cylinder(d=channel_d, h=h*1.5, center=true);
        }
    }
}

// 4) Flow collapse core
module flow_collapse_core(
    od_top = flow_od_top,
    od_base = flow_od_base,
    h = flow_h,
    wall = flow_wall
) {
    // Outer funnel
    difference() {
        frustum(d1=od_base, d2=od_top, h=h);

        // inner funnel (axial funnel to toroid approx)
        frustum(
            d1 = od_base - 2*wall,
            d2 = od_top * 0.5,
            h  = h + 0.2
        );
    }
}

// 5) Mid ring adapter
module mid_ring_adapter(
    od = mid_ring_od,
    id = mid_ring_id,
    h  = mid_ring_h
) {
    tube(od=od, id=id, h=h);
}

// 6) Output cone
module output_cone(
    top_d = output_top_d,
    base_d = output_base_d,
    h = output_h,
    exit_id = output_exit_id
) {
    difference() {
        frustum(d1=base_d, d2=top_d, h=h);
        // straight-through nozzle
        translate([0,0,-0.1])
            cylinder(d=exit_id, h=h+0.3);
    }
}

// 7) Base mount plate
module base_mount_plate(
    d = base_d,
    h = base_h,
    hole_count = base_hole_count,
    hole_d = base_hole_d,
    hole_radius = base_hole_radius
) {
    difference() {
        cylinder(d=d, h=h);

        for (i = [0 : 360/hole_count : 360-360/hole_count]) {
            rotate([0,0,i])
                translate([hole_radius, 0, h/2])
                    cylinder(d=hole_d, h=h+0.4, center=true);
        }
    }
}

// ---------- Example: stacked assembly ----------

module don_node_v2_assembly() {
    z = 0;

    // Base
    translate([0,0,z]) base_mount_plate();
    z = z + base_h;

    // Output cone
    translate([0,0,z]) output_cone();
    z = z + output_h;

    // Mid ring adapter
    translate([0,0,z]) mid_ring_adapter();
    z = z + mid_ring_h;

    // Flow collapse core
    translate([0,0,z]) flow_collapse_core();
    z = z + flow_h;

    // Pulse chamber ring
    translate([0,0,z]) pulse_chamber_ring();
    z = z + pulse_h;

    // Housing cap
    translate([0,0,z]) housing_cap();
    z = z + housing_h;

    // Sensor mount clip on top
    translate([0,0,z]) sensor_mount_clip();
}

// Uncomment one of these to view in OpenSCAD:

//sensor_mount_clip();
//housing_cap();
//pulse_chamber_ring();
//flow_collapse_core();
//mid_ring_adapter();
//output_cone();
//base_mount_plate();
don_node_v2_assembly();
