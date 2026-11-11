import os
import matplotlib
matplotlib.use('Agg')
from matplotlib.textpath import TextPath
from matplotlib.font_manager import FontProperties
from matplotlib.path import Path
import numpy as np

W = 162.0
H = 97.0

def path_to_svg_d(path, height=H):
    cmds = []
    for verts, code in path.iter_segments():
        if code == Path.MOVETO:
            y = height - verts[1]
            cmds.append(f"M {verts[0]:.3f} {y:.3f}")
        elif code == Path.LINETO:
            y = height - verts[1]
            cmds.append(f"L {verts[0]:.3f} {y:.3f}")
        elif code == Path.CURVE3:
            y1 = height - verts[1]
            y = height - verts[3]
            cmds.append(f"Q {verts[0]:.3f} {y1:.3f} {verts[2]:.3f} {y:.3f}")
        elif code == Path.CURVE4:
            y1 = height - verts[1]
            y2 = height - verts[3]
            y = height - verts[5]
            cmds.append(f"C {verts[0]:.3f} {y1:.3f} {verts[2]:.3f} {y2:.3f} {verts[4]:.3f} {y:.3f}")
        elif code == Path.CLOSEPOLY:
            cmds.append("Z")
    return " ".join(cmds)

def get_text_path(text, cx, cy, size, weight='bold', align='center'):
    fp = FontProperties(family='sans-serif', weight=weight)
    tp = TextPath((0, 0), text, size=size, prop=fp)
    verts = tp.vertices
    x_min, x_max = verts[:,0].min(), verts[:,0].max()
    y_min, y_max = verts[:,1].min(), verts[:,1].max()
    w = x_max - x_min
    h = y_max - y_min
    
    if align == 'center':
        dx = cx - (x_min + w / 2.0)
    elif align == 'left':
        dx = cx - x_min
    elif align == 'right':
        dx = cx - x_max
    else:
        dx = cx
        
    dy = cy - (y_min + h / 2.0)
    return Path(verts + np.array([dx, dy]), tp.codes)

def rect_path(x, y, w, h, t=0.3):
    outer = [(x, y), (x + w, y), (x + w, y + h), (x, y + h), (x, y)]
    inner = [(x + t, y + t), (x + t, y + h - t), (x + w - t, y + h - t), (x + w - t, y + t), (x + t, y + t)]
    pts = outer + inner
    codes = [Path.MOVETO, Path.LINETO, Path.LINETO, Path.LINETO, Path.CLOSEPOLY,
             Path.MOVETO, Path.LINETO, Path.LINETO, Path.LINETO, Path.CLOSEPOLY]
    return Path(pts, codes)

def tick_rect_path(x1, y1, x2, y2, width=0.35):
    dx = x2 - x1
    dy = y2 - y1
    L = np.hypot(dx, dy)
    if L < 1e-6: return None
    nx = -dy / L * (width / 2.0)
    ny = dx / L * (width / 2.0)
    pts = [
        (x1 + nx, y1 + ny), (x2 + nx, y2 + ny),
        (x2 - nx, y2 - ny), (x1 - nx, y1 - ny),
        (x1 + nx, y1 + ny)
    ]
    codes = [Path.MOVETO, Path.LINETO, Path.LINETO, Path.LINETO, Path.CLOSEPOLY]
    return Path(pts, codes)

svg_paths = []

# 1. Knob Labels (Original M-VAVE Case Typography)
knob_labels = [
    # Left Bank
    ("MASTER",    14.00, 87.80, 2.3),
    ("SELECT",    31.00, 87.80, 2.3),
    ("PRESETS",   14.00, 70.80, 2.3),
    ("ALGORITHM", 31.00, 70.80, 2.3),
    # Right Bank
    ("KNOB1",     91.00, 87.80, 2.3),
    ("KNOB2",    109.00, 87.80, 2.3),
    ("KNOB3",    127.00, 87.80, 2.3),
    ("KNOB4",    145.00, 87.80, 2.3),
]

for text, cx, cy, sz in knob_labels:
    p = get_text_path(text, cx, cy, sz, weight='bold')
    svg_paths.append(path_to_svg_d(p))

# 2. Knob Graduation Ticks (7 clean ticks from 7 o'clock to 5 o'clock)
knob_coords = [
    [14.0, 81.0], [31.0, 81.0], [14.0, 64.0], [31.0, 64.0],
    [91.0, 81.0], [109.0, 81.0], [127.0, 81.0], [145.0, 81.0]
]

