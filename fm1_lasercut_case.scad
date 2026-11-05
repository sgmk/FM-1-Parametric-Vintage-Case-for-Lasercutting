// ==============================================================================
// M-VAVE FM-1 Synthesizer - Vintage ABK-20 Style Laser-Cut Case
// ==============================================================================
// Parametric laser-cut enclosure with tilted top faceplate and vintage side
// panels ("cheeks"), inspired by the ABK-20 / eurocrack2chistli case design.
// Includes the 3D internal FM-1 PCB, silicone pads, encoders, screen, rear ports,
// LiPo battery, and a captive laser-cut ON/OFF switch slider.
// ==============================================================================

use <fm1_pcb_and_silicone.scad>

/* [Case Dimensions & Tilt] */
// Internal width of the case (X) in mm (FM-1 PCB is 156.5mm wide; 162mm is minimum tight fit)
case_width = 170.0; // [160.0:1.0:260.0]

// Sloped depth of the top faceplate (Y) in mm (FM-1 PCB is anchored to the back wall so plugs are always accessible)
case_depth = 100.0; // [95.0:1.0:180.0]

// Internal front height of the case (Z) in mm (minimum ~16mm for underside LiPo battery clearance)
case_internal_height = 25.0; // [15.0:1.0:70.0]

// Angle to tilt the top faceplate and FM-1 synth towards the user (degrees)
panel_tilt = 12.0; // [0.0:1.0:35.0]

// Shift the FM-1 interface left/right from the center of the top panel (mm)
fm1_shift_x = 0.0; // [-40.0:0.5:40.0]

// Clearance between the rear jacks/PCB and the inside of the back panel in mm (0.2mm = flush against back wall)
rear_pcb_clearance = 0.2; // [0.0:0.1:10.0]

// Standoff/spacer distance between the PCB top surface and the underside of the top frontplate in mm
pcb_frontplate_distance = 5.6; // [0.0:0.1:12.0]

/* [Rear Ports & ON/OFF Switch] */
// Rear port cutout style
rear_port_style = "plug_barrels"; // [plug_barrels:Individual Cutouts (Adjustable Barrel Clearance), open_bay:Single Open Port Bay Slot]

// 3.5mm MIDI & Audio jack hole diameter in mm (6.6mm = tight collar, 8.0-11.0mm = clears 3.5mm plug barrel)
jack_barrel_dia = 8.5; // [6.0:0.1:14.0]

// USB-C cutout width in mm (9.6mm = tight shell, 12.0-13.5mm = clears USB-C plug overmold)
usbc_barrel_width = 12.8; // [9.0:0.2:16.0]

// USB-C cutout height in mm (4.4mm = tight shell, 6.5-8.0mm = clears USB-C plug overmold)
usbc_barrel_height = 6.8; // [4.0:0.2:11.0]

// How to actuate the recessed SMD ON/OFF slide switch through the back panel
power_switch_mode = "laser_slider"; // [laser_slider:Captive Laser-Cut Slide Switch Extender, finger_notch:Wide Finger Access Slot + Top LED Window, stock_cap:Stock Plastic Cap Slot (4.0x4.0mm)]

/* [Vintage Side Panels (Cheeks)] */
// Extend the side panels past the main box (creates a vintage synth lip and overhang)
cheek_extension = 7.0; // [0.0:0.5:25.0]

// Corner radius for the top-front and top-back of the extended side cheeks (mm)
cheek_radius_top = 8.0; // [0.0:0.5:25.0]

// Corner radius for the bottom-front and bottom-back of the extended side cheeks (mm)
cheek_radius_bottom = 2.0; // [0.0:0.5:25.0]

// Control the bottom cheek overhang independently (true = flat/custom bottom extension)
cheek_flat_bottom = false;

// How much the bottom of the cheeks extends below the box when cheek_flat_bottom is true (0 = flush)
cheek_bottom_extension = 0.0; // [0.0:0.5:20.0]

/* [Material & Laser] */
// Thickness of the main panels (top, bottom, front, back) in mm
thickness = 3.0; // [1.5:0.1:8.0]

// Thickness of the left/right side cheeks in mm (0 = use same thickness as main panels)
thickness_sides = 6.5; // [0.0:0.1:10.0]

