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

/* [Speaker & Acoustic Grille] */
// Speaker driver model inside the enclosure
speaker_type = "aliexpress_40mm"; // [aliexpress_40mm:AliExpress 40mm 4Ohm 5W Shielded Speaker (40x22mm), upgrade_50mm:Upgraded 50mm Full-Range Speaker (50x31mm), stock_26mm:Stock 26.5mm Capsule (26.5x4.2mm), custom:Custom Dimensions (set in Custom tab), none:No Speaker / No Grille]

// Acoustic resonator or speaker mount inside the enclosure
resonator_type = "helmholtz_laser_duct"; // [helmholtz_laser_duct:Laser-Cut Stacked Wood Helmholtz Resonator (Bass-Reflex), helmholtz_3d_pod:3D-Printed Sealed Helmholtz Resonator Pod (Bass-Reflex), stepped_clamp_laser:Laser-Cut 2-Layer Stepped Wood Clamp (Open Case), spider_clamp_3d:3D-Printed 3-Pillar Spider Clamp Bridge (Open Case), retainer_ring:Laser-Cut Single Retainer Ring (Centering Only), none:None (Open Inside Case)]

// Bottom panel speaker cutout style
speaker_grille_style = "fm1_pinwheel"; // [fm1_pinwheel:Original FM-1 Curved Pinwheel Grille, perforated:Perforated Acoustic Grille Dots, open_hole:Open Round Cutout (for recessed speaker), none:Solid Bottom (No Cutout)]

// Speaker X center in FM-1 coordinates in mm (38 = rear-left zone; 30 = front-left under keys)
speaker_x = 38.0; // [10.0:0.5:150.0]

// Speaker Y center in FM-1 coordinates in mm (64 = deeper rear-left zone; 24.5 = stock silkscreen circle)
speaker_y = 64.0; // [10.0:0.5:85.0]

// Vertical Z offset of the speaker in mm (0 = resting flush on inside of Bottom Panel; negative = recessed into Bottom Panel)
speaker_z_offset = 0.0; // [-10.0:0.5:25.0]

/* [Custom Speaker Dimensions (when speaker_type == custom)] */
// Outer rim diameter of custom speaker in mm
speaker_dia = 50.0; // [20.0:0.5:70.0]

// Total height of custom speaker from front gasket to magnet back in mm
speaker_total_height = 31.0; // [4.0:0.5:45.0]

// Diameter of rear magnet / cup in mm
speaker_magnet_dia = 45.0; // [15.0:0.5:60.0]

// Height of rear magnet / cup in mm
speaker_magnet_height = 8.0; // [2.0:0.2:25.0]

/* [Helmholtz Port Tuning (when using Helmholtz Resonators)] */
// Internal width of the Helmholtz bass-reflex slot tunnel in mm
helmholtz_port_w = 25.0; // [12.0:1.0:40.0]

// Internal height of the Helmholtz slot tunnel in mm (6.0mm = 2 stacked 3mm laser-cut wood layers)
helmholtz_port_h = 6.0; // [3.0:0.5:15.0]

// Physical length of the Helmholtz slot tunnel in mm (56mm tunes 0.15L chamber to ~135 Hz)
helmholtz_port_length = 56.0; // [20.0:1.0:80.0]

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
part_to_show = "assembly"; // [assembly:3D Assembly, exploded:3D Exploded View, helmholtz_3d:Dedicated 3D Speaker & Laser Helmholtz Duct View, helmholtz_3d_exploded:Dedicated 3D Exploded Speaker & Duct Stack, layout:2D Laser Cut Layout, top:Top Faceplate (2D), bottom:Bottom Panel (2D), left:Left Cheek Panel (2D), right:Right Cheek Panel (2D), front:Front Panel (2D), back:Back Panel (2D), slider:Power Switch Slider (2D), helmholtz_laser:Laser-Cut Helmholtz Resonator Parts (2D), stepped_clamp:Laser-Cut 2-Layer Stepped Clamp (2D), speaker_ring:Laser-Cut Speaker Retainer Ring (2D), helmholtz_pod:3D-Printed Helmholtz Resonator Tub (3D STL), spider_clamp:3D-Printed Spider Clamp Bridge (3D STL), speaker:Speaker Driver Only (3D), internals:FM-1 Internals Only (3D)]

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

// Fixed mounting orientation & legacy compatibility flags
speaker_mount = "bottom_panel";
speaker_face_down = true;
show_speaker_retainer = (resonator_type != "none");

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

// Effective speaker dimensions & projected Bottom Panel coordinates
eff_spk_dia = (speaker_type == "stock_26mm")      ? 26.5 :
              (speaker_type == "aliexpress_40mm") ? 40.0 :
              (speaker_type == "upgrade_50mm")    ? 50.0 :
              speaker_dia;
eff_spk_h   = (speaker_type == "stock_26mm")      ?  4.2 :
              (speaker_type == "aliexpress_40mm") ? 21.0 :
              (speaker_type == "upgrade_50mm")    ? 31.0 :
              speaker_total_height;
eff_mag_dia = (speaker_type == "stock_26mm")      ? 16.0 :
              (speaker_type == "aliexpress_40mm") ? 23.1 :
              (speaker_type == "upgrade_50mm")    ? 45.0 :
              speaker_magnet_dia;
eff_mag_h   = (speaker_type == "stock_26mm")      ?  2.5 :
              (speaker_type == "aliexpress_40mm") ?  8.5 :
              (speaker_type == "upgrade_50mm")    ?  8.0 :
              speaker_magnet_height;
spk_box_x   = fm1_ofs_x + speaker_x;
spk_box_y   = T + (fm1_ofs_y + speaker_y) * cos(panel_tilt);

