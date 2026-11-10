// ==============================================================================
// M-VAVE FM-1 Synthesizer - Internal PCB & Silicone Mats 3D Model
// ==============================================================================
// Calibrated from teardown photos (photos/fm-1_PCB-front.jpeg, fm-1_PCB-back.jpeg,
// fm-1_pcb_with-silicone.jpg), caliper measurements, and FM1.obj 3D scan.
//
// Coordinate System:
//   - X, Y: Matches the FM-1 enclosure coordinate system (X: 0..162.5, Y: 0..97.5)
//   - Z = 0.0: Top surface of the green 1.6mm main PCB
//     * PCB body: Z = -1.6 to 0.0 mm
//     * Silicone flange: Z = 0.0 to 1.2 mm
//     * Silicone plateau: Z = 0.0 to 5.8 mm (measured 5.8mm)
//     * Silicone keys/buttons: Z = 5.8 to 8.0 mm (measured 8.0mm total above PCB)
//     * Rotary encoders + knobs: Z = 0.0 to 13.2 mm
//     * Underside LiPo battery (DTP704060): Z = -1.6 to -8.6 mm (7.0mm thick)
// ==============================================================================

/* [Visibility Toggles] */
show_pcb            = true;
show_silicone_keys  = true;
show_silicone_opts  = true;
show_silicone_oct   = true;
show_encoders       = true;
show_screen         = true;
show_rear_ports     = true;
show_bottom_parts   = true; // Battery, capacitors, JST headers
show_speaker        = true; // Show speaker in standalone view
speaker_model       = "upgrade_50mm"; // [upgrade_50mm:50mm Full-Range Speaker (31mm tall), aliexpress_40mm:40mm 4Ohm 5W Shielded Speaker (22mm tall), stock_26mm:26.5mm Stock Capsule]

// Vertical explode distance between Silicone Mats and PCB (0 = seated on PCB)
silicone_explode_z  = 0.0; // [0:1:30]

$fn = 36;

// ==============================================================================
// Exact Calibrated Constants (mm)
// ==============================================================================

// --- Main Green PCB (DX7 MB V07) ---
PCB_X_MIN   = 2.75;
PCB_Y_MIN   = 3.00;
PCB_WIDTH   = 156.50; // Spans X = 2.75 to 159.25 mm
PCB_DEPTH   = 91.00;  // Spans Y = 3.00 to 94.00 mm
PCB_THICK   = 1.60;   // Measured 1.6mm
PCB_R       = 5.50;   // Corner radius

// 6 Mounting Screw Holes in PCB (3x2 grid on upper half)
PCB_SCREW_HOLES = [
    [  7.30, 89.00], // Rear-Left
    [ 83.00, 89.00], // Rear-Center (between Audio jack & Knob 1)
    [154.50, 89.00], // Rear-Right
    [  7.30, 44.50], // Mid-Left (above keyboard left)
    [ 83.00, 44.50], // Center (between FPC, Options & Keyboard)
    [154.50, 44.50]  // Mid-Right (above keyboard right)
];
PCB_HOLE_D = 2.6;

// --- Silicone Heights (Measured with Calipers) ---
SILICONE_FLANGE_H  = 1.2; // Base skirt with alignment holes
SILICONE_PLATEAU_H = 5.8; // Main island height above PCB
SILICONE_TOTAL_H   = 8.0; // Top of keys/buttons above PCB
SILICONE_KEY_H     = SILICONE_TOTAL_H - SILICONE_PLATEAU_H; // 2.2mm key height

// 1. 27-Key Silicone Mat
KEYS_CX = 81.00;
KEYS_CY = 24.25;
KEYS_W  = 147.80;
KEYS_H  = 34.30;
KEYS_R  = 5.00;

LOWER_KEYS_X = [
    12.1, 21.1, 30.4, 39.4, 48.6, 58.2, 66.8, 76.2,
    85.0, 94.1, 103.7, 112.5, 122.1, 130.7, 140.3, 149.4
];
UPPER_KEYS_X = [
    16.7, 25.8, 35.0,        // OP1, OP2, OP3
    53.2, 62.6,              // OP4, OP5
    80.6, 89.6, 99.1,        // OP6, PIT, GLO
    116.9, 126.3,            // MONO, POLY
    144.5                    // Far-right tall key
];

// 2. 12-Button Options Keypad Mat (2x6 grid)
OPTIONS_CX = 118.15;
OPTIONS_CY = 58.65;
OPTIONS_W  = 63.30;
OPTIONS_H  = 21.90;
OPTIONS_R  = 3.00;
OPTIONS_COLS_X = [92.6, 102.8, 112.9, 123.0, 133.2, 143.3];
OPTIONS_ROW1_Y = 63.7; // FX, SEL, ENV, LFO, EDIT, GLO
OPTIONS_ROW2_Y = 53.4; // HOME, SAVE, ARP, SEQ, PLAY/STOP, REC

// 3. 2-Button Octave Mat (OCT- / OCT+)
OCT_CX = 22.60;
OCT_CY = 51.30;
OCT_W  = 24.60;
OCT_H  = 7.40;
OCT_R  = 3.00;

