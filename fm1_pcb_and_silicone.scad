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
show_bottom_parts   = true; // Battery, capacitors, speaker

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

// --- Underside Components (Battery & Speaker) ---
BAT_X_MIN = 94.30;
BAT_Y_MIN = 9.00;
BAT_W     = 60.00; // DTP704060 length
BAT_D     = 40.00; // DTP704060 width
BAT_H     = 7.00;  // DTP704060 thickness

SPEAKER_CX = 24.20;
SPEAKER_CY = 34.50;
SPEAKER_D  = 26.50;
SPEAKER_H  = 4.20;

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

module fm1_bottom_components() {
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

    // 3. Enclosed Round Speaker Module (D=26.5mm, under left side of PCB)
    color([0.12, 0.12, 0.14])
        translate([SPEAKER_CX, SPEAKER_CY, -PCB_THICK - 4.0 - SPEAKER_H]) {
            cylinder(d=SPEAKER_D, h=SPEAKER_H);
            // Mounting ears
            for (ang = [-35, 145]) {
                rotate([0, 0, ang])
                    translate([SPEAKER_D/2, 0, 0])
                        cylinder(d=5.0, h=SPEAKER_H);
            }
        }
}

// ==============================================================================
// Complete Internal Hardware Assembly Module
// ==============================================================================
module fm1_internals_assembly(explode_silicone=0.0) {
    if (show_pcb)          fm1_pcb();
    if (show_encoders)     fm1_encoders();
    if (show_screen)       fm1_screen_module();
    if (show_rear_ports)   fm1_rear_ports();
    if (show_bottom_parts) fm1_bottom_components();

    translate([0, 0, explode_silicone]) {
        if (show_silicone_keys) fm1_silicone_keys_mat();
        if (show_silicone_opts) fm1_silicone_options_mat();
        if (show_silicone_oct)  fm1_silicone_oct_mat();
    }
}

// Direct Preview when opening this file standalone
fm1_internals_assembly(explode_silicone=silicone_explode_z);