// Target length of the interlocking finger notches in mm
notch_length = 30.0; // [8.0:1.0:50.0]

// Laser kerf compensation in mm (positive values widen tabs for a tighter fit)
kerf = 0.08; // [0.0:0.01:0.4]

/* [Display Mode] */
// What to render
part_to_show = "assembly"; // [assembly:3D Assembly, exploded:3D Exploded View, layout:2D Laser Cut Layout, top:Top Faceplate (2D), bottom:Bottom Panel (2D), left:Left Cheek Panel (2D), right:Right Cheek Panel (2D), front:Front Panel (2D), back:Back Panel (2D), slider:Power Switch Slider (2D), internals:FM-1 Internals Only (3D)]

// Show the 3D FM-1 PCB, silicone pads, encoders, screen & battery inside the case
show_internals = true;

// Float or explode distance in 3D views (mm)
explode_distance = 30.0; // [0.0:2.0:120.0]

// Opacity of the case panels in 3D view
assembly_opacity = 0.55; // [0.15:0.05:1.0]

// Stop OpenSCAD Customizer parameter scanning here so internal constants are never exported to JSON
module __customizer_limit__() {}

/* [Hidden] */
$fn = 48;

// Effective panel thicknesses
T  = thickness;
Ts = (thickness_sides > 0) ? thickness_sides : thickness;

// Internal & outer box dimensions
iw = case_width;
id = case_depth * cos(panel_tilt) + T * sin(panel_tilt);
case_internal_height_back = case_internal_height + id * tan(panel_tilt);

ow = iw + 2 * Ts;
od = id + 2 * T;

// Automatically calculated odd notch counts per edge
num_notches_x       = max(1, floor(iw / (2 * notch_length)));
num_notches_y       = max(1, floor(od / (2 * notch_length)));
num_notches_d       = max(1, floor(case_depth / (2 * notch_length)));
num_notches_z_front = max(1, floor(case_internal_height / (2 * notch_length)));
num_notches_z_back  = max(1, floor(case_internal_height_back / (2 * notch_length)));

len_x       = iw / (2 * num_notches_x + 1);
len_y       = od / (2 * num_notches_y + 1);
len_d       = case_depth / (2 * num_notches_d + 1);
len_z_front = case_internal_height / (2 * num_notches_z_front + 1);
len_z_back  = case_internal_height_back / (2 * num_notches_z_back + 1);

// Tilted Top Panel tab geometry into Front and Back vertical walls
tab_len_front = T * (1 + sin(panel_tilt)) / cos(panel_tilt);
tab_len_back  = T / cos(panel_tilt);

z_max_front  = case_internal_height;
z_min_front  = max(0.5, case_internal_height - T / cos(panel_tilt) - T * tan(panel_tilt));
slot_h_front = z_max_front - z_min_front;

z_max_back   = min(case_internal_height_back, case_internal_height + (case_depth + tab_len_back) * sin(panel_tilt));
z_min_back   = case_internal_height + case_depth * sin(panel_tilt) - T / cos(panel_tilt);
slot_h_back  = z_max_back - z_min_back;

// ==============================================================================
// Fixed FM-1 Hardware Interface Constants (Hidden from Customizer)
// ==============================================================================
FM1_REF_W = 162.0;
FM1_REF_D = 97.0;

// Vertical stackup relative to the Top Faceplate outer surface (Z_local = 0):
// The underside of the Top Faceplate is at Z_local = -T, and the PCB top surface
// sits `pcb_frontplate_distance` below the underside of the Top Faceplate.
PCB_TOP_Z_LOCAL = -(T + pcb_frontplate_distance);

// Rear Edge Ports sit on the PCB with their front faces at Y_fm1 = 94.6mm:
// - Mid-mount USB-C & 3.5mm jacks are centered on the 1.6mm PCB middle axis (Z_pcb = -0.8mm)
// - SMD Slide Power Switch sits on top of the PCB (+2.0mm calibrated higher in Z -> Z_pcb = +3.2mm)
PORT_FACE_Y_FM1 = 94.6;
jack_z_local    = PCB_TOP_Z_LOCAL - 0.8; // Middle axis of the 1.6mm PCB
switch_z_local  = PCB_TOP_Z_LOCAL + 3.2; // Calibrated SMD slide switch center (+2mm higher in Z)