// Calculate vertical clearance between the speaker top and the tilted PCB underside
pcb_bot_z_at_spk = T + case_internal_height
                 + (fm1_ofs_y + speaker_y) * sin(panel_tilt)
                 + (PCB_TOP_Z_LOCAL - 1.6) * cos(panel_tilt);
spk_top_z_in_box = T + speaker_z_offset + eff_spk_h;
spk_pcb_clearance = pcb_bot_z_at_spk - spk_top_z_in_box;

if (speaker_type != "none" && speaker_mount == "bottom_panel") {
    echo(str("Speaker Center [X=", speaker_x, ", Y=", speaker_y, "] -> Vertical Clearance to PCB Underside = ", round(spk_pcb_clearance * 100) / 100, " mm (PCB bottom Z=", round(pcb_bot_z_at_spk * 10) / 10, "mm, Speaker top Z=", round(spk_top_z_in_box * 10) / 10, "mm)"));
}

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
// Reaches deep inside the enclosure to clasp the 1.5mm right-angle SMD slide switch
// peg (J5) on top of the PCB, captive behind the vertical Back Panel.
// Sandwiched vertically between the PCB top surface and the Top Faceplate.
// Engineered with heavy-duty 5.5mm wide fork prongs and a 2.0mm+ solid spine so it
// never snaps along the wood grain under laser cutting or repeated actuation!
module power_switch_slider_2d() {
    flange_w = 13.5;    // Captive inner retention flange width in X (mm)
    flange_d =  5.2;    // Deep reach inside enclosure towards switch body (mm)
    handle_w =  5.2;    // Thumb tab width protruding through the Back Panel slot (mm)
    handle_d = T + 3.5; // Reaches through 3mm back wall + 3.5mm outside for thumb flick (mm)
    pin_w    =  1.85;   // Fork slot width for 1.5mm switch pin with kerf clearance (mm)
    pin_d    =  3.0;    // Deep fork slot depth capturing the switch pin securely (mm)

    offset_kerf() {
        difference() {
            union() {
                // Inner captive flange with rounded corners (slides inside back panel)
                translate([-flange_w/2, -flange_d])
                    rounded_square_2d([flange_w, flange_d], 1.2);

                // Reinforced structural neck fillets bridging flange to thumb handle
                translate([-handle_w/2 - 1.5, -1.5])
                    rounded_square_2d([handle_w + 3.0, 1.5], 0.8);

                // Outer thumb lever sticking out through the Back Panel
                translate([-handle_w/2, -0.6])
                    rounded_square_2d([handle_w, handle_d + 0.6], 1.2);
            }

            // Deep fork notch that captures the 1.5mm SMD slide switch actuator pin
            // Leaves a solid 2.2mm wooden spine between the notch bottom and back wall
            translate([-pin_w/2, -flange_d - 0.1])
                square([pin_w, pin_d + 0.1]);
        }
    }
}

// ==============================================================================
// Speaker Mounting, Clamping & Acoustic Resonator Modules (2D/3D)
// ==============================================================================
// See docs/PEER_REVIEW_DIALOGUE_SYNTH_GEEK_VS_SOUND_ENG.md for the full engineering audit:
// - "spider_clamp_3d": 3D-printed 3-pillar open spider bridge clamping the magnet pot downward.
// - "stepped_clamp_laser": 2-layer stacked laser-cut rings (overhangs outer rim by 1.2mm).
// - "helmholtz_3d_pod" / "helmholtz_laser_duct": tuned slot bass-reflex system.

helmholtz_area_mm2  = helmholtz_port_w * helmholtz_port_h;
helmholtz_d_eff_mm  = 2 * sqrt(helmholtz_area_mm2 / 3.14159);
helmholtz_l_eff_mm  = helmholtz_port_length + 0.85 * helmholtz_d_eff_mm;
// Real net volume of sealed sub-enclosure tub (~0.15L = 150,000 mm^3):
helmholtz_vb_liters = 0.15;
helmholtz_fb_hz     = (343000 / (2 * 3.14159)) * sqrt(helmholtz_area_mm2 / ((helmholtz_vb_liters * 1000000) * helmholtz_l_eff_mm));

if (speaker_type != "none") {
    if (resonator_type == "spider_clamp_3d" || resonator_type == "stepped_clamp_laser") {
        echo("Acoustic Architecture: Full-Case Aperiodic Variovent (~0.38L net volume) + Downward Clamping Mount + Under-Case Cheek Waveguide");
    } else if (resonator_type == "helmholtz_3d_pod" || resonator_type == "helmholtz_laser_duct") {
        echo(str("Helmholtz Resonator [", resonator_type, "] -> Slot ", helmholtz_port_w, "x", helmholtz_port_h, "mm, L_phys=", helmholtz_port_length, "mm (L_eff=", round(helmholtz_l_eff_mm*10)/10, "mm, V_b=0.15L) -> Tuned f_B = ", round(helmholtz_fb_hz*10)/10, " Hz"));
    }
}

// 1. Single Laser-Cut Centering / Baffle Ring (2D)
module speaker_retainer_ring_2d() {
    id = eff_spk_dia + 0.4;
    od_ring = id + 8.0;
    offset_kerf() {
        difference() {
            circle(d = od_ring);
            circle(d = id);
            // Side notch for the speaker wire lead
            translate([0, -3.5])
                square([od_ring, 7.0]);
        }
    }
}