// --- 8 Rotary Encoders / Knobs ---
ENCODER_BODY_W = 12.2;
ENCODER_BODY_H = 4.5;
KNOB_SHAFT_D   = 6.0;
KNOB_TOP_Z     = 13.2; // Total height above PCB top surface

KNOB_POSITIONS = [
    [ 14.00, 81.00], // Master Volume (with white pointer insert)
    [ 31.00, 81.00], // Select
    [ 14.00, 64.00], // Presets
    [ 31.00, 64.00], // Algorithm
    [ 91.00, 81.00], // Knob 1
    [109.00, 81.00], // Knob 2
    [127.00, 81.00], // Knob 3
    [145.00, 81.00]  // Knob 4
];

// --- 1.54" TFT Screen & Glass Bezel ---
SCREEN_CX      = 61.10;
SCREEN_CY      = 70.20;
SCREEN_BEZEL_W = 37.40;
SCREEN_BEZEL_H = 37.40;
SCREEN_LCD_W   = 27.20;
SCREEN_LCD_H   = 27.40;

// --- Rear Edge Ports ---
REAR_POWER_X = 37.05;
REAR_USBC_X  = 50.00;
REAR_MIDI_X  = 63.25;
REAR_AUDIO_X = 75.00;

// --- Underside Components (Battery, JST Headers & Speakers) ---
BAT_X_MIN = 94.30;
BAT_Y_MIN = 9.00;
BAT_W     = 60.00; // DTP704060 length
BAT_D     = 40.00; // DTP704060 width
BAT_H     = 7.00;  // DTP704060 thickness

// Stock 26.5mm Speaker Capsule
SPEAKER_CX = 30.00; // Centered on white silkscreen circle on PCB back
SPEAKER_CY = 24.50;
SPEAKER_D  = 26.50;
SPEAKER_H  = 4.20;

// Upgraded 50mm Full-Range Speaker Driver (2-inch driver)
BIG_SPK_DIA        = 50.00; // Outer rim & front foam gasket diameter (50mm)
BIG_SPK_TOTAL_H    = 31.00; // Total height from front gasket to magnet back (31mm)
BIG_SPK_MAGNET_DIA = 45.00; // Large ferrite magnet diameter (45mm)
BIG_SPK_MAGNET_H   =  8.00; // Ferrite magnet + back pole plate height (8mm)

// ==============================================================================
// Helper Geometry Modules
// ==============================================================================
module rrect_3d(w, d, h, r, center_xy=false) {
    rad = min(r, w/2, d/2);
    ox = center_xy ? -w/2 : 0;
    oy = center_xy ? -d/2 : 0;
    translate([ox, oy, 0])
        linear_extrude(height=h)
            hull() {
                translate([rad, rad]) circle(r=rad);
                translate([w - rad, rad]) circle(r=rad);
                translate([rad, d - rad]) circle(r=rad);
                translate([w - rad, d - rad]) circle(r=rad);
            }
}

module pill_key_3d(w, l, h) {
    r = w / 2;
    linear_extrude(height=h)
        hull() {
            translate([0, -(l - w)/2]) circle(r=r);
            translate([0,  (l - w)/2]) circle(r=r);
        }
}

// ==============================================================================
// 1. Main PCB Module
// ==============================================================================
module fm1_pcb() {
    // Green Solder Mask PCB Substrate (Z = -1.6 to 0.0)
    color([0.08, 0.42, 0.24])
    difference() {
        translate([PCB_X_MIN, PCB_Y_MIN, -PCB_THICK])
            rrect_3d(PCB_WIDTH, PCB_DEPTH, PCB_THICK, PCB_R);

        // 6 Mounting Screw Holes
        for (pt = PCB_SCREW_HOLES) {
            translate([pt[0], pt[1], -PCB_THICK - 0.5])
                cylinder(d=PCB_HOLE_D, h=PCB_THICK + 1.0);
        }

        // Rear Edge Notches for Mid-Mount USB-C & 3.5mm Jacks
        translate([REAR_USBC_X - 4.6, 86.8, -PCB_THICK - 0.5])
            cube([9.2, 8.0, PCB_THICK + 1.0]);
        for (jx = [REAR_MIDI_X, REAR_AUDIO_X]) {
            translate([jx - 4.2, 82.0, -PCB_THICK - 0.5])
                cube([8.4, 13.0, PCB_THICK + 1.0]);
        }
    }

    // White Silkscreen Rings around Mounting Holes
    color([0.9, 0.9, 0.9])
    for (pt = PCB_SCREW_HOLES) {
        translate([pt[0], pt[1], -0.02])
        difference() {
            cylinder(d=5.2, h=0.05);
            translate([0, 0, -0.1]) cylinder(d=PCB_HOLE_D + 0.4, h=0.3);
        }
    }

    // Gold Key Matrix Contact Pads on PCB (for visual check when silicone is hidden)
    color([0.85, 0.70, 0.20]) {
        for (kx = LOWER_KEYS_X) {
            translate([kx, 16.5, 0])
                rrect_3d(5.0, 12.0, 0.05, 1.0, center_xy=true);
        }
        for (kx = UPPER_KEYS_X) {
            translate([kx, 32.5, 0])
                rrect_3d(5.0, 9.0, 0.05, 1.0, center_xy=true);
        }
    }