// Anchor the FM-1 PCB to the Back Panel so that the rear port faces (Y_fm1 = 94.6mm)
// sit right against the inside face of the vertical Back Panel (Y_box = T + id)
// at any case_depth and any panel_tilt!
fm1_ofs_x = (iw - FM1_REF_W) / 2 + fm1_shift_x;
fm1_ofs_y = (id - rear_pcb_clearance + jack_z_local * sin(panel_tilt)) / cos(panel_tilt) - PORT_FACE_Y_FM1;

CUTOUT_TOL       = 0.35;
KNOB_HOLE_D      = 7.0;
PCB_MOUNT_HOLE_D = 2.6;

SCREEN_CX      = 61.10;
SCREEN_CY      = 70.20;
SCREEN_BEZEL_W = 37.50;
SCREEN_BEZEL_H = 37.50;

KNOB_COORDS = [
    [ 14.00, 81.00], // Master Volume
    [ 31.00, 81.00], // Select
    [ 14.00, 64.00], // Presets
    [ 31.00, 64.00], // Algorithm
    [ 91.00, 81.00], // Knob 1
    [109.00, 81.00], // Knob 2
    [127.00, 81.00], // Knob 3
    [145.00, 81.00]  // Knob 4
];

PCB_SCREW_COORDS = [
    [  7.30, 89.00],
    [ 83.00, 89.00],
    [154.50, 89.00],
    [  7.30, 44.50],
    [ 83.00, 44.50],
    [154.50, 44.50]
];

OCT_CX     =  22.60; OCT_CY     = 51.30; OCT_W     =  24.60; OCT_H     =  7.40;
OPTIONS_CX = 118.15; OPTIONS_CY = 58.65; OPTIONS_W =  63.30; OPTIONS_H = 21.90;
KEYS_CX    =  81.00; KEYS_CY    = 24.25; KEYS_W    = 147.80; KEYS_H    = 34.30;
SPEAKER_CX =  24.20; SPEAKER_CY = 34.50; SPEAKER_D =  26.50;

// Rear Edge Ports (in FM-1 X reference frame, calibrated from physical test cut)
REAR_LED_X   = 33.80; // SMD Charge LED (LED2)
REAR_POWER_X = 37.05; // Right-angle SMD Slide Switch (J5)
REAR_USBC_X  = 50.00; // Mid-mount USB Type-C (J3)
REAR_MIDI_X  = 63.25; // Mid-mount 3.5mm MIDI In (J6, shifted +0.5mm left in rear view)
REAR_AUDIO_X = 75.00; // Mid-mount 3.5mm Audio Out (J7, shifted -1.0mm right in rear view)

// Port exclusion zone along X so top-back finger tabs never collide with rear port cutouts
PORT_ZONE_X_MIN = fm1_ofs_x + 29.0;
PORT_ZONE_X_MAX = fm1_ofs_x + 82.0;

// Function to check if a back-edge finger tab [x0, x1] overlaps the rear port zone
function overlaps_port_zone(x0, x1) =
    (x1 > PORT_ZONE_X_MIN) && (x0 < PORT_ZONE_X_MAX);

// Project rear jack & switch vertical heights onto the Back Panel
pcb_rear_y_local      = fm1_ofs_y + PORT_FACE_Y_FM1;
REAR_JACK_Z_IN_BACK   = case_internal_height
                      + pcb_rear_y_local * sin(panel_tilt)
                      + jack_z_local * cos(panel_tilt);
REAR_SWITCH_Z_IN_BACK = case_internal_height
                      + pcb_rear_y_local * sin(panel_tilt)
                      + switch_z_local * cos(panel_tilt);

// ==============================================================================
// 2D Helper Modules
// ==============================================================================
module offset_kerf() {
    if (kerf > 0) {
        offset(delta = kerf / 2) children();
    } else {
        children();
    }
}