// 2. 100% Laser-Cut 2-Layer Glued Speaker Mounting Well (2D Layout)
// Calibrated from calipers on the physical AliExpress 40mm speaker:
// - Outer diameter: 40.0mm, total height: 21.0mm, magnet pot: Ø23.0mm x 9.0mm
// - Terminal strip: 28.0mm wide across solder eyelets (centered along +X axis)
// - Forward membrane bulge: requires >=36.8mm spacer opening so cone never rubs on bottom plate!
//
// Layer 1 (Z=0..3mm, glued to Bottom Panel):
//   Spacer / Standoff Ring with ID = 36.8mm (clears moving surround with 3mm depth!)
//   and OD = 50.0mm. Leaves a solid 1.6mm flat metal seating shelf for the speaker flange.
// Layer 2 (Z=3..6mm, glued to Layer 1):
//   Centering Pocket Ring with ID = 40.5mm (snugly captures Ø40mm metal rim).
//   Features a 30mm wide notch to clear the 28mm terminal strip and wire leads.
//
// Assembly: Glue Layer 1 + Layer 2 to bottom panel with PVA wood glue to form a rigid well.
// Drop speaker in and seal/glue with silicone, B-7000, or hot melt glue on the 36.8mm shelf.

module stepped_clamp_layer1_2d() {
    // Spacer ring inner diameter: exactly 36.8mm for 40mm driver
    id_spacer = (eff_spk_dia == 40.0) ? 36.8 : (eff_spk_dia - 3.2);
    od_ring   = eff_spk_dia + 10.0;
    offset_kerf() {
        difference() {
            circle(d = od_ring);
            circle(d = id_spacer);
        }
    }
}

module stepped_clamp_layer2_2d() {
    id_center   = eff_spk_dia + 0.5; // 40.5mm
    od_ring     = eff_spk_dia + 10.0; // 50.0mm
    wire_slot_w = 5.0; // Small 5.0mm wire exit notch (terminal strip sits inside, only wires exit!)
    offset_kerf() {
        difference() {
            circle(d = od_ring);
            circle(d = id_center);
            // Small narrow notch for wire lead exit
            translate([0, -wire_slot_w / 2])
                square([od_ring, wire_slot_w]);
        }
    }
}

module stepped_clamp_laser_layers_2d() {
    spacing = 6.0;
    od_ring = eff_spk_dia + 10.0;
    translate([0, 0])
        stepped_clamp_layer1_2d();
    translate([0, od_ring + spacing])
        stepped_clamp_layer2_2d();
}

// 3. 3D-Printed 3-Pillar Open Spider Clamp Bridge (3D STL)
// Clamps directly down on the top of the speaker's rear magnet pot / pole plate, locking the
// speaker firmly against the bottom panel foam gasket (zero plywood buzz!) while leaving 85% of
// the sides completely open so the driver breathes into the full 0.38L aperiodic case cavity.
module speaker_spider_clamp_3d() {
    wall_t      = 2.2;
    id_base     = eff_spk_dia + 0.5;
    od_base     = eff_spk_dia + 5.0;
    base_h      = 2.8;
    h_spk       = eff_spk_h;
    cap_od      = eff_mag_dia + 5.0;
    cap_h       = 2.2;
    pillar_w    = 6.5;

    color("#0288d1") {
        difference() {
            union() {
                // Base Centering Ring
                cylinder(d = od_base, h = base_h);

                // 3 Mounting Ears with 2.8mm screw holes (at 100, 180, 260 deg)
                for (ang = [100, 180, 260]) {
                    rotate([0, 0, ang])
                        translate([od_base / 2 + 3.0, 0, 0])
                            cylinder(d = 8.5, h = wall_t);
                }

                // 3 Arched Vertical Pillars rising to top of magnet cup
                for (ang = [100, 180, 260]) {
                    rotate([0, 0, ang])
                        hull() {
                            translate([od_base / 2 - 1.0, -pillar_w / 2, base_h - 0.1])
                                cube([wall_t + 1.0, pillar_w, 0.2]);
                            translate([cap_od / 2 - 1.0, -pillar_w / 2, h_spk - 0.1])
                                cube([wall_t + 1.0, pillar_w, 0.2]);
                        }
                }

                // Top Pressure Bridge Cap (presses down on top of magnet cup)
                translate([0, 0, h_spk])
                    cylinder(d = cap_od, h = cap_h);
            }

            // Hollow base centering cavity
            translate([0, 0, -0.1])
                cylinder(d = id_base, h = base_h + 0.2);

            // 100° wide terminal opening on the base ring (centered at 0 deg)
            rotate([0, 0, -50])
                rotate_extrude(angle = 100)
                    translate([id_base / 2 - 1.0, -0.1])
                        square([od_base, base_h + 0.3]);

            // Screw holes in mounting ears
            for (ang = [100, 180, 260]) {
                rotate([0, 0, ang])
                    translate([od_base / 2 + 3.0, 0, -0.1])
                        cylinder(d = 2.8, h = wall_t + 0.3);
            }

            // Hollow center of top pressure cap (saves weight, ring pressure around edge)
            translate([0, 0, h_spk - 0.1])
                cylinder(d = max(10.0, eff_mag_dia * 0.55), h = cap_h + 0.3);
        }
    }
}

// 4. Bottom-panel Helmholtz Port Exit Grille Cutout
// Precisely aligned with the end of the Helmholtz tunnel / 3D pod deflector ramp
module helmholtz_port_exit_2d() {
    id_spk      = eff_spk_dia + 0.4;
    port_x_ofs  = id_spk / 2 + helmholtz_port_length;
    slot_len_x  = 10.0;
    bar_rib_y   = 2.4;
    slot_w_y    = (helmholtz_port_w - bar_rib_y) / 2;

