# 🎛️ Dual-Perspective Repository & Readability Review: Synth Geek vs. Hardware Hacker

**A Dialogue & Comprehensive Readability Audit of the M-VAVE FM-1 Vintage Case Project**  
**Repository:** `dusjagr/fm-1_case`  
**License:** [Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](../LICENSE)  
**Date:** November 2026  

---

## 👥 The Reviewers

| Reviewer | Persona & Background | Primary Focus Areas |
| :--- | :--- | :--- |
| **Julian "Patchbay" Sterling** | DX7 purist, audio journalist (*Retro-Tech & Synthesis Quarterly*), boutique synth collector | Musical ergonomics, aesthetic heritage, tactile feel, sound quality, patch workflow, readability for musicians |
| **Dr. Morgan "Bitstream" Chen** | Open-source hardware hacker, FabLab mentor, digital fabrication & parametric CAD specialist | OpenSCAD architecture, laser cutting tolerances, kerf compensation, BOM completeness, safety cautions, assembly reproducibility |

---

## 🎙️ Part 1: The Fireside Dialogue

*Setting: Late evening at a hackerspace electronics lab. A vintage Yamaha DX7 sits propped up against a workbench on one side; an 80W CO2 laser cutter hums gently on the other. On the center table sits the final prototype: an M-VAVE FM-1 running classic DX7 patches, glowing warmly through its tilted wooden cabinet with sculpted walnut cheeks.*

```
   ┌─────────────────────────────────────────────────────────────────┐
   │  "From a $35 orange plastic toy calculator to a boutique         │
   │   desktop Eurorack-heritage 6-operator FM powerhouse."          │
   └─────────────────────────────────────────────────────────────────┘
```

### Act I: First Impressions — Seduction vs. CAD Inspection

**Julian:** Morgan, look at this little beast sitting on the desk. You know what the M-VAVE FM-1 usually looks like out of the box: a day-glo orange injection-molded plastic shell that screams "bargain basement guitar pedal company." And yet under the hood, JieLi chip engineers quietly implemented a genuine **6-operator FM synthesis engine** with 32 classic algorithms, DX7 SysEx patch compatibility, 8 rotary encoders, and a crisp 1.54" IPS color display! When I saw this repository, my heart skipped a beat. Putting it into a **12° tilted desktop chassis with 6.5mm sculpted wooden cheeks**, laser-engraved DX7 typography, and a custom wooden screen bezel—it’s like someone rescued Brian Eno’s pocket sketchpad and dressed it in Buchla and ABK-20 tailoring.

**Morgan:** *(adjusting caliper jaws)* It’s undeniably gorgeous, Julian. But you know me: before I drool over wood grain, I pull the git tree and inspect the source code. And I’ll give credit where it’s due: this isn't just an illustrator slapping vector lines together for a flat laser cut. The author extracted the GrabCAD 3D scan (`downloaded/3d_model_grabcad/FM1.stp`), took calipers to every boss and mid-mount jack, and wrote an entire **3D internal hardware model** in [`fm1_pcb_and_silicone.scad`](../fm1_pcb_and_silicone.scad). The collision avoidance alone is masterclass work. Look at line 336 in [`fm1_lasercut_case.scad`](../fm1_lasercut_case.scad)—`overlaps_port_zone()`. The code dynamically calculates the position of the USB-C overmold and 3.5mm jacks, and automatically suppresses finger notches that would collide with the connector barrels!

**Julian:** Exactly! But let’s talk about the **README.md**. If I'm a music producer browsing GitHub at 2 AM, that opening hero table (line 7) is pure dopamine. You see the working physical prototype with the screen lit up, the sculpted side view showing that sleek 12° wedge, and the OpenSCAD 3D model side-by-side. You immediately know: *this isn't CAD vaporware; someone actually built this and it’s running on their desk.* But then, Morgan... I hit Section 2.

**Morgan:** Ah, the "Vertex Trap."