module rounded_square_2d(size, r) {
    x = size[0];
    y = size[1];
    rad = min(r, x/2, y/2);
    hull() {
        translate([rad, rad])         circle(r=rad);
        translate([x - rad, rad])     circle(r=rad);
        translate([rad, y - rad])     circle(r=rad);
        translate([x - rad, y - rad]) circle(r=rad);
    }
}

// All FM-1 top interface cutouts in the 162x97mm FM-1 reference frame
module fm1_interface_cutouts_2d() {
    tol = CUTOUT_TOL;

    // 1.54" Screen Glass Bezel Window
    translate([SCREEN_CX - SCREEN_BEZEL_W/2 - tol, SCREEN_CY - SCREEN_BEZEL_H/2 - tol])
        rounded_square_2d([SCREEN_BEZEL_W + 2*tol, SCREEN_BEZEL_H + 2*tol], 3.2);

    // 8 Encoder Knob Holes
    for (pt = KNOB_COORDS) {
        translate(pt) circle(d = KNOB_HOLE_D);
    }

    // 6 M2.5 PCB Mounting Holes
    for (pt = PCB_SCREW_COORDS) {
        translate(pt) circle(d = PCB_MOUNT_HOLE_D);
    }

    // Charge LED Pinhole on Top Faceplate (right above LED2 at X=33.8, Y=92.8)
    translate([REAR_LED_X, 92.5])
        circle(d = 2.2);

    // Octave Silicone Pad Cutout
    translate([OCT_CX - OCT_W/2 - tol, OCT_CY - OCT_H/2 - tol])
        rounded_square_2d([OCT_W + 2*tol, OCT_H + 2*tol], 3.0);

    // 2x6 Function Options Silicone Pad Cutout
    translate([OPTIONS_CX - OPTIONS_W/2 - tol, OPTIONS_CY - OPTIONS_H/2 - tol])
        rounded_square_2d([OPTIONS_W + 2*tol, OPTIONS_H + 2*tol], 3.0);

    // 27-Key Silicone Keybed Cutout
    translate([KEYS_CX - KEYS_W/2 - tol, KEYS_CY - KEYS_H/2 - tol])
        rounded_square_2d([KEYS_W + 2*tol, KEYS_H + 2*tol], 5.0);
}

// ==============================================================================
// Captive Laser-Cut ON/OFF Slide Switch Extender (2D & 3D)
// ==============================================================================
// Sits in the 2.3mm channel on top of the PCB rear edge between the SMD switch
// metal housing (Y_fm1 = 92.3mm) and the inside of the Back Panel (Y_fm1 = 94.6mm),
// and is sandwiched vertically in the 3.0mm gap between the PCB top surface and
// the underside of the Top Faceplate.
// A 1.6mm fork notch grabs the 1.5mm black SMD switch pin, while a rounded thumb
// lever protrudes 3.0mm out through the Back Panel.
module power_switch_slider_2d() {
    bar_w    = 12.0;    // Captive flange width inside the back wall (mm)
    bar_d    =  2.1;    // Fits in the 2.3mm gap between SMD switch body & back wall (mm)
    handle_w =  4.2;    // Thumb tab width protruding through the back panel slot (mm)
    handle_d = T + 3.2; // Reaches through the back wall thickness T + 3.2mm outside (mm)
    pin_w    =  1.65;   // Fork slot width for the 1.5mm black SMD switch pin (mm)
    pin_d    =  1.6;    // Fork slot depth (mm)

    offset_kerf() {
        difference() {
            union() {
                // Inner captive flange (rides between SMD switch body and inside of back wall)
                translate([-bar_w/2, -bar_d])
                    rounded_square_2d([bar_w, bar_d], 0.8);

                // Outer thumb lever sticking out through the Back Panel
                translate([-handle_w/2, -0.8])
                    rounded_square_2d([handle_w, handle_d + 0.8], 1.2);
            }

            // Fork notch that grabs the 1.5mm SMD slide switch actuator pin
            translate([-pin_w/2, -bar_d - 0.1])
                square([pin_w, pin_d + 0.1]);
        }
    }
}

// ==============================================================================
// 2D Panel Modules
// ==============================================================================