    // 14 SMD Tactile Switches under Options & OCT mats (6x6x2.5mm)
    color([0.75, 0.75, 0.78]) {
        for (cx = OPTIONS_COLS_X) {
            for (cy = [OPTIONS_ROW1_Y, OPTIONS_ROW2_Y]) {
                translate([cx, cy, 0])
                    rrect_3d(5.2, 5.2, 1.8, 0.5, center_xy=true);
                color([0.6, 0.4, 0.1])
                    translate([cx, cy, 1.8])
                        cylinder(d=2.8, h=0.7);
            }
        }
        for (cx = [16.8, 28.4]) {
            translate([cx, OCT_CY, 0])
                rrect_3d(5.2, 5.2, 1.8, 0.5, center_xy=true);
            color([0.6, 0.4, 0.1])
                translate([cx, OCT_CY, 1.8])
                    cylinder(d=2.8, h=0.7);
        }
    }

    // JieLi Main SoC & FPC Connector under Screen area
    color([0.15, 0.15, 0.15])
        translate([58.0, 72.0, 0])
            rrect_3d(7.0, 7.0, 1.0, 0.3, center_xy=true);
    color([0.9, 0.88, 0.82])
        translate([61.0, 56.0, 0])
            rrect_3d(14.0, 4.0, 1.8, 0.2, center_xy=true);
}

// ==============================================================================
// 2. Three Molded Silicone Button Mats (5.8mm Plateau, 8.0mm Key Tops)
// ==============================================================================
module fm1_silicone_keys_mat() {
    color([0.68, 0.32, 0.22]) // Terracotta silicone color
    union() {
        // Outer Base Flange / Skirt (1.2mm thick, 2.0mm wider per side)
        translate([KEYS_CX, KEYS_CY, 0])
            rrect_3d(KEYS_W + 3.6, KEYS_H + 3.6, SILICONE_FLANGE_H, KEYS_R + 1.5, center_xy=true);

        // Perimeter Alignment Ears with Pinholes
        for (ear = [
            [KEYS_CX - 55, KEYS_CY - KEYS_H/2 - 2.2],
            [KEYS_CX,      KEYS_CY - KEYS_H/2 - 2.2],
            [KEYS_CX + 55, KEYS_CY - KEYS_H/2 - 2.2],
            [KEYS_CX - 18, KEYS_CY + KEYS_H/2 + 2.2],
            [KEYS_CX + 38, KEYS_CY + KEYS_H/2 + 2.2],
            [KEYS_CX - KEYS_W/2 - 2.2, KEYS_CY],
            [KEYS_CX + KEYS_W/2 + 2.2, KEYS_CY]
        ]) {
            difference() {
                translate([ear[0], ear[1], 0])
                    cylinder(d=5.0, h=SILICONE_FLANGE_H);
                translate([ear[0], ear[1], -0.1])
                    cylinder(d=1.8, h=SILICONE_FLANGE_H + 0.2);
            }
        }

        // Raised Main Plateau (5.8mm above PCB)
        translate([KEYS_CX, KEYS_CY, 0])
            rrect_3d(KEYS_W, KEYS_H, SILICONE_PLATEAU_H, KEYS_R, center_xy=true);

        // 16 Lower White Keys (protrude from 5.8mm to 8.0mm)
        for (kx = LOWER_KEYS_X) {
            translate([kx, 16.5, SILICONE_PLATEAU_H])
                pill_key_3d(5.2, 18.0, SILICONE_KEY_H);
        }

        // 11 Upper Black/Function Keys (protrude from 5.8mm to 8.0mm)
        for (i = [0 : len(UPPER_KEYS_X) - 1]) {
            kx = UPPER_KEYS_X[i];
            klen = (i == 10) ? 18.0 : 13.5;
            ky   = (i == 10) ? 30.3 : 32.5;
            translate([kx, ky, SILICONE_PLATEAU_H])
                pill_key_3d(5.2, klen, SILICONE_KEY_H);
        }
    }

    // Translucent Light Cap Stripes on top of the 27 keys
    color([0.92, 0.92, 0.95]) {
        for (kx = LOWER_KEYS_X) {
            translate([kx - 0.4, 16.5 - 5.0, SILICONE_TOTAL_H])
                cube([0.8, 10.0, 0.1]);
        }
        for (i = [0 : len(UPPER_KEYS_X) - 1]) {
            kx = UPPER_KEYS_X[i];
            ky = (i == 10) ? 30.3 : 32.5;
            translate([kx - 0.4, ky - 3.0, SILICONE_TOTAL_H])
                cube([0.8, 6.0, 0.1]);
        }
    }
}

module fm1_silicone_options_mat() {
    color([0.68, 0.32, 0.22])
    union() {
        // Outer Base Flange (1.2mm thick)
        translate([OPTIONS_CX, OPTIONS_CY, 0])
            rrect_3d(OPTIONS_W + 3.4, OPTIONS_H + 3.4, SILICONE_FLANGE_H, OPTIONS_R + 1.2, center_xy=true);