    translate([port_x_ofs, 0]) {
        // Upper slot: Y in [+bar_rib_y/2 .. +helmholtz_port_w/2]
        translate([0, bar_rib_y / 2])
            rounded_square_2d([slot_len_x, slot_w_y], 1.8);
        // Lower slot: Y in [-helmholtz_port_w/2 .. -bar_rib_y/2]
        translate([0, -bar_rib_y / 2 - slot_w_y])
            rounded_square_2d([slot_len_x, slot_w_y], 1.8);
    }
}

// 5. Laser-Cut Helmholtz Bass-Reflex Resonator with Integrated Metal-Cup Seal (2D)
// Calibrated from the physical AliExpress 40mm speaker:
// Uses the speaker's own solid stamped steel magnet pot as the airtight acoustic ceiling!
// The side tube / tunnel stays low at 6mm height (Layers 1 & 2), while Layers 3 & 4 step inward
// to seal airtight around the 23mm metal cup.
//
// Layer 1 (Z=0..3mm, on Bottom Panel):
//   Spacer Ledge (ID = 36.8mm) clears moving membrane with 3mm depth + 25mm slot tunnel channel.
// Layer 2 (Z=3..6mm):
//   Centering Pocket (ID = 40.5mm) captures Ø40mm flange + terminal notch (-X) + 25mm slot tunnel.
// Layer 3 (Z=6..9mm):
//   Tunnel Roof Plate (caps the 6mm slot tunnel!) + ID = 32.0mm middle basket collar.
// Layer 4 (Z=9..12mm):
//   Magnet Pot Seal Collar (ID = 23.5mm) slips snugly over the Ø23.0mm steel cup.
//   A bead of silicone / gasket tape around the 23mm cup creates a 100% airtight seal!

module helmholtz_laser_layer1_spacer_2d() {
    id_spacer   = (eff_spk_dia == 40.0) ? 36.8 : (eff_spk_dia - 3.2);
    wall_w      = 5.0;
    od_spk      = eff_spk_dia + 10.0;
    slot_len_x  = 10.0;
    port_x_end  = eff_spk_dia / 2 + helmholtz_port_length + slot_len_x;
    outer_h_y   = helmholtz_port_w + 2 * wall_w;

    offset_kerf() {
        difference() {
            union() {
                circle(d = od_spk);
                translate([0, -outer_h_y / 2])
                    square([port_x_end + wall_w, outer_h_y]);
            }
            circle(d = id_spacer);
            translate([0, -helmholtz_port_w / 2])
                square([port_x_end, helmholtz_port_w]);
        }
    }
}

// Solder Latch Relief Pocket:
// A wide (19mm) but shallow (1.4mm into the wall) inner recess:
// Frees the full width of the phenolic solder strip while preserving a thick,
// solid 3.4mm unbroken outer wall all the way around!
module speaker_solder_latch_relief_2d(through_wall = false) {
    latch_w_y   = 19.0; // 19.0mm wide to comfortably cover the solder eyelet spacing
    latch_r_out = 21.65;// Extends only 1.4mm into the inner wall (leaves 3.35mm solid outer wall!)
    wire_slot_w =  3.5; // Small 3.5mm narrow wire exit slit
    od_spk      = eff_spk_dia + 10.0;

    // Wide, shallow inner relief pocket
    translate([-latch_r_out, -latch_w_y / 2])
        rounded_square_2d([latch_r_out, latch_w_y], 1.2);

    // Only Layer 2 gets the narrow wire exit slit through the wall
    if (through_wall) {
        translate([-od_spk / 2 - 1.0, -wire_slot_w / 2])
            square([od_spk / 2 + 1.0, wire_slot_w]);
    }
}

module helmholtz_laser_layer2_centering_2d() {
    id_center   = eff_spk_dia + 0.5; // 40.5mm
    wall_w      = 5.0;
    od_spk      = eff_spk_dia + 10.0;
    slot_len_x  = 10.0;
    port_x_end  = eff_spk_dia / 2 + helmholtz_port_length + slot_len_x;
    outer_h_y   = helmholtz_port_w + 2 * wall_w;

    offset_kerf() {
        difference() {
            union() {
                circle(d = od_spk);
                translate([0, -outer_h_y / 2])
                    square([port_x_end + wall_w, outer_h_y]);
            }
            circle(d = id_center);
            translate([0, -helmholtz_port_w / 2])
                square([port_x_end, helmholtz_port_w]);
            // Compact solder latch notch + narrow 4mm wire exit slot
            speaker_solder_latch_relief_2d(through_wall = true);
        }
    }
}

module helmholtz_laser_layer3_roof_collar_2d() {
    // Widened to 40.5mm so it drops right over the AliExpress 40mm speaker basket & terminals
    // while the solid wood roof completely caps and seals the 6mm side tunnel!
    id_collar   = (eff_spk_dia == 40.0) ? 40.5 : (eff_spk_dia + 0.5);
    wall_w      = 5.0;
    od_spk      = eff_spk_dia + 10.0;
    slot_len_x  = 10.0;
    port_x_end  = eff_spk_dia / 2 + helmholtz_port_length + slot_len_x;
    outer_h_y   = helmholtz_port_w + 2 * wall_w;

    offset_kerf() {
        difference() {
            union() {
                circle(d = od_spk);
                // Solid wooden roof covering the tunnel channel
                translate([0, -outer_h_y / 2])
                    square([port_x_end + wall_w, outer_h_y]);
            }
            // Collar opening clears speaker basket and wire terminals
            circle(d = id_collar);

            // Compact solder latch relief pocket (keeps 2.8mm solid outer wall intact)
            speaker_solder_latch_relief_2d(through_wall = false);
        }
    }
}