// 1. TOP FACEPLATE (X in [0..iw], Y in [0..case_depth], side tabs +-Ts, front/back tabs)
module top_panel() {
    offset_kerf() {
        difference() {
            union() {
                square([iw, case_depth]);

                // Left & Right tabs into side cheeks (at odd indices i % 2 == 1)
                for (i = [0 : 2 * num_notches_d]) {
                    if (i % 2 == 1) {
                        translate([-Ts, i * len_d])
                            square([Ts + 0.1, len_d]);
                        translate([iw - 0.1, i * len_d])
                            square([Ts + 0.1, len_d]);
                    }
                }

                // Front tabs into Front Panel (at odd indices i % 2 == 1)
                for (i = [0 : 2 * num_notches_x]) {
                    if (i % 2 == 1) {
                        translate([i * len_x, -tab_len_front])
                            square([len_x, tab_len_front + 0.1]);
                    }
                }

                // Back tabs into Back Panel (skipping the Rear Port Zone so ports have clean wall clearance)
                for (i = [0 : 2 * num_notches_x]) {
                    if (i % 2 == 1 && !overlaps_port_zone(i * len_x, (i + 1) * len_x)) {
                        translate([i * len_x, case_depth - 0.1])
                            square([len_x, tab_len_back + 0.1]);
                    }
                }
            }

            // Subtract FM-1 Interface Cutouts
            translate([fm1_ofs_x, fm1_ofs_y])
                fm1_interface_cutouts_2d();
        }
    }
}

// 2. BOTTOM PANEL (X in [0..iw], Y in [0..od], side tabs +-Ts into cheeks, slots for Front/Back)
module bottom_panel() {
    // Speaker position projected horizontally onto the bottom panel
    spk_x = fm1_ofs_x + SPEAKER_CX;
    spk_y = T + (fm1_ofs_y + SPEAKER_CY) * cos(panel_tilt);

    offset_kerf() {
        difference() {
            union() {
                square([iw, od]);

                // Left & Right tabs into side cheeks (at odd indices i % 2 == 1)
                for (i = [0 : 2 * num_notches_y]) {
                    if (i % 2 == 1) {
                        translate([-Ts, i * len_y])
                            square([Ts + 0.1, len_y]);
                        translate([iw - 0.1, i * len_y])
                            square([Ts + 0.1, len_y]);
                    }
                }
            }

            // Slots for Front wall bottom tabs (Y in [0..T], odd indices i % 2 == 1)
            for (i = [0 : 2 * num_notches_x]) {
                if (i % 2 == 1) {
                    translate([i * len_x, -0.1])
                        square([len_x, T + 0.2]);
                }
            }

            // Slots for Back wall bottom tabs (Y in [od-T..od], odd indices i % 2 == 1)
            for (i = [0 : 2 * num_notches_x]) {
                if (i % 2 == 1) {
                    translate([i * len_x, od - T - 0.1])
                        square([len_x, T + 0.2]);
                }
            }

            // Speaker Perforated Acoustic Grille
            for (r = [3 : 3.5 : SPEAKER_D/2]) {
                count = max(4, round(2 * 3.14159 * r / 3.5));
                for (a = [0 : 360/count : 359]) {
                    translate([spk_x + r * cos(a), spk_y + r * sin(a)])
                        circle(d = 1.8);
                }
            }
            translate([spk_x, spk_y])
                circle(d = 2.0);
        }
    }
}

// 3. LEFT & RIGHT VINTAGE CHEEK PANELS
// X_panel maps to Y_box [0..od], Y_panel maps to Z_box - T [-T..case_internal_height_back]
module left_panel() {
    bot_ext = cheek_flat_bottom ? cheek_bottom_extension : cheek_extension;
    r_top   = min(cheek_radius_top, cheek_extension + T);
    r_bot   = min(cheek_radius_bottom, cheek_extension + T, (case_internal_height + T + bot_ext) / 2);