        // Alignment Ears on Top & Left of Options Mat
        for (ear = [
            [OPTIONS_CX - 20, OPTIONS_CY + OPTIONS_H/2 + 2.0],
            [OPTIONS_CX,      OPTIONS_CY + OPTIONS_H/2 + 2.0],
            [OPTIONS_CX + 20, OPTIONS_CY + OPTIONS_H/2 + 2.0],
            [OPTIONS_CX - OPTIONS_W/2 - 2.0, OPTIONS_CY]
        ]) {
            difference() {
                translate([ear[0], ear[1], 0])
                    cylinder(d=4.6, h=SILICONE_FLANGE_H);
                translate([ear[0], ear[1], -0.1])
                    cylinder(d=1.6, h=SILICONE_FLANGE_H + 0.2);
            }
        }

        // Raised Plateau (5.8mm above PCB)
        translate([OPTIONS_CX, OPTIONS_CY, 0])
            rrect_3d(OPTIONS_W, OPTIONS_H, SILICONE_PLATEAU_H, OPTIONS_R, center_xy=true);

        // 12 Chiclet Function Buttons (5.8mm to 8.0mm)
        for (cx = OPTIONS_COLS_X) {
            for (cy = [OPTIONS_ROW1_Y, OPTIONS_ROW2_Y]) {
                translate([cx, cy, SILICONE_PLATEAU_H])
                    rrect_3d(7.5, 7.0, SILICONE_KEY_H, 1.4, center_xy=true);
            }
        }
    }
}

module fm1_silicone_oct_mat() {
    color([0.68, 0.32, 0.22])
    union() {
        // Outer Base Flange (1.2mm thick)
        translate([OCT_CX, OCT_CY, 0])
            rrect_3d(OCT_W + 3.2, OCT_H + 3.2, SILICONE_FLANGE_H, OCT_R + 1.2, center_xy=true);

        // Alignment Ear on Top Center
        difference() {
            translate([OCT_CX, OCT_CY + OCT_H/2 + 2.0, 0])
                cylinder(d=4.6, h=SILICONE_FLANGE_H);
            translate([OCT_CX, OCT_CY + OCT_H/2 + 2.0, -0.1])
                cylinder(d=1.6, h=SILICONE_FLANGE_H + 0.2);
        }

        // Raised Plateau (5.8mm above PCB)
        translate([OCT_CX, OCT_CY, 0])
            rrect_3d(OCT_W, OCT_H, SILICONE_PLATEAU_H, OCT_R, center_xy=true);

        // 2 Octave Buttons (OCT- and OCT+, 5.8mm to 8.0mm)
        for (cx = [16.5, 28.7]) {
            translate([cx, OCT_CY, SILICONE_PLATEAU_H])
                rrect_3d(9.5, 4.8, SILICONE_KEY_H, 1.2, center_xy=true);
        }
    }
}

// ==============================================================================
// 3. Encoders, Screen, Rear Ports & Bottom Battery/Speaker
// ==============================================================================
module fm1_encoders() {
    for (i = [0 : len(KNOB_POSITIONS) - 1]) {
        pos = KNOB_POSITIONS[i];
        // Metal Square Encoder Body on PCB (12.2 x 12.2 x 4.5mm)
        color([0.78, 0.78, 0.80])
            translate([pos[0], pos[1], 0])
                rrect_3d(ENCODER_BODY_W, ENCODER_BODY_W, ENCODER_BODY_H, 0.8, center_xy=true);

        // Black Fluted Shaft / Knob (D=6.0mm, rises to Z=13.2mm)
        color([0.14, 0.14, 0.16])
            translate([pos[0], pos[1], ENCODER_BODY_H])
                cylinder(d=KNOB_SHAFT_D, h=KNOB_TOP_Z - ENCODER_BODY_H);

        // White Pointer Line on Master Knob (index 0)
        if (i == 0) {
            color([0.95, 0.95, 0.95])
                translate([pos[0] - 0.45, pos[1] + 0.8, KNOB_TOP_Z - 3.8])
                    cube([0.9, 2.3, 3.9]);
        }
    }
}

module fm1_screen_module() {
    // 1.54" TFT Module Backlight Frame (mounted under glass bezel)
    color([0.85, 0.85, 0.88])
        translate([SCREEN_CX, SCREEN_CY, 3.2])
            rrect_3d(31.5, 35.5, 2.4, 1.0, center_xy=true);

    // Outer Black Glass Bezel (37.4 x 37.4 x 0.8mm, top at Z=6.4mm)
    color([0.10, 0.10, 0.12])
        translate([SCREEN_CX, SCREEN_CY, 5.6])
            rrect_3d(SCREEN_BEZEL_W, SCREEN_BEZEL_H, 0.8, 3.2, center_xy=true);

    // Active 1.54" TFT Area
    color([0.55, 0.75, 0.88])
        translate([SCREEN_CX, SCREEN_CY, 6.41])
            rrect_3d(SCREEN_LCD_W, SCREEN_LCD_H, 0.05, 0.5, center_xy=true);
}

module fm1_rear_ports() {
    pcb_mid_z = -PCB_THICK / 2; // -0.8mm (center axis of the 1.6mm PCB)

    // 1. SMD Charge LED (LED2 on top of PCB at X = 33.8, Y = 92.8)
    color([0.95, 0.25, 0.15])
        translate([33.8, 92.8, 0])
            rrect_3d(1.6, 1.2, 0.8, 0.2, center_xy=true);