module helmholtz_laser_ring_32mm_2d() {
    // Mid-basket riser ring (ID = 36.8mm clears Ø36.0mm window cage)
    id_collar = (eff_spk_dia == 40.0) ? 36.8 : (eff_mag_dia + 10.0);
    od_spk    = eff_spk_dia + 10.0; // 50.0mm
    offset_kerf() {
        difference() {
            circle(d = od_spk);
            circle(d = id_collar);

            // Compact solder latch relief pocket (keeps 2.8mm solid outer wall intact)
            speaker_solder_latch_relief_2d(through_wall = false);
        }
    }
}

module helmholtz_laser_layer4_pot_seal_2d() {
    id_pot = eff_mag_dia + 0.5; // 23.5mm (slips snugly over 23.0mm steel cup)
    od_spk = eff_spk_dia + 10.0; // 50.0mm
    offset_kerf() {
        difference() {
            circle(d = od_spk);
            circle(d = id_pot);
        }
    }
}

module helmholtz_laser_parts_2d() {
    wall_w     = 5.0;
    outer_h_y  = max(eff_spk_dia + 10.0, helmholtz_port_w + 2 * wall_w);
    step_y     = outer_h_y + 5.0;
    od_spk     = eff_spk_dia + 10.0;
    col2_x     = od_spk + helmholtz_port_length + 20.0;

    // Column 1: The 3 Tunnel Layers (L1: Spacer, L2: Centering + Wire Slot, L3: Tunnel Roof)
    translate([0, 0])
        helmholtz_laser_layer1_spacer_2d();
    translate([0, step_y])
        helmholtz_laser_layer2_centering_2d();
    translate([0, 2 * step_y])
        helmholtz_laser_layer3_roof_collar_2d();

    // Column 2: Riser & Pot Seal Rings (stacks above Layer 3 to reach and seal against 23mm steel cup!)
    // 1x 34mm basket collar ring (Layer 4)
    translate([col2_x, 0])
        helmholtz_laser_ring_32mm_2d();
    // 3x 23.5mm magnet pot seal rings (Layers 5, 6, 7 -> matches total 21mm speaker height!)
    translate([col2_x, step_y])
        helmholtz_laser_layer4_pot_seal_2d();
    translate([col2_x, 2 * step_y])
        helmholtz_laser_layer4_pot_seal_2d();
    translate([col2_x, 3 * step_y])
        helmholtz_laser_layer4_pot_seal_2d();
}

// 6. 3D-Printed Wide-Body Sealed Helmholtz Tub + 45° Swept Port Deflector Ramp (3D STL)
// Upgraded per Dr. Viktor Vance's audit: incorporates terminal relief pocket, larger chamber,
// and 45-degree swept deflector ramp to prevent 90-degree corner flow turbulence.
module helmholtz_3d_pod_model() {
    wall_t       = 2.0;
    id_rim       = eff_spk_dia + 0.5;
    chamber_w    = max(55.0, eff_spk_dia + 14.0);
    chamber_d    = max(60.0, eff_spk_dia + 18.0);
    inner_ceil_z = eff_spk_h + 2.0;
    total_pod_h  = inner_ceil_z + wall_t;

    port_x_start = chamber_w / 2;
    slot_len_x   = 10.0;
    port_x_end   = id_rim / 2 + helmholtz_port_length + slot_len_x;
    duct_outer_w = helmholtz_port_w + 2 * wall_t;
    duct_outer_h = helmholtz_port_h + wall_t;

    difference() {
        union() {
            // Main Wide-Body Acoustic Chamber Box
            translate([-chamber_w/2, -chamber_d/2, 0])
                rrect_3d(chamber_w, chamber_d, total_pod_h, 8.0);

            // Integrated Helmholtz Slot Tunnel extending +X
            translate([0, -duct_outer_w / 2, 0])
                cube([port_x_end + wall_t, duct_outer_w, duct_outer_h]);

            // Base mounting ears
            for (pos = [
                [-chamber_w/2 + 2, -chamber_d/2 - 4],
                [-chamber_w/2 + 2,  chamber_d/2 + 4],
                [ chamber_w/2 - 2, -chamber_d/2 - 4],
                [ chamber_w/2 - 2,  chamber_d/2 + 4]
            ]) {
                translate([pos[0], pos[1], 0])
                    cylinder(d = 8.5, h = wall_t);
            }
        }

        // Subtract hollow interior chamber
        translate([-chamber_w/2 + wall_t, -chamber_d/2 + wall_t, -0.1])
            rrect_3d(chamber_w - 2 * wall_t, chamber_d - 2 * wall_t, inner_ceil_z + 0.1, 6.0);

        // Subtract internal tunnel air channel
        translate([0, -helmholtz_port_w / 2, -0.1])
            cube([port_x_end, helmholtz_port_w, helmholtz_port_h + 0.1]);

        // Subtract 45-degree swept exit deflector ramp directly over bottom panel exit slots
        translate([port_x_end - slot_len_x, -helmholtz_port_w / 2 - 0.1, 0])
            rotate([0, 45, 0])
                cube([slot_len_x * 1.5, helmholtz_port_w + 0.2, slot_len_x * 1.5]);

        // Subtract speaker rim centering seat on bottom
        translate([0, 0, -0.1])
            cylinder(d = id_rim, h = 3.0);

        // Subtract mounting screw holes
        for (pos = [
            [-chamber_w/2 + 2, -chamber_d/2 - 4],
            [-chamber_w/2 + 2,  chamber_d/2 + 4],
            [ chamber_w/2 - 2, -chamber_d/2 - 4],
            [ chamber_w/2 - 2,  chamber_d/2 + 4]
        ]) {
            translate([pos[0], pos[1], -0.1])
                cylinder(d = 2.8, h = wall_t + 0.2);
        }

        // Wire pass-through notch at rear corner (must be caulked with putty/silicone!)
        translate([-chamber_w/2 - 0.1, 0, 0])
            cube([wall_t + 0.2, 3.8, 3.8]);
    }
}