**Julian:** Precisely! Right after the intro, line 33 hits me with: *"FM1.stp and FM1.obj, 901,951 vertices across 19 named sub-meshes: Screen, Oct_Buttons, Options, Keys..."* followed by raw Windows scan paths like `F:\Revopoint\FM1\FM1.stp`. As a musician, my eyes glaze over! I don’t care how many triangles Revopoint spit out; I want to know: *Can I play basslines without the keys flexing? Does the speaker sound like an intercom or a real synth? How do I get my Dexed patches into it?*

**Morgan:** Fair critique. But as a maker, crediting Zande Creates for the scan and noting the sub-mesh breakdown is critical open-source etiquette. However, I agree with you on flow: that belongs in an appendix or a dedicated `docs/HARDWARE_REVERSE_ENGINEERING.md`. The main README should get straight to the quickstart: *What is this? How does it sound? What materials do I buy? How do I cut it?*

---

### Act II: The Screen, The Teardown & The Life-or-Death Warning

**Julian:** Can we talk about the teardown section in the README? Because that genuinely saved this project from being a graveyard of broken synths. Lines 46–52:
> *"Be careful with the 1.54" TFT screen and its FPC connector (`J12`)! In the stock plastic enclosure, the glass display is glued into the orange top shell... Unlock the tiny black plastic FPC latch gently before pulling the ribbon..."*

Showing the macro photo of the snapped latch (`photos/broken_screenplug.jpg`) alongside the delicate ribbon cable (`photos/screenplug.jpg`) is the kind of visceral documentation every DIY project needs. I felt the author’s pain in my soul.

**Morgan:** It’s a great warning, Julian, but from a hardware hacker’s perspective, it’s incomplete. It tells you *what went wrong*, but it doesn't give you the **forensic teardown protocol** to prevent it. In the factory Cuvave shell, that glass display is bound with aggressive black acrylic pressure-sensitive adhesive. If a maker tries to pry it out cold with a screwdriver, they will either crack the 0.5mm glass matrix or tear the copper traces on the flex cable.

**Julian:** So how should a builder extract it safely?

**Morgan:** It needs an explicit 4-step protocol in the README:
1. **Toothpick or nylon spudger only** to flip the latch on `J12`—never metal tweezers that can short capacitors or chip the plastic bail.
2. **Apply 3–4 drops of 99% Isopropyl Alcohol (IPA)** around the seam to soften the acrylic adhesive.
3. **Gentle heat (50–60°C)** with a hairdryer or rework station to soften the glue bond.
4. **Push from the FRONT** with a small suction cup or soft guitar pick—never pry from the fragile ribbon edge!

And there’s another hazard nobody mentioned: the **SMD slide switch (`J5`) shearing risk**. The right-angle power switch sits on top of the PCB, but its plastic actuator peg pokes through the rear casing. If a maker unscrews the 6 main board screws and lifts the PCB while the switch is caught in the plastic cutout, it will **tear the copper solder pads clean off the FR4!** You have to center the switch and slide the board backwards before lifting. That warning needs to be in bold red font in the README.

---

### Act III: Ergonomics, Joinery & The Double-Kerf Trap

**Julian:** Once you do get the board out and mount it into the laser-cut frontplate, the ergonomic upgrades are staggering. Let's talk about the **Under-PCB Keyboard Support Rail** (`pcb_lower_support = "laser_rail"`). 
When I first played a stock FM-1, I noticed that all 6 factory mounting screws are up top ($Y \ge 44.5\,\text{mm}$). Below that, the entire 27-key keyboard is suspended like a cantilever diving board! When you play an energetic bassline on the lower octave, the whole PCB bounces and bows. 