    // 2. Right-Angle SMD Slide Power Switch (sits on TOP of PCB, Z = 0 to +2.2mm)
    color([0.75, 0.75, 0.78])
        translate([REAR_POWER_X, 92.2, 0])
            rrect_3d(6.8, 3.0, 2.2, 0.3, center_xy=true);
    // Black actuator pin sticking out at Z = +0.45 to +1.95mm (center Z = +1.2mm)
    color([0.12, 0.12, 0.14])
        translate([REAR_POWER_X - 0.75, 93.5, 0.45])
            cube([1.5, 1.3, 1.5]);

    // 3. Mid-Mount USB-C Receptacle (centered on PCB middle axis Z = -0.8mm)
    color([0.80, 0.80, 0.85])
        translate([REAR_USBC_X, 90.8, pcb_mid_z - 1.6])
            rrect_3d(8.9, 7.4, 3.2, 1.2, center_xy=true);
    // Dark inner USB-C tongue cavity
    color([0.15, 0.15, 0.18])
        translate([REAR_USBC_X, 94.51, pcb_mid_z - 1.1])
            rrect_3d(7.8, 0.2, 2.2, 0.8, center_xy=true);

    // 4. Mid-Mount 3.5mm MIDI In & Audio Out Jacks (centered on PCB middle axis Z = -0.8mm)
    color([0.15, 0.15, 0.18]) {
        for (jx = [REAR_MIDI_X, REAR_AUDIO_X]) {
            difference() {
                union() {
                    translate([jx, 88.3, pcb_mid_z - 2.5])
                        rrect_3d(8.0, 12.0, 5.0, 0.5, center_xy=true);
                    translate([jx, 94.0, pcb_mid_z])
                        rotate([-90, 0, 0])
                            cylinder(d=5.6, h=0.6);
                }
                // 3.5mm bore hole centered at pcb_mid_z (-0.8mm)
                translate([jx, 95.0, pcb_mid_z])
                    rotate([90, 0, 0])
                        cylinder(d=3.6, h=11.0);
            }
        }
    }
}

// ==============================================================================
// 4. Stock 26.5mm Speaker & Upgraded 40mm Full-Range Speaker 3D Modules
// ==============================================================================

// Stock 26.5 x 4.2mm flat speaker capsule
module fm1_stock_speaker_3d(dia=SPEAKER_D, h=SPEAKER_H) {
    color([0.12, 0.12, 0.14]) {
        cylinder(d=dia, h=h);
        for (ang = [-35, 145]) {
            rotate([0, 0, ang])
                translate([dia/2, 0, 0])
                    cylinder(d=5.0, h=h);
        }
    }
}