for kx, ky in knob_coords:
    for ang_deg in np.linspace(220, -40, 7):
        rad = np.radians(ang_deg)
        r_in = 5.8
        r_out = 6.9
        p_tick = tick_rect_path(kx + r_in * np.cos(rad), ky + r_in * np.sin(rad),
                               kx + r_out * np.cos(rad), ky + r_out * np.sin(rad), width=0.35)
        if p_tick:
            svg_paths.append(path_to_svg_d(p_tick))

# 3. Logos
# "M-VAVE" logo (top right above knobs 2 & 3)
p_mvave = get_text_path("M-VAVE", 118.0, 93.3, 3.4, weight='bold')
svg_paths.append(path_to_svg_d(p_mvave))

# "FM-1" logo (centered above screen)
p_fm1 = get_text_path("FM-1", 61.1, 93.3, 3.8, weight='bold')
svg_paths.append(path_to_svg_d(p_fm1))

# Subtitle under FM-1
p_sub = get_text_path("6-OPERATOR FM SYNTHESIZER", 61.1, 89.6, 1.4, weight='bold')
svg_paths.append(path_to_svg_d(p_sub))

# 4. Plastic Cover Placement Guide Outline on Wood
# Size: 37.4 x 37.4 mm centered at SCREEN_CX=61.10, SCREEN_CY=70.20
scx = 61.10
scy = 70.20
sbw = 37.40
sbh = 37.40
p_screen_guide = rect_path(scx - sbw/2, scy - sbh/2, sbw, sbh, t=0.30)
svg_paths.append(path_to_svg_d(p_screen_guide))

# 4 stylish corner brackets on screen alignment frame
cs = 3.5
ct = 0.5
rx = scx - sbw/2
ry = scy - sbh/2
# Top-Left corner bracket
svg_paths.append(path_to_svg_d(tick_rect_path(rx - 0.8, ry + sbh + 0.8, rx + cs, ry + sbh + 0.8, ct)))
svg_paths.append(path_to_svg_d(tick_rect_path(rx - 0.8, ry + sbh + 0.8, rx - 0.8, ry + sbh - cs, ct)))
# Top-Right corner bracket
svg_paths.append(path_to_svg_d(tick_rect_path(rx + sbw + 0.8, ry + sbh + 0.8, rx + sbw - cs, ry + sbh + 0.8, ct)))
svg_paths.append(path_to_svg_d(tick_rect_path(rx + sbw + 0.8, ry + sbh + 0.8, rx + sbw + 0.8, ry + sbh - cs, ct)))
# Bottom-Left corner bracket
svg_paths.append(path_to_svg_d(tick_rect_path(rx - 0.8, ry - 0.8, rx + cs, ry - 0.8, ct)))
svg_paths.append(path_to_svg_d(tick_rect_path(rx - 0.8, ry - 0.8, rx - 0.8, ry + cs, ct)))
# Bottom-Right corner bracket
svg_paths.append(path_to_svg_d(tick_rect_path(rx + sbw + 0.8, ry - 0.8, rx + sbw - cs, ry - 0.8, ct)))
svg_paths.append(path_to_svg_d(tick_rect_path(rx + sbw + 0.8, ry - 0.8, rx + sbw + 0.8, ry + cs, ct)))

# 5. Note markers above keyboard keys (C2, C3, C4, C5)
c_keys = [
    ("C2", 12.1, 41.5),
    ("C3", 48.6, 41.5),
    ("C4", 85.0, 41.5),
    ("C5", 122.1, 41.5)
]
for lbl, cx, cy in c_keys:
    p_c = get_text_path(lbl, cx, cy, 1.8, weight='bold')
    svg_paths.append(path_to_svg_d(p_c))
    p_tick = tick_rect_path(cx, cy - 1.2, cx, cy - 2.5, width=0.35)
    if p_tick:
        svg_paths.append(path_to_svg_d(p_tick))

# Combine all paths into clean SVG
all_d = " ".join(svg_paths)
svg_content = f'''<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg xmlns="http://www.w3.org/2000/svg" width="{W}mm" height="{H}mm" viewBox="0 0 {W} {H}">
  <title>M-VAVE FM-1 Frontplate Laser Engraving</title>
  <desc>Precision vector engraving artwork calibrated from original M-VAVE FM-1 case</desc>
  <path id="frontplate_engraving" d="{all_d}" fill="#1a1a1a" fill-rule="evenodd" stroke="none" />
</svg>
'''

os.makedirs('laserfiles', exist_ok=True)
with open('laserfiles/fm1_frontplate_engraving.svg', 'w') as f:
    f.write(svg_content)
with open('fm1_frontplate_engraving.svg', 'w') as f:
    f.write(svg_content)

print(f"Generated clean SVG with {len(svg_paths)} vector paths.")