    offset_kerf() {
        difference() {
            // Outer sculpted vintage cheek contour
            if (cheek_extension > 0) {
                hull() {
                    // Bottom-front corner
                    if (r_bot > 0) {
                        translate([-cheek_extension + r_bot, -T - bot_ext + r_bot])
                            circle(r = r_bot);
                    } else {
                        translate([-cheek_extension, -T - bot_ext])
                            square([0.01, 0.01]);
                    }

                    // Bottom-back corner
                    if (r_bot > 0) {
                        translate([od + cheek_extension - r_bot, -T - bot_ext + r_bot])
                            circle(r = r_bot);
                    } else {
                        translate([od + cheek_extension - 0.01, -T - bot_ext])
                            square([0.01, 0.01]);
                    }

                    // Top-front rounded corner
                    offset(r = r_top)
                        offset(delta = cheek_extension - r_top)
                            polygon([
                                [0, 0],
                                [T, 0],
                                [T, case_internal_height],
                                [0, case_internal_height]
                            ]);

                    // Top-back rounded corner
                    offset(r = r_top)
                        offset(delta = cheek_extension - r_top)
                            polygon([
                                [od - T, 0],
                                [od, 0],
                                [od, case_internal_height_back],
                                [od - T, case_internal_height_back]
                            ]);
                }
            } else {
                // Flush side panel when cheek_extension == 0
                polygon([
                    [0, -T],
                    [od, -T],
                    [od, case_internal_height_back],
                    [od - T, case_internal_height_back],
                    [T, case_internal_height],
                    [0, case_internal_height]
                ]);
            }

            // 1. Slots for Bottom panel side tabs (Y_panel in [-T..0], odd indices)
            for (i = [0 : 2 * num_notches_y]) {
                if (i % 2 == 1) {
                    translate([i * len_y, -T - ((cheek_extension == 0 || bot_ext == 0) ? 0.1 : 0)])
                        square([len_y, T + ((cheek_extension == 0 || bot_ext == 0) ? 0.1 : 0)]);
                }
            }

            // 2. Slots for Front panel side tabs (X_panel in [0..T], odd indices)
            for (i = [0 : 2 * num_notches_z_front]) {
                if (i % 2 == 1) {
                    translate([-(cheek_extension == 0 ? 0.1 : 0), i * len_z_front])
                        square([T + (cheek_extension == 0 ? 0.1 : 0), len_z_front]);
                }
            }

            // 3. Slots for Back panel side tabs (X_panel in [od-T..od], odd indices)
            for (i = [0 : 2 * num_notches_z_back]) {
                if (i % 2 == 1) {
                    translate([od - T, i * len_z_back])
                        square([T + (cheek_extension == 0 ? 0.1 : 0), len_z_back]);
                }
            }

            // 4. Tilted slots for Top Faceplate side tabs (along the panel_tilt slope, odd indices)
            translate([T, case_internal_height])
                rotate([0, 0, panel_tilt])
                translate([0, -T])
                for (i = [0 : 2 * num_notches_d]) {
                    if (i % 2 == 1) {
                        translate([i * len_d, 0])
                            square([len_d, T + (cheek_extension == 0 ? 0.1 : 0)]);
                    }
                }
        }
    }
}

module right_panel() {
    left_panel();
}

// 4. FRONT PANEL (X in [0..iw], Y in [0..case_internal_height])
module front_panel() {
    offset_kerf() {
        difference() {
            union() {
                square([iw, case_internal_height]);

                // Side tabs into Left & Right cheeks (odd indices)
                for (i = [0 : 2 * num_notches_z_front]) {
                    if (i % 2 == 1) {
                        translate([-Ts, i * len_z_front])
                            square([Ts + 0.1, len_z_front]);
                        translate([iw - 0.1, i * len_z_front])
                            square([Ts + 0.1, len_z_front]);
                    }
                }

                // Bottom tabs into Bottom panel (odd indices)
                for (i = [0 : 2 * num_notches_x]) {
                    if (i % 2 == 1) {
                        translate([i * len_x, -T])
                            square([len_x, T + 0.1]);
                    }
                }
            }

            // Slots at top edge for tilted Top Faceplate front tabs
            for (i = [0 : 2 * num_notches_x]) {
                if (i % 2 == 1) {
                    translate([i * len_x, z_min_front])
                        square([len_x, slot_h_front + 0.1]);
                }
            }
        }
    }
}