// Upgraded 50mm Full-Range Speaker Driver (Calibrated from 50x31mm / Ø45x8mm measurements & photos)
// Origin (0,0,0):
//   - If face_down == true:  Z=0 is the front foam gasket face (resting on Bottom Panel),
//                            and Z=total_h is the top of the ferrite magnet.
//   - If face_down == false: Z=0 is the back of the ferrite magnet (resting on Bottom Panel),
//                            and Z=total_h is the front foam gasket face.
module fm1_big_speaker_3d(
    outer_dia  = BIG_SPK_DIA,        // 50.0 mm
    total_h    = BIG_SPK_TOTAL_H,    // 31.0 mm
    magnet_dia = BIG_SPK_MAGNET_DIA, // 45.0 mm
    magnet_h   = BIG_SPK_MAGNET_H,   //  8.0 mm
    face_down  = true,
    show_wires = true
) {
    // Proportions matched directly to photos/speaker_50mm_side.jpg & speaker_50mm_3q.jpg
    gasket_h     = 2.2;                         // Black front rubber/foam gasket thickness
    rim_lip_h    = 1.3;                         // Stamped steel outer flange lip thickness
    top_plate_h  = 1.8;                         // Silver steel front pole plate on magnet
    neck_h       = 2.7;                         // Stepped silver cylindrical collar above top plate
    neck_dia     = outer_dia * 0.73;            // ~36.5mm basket throat diameter
    basket_z0    = magnet_h + top_plate_h + neck_h; // ~12.5mm from magnet back
    basket_z1    = max(basket_z0 + 4.0, total_h - gasket_h - rim_lip_h); // ~27.5mm
    basket_h     = basket_z1 - basket_z0;       // ~15.0mm flared basket height
    spider_h     = min(6.0, basket_h * 0.45);   // Corrugated orange spider visible in windows
    surround_od  = outer_dia * 0.91;            // Outer diameter of rubber half-roll surround (45.5mm)
    surround_id  = outer_dia * 0.70;            // Inner diameter of rubber surround / cone edge (35.0mm)
    dustcap_dia  = outer_dia * 0.40;            // Glossy black central dome dust cap (20.0mm)
    cone_depth   = min(8.0, basket_h * 0.52);   // Depth of the concave paper cone funnel

    // Orient driver according to face_down flag (built in magnet-at-Z=0 frame, then flipped if face_down)
    translate([0, 0, face_down ? total_h : 0])
    mirror([0, 0, face_down ? 1 : 0]) {

        // 1. Rear Chamfered Pole Plate & Large Black Ferrite Magnet (Z = 0 .. magnet_h)
        color([0.22, 0.22, 0.25])
            cylinder(d1=magnet_dia - 1.2, d2=magnet_dia, h=0.8);
        color([0.14, 0.14, 0.16])
            translate([0, 0, 0.8])
                cylinder(d=magnet_dia, h=max(0.5, magnet_h - 0.8));

        // 2. Galvanized Steel Front Pole Plate + Stepped Basket Collar (Z = magnet_h .. basket_z0)
        color([0.72, 0.75, 0.78]) {
            translate([0, 0, magnet_h])
                cylinder(d1=magnet_dia - 1.5, d2=magnet_dia - 2.5, h=top_plate_h);
            translate([0, 0, magnet_h + top_plate_h])
                cylinder(d1=neck_dia + 1.5, d2=neck_dia, h=neck_h);
        }

        // 3. Corrugated Golden-Orange Spider visible inside the 4 Basket Windows
        color([0.80, 0.52, 0.22])
            translate([0, 0, basket_z0 + 0.2])
                cylinder(d=neck_dia - 1.4, h=spider_h);

        // 4. Flared Stamped Metal Basket with 4 Open Windows & Square Strut Holes
        color([0.62, 0.65, 0.68]) {
            difference() {
                translate([0, 0, basket_z0])
                    cylinder(d1=neck_dia, d2=outer_dia - 1.4, h=basket_h);

                // Hollow interior of the basket
                translate([0, 0, basket_z0 - 0.1])
                    cylinder(d1=neck_dia - 2.2, d2=outer_dia - 3.8, h=basket_h + 0.2);

                // 4 Basket Cutout Windows (at 45, 135, 225, 315 deg, leaving solid struts at 0/90/180/270)
                for (ang = [45, 135, 225, 315]) {
                    rotate([0, 0, ang])
                        translate([neck_dia * 0.22, -outer_dia * 0.19, basket_z0 + 1.0])
                            cube([outer_dia, outer_dia * 0.38, max(1.0, basket_h - 3.2)]);
                }

                // 4 Small Square Stamping Holes in the 4 Basket Struts (at 0, 90, 180, 270 deg)
                for (ang = [0, 90, 180, 270]) {
                    rotate([0, 0, ang])
                        translate([0, -1.2, basket_z0 + basket_h * 0.38])
                            cube([outer_dia, 2.4, 2.4]);
                }
            }

            // Stamped Steel Outer Rim Flange (Z = basket_z1 .. total_h - gasket_h)
            translate([0, 0, basket_z1])
                difference() {
                    cylinder(d=outer_dia, h=rim_lip_h);
                    translate([0, 0, -0.1])
                        cylinder(d=surround_od - 1.0, h=rim_lip_h + 0.2);
                }
        }

        // 5. Hollow Concave Matte-Black Paper Cone Funnel
        cone_z_top = total_h - gasket_h - 0.3;
        cone_z_bot = cone_z_top - cone_depth;
        color([0.16, 0.16, 0.18])
            difference() {
                translate([0, 0, cone_z_bot])
                    cylinder(d1=dustcap_dia * 0.78, d2=surround_id + 1.2, h=cone_depth);
                // Subtract hollow concave funnel interior so the cone dips down around the dust cap
                translate([0, 0, cone_z_bot + 1.2])
                    cylinder(d1=dustcap_dia * 0.72, d2=surround_id - 0.4, h=cone_depth);
            }

        // 6. Glossy Black Convex Dust Cap Dome Seated Inside the Concave Cone
        color([0.08, 0.08, 0.10])
            difference() {
                translate([0, 0, cone_z_bot + 0.5])
                    scale([1.0, 1.0, 0.42])
                        sphere(d=dustcap_dia);
                translate([0, 0, cone_z_bot - dustcap_dia])
                    cylinder(d=dustcap_dia + 2, h=dustcap_dia + 0.5);
            }

        // 7. Half-Roll Black Rubber Surround Torus
        roll_r  = (surround_od - surround_id) / 4;
        roll_cr = (surround_od + surround_id) / 4;
        color([0.12, 0.12, 0.14])
            translate([0, 0, total_h - gasket_h])
                scale([1.0, 1.0, 0.85])
                    rotate_extrude()
                        translate([roll_cr, 0, 0])
                            circle(r=roll_r);

        // 8. Outer Black Foam/Rubber Mounting Gasket Ring (Z = total_h - gasket_h .. total_h)
        color([0.10, 0.10, 0.12])
            translate([0, 0, total_h - gasket_h])
                difference() {
                    cylinder(d=outer_dia, h=gasket_h);
                    translate([0, 0, -0.1])
                        cylinder(d=surround_od, h=gasket_h + 0.2);
                }

        // 9. Solder Terminal Tab + Red/Black Twisted Wire + White 2-Pin JST Plug
        if (show_wires) {
            color([0.75, 0.65, 0.25])
                translate([neck_dia/2 - 0.5, -2.5, basket_z0 + 0.5])
                    cube([3.5, 5.0, 0.8]);
            color([0.85, 0.15, 0.12])
                translate([neck_dia/2 + 2.0, -0.8, basket_z0 - 2.0])
                    rotate([0, 65, 15])
                        cylinder(d=1.3, h=14.0);
            color([0.12, 0.12, 0.14])
                translate([neck_dia/2 + 2.0, 0.6, basket_z0 - 2.0])
                    rotate([0, 65, 15])
                        cylinder(d=1.3, h=14.0);
            color([0.92, 0.92, 0.90])
                translate([neck_dia/2 + 13.5, 1.5, basket_z0 - 8.5])
                    rotate([0, 20, 15])
                        rrect_3d(5.5, 4.2, 3.2, 0.4, center_xy=true);
        }
    }
}