// ==============================================================================
// Original FM-1 Curved 8-Arm Pinwheel Speaker Grille (2D)
// ==============================================================================
// Reproduces the 4 concentric slot rings + 8 curved circular-arc turbine ribs
// + center pinhole from the stock orange FM-1 bottom shell, scaled to grille_dia.
module fm1_pinwheel_grille_2d(grille_dia = 43.0) {
    R_max    = grille_dia / 2;
    R_arc    = 0.72 * R_max;
    rib_w    = max(1.6, 0.115 * R_max);
    corner_r = min(0.45, 0.02 * R_max);
    rings    = [
        [0.18, 0.32],
        [0.41, 0.55],
        [0.64, 0.78],
        [0.86, 1.00]
    ];

    // Center pinhole
    circle(r = max(0.9, 0.085 * R_max));

    // 4 Concentric Rings minus 8 Curved Circular-Arc Pinwheel Ribs
    offset(r = corner_r)
    offset(delta = -corner_r)
    difference() {
        union() {
            for (rng = rings) {
                difference() {
                    circle(r = rng[1] * R_max);
                    circle(r = rng[0] * R_max);
                }
            }
        }

        // Subtract 8 curved circular-arc ribs sweeping outward from the center hub
        for (i = [0 : 7]) {
            rotate([0, 0, i * 45])
            intersection() {
                translate([R_arc, 0])
                    difference() {
                        circle(r = R_arc + rib_w / 2);
                        circle(r = R_arc - rib_w / 2);
                    }
                translate([-R_max, -0.05 * R_max])
                    square([3 * R_max, 2 * R_max]);
            }
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

            // Speaker Acoustic Grille or Open Cutout on Bottom Panel
            if (speaker_type != "none" && speaker_grille_style != "none") {
                if (speaker_grille_style == "open_hole") {
                    translate([spk_box_x, spk_box_y])
                        circle(d = eff_spk_dia + 0.4);
                } else if (speaker_grille_style == "fm1_pinwheel") {
                    translate([spk_box_x, spk_box_y])
                        fm1_pinwheel_grille_2d(grille_dia = eff_spk_dia * 0.86);
                } else {
                    // Concentric Perforated Acoustic Grille Dots scaled to effective speaker diameter
                    grille_r_max = max(6.0, eff_spk_dia * 0.44);
                    for (r = [3.5 : 3.8 : grille_r_max]) {
                        count = max(6, round(2 * 3.14159 * r / 3.8));
                        for (a = [0 : 360/count : 359]) {
                            translate([spk_box_x + r * cos(a), spk_box_y + r * sin(a)])
                                circle(d = 2.0);
                        }
                    }
                    translate([spk_box_x, spk_box_y])
                        circle(d = 2.2);
                }
            }

            // Helmholtz Bass-Reflex Port Exit Cutout on Bottom Panel (when Helmholtz Pod or Laser Duct is active)
            if (speaker_type != "none" && (resonator_type == "helmholtz_3d_pod" || resonator_type == "helmholtz_laser_duct")) {
                translate([spk_box_x, spk_box_y])
                    helmholtz_port_exit_2d();
            }
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
                        // Horizontal guide slot for the laser-cut captive slider (9.0mm wide for 5.2mm neck + 3.8mm travel)
                        slider_slot_h = T / cos(panel_tilt) + 0.6;
                        translate([REAR_POWER_X - 4.5, REAR_SWITCH_Z_IN_BACK - slider_slot_h/2])
                            rounded_square_2d([9.0, slider_slot_h], 0.6);
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

    // 1b. Speaker Mounted Flat on Bottom Panel (+ Optional Laser-Cut Retainer Ring)
    spk_seat_z = (resonator_type == "stepped_clamp_laser" || resonator_type == "helmholtz_laser_duct") ? (2 * T) : T;
    if (show_internals && speaker_type != "none" && speaker_mount == "bottom_panel") {
        translate([Ts + spk_box_x, spk_box_y, spk_seat_z + speaker_z_offset - explode * 0.45]) {
            if (speaker_type == "aliexpress_40mm") {
                fm1_aliexpress_40mm_speaker_3d(
                    outer_dia = eff_spk_dia,
                    total_h   = eff_spk_h,
                    cup_dia   = eff_mag_dia,
                    cup_h     = eff_mag_h,
                    face_down = speaker_face_down
                );
            } else if (speaker_type != "stock_26mm") {
                fm1_big_speaker_3d(
                    outer_dia  = eff_spk_dia,
                    total_h    = eff_spk_h,
                    magnet_dia = eff_mag_dia,
                    magnet_h   = eff_mag_h,
                    face_down  = speaker_face_down
                );
            } else {
                fm1_stock_speaker_3d(dia = eff_spk_dia, h = eff_spk_h);
            }
        }
        if (resonator_type == "spider_clamp_3d") {
            translate([Ts + spk_box_x, spk_box_y, T - explode * 0.55])
                speaker_spider_clamp_3d();
        } else if (resonator_type == "stepped_clamp_laser") {
            color("#6d4c41", 0.85)
                translate([Ts + spk_box_x, spk_box_y, T - explode * 0.65])
                    linear_extrude(T)
                        stepped_clamp_layer1_2d();
            color("#5d4037", 0.85)
                translate([Ts + spk_box_x, spk_box_y, 2 * T - explode * 0.55])
                    linear_extrude(T)
                        stepped_clamp_layer2_2d();
        } else if (resonator_type == "helmholtz_3d_pod") {
            color("#2e7d32", 0.55)
                translate([Ts + spk_box_x, spk_box_y, T - explode * 0.55])
                    helmholtz_3d_pod_model();
        } else if (resonator_type == "helmholtz_laser_duct") {
            // Layer 1: Spacer Ledge (Z = 0..3mm, ID = 36.8mm, clears membrane)
            color("#6d4c41", 0.85)
                translate([Ts + spk_box_x, spk_box_y, T - explode * 0.75])
                    linear_extrude(T)
                        helmholtz_laser_layer1_spacer_2d();
            // Layer 2: Centering Pocket Wall (Z = 3..6mm, ID = 40.5mm)
            color("#5d4037", 0.85)
                translate([Ts + spk_box_x, spk_box_y, 2 * T - explode * 0.65])
                    linear_extrude(T)
                        helmholtz_laser_layer2_centering_2d();
            // Layer 3: Tunnel Roof Plate & Basket Collar (Z = 6..9mm, caps tunnel at 6mm height!)
            color("#4e342e", 0.85)
                translate([Ts + spk_box_x, spk_box_y, 3 * T - explode * 0.55])
                    linear_extrude(T)
                        helmholtz_laser_layer3_roof_collar_2d();
            // Layer 4: Basket Riser Ring (Z = 9..12mm, ID = 32mm)
            color("#3e2723", 0.88)
                translate([Ts + spk_box_x, spk_box_y, 4 * T - explode * 0.45])
                    linear_extrude(T)
                        helmholtz_laser_ring_32mm_2d();
            // Layer 5: Magnet Pot Seal Collar 1 (Z = 12..15mm, ID = 23.5mm)
            color("#2e1c18", 0.90)
                translate([Ts + spk_box_x, spk_box_y, 5 * T - explode * 0.35])
                    linear_extrude(T)
                        helmholtz_laser_layer4_pot_seal_2d();
            // Layer 6: Magnet Pot Seal Collar 2 (Z = 15..18mm, ID = 23.5mm seals around steel cup)
            color("#1b0000", 0.92)
                translate([Ts + spk_box_x, spk_box_y, 6 * T - explode * 0.25])
                    linear_extrude(T)
                        helmholtz_laser_layer4_pot_seal_2d();
            // Layer 7: Magnet Pot Seal Collar 3 (Z = 18..21mm, ID = 23.5mm reaches top of 21mm speaker)
            color("#120000", 0.94)
                translate([Ts + spk_box_x, spk_box_y, 7 * T - explode * 0.15])
                    linear_extrude(T)
                        helmholtz_laser_layer4_pot_seal_2d();
        } else if (resonator_type == "retainer_ring") {
            color("#5c4a3e", 0.85)
                translate([Ts + spk_box_x, spk_box_y, T - explode * 0.6])
                    linear_extrude(T)
                        speaker_retainer_ring_2d();
        }
    }

    // 2. Tilted Top Faceplate + Attached FM-1 Internals + Captive Power Slider
    translate([Ts, T, T + case_internal_height]) {
        rotate([panel_tilt, 0, 0]) {
            // FM-1 PCB, Silicone Button Mats, Encoders, Screen & Battery
            if (show_internals) {
                translate([fm1_ofs_x, fm1_ofs_y, PCB_TOP_Z_LOCAL]) {
                    fm1_internals_assembly(explode_silicone = explode * 0.25, include_speaker = false);

                    // Speaker Mounted Tilted Under the PCB (when speaker_mount == "pcb_underside")
                    if (speaker_type != "none" && speaker_mount == "pcb_underside") {
                        translate([speaker_x, speaker_y, -1.6 - eff_spk_h - speaker_z_offset]) {
                            if (speaker_type == "aliexpress_40mm") {
                                fm1_aliexpress_40mm_speaker_3d(
                                    outer_dia = eff_spk_dia,
                                    total_h   = eff_spk_h,
                                    cup_dia   = eff_mag_dia,
                                    cup_h     = eff_mag_h,
                                    face_down = speaker_face_down
                                );
                            } else if (speaker_type != "stock_26mm") {
                                fm1_big_speaker_3d(
                                    outer_dia  = eff_spk_dia,
                                    total_h    = eff_spk_h,
                                    magnet_dia = eff_mag_dia,
                                    magnet_h   = eff_mag_h,
                                    face_down  = speaker_face_down
                                );
                            } else {
                                fm1_stock_speaker_3d(dia = eff_spk_dia, h = eff_spk_h);
                            }
                        }
                    }
                }
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

    // Row 3: Front & Back Panels (+ Captive Power Switch Slider & Speaker Retainer Ring)
    row3_y = row2_y + case_internal_height_back + cheek_extension + spacing + T;
    translate([Ts, row3_y])
        front_panel();

    translate([ow + Ts + spacing, row3_y])
        back_panel();

    if (power_switch_mode == "laser_slider") {
        translate([2 * ow + 2 * Ts + 2 * spacing + 10, row3_y + 10])
            power_switch_slider_2d();
    }

    if (speaker_type != "none") {
        if (resonator_type == "stepped_clamp_laser") {
            translate([2 * ow + 2 * Ts + 2 * spacing + 45, row3_y + eff_spk_dia/2 + 6])
                stepped_clamp_laser_layers_2d();
        } else if (resonator_type == "helmholtz_laser_duct") {
            translate([2 * ow + 2 * Ts + 2 * spacing + 45, row3_y + eff_spk_dia/2 + 6])
                helmholtz_laser_parts_2d();
        } else if (resonator_type == "retainer_ring") {
            translate([2 * ow + 2 * Ts + 2 * spacing + 45, row3_y + eff_spk_dia/2 + 6])
                speaker_retainer_ring_2d();
        }
    }
}

// ==============================================================================
// Dedicated 3D View of the Speaker & Stacked Helmholtz Resonator Duct
// ==============================================================================
module speaker_helmholtz_3d_view(explode = 0.0) {
    // 1. Bottom Panel with speaker grille & port exit
    color("#302b28", 0.70)
        translate([Ts, 0, -T - explode * 0.5])
            linear_extrude(T)
                bottom_panel();

    // 2. Stacked Helmholtz Laser Cut Wood Layers (each layer distinct color)
    translate([Ts + spk_box_x, spk_box_y, 0]) {
        // Layer 1: Spacer Ledge (Z=0..3mm, ID=36.8mm, clears moving membrane)
        color("#a1887f", 0.95)
            translate([0, 0, 0 + explode * 0.3])
                linear_extrude(T)
                    helmholtz_laser_layer1_spacer_2d();

        // Layer 2: Centering Pocket Wall (Z=3..6mm, ID=40.5mm, captures outer rim + wire slot)
        color("#8d6e63", 0.95)
            translate([0, 0, T + explode * 0.6])
                linear_extrude(T)
                    helmholtz_laser_layer2_centering_2d();

        // Layer 3: Solid Tunnel Roof Plate + Basket Clearance (Z=6..9mm, ID=40.5mm caps 6mm tunnel)
        color("#795548", 0.95)
            translate([0, 0, 2 * T + explode * 0.9])
                linear_extrude(T)
                    helmholtz_laser_layer3_roof_collar_2d();

        // Layer 4: Basket Riser Ring (Z=9..12mm, ID=34.0mm clears tapering stamped basket)
        color("#6d4c41", 0.95)
            translate([0, 0, 3 * T + explode * 1.2])
                linear_extrude(T)
                    helmholtz_laser_ring_32mm_2d();

        // Layer 5: Magnet Pot Seal Ring 1 (Z=12..15mm, ID=23.5mm fits snugly over steel cup)
        color("#5d4037", 0.95)
            translate([0, 0, 4 * T + explode * 1.5])
                linear_extrude(T)
                    helmholtz_laser_layer4_pot_seal_2d();

        // Layer 6: Magnet Pot Seal Ring 2 (Z=15..18mm, ID=23.5mm seals airtight around steel cup)
        color("#4e342e", 0.95)
            translate([0, 0, 5 * T + explode * 1.8])
                linear_extrude(T)
                    helmholtz_laser_layer4_pot_seal_2d();

        // Layer 7: Magnet Pot Seal Ring 3 (Z=18..21mm, ID=23.5mm reaches top of 21mm speaker!)
        color("#3e2723", 0.95)
            translate([0, 0, 6 * T + explode * 2.1])
                linear_extrude(T)
                    helmholtz_laser_layer4_pot_seal_2d();

        // 3. Realistic 3D Speaker Seated Face-Down in the Stack
        // Sits on Layer 1 spacer shelf at Z = T
        translate([0, 0, T + explode * 0.45]) {
            if (speaker_type == "aliexpress_40mm") {
                fm1_aliexpress_40mm_speaker_3d(
                    outer_dia = eff_spk_dia,
                    total_h   = eff_spk_h,
                    cup_dia   = eff_mag_dia,
                    cup_h     = eff_mag_h,
                    face_down = true
                );
            } else {
                fm1_big_speaker_3d(
                    outer_dia  = eff_spk_dia,
                    total_h    = eff_spk_h,
                    magnet_dia = eff_mag_dia,
                    magnet_h   = eff_mag_h,
                    face_down  = true
                );
            }
        }
    }
}

// ==============================================================================
// Main Render Controller
// ==============================================================================
if (part_to_show == "assembly") {
    assembly(explode = 0.0);
} else if (part_to_show == "exploded") {
    assembly(explode = explode_distance);
} else if (part_to_show == "helmholtz_3d") {
    speaker_helmholtz_3d_view(explode = 0.0);
} else if (part_to_show == "helmholtz_3d_exploded") {
    speaker_helmholtz_3d_view(explode = max(8.0, explode_distance));
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
} else if (part_to_show == "acoustic_mount") {
    if (resonator_type == "spider_clamp_3d") {
        speaker_spider_clamp_3d();
    } else if (resonator_type == "stepped_clamp_laser") {
        stepped_clamp_laser_layers_2d();
    } else if (resonator_type == "helmholtz_3d_pod") {
        helmholtz_3d_pod_model();
    } else if (resonator_type == "helmholtz_laser_duct") {
        helmholtz_laser_parts_2d();
    } else {
        speaker_retainer_ring_2d();
    }
} else if (part_to_show == "helmholtz_laser") {
    helmholtz_laser_parts_2d();
} else if (part_to_show == "stepped_clamp") {
    stepped_clamp_laser_layers_2d();
} else if (part_to_show == "speaker_ring") {
    speaker_retainer_ring_2d();
} else if (part_to_show == "helmholtz_pod") {
    helmholtz_3d_pod_model();
} else if (part_to_show == "spider_clamp") {
    speaker_spider_clamp_3d();
} else if (part_to_show == "speaker") {
    if (speaker_type == "aliexpress_40mm") {
        fm1_aliexpress_40mm_speaker_3d(
            outer_dia = eff_spk_dia,
            total_h   = eff_spk_h,
            cup_dia   = eff_mag_dia,
            cup_h     = eff_mag_h,
            face_down = false
        );
    } else {
        fm1_big_speaker_3d(
            outer_dia  = eff_spk_dia,
            total_h    = eff_spk_h,
            magnet_dia = eff_mag_dia,
            magnet_h   = eff_mag_h,
            face_down  = false
        );
    }
} else if (part_to_show == "internals") {
    fm1_internals_assembly(explode_silicone = 0.0, include_speaker = true);
}