**Morgan:** That was a glaring industrial design compromise by Cuvave to save cost on screw bosses. And the fix in [`fm1_lasercut_case.scad#L1007`](../fm1_lasercut_case.scad#L1007) is brilliantly simple: a 144mm laser-cut upright rail with 3 tenon tabs that lock into mortises in the bottom panel, supporting the front lip of the PCB at exactly $16.76\,\text{mm}$ height. It even has an arched cutout for the battery and speaker wires! That turns what was a spongy, trampoline keyboard into a firm, positive-bottoming musical interface.

**Julian:** And the **12° desktop tilt**! Flat pocket synths like the Korg Volcas or Pocket Operators force you to hunch over like an accountant doing taxes. At 12°, you can sit comfortably in an ergonomic studio chair, tweak the `ALGORITHM` and `PRESETS` encoders without the box sliding across the table, and look directly into the screen without glare. 

**Morgan:** Speaking of laser cutting, Julian, let’s talk about a major fabrication trap lurking in the OpenSCAD parameters: **Kerf Compensation**.

**Julian:** Ah, the magic number that makes tabs fit tight?

**Morgan:** Exactly, but here’s the trap: in [`fm1_lasercut_case.scad#L186`](../fm1_lasercut_case.scad#L186), `kerf` defaults to `0.08` mm. OpenSCAD’s `offset_kerf()` module ([L365](../fm1_lasercut_case.scad#L365)) properly expands male fingers by $+0.04\,\text{mm}$ per edge and shrinks female slots by $-0.04\,\text{mm}$. BUT almost every laser operator in a FabLab or makerspace uses **LightBurn**, **RDWorks**, or **Glowforge OS**, which *already* applies kerf offset during CAM slicing (typically $0.07\text{--}0.10\,\text{mm}$). If a maker leaves `kerf = 0.08` in OpenSCAD and then loads it into LightBurn with kerf enabled, the joints become **double-compensated**—an interference fit of over $+0.32\,\text{mm}$! On $3\,\text{mm}$ birch ply, your tabs will splinter or you’ll need a mallet to force them together.

**Julian:** So what should the README say?

**Morgan:** One clear sentence in a new fabrication quickstart:  
*"If your laser CAM software (LightBurn / Glowforge) handles kerf offset, set `kerf = 0.0 mm` in OpenSCAD before exporting!"*

---

### Act IV: The Vertical Height Anomaly (Sunken Keys)

**Morgan:** Julian, did you measure the height of the silicone keys relative to the frontplate on your prototype?

**Julian:** They feel decent, but now that you mention it, my fingertips do touch the wood around the key cutouts. Why?

**Morgan:** Because of the math in line 247: `PCB_TOP_Z_LOCAL = -(T + pcb_frontplate_distance)`. 
Let’s do the physical math:
* Wood thickness $T = 3.0\,\text{mm}$.
* Standoff distance `pcb_frontplate_distance = 5.6 mm`.
* That puts the PCB top surface at **$-8.6\,\text{mm}$** below the outer frontplate surface ($Z = 0$).
* Now look at [`fm1_pcb_and_silicone.scad`](../fm1_pcb_and_silicone.scad): the silicone keys are $8.0\,\text{mm}$ tall above the PCB.
* $-8.6 + 8.0 = \mathbf{-0.6\,\text{mm}}$!
On a standard $3.0\,\text{mm}$ frontplate, **the keys sit $0.6\,\text{mm}$ BELOW the top surface of the wood!**

**Julian:** *(gasps)* In the stock plastic shell, the orange face was only about $1.2\text{--}1.5\,\text{mm}$ thick, so the keys protruded nicely!

**Morgan:** Exactly! In $3\,\text{mm}$ wood, the keys become recessed into the apertures. If you want the keys to stand proud by $+1.0\,\text{mm}$ like a real synthesizer keyboard, a builder has two choices:
1. Cut the Top Faceplate from **$2.0\,\text{mm}$ or $2.5\,\text{mm}$ aircraft birch ply / black acrylic**, OR
2. Reduce `pcb_frontplate_distance` from `5.6` to `4.0 mm` in OpenSCAD.
That needs to be documented so builders don't wonder why their keys feel slightly sunken!

---

### Act V: The Great Acoustic Debate — Helmholtz Tunnel vs. Aperiodic Variovent

**Julian:** Let’s dive into the `docs/` folder, because that's where this project goes from a neat enclosure mod to an absolute tour-de-force of electro-acoustics. Reading [`PEER_REVIEW_DIALOGUE_SYNTH_GEEK_VS_SOUND_ENG.md`](PEER_REVIEW_DIALOGUE_SYNTH_GEEK_VS_SOUND_ENG.md) with **Dr. Viktor Vance ("The Baffle Butcher")** was like watching Gordon Ramsay audit an acoustic laboratory.

**Morgan:** Viktor Vance’s teardown of the "0.018 L thimble" was brutal but mathematically unassailable. When someone claims they can tune a $40\,\text{mm}$ speaker in a tiny $\varnothing 43 \times 24\,\text{mm}$ plastic cup down to $150\,\text{Hz}$ with a Helmholtz port, they forget that the magnet pot itself displaces half the cup! You’re left with $0.0178\,\text{L}$ of net air, which jacks resonance up to $500\,\text{Hz}$—it sounds like an angry bee in a tin can!

**Julian:** And Vance’s audit of the **$311\,\text{mm}^2$ of parasitic leaks**! Look at line 104:
* Dual 3.5mm jacks: $64.2\,\text{mm}^2$
* USB-C port: $53.1\,\text{mm}^2$
* Power switch slot: $15.9\,\text{mm}^2$
* 8 encoder shafts: $81.7\,\text{mm}^2$
* Finger joint seams: $96\,\text{mm}^2$
**Total: $311\,\text{mm}^2$!**
Air is lazy. If your Helmholtz duct has an acoustic inertance of $M_A = 0.452\,\text{mm}^{-1}$ and the case leaks have $M_A = 0.023\,\text{mm}^{-1}$, the leaks have **$19.6\times$ less resistance**. The air just dumps out the knob holes, and the air slug in the bass reflex duct barely moves!

**Morgan:** That’s why the **Aperiodic Variovent** concept is so brilliant. Instead of spending 50 hours trying to silicone-seal every encoder shaft, you embrace the leaks! You clamp the $40\,\text{mm}$ speaker down over the bottom pinwheel grille, put a loose $2\text{--}3\,\text{g}$ pinch of polyfill inside the case, and use the entire $\sim 0.38\,\text{L}$ cavity as an aperiodically damped chamber ($Q_{tc} \approx 0.68$). 
* No port resonance spikes.
* No port wind noise ("chuffing") on square-wave basslines.
* Flat, uncolored response down to $\sim 125\,\text{Hz}$.
* The air spring prevents the speaker cone from bottoming out when you trigger sub-audio FM clicks!

**Julian:** And don't forget the **"Cheek Megaphone" Desk Effect**! The wooden side cheeks elevate the bottom plate $4.0\,\text{mm}$ above the table. If you stick a simple $4\,\text{mm}$ foam strip along the back edge between the cheeks, the desk acts as an acoustic ground plane ($+3.5\,\text{dB}$ boundary loading), and the two cheeks form a forward-firing horn that launches bass transients directly toward the player’s chest!

**Morgan:** But notice the contradiction in the repo right now, Julian:
In [`README.md`](../README.md#L129), the parameter table lists:
`resonator_type = "helmholtz_laser_duct"` as the default!
Yet the engineering docs prove that the **Aperiodic Variovent with mechanical clamping (`stepped_clamp_laser` or `spider_clamp_3d`)** is by far the superior, buzz-free real-world build! The README should explicitly guide the reader on which one to choose.

---

### Act VI: What’s Missing & The Path to Greatness

**Julian:** If we want this project to inspire thousands of synth players on *CDM*, *Synthtopia*, and *Elektronauts*, here is what's missing on the musical side:
1. **Audio Recordings!** Where are the 24-bit sound demos? Record a 30-second A/B test of the stock plastic buzzer vs. the 40mm wooden desktop case playing *SOLID BASS*, *E.PIANO 1*, and a filtered metallic pad!
2. **SysEx & Patch Quickstart:** A one-paragraph cheat-sheet in `docs/` explaining how to fire up Dexed or Sysex Librarian over USB-C and dump 32-patch DX7 banks into the unit.
3. **Battery Runtime:** Does the bigger 40mm speaker drain the $2000\,\text{mAh}$ LiPo in 2 hours or 6 hours? Mobile synth geeks need to know!

**Morgan:** And from the hacker/maker side, here is what’s missing:
1. **A Concrete Bill of Materials (BOM) Table:** Sourcing links, screw lengths (e.g. M2.5 $\times 12\,\text{mm}$ pan-heads, M2.5 $\times 5\,\text{mm}$ brass standoffs, M3 $\times 30\,\text{mm}$ clamp bolts), foam thickness ($1.5\,\text{mm}$ EVA), and plywood specs.
2. **Pre-Stratified Production SVGs:** Standard OpenSCAD SVG export hardcodes `stroke-width="0.5"` and `fill="lightgray"`. In LightBurn, that tries to raster-engrave the whole sheet! We need a clean 3-color SVG (`cut_red`, `score_blue`, `engrave_black`) ready to drag and drop onto a laser cutter.
3. **The Step-by-Step Assembly Sequence:** Step 1: Sand the captive slider. Step 2: Install standoffs. Step 3: Seat silicone pads. Step 4: Interlock bottom rail. Step 5: Glue cheeks.

**Julian:** It sounds like we agree completely, Morgan. The engineering is already 95% of the way to legendary. With a bit of UX polish, this repository can be the gold standard for synthesizer hardware upcycling on GitHub.

**Morgan:** Let's write up the formal review matrix.

---

## 📊 Part 2: Dual-Perspective Evaluation Matrix

| Category | 🎹 Synth Geek Perspective (Julian) | 🛠️ Hardware Hacker Perspective (Morgan) | Verdict & Rating |
| :--- | :--- | :--- | :---: |
| **Concept & Heritage** | Transmutes cheap $35 toy into a boutique desktop centerpiece. Celebrates 6-op FM engine with classic DX7 aesthetic. | Replaces flimsy injection-molded plastic with rigid, repairable, fully parametric wooden cabinetry. | **10 / 10**<br>*(Flawless vision)* |
| **Ergonomics & Feel** | 12° desktop slant cures neck strain; under-PCB rail eliminates keyboard flex; captive slider restores tactile power switch. | Slant introduces $12^\circ$ line-contact tenons requiring PVA gap fill. Silicone keys sit slightly sunken in $3\,\text{mm}$ wood. | **8.5 / 10**<br>*(Great feel; tune $Z$ height)* |
| **Acoustic Design** | Massive upgrade from $0.5\,\text{W}$ intercom squeak. Cheek megaphone effect couples bass to desktop. | Vance audit exposes $311\,\text{mm}^2$ leaks. Aperiodic variovent ($Q_{tc} \approx 0.68$) is brilliant; Helmholtz duct is finicky to seal. | **9.5 / 10**<br>*(Top-tier acoustic science)* |
| **OpenSCAD Code** | Customizer dropdowns are logical. View mode categories make selecting parts easy. | Masterful use of `__customizer_limit__()` and `overlaps_port_zone()`. Need to warn against double-kerf CAM slicing. | **9.0 / 10**<br>*(Clean, modular code)* |
| **Fabrication Readiness** | Vector engraving SVG reproduces DX7 typography and dial ticks with gorgeous precision. | OpenSCAD SVG exports `0.5mm` stroke with `lightgray` fill (causes LightBurn engrave trap). Lacks unified 3-color CAM SVG. | **7.5 / 10**<br>*(Needs production SVG)* |
| **Documentation & Safety**| Inspiring narrative journalism in `docs/`. FPC latch warning is life-saving. Missing audio samples. | Outstanding math in deep analysis. Missing explicit BOM table, teardown solvent guide (IPA for glued screen), and assembly sequence. | **8.5 / 10**<br>*(Rich, but needs maker BOM)* |

---

## 🛠️ Part 3: Actionable Recommendations Checklist

### 1. High-Priority Documentation Updates (No Code Changes Needed)
- [ ] **Add a Universal Bill of Materials (BOM) Table to `README.md`:**
  * Fasteners: 6× M2.5 $\times 12\,\text{mm}$ pan-head screws, 6× M2.5 $\times 5\,\text{mm}$ female standoffs, 3× M3 $\times 30\,\text{mm}$ screws (for Helmholtz duct), 3× M2.5 $\times 8\,\text{mm}$ wood screws (for spider clamp).
  * Materials: 1 sheet $3.0\,\text{mm}$ Baltic Birch ($300 \times 220\,\text{mm}$), 2 pieces $6.5\,\text{mm}$ hardwood ($180 \times 120\,\text{mm}$), 1 sheet $1.0\,\text{mm}$ craft veneer ($60 \times 60\,\text{mm}$), 1 piece $0.8\,\text{mm}$ clear acrylic ($45 \times 45\,\text{mm}$).
  * Acoustics: AliExpress 40mm $4\Omega\,5\text{W}$ speaker, $1.5\,\text{mm}$ EVA gasket foam, 2–3g polyfill damping.
- [ ] **Expand Teardown Safety Protocols in `README.md`:**
  * Add the **99% IPA adhesive release & gentle heat protocol** for safely freeing the glued 1.54" display without glass fracture.
  * Add the **SMD slide switch (`J5`) shearing precaution** (center switch before pulling board).
- [ ] **Add a "Kerf Warning" in Laser Cutting Instructions:**
  * Clarify that if LightBurn / Glowforge kerf offset is enabled, set `kerf = 0.0 mm` in OpenSCAD to prevent double-compensation jamming.
- [ ] **Add Faceplate Thickness / Silicone Key Protrusion Advice:**
  * Recommend $2.0\text{--}2.5\,\text{mm}$ sheet for the Top Faceplate, or reducing `pcb_frontplate_distance = 4.0 mm` so silicone keys stand proud of a $3\,\text{mm}$ wood panel.

### 2. High-Value Audio & Musical Enhancements
- [ ] **Record & Link 30-Second Audio Comparison:**
  * Track A: Stock plastic capsule vs. Track B: Upgraded 40mm wooden case playing classic DX7 patches (*SOLID BASS*, *E.PIANO 1*, *TUB BELLS*).
- [ ] **Add SysEx & Patch Loading Quickstart:**
  * Brief instructions for loading 32-voice Yamaha DX7 `.syx` patch banks via Dexed / MIDI-OX over USB-C.
- [ ] **Battery Runtime Benchmarks:**
  * Report real-world playing time on the internal $2000\,\text{mAh}$ LiPo when driving the 40mm speaker at moderate vs. maximum volume.

### 3. Digital Fabrication & CAM Enhancements
- [ ] **Export Production-Ready 3-Color Laser SVGs in `laserfiles/`:**
  * `RED` (`0.01mm` hairline, no fill): Vector Through-Cut.
  * `BLUE` (`0.05mm` stroke, no fill): Vector Scoring (Screen bezel accent groove).
  * `BLACK` (`fill`, no stroke): Raster Engrave (Knob text, dial ticks, FM-1 logos).

---

## 🏆 Final Synthesis: Why This Project Matters

In an era of disposable consumer electronics and cheap plastic enclosures, the **M-VAVE FM-1 Vintage Case** demonstrates the highest ideals of open-source hardware:
1. **Respecting the Silicon:** Recognizing that a $35 synth board contains genuine musical power, and elevating it rather than discarding it.
2. **Empirical Honesty:** Tearing down acoustic myths with real math, admitting when case leaks kill bass reflex, and designing a robust aperiodic variovent solution that actually works on a workbench.
3. **Craftsmanship:** Blending algorithmic OpenSCAD code with warm, tactile wooden materials and timeless vintage desktop ergonomics.

With the addition of a clean BOM, a safe teardown guide, and audio demos, this repository stands as an undisputed benchmark for musical instrument modification.

---

<div align="center">

[![Bruce Lee Showdown](artwork/c64_bruce_showdown_dark.gif)](https://dusseiller.ch/)

*Bruce Lee rules · Open source — hack, remix, share.*

</div>