// AliExpress 40mm 4Ohm 5W Shielded Speaker 3D Model
// Physical calibrated measurements from real hardware:
//   - Outer Rim Flange:   40.0 mm outer diameter
//   - Total Height:       21.0 mm from front gasket to back of magnet cup
//   - Rear Magnet Cup:    23.0 mm diameter x 9.0 mm tall matte black cup
//   - Terminal Strip:     28.0 mm wide across eyelets (23mm white phenolic strip + 2x 2.5mm eyelets)
module fm1_aliexpress_40mm_speaker_3d(
    outer_dia  = 40.0,
    total_h    = 21.0,
    cup_dia    = 23.0,
    cup_h      = 9.0,
    face_down  = true,
    show_wires = true
) {
    gasket_h    = 1.2;
    rim_lip_h   = 1.3;
    step1_h     = 2.6;
    step1_dia   = min(outer_dia - 4.0, cup_dia + 8.0); // ~31mm middle step
    dish_z0     = cup_h + step1_h;                     // ~11.6mm
    dish_z1     = max(dish_z0 + 2.0, total_h - gasket_h - rim_lip_h - 3.2); // leaves 3.2mm circumferential acoustic slot
    surround_od = outer_dia * 0.90;
    surround_id = outer_dia * 0.68;
    dustcap_dia = outer_dia * 0.42;
    cone_depth  = 5.5;

    translate([0, 0, face_down ? total_h : 0])
    mirror([0, 0, face_down ? 1 : 0]) {
        // 1. Matte Black Stamped Steel Basket & Rear Magnet Cup (Ø23mm x 9mm with rounded top bevel)
        color([0.18, 0.18, 0.20]) {
            cylinder(d1=cup_dia - 2.0, d2=cup_dia, h=1.2);
            translate([0, 0, 1.2])
                cylinder(d=cup_dia, h=max(0.5, cup_h - 1.2));

            // 2. Stepped Steel Collar (Ø31mm)
            translate([0, 0, cup_h])
                cylinder(d1=step1_dia - 1.0, d2=step1_dia, h=step1_h);

            // 3. Flared Stamped Steel Basket Dish (Ø31mm -> Ø37.5mm)
            translate([0, 0, dish_z0])
                cylinder(d1=step1_dia, d2=outer_dia - 2.2, h=dish_z1 - dish_z0);

            // 4 internal support struts bridging the circumferential acoustic windows to the Ø40mm front rim
            for (ang = [45, 135, 225, 315]) {
                rotate([0, 0, ang])
                    translate([outer_dia/2 - 3.5, -2.0, dish_z1 - 0.5])
                        cube([2.8, 4.0, total_h - gasket_h - dish_z1 + 0.5]);
            }

            // Outer Ø40mm Stamped Steel Rim Flange
            translate([0, 0, total_h - gasket_h - rim_lip_h])
                difference() {
                    cylinder(d=outer_dia, h=rim_lip_h);
                    translate([0, 0, -0.1])
                        cylinder(d=surround_od - 1.0, h=rim_lip_h + 0.2);
                }
        }

        // 4. Golden Woven Composite Cone Ring
        cone_z_top = total_h - gasket_h - 0.2;
        cone_z_bot = cone_z_top - cone_depth;
        color([0.72, 0.58, 0.20])
            difference() {
                translate([0, 0, cone_z_bot])
                    cylinder(d1=dustcap_dia * 0.85, d2=surround_id + 0.5, h=cone_depth);
                translate([0, 0, cone_z_bot + 0.8])
                    cylinder(d1=dustcap_dia * 0.80, d2=surround_id - 0.8, h=cone_depth);
            }

        // Glossy Black Convex Dust Cap
        color([0.05, 0.05, 0.06])
            difference() {
                translate([0, 0, cone_z_bot + 0.8])
                    scale([1.0, 1.0, 0.45])
                        sphere(d=dustcap_dia);
                translate([0, 0, cone_z_bot - dustcap_dia])
                    cylinder(d=dustcap_dia + 2, h=dustcap_dia + 0.4);
            }

        // 5. Half-Roll Rubber Surround & Front Gasket
        roll_r  = (surround_od - surround_id) / 4;
        roll_cr = (surround_od + surround_id) / 4;
        color([0.12, 0.12, 0.14])
            translate([0, 0, total_h - gasket_h])
                scale([1.0, 1.0, 0.85])
                    rotate_extrude()
                        translate([roll_cr, 0, 0])
                            circle(r=roll_r);

        color([0.10, 0.10, 0.12])
            translate([0, 0, total_h - gasket_h])
                difference() {
                    cylinder(d=outer_dia, h=gasket_h);
                    translate([0, 0, -0.1])
                        cylinder(d=surround_od, h=gasket_h + 0.2);
                }

        // 6. Riveted White Phenolic Terminal Strip (23mm wide body + 2x 2.5mm solder eyelets = 28mm total)
        if (show_wires) {
            color([0.94, 0.92, 0.85])
                translate([outer_dia/2 - 2.8, -11.5, dish_z1 - 1.2])
                    cube([2.2, 23.0, 3.2]);
            // Silver solder eyelets
            color([0.80, 0.82, 0.85]) {
                translate([outer_dia/2 - 2.6, -13.0, dish_z1 - 0.8])
                    cube([2.0, 2.5, 2.4]);
                translate([outer_dia/2 - 2.6,  10.5, dish_z1 - 0.8])
                    cube([2.0, 2.5, 2.4]);
            }
        }
    }
}