// 5. BACK PANEL (X in [0..iw], Y in [0..case_internal_height_back])
module back_panel() {
    offset_kerf() {
        difference() {
            union() {
                square([iw, case_internal_height_back]);

                // Side tabs into Left & Right cheeks (odd indices)
                for (i = [0 : 2 * num_notches_z_back]) {
                    if (i % 2 == 1) {
                        translate([-Ts, i * len_z_back])
                            square([Ts + 0.1, len_z_back]);
                        translate([iw - 0.1, i * len_z_back])
                            square([Ts + 0.1, len_z_back]);
                    }
                }

                // Bottom tabs into Bottom panel (odd indices)
                for (i = [0 : 2 * num_notches_x]) {
                    if (i % 2 == 1) {
                        translate([i * len_x, -T])
                            square([len_x, T + 0.1]);
                    }
                }
            }

            // Slots at top edge for tilted Top Faceplate back tabs (skipping the Rear Port Zone)
            for (i = [0 : 2 * num_notches_x]) {
                if (i % 2 == 1 && !overlaps_port_zone(i * len_x, (i + 1) * len_x)) {
                    translate([i * len_x, z_min_back])
                        square([len_x, slot_h_back + 0.1]);
                }
            }

            // Rear Port & Power Switch Cutouts
            // - USB-C, MIDI & Audio are centered on the PCB middle axis (REAR_JACK_Z_IN_BACK)
            // - ON/OFF Switch sits on top of the PCB (REAR_SWITCH_Z_IN_BACK, ~2.0mm higher)
            translate([fm1_ofs_x, 0]) {
                if (rear_port_style == "open_bay") {
                    // Single wide rounded stadium bay covering Power, USB-C, MIDI & Audio
                    translate([32.0, REAR_JACK_Z_IN_BACK - 4.8])
                        rounded_square_2d([49.5, 10.6], 4.5);
                } else {
                    // 1. ON/OFF Switch Cutout (centered at REAR_SWITCH_Z_IN_BACK on top of PCB)
                    if (power_switch_mode == "laser_slider") {
                        // Horizontal guide slot for the laser-cut captive slider
                        slider_slot_h = T / cos(panel_tilt) + 0.5;
                        translate([REAR_POWER_X - 4.0, REAR_SWITCH_Z_IN_BACK - slider_slot_h/2])
                            rounded_square_2d([8.0, slider_slot_h], 0.5);
                    } else if (power_switch_mode == "stock_cap") {
                        // Slot for stock plastic slider cap (3.5x3.5mm nub + travel) + Charge LED pinhole
                        translate([REAR_POWER_X - 3.3, REAR_SWITCH_Z_IN_BACK - 2.1])
                            rounded_square_2d([6.6, 4.2], 1.0);
                        translate([REAR_LED_X, REAR_SWITCH_Z_IN_BACK])
                            circle(d = 2.0);
                    } else {
                        // Wide finger-access slot so a fingertip/fingernail can flick the switch directly
                        translate([REAR_POWER_X - 6.0, REAR_SWITCH_Z_IN_BACK - 3.0])
                            rounded_square_2d([11.0, 6.0], 2.5);
                    }

                    // 2. USB Type-C, MIDI In & Audio Out Cutouts (centered on PCB middle axis REAR_JACK_Z_IN_BACK)
                    translate([REAR_USBC_X - usbc_barrel_width/2, REAR_JACK_Z_IN_BACK - usbc_barrel_height/2])
                        rounded_square_2d([usbc_barrel_width, usbc_barrel_height], min(2.8, usbc_barrel_height/2.2));
                    translate([REAR_MIDI_X, REAR_JACK_Z_IN_BACK])
                        circle(d = jack_barrel_dia);
                    translate([REAR_AUDIO_X, REAR_JACK_Z_IN_BACK])
                        circle(d = jack_barrel_dia);
                }
            }
        }
    }
}

// ==============================================================================
// 3D Assembly & Exploded Views
// ==============================================================================
module assembly(explode = 0.0) {
    // 1. Bottom Panel (sits at Z in [0..T], X in [Ts..Ts+iw], Y in [0..od])
    color("#302b28", assembly_opacity)
        translate([Ts, 0, -explode])
            linear_extrude(T)
                bottom_panel();