module fm1_bottom_components(include_speaker=true) {
    // 1. LiPo Battery DTP704060 (60 x 40 x 7.0mm, taped to bottom of PCB)
    color([0.85, 0.70, 0.10])
        translate([BAT_X_MIN, BAT_Y_MIN, -PCB_THICK - BAT_H])
            rrect_3d(BAT_W, BAT_D, BAT_H, 2.0);
    // Silver battery label
    color([0.90, 0.90, 0.92])
        translate([BAT_X_MIN + 4, BAT_Y_MIN + 3, -PCB_THICK - BAT_H - 0.05])
            cube([BAT_W - 8, BAT_D - 6, 0.05]);

    // 2. Three Laid-Down Electrolytic Capacitors (100uF 16V, next to battery)
    color([0.15, 0.15, 0.18]) {
        translate([83.0, 48.0, -PCB_THICK - 6.3])
            cube([11.0, 6.3, 6.3]);
        translate([83.0, 41.0, -PCB_THICK - 6.3])
            cube([11.0, 6.3, 6.3]);
        translate([74.0, 52.0, -PCB_THICK - 6.3])
            cube([6.3, 11.0, 6.3]);
    }

    // 3. Underside JST Connectors (Important for speaker placement clearance!)
    // J1: 3-Pin Battery JST Connector + Plug (at X=41.0, Y=38.5, protrudes 5.0mm below PCB)
    color([0.90, 0.88, 0.82])
        translate([41.0, 38.5, -PCB_THICK - 5.0])
            rrect_3d(8.0, 7.6, 5.0, 0.4, center_xy=true);
    // J13: 2-Pin Speaker JST Header (labeled S+ S- at X=62.5, Y=46.5, protrudes 3.5mm below PCB)
    color([0.88, 0.85, 0.78])
        translate([62.5, 46.5, -PCB_THICK - 3.5])
            rrect_3d(6.2, 4.5, 3.5, 0.4, center_xy=true);

    // 4. White Silkscreen Reference Circle for Stock Speaker on PCB Underside
    color([0.92, 0.92, 0.92])
        translate([SPEAKER_CX, SPEAKER_CY, -PCB_THICK - 0.04])
            difference() {
                cylinder(d=SPEAKER_D, h=0.04);
                translate([0, 0, -0.05])
                    cylinder(d=SPEAKER_D - 0.8, h=0.15);
            }

    // 5. Through-Hole Encoder Mounting Clips/Pins on PCB Underside (protrude 2.0mm below PCB)
    color([0.72, 0.72, 0.75])
        for (pos = KNOB_POSITIONS) {
            translate([pos[0], pos[1], -PCB_THICK - 2.0])
                rrect_3d(11.5, 11.5, 2.0, 0.5, center_xy=true);
        }

    // 6. Standalone Speaker Preview (when viewing fm1_pcb_and_silicone.scad directly)
    if (include_speaker && show_speaker) {
        if (speaker_model == "aliexpress_40mm") {
            translate([SPEAKER_CX, SPEAKER_CY, -PCB_THICK - 2.0 - 22.0])
                fm1_aliexpress_40mm_speaker_3d();
        } else if (speaker_model != "stock_26mm") {
            translate([SPEAKER_CX, SPEAKER_CY, -PCB_THICK - 2.0 - BIG_SPK_TOTAL_H])
                fm1_big_speaker_3d();
        } else {
            translate([SPEAKER_CX, SPEAKER_CY, -PCB_THICK - 4.0 - SPEAKER_H])
                fm1_stock_speaker_3d();
        }
    }
}

// ==============================================================================
// Complete Internal Hardware Assembly Module
// ==============================================================================
module fm1_internals_assembly(explode_silicone=0.0, include_speaker=true) {
    if (show_pcb)          fm1_pcb();
    if (show_encoders)     fm1_encoders();
    if (show_screen)       fm1_screen_module();
    if (show_rear_ports)   fm1_rear_ports();
    if (show_bottom_parts) fm1_bottom_components(include_speaker=include_speaker);

    translate([0, 0, explode_silicone]) {
        if (show_silicone_keys) fm1_silicone_keys_mat();
        if (show_silicone_opts) fm1_silicone_options_mat();
        if (show_silicone_oct)  fm1_silicone_oct_mat();
    }
}

// Direct Preview when opening this file standalone
fm1_internals_assembly(explode_silicone=silicone_explode_z, include_speaker=true);