    // 2. Tilted Top Faceplate + Attached FM-1 Internals + Captive Power Slider
    translate([Ts, T, T + case_internal_height]) {
        rotate([panel_tilt, 0, 0]) {
            // FM-1 PCB, Silicone Button Mats, Encoders, Screen & Battery
            if (show_internals) {
                translate([fm1_ofs_x, fm1_ofs_y, PCB_TOP_Z_LOCAL])
                    fm1_internals_assembly(explode_silicone = explode * 0.25);
            }

            // Captive Laser-Cut ON/OFF Switch Slider (sandwiched between PCB top and Top Faceplate)
            if (power_switch_mode == "laser_slider" && rear_port_style != "open_bay") {
                color("#4a423d", 0.95)
                    translate([fm1_ofs_x + REAR_POWER_X, fm1_ofs_y + PORT_FACE_Y_FM1 + explode * 0.4, switch_z_local - T/2])
                        linear_extrude(T)
                            power_switch_slider_2d();
            }

            // Laser-Cut Top Faceplate
            color("#3d3632", assembly_opacity)
                translate([0, 0, -T + explode])
                    linear_extrude(T)
                        top_panel();
        }
    }

    // 4. Left Vintage Cheek Panel (X in [0..Ts])
    color("#a0522d", assembly_opacity)
        translate([-explode, 0, T])
            rotate([90, 0, 90])
                linear_extrude(Ts)
                    left_panel();

    // 5. Right Vintage Cheek Panel (X in [ow-Ts..ow])
    color("#a0522d", assembly_opacity)
        translate([ow - Ts + explode, 0, T])
            rotate([90, 0, 90])
                linear_extrude(Ts)
                    right_panel();

    // 6. Front Panel (Y in [0..T])
    color("#36302d", assembly_opacity)
        translate([Ts, T - explode, T])
            rotate([90, 0, 0])
                linear_extrude(T)
                    front_panel();

    // 7. Back Panel (Y in [od-T..od])
    color("#36302d", assembly_opacity)
        translate([Ts, od + explode, T])
            rotate([90, 0, 0])
                linear_extrude(T)
                    back_panel();
}

// ==============================================================================
// 2D Flat Laser Cutting Layout
// ==============================================================================
module layout() {
    spacing = 8.0;
    bot_ext = (cheek_extension > 0) ? (cheek_flat_bottom ? cheek_bottom_extension : cheek_extension) : 0;

    // Row 1: Bottom Panel & Top Faceplate
    translate([Ts, 0])
        bottom_panel();

    translate([ow + Ts + spacing, tab_len_front])
        top_panel();

    // Row 2: Left & Right Vintage Cheek Panels
    row2_y = max(od, case_depth + tab_len_front + tab_len_back) + spacing + T + bot_ext;
    translate([cheek_extension, row2_y])
        left_panel();

    translate([2 * od + cheek_extension * 3 + spacing, row2_y])
        mirror([1, 0]) right_panel();

    // Row 3: Front & Back Panels (+ Captive Power Switch Slider)
    row3_y = row2_y + case_internal_height_back + cheek_extension + spacing + T;
    translate([Ts, row3_y])
        front_panel();

    translate([ow + Ts + spacing, row3_y])
        back_panel();

    if (power_switch_mode == "laser_slider") {
        translate([2 * ow + 2 * Ts + 2 * spacing + 10, row3_y + 10])
            power_switch_slider_2d();
    }
}

// ==============================================================================
// Main Render Controller
// ==============================================================================
if (part_to_show == "assembly") {
    assembly(explode = 0.0);
} else if (part_to_show == "exploded") {
    assembly(explode = explode_distance);
} else if (part_to_show == "layout") {
    layout();
} else if (part_to_show == "top") {
    top_panel();
} else if (part_to_show == "bottom") {
    bottom_panel();
} else if (part_to_show == "left") {
    left_panel();
} else if (part_to_show == "right") {
    mirror([1, 0]) right_panel();
} else if (part_to_show == "front") {
    front_panel();
} else if (part_to_show == "back") {
    back_panel();
} else if (part_to_show == "slider") {
    power_switch_slider_2d();
} else if (part_to_show == "internals") {
    fm1_internals_assembly(explode_silicone = 0.0);
}
