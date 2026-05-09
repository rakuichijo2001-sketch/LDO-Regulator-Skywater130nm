# Low Dropout Regulator (LDO) - SkyWater 130 nm

## Layout Preview

The completed LDO layout uses the top cell name:

tt_um_ctw_ldo

To inspect the physical layout and view the design layers online, open the link below:

[View the LDO Layout in TinyTapeout GDS Viewer](https://gds-viewer.tinytapeout.com/?model=https://raw.githubusercontent.com/rakuichijo2001-sketch/LDO-Regulator-Skywater130nm/main/gds/tt_um_ctw_ldo.gds)

This online GDS viewer helps reviewers quickly inspect the generated GDS layout without downloading the repository locally.


## Overview

This repository presents an analog Low Dropout Regulator (LDO) designed using the SkyWater 130 nm Process Design Kit (PDK).

The objective of this project is to design, simulate, layout, and document a low-voltage analog regulator that generates a stable output voltage of approximately 1.3 V from a nominal input supply of 1.5 V.

This project is based on LDO Version 2. The schematic design, pre-layout simulation, layout implementation, and Magic .mag layout file have been completed.

This LDO is also the first foundation block for a future Smart Power Management Integrated Circuit (Smart PMIC). The long-term goal is to evolve from a single analog LDO into a complete mixed-signal power-management platform with LDO array, Buck converter, digital control, telemetry, protection, trimming, and full-chip integration.


## Project Status

Current status:

LDO Version 2 is completed at the schematic and layout level.

Completed items:

1. Schematic design completed.
2. Pre-layout simulation completed.
3. Layout implementation completed.
4. Magic .mag layout file completed.
5. Main performance summary documented.
6. README documentation updated.

Current milestone:

This LDO is considered the analog foundation block for the next Smart PMIC development stage.

Recommended final documentation items:

1. Add final Design Rule Check (DRC) result.
2. Add final Layout Versus Schematic (LVS) result.
3. Add final parasitic extraction (PEX) result.
4. Add post-layout simulation summary.
5. Add final Graphic Design System (GDS) file status.
6. Add pre-layout versus post-layout comparison.
7. Add final tape-out or submission notes.


## Main Design Target

| Parameter | Target / Result |
|---|---|
| Technology | SkyWater 130 nm |
| Circuit type | Analog Low Dropout Regulator |
| LDO version | Version 2 |
| Nominal input voltage | 1.5 V |
| Target output voltage | Approximately 1.3 V |
| Maximum load current | 10 mA |
| Dropout voltage | Approximately 187.8 mV to 212.2 mV |
| Load capacitor used in simulation | 0 pF to 100 pF |
| On-chip capacitance | Approximately 3.11 pF |
| Design status | Schematic and layout completed |
| Layout file | Magic .mag file completed |


## LDO Architecture

The LDO Version 2 architecture contains five main functional blocks:

1. Current Generator
2. Error Amplifier
3. Push-Pull Composite Power Transistor
4. Feedback Network
5. Load Circuit

Simplified architecture:

Input Supply
    |
    v
Current Generator ---> Error Amplifier ---> Push-Pull Composite Power Transistor ---> Output Voltage
                              ^                                      |
                              |                                      |
                              +----------- Feedback Network <---------+


## Block-Level Description

### 1. Current Generator

The Current Generator provides the internal bias current and bias voltage required by the analog core.

Its role is to bias the analog devices so that the regulator can operate correctly across process, voltage, temperature, and load variations.

Main purpose:

- Generate internal bias conditions.
- Provide biasing for the Error Amplifier.
- Support stable analog operation.
- Reduce dependency on external bias circuits.


### 2. Error Amplifier

The Error Amplifier compares the feedback voltage with the reference voltage.

It generates a control signal for the pass device. When the output voltage changes because of input variation or load variation, the Error Amplifier adjusts the pass device gate voltage to recover the regulated output voltage.

Main purpose:

- Compare reference voltage and feedback voltage.
- Control the pass device.
- Improve output voltage accuracy.
- Support line regulation and load regulation.
- Maintain negative feedback loop operation.


### 3. Push-Pull Composite Power Transistor

The Push-Pull Composite Power Transistor works as the main pass device of the regulator.

It supplies current from the input supply to the output load while maintaining the regulated output voltage.

Main purpose:

- Deliver load current.
- Maintain output regulation.
- Support up to 10 mA load current.
- Improve transient response.
- Reduce dropout limitation.


### 4. Feedback Network

The Feedback Network senses the output voltage and sends a scaled feedback voltage to the Error Amplifier.

This block closes the regulation loop of the LDO.

Main purpose:

- Sense output voltage.
- Generate feedback voltage.
- Define output voltage ratio.
- Close the control loop.
- Stabilize the output voltage through negative feedback.


### 5. Load Circuit

The Load Circuit represents the output load condition used during simulation.

It is used to verify:

- Load regulation.
- Load transient response.
- Startup behavior.
- Stability under different load currents.
- Output voltage recovery after load changes.


## Operating Principle

The LDO regulates the output voltage by continuously monitoring the output through the Feedback Network.

If the output voltage drops because the load current increases, the feedback voltage also changes. The Error Amplifier detects this difference and drives the Push-Pull Composite Power Transistor to provide more current to the load.

If the output voltage rises, the Error Amplifier reduces the drive strength of the pass device. This reduces the output current and brings the output voltage back to the target value.

This negative feedback mechanism allows the LDO to maintain an output voltage close to 1.3 V.


## Pre-Layout Simulation Conditions

The main reported results are based on pre-layout simulation under the following nominal condition:

| Condition | Value |
|---|---|
| Process corner | TT |
| Input supply voltage | 1.5 V |
| Temperature | 27 degC |
| Load current range | 0 A to 10 mA |
| Load capacitor range | 0 pF to 100 pF |
| Target output voltage | Approximately 1.3 V |

Important note:

The simulated load capacitor range is 0 pF to 100 pF, not 0 uF to 100 uF.


## Pre-Layout Simulation Results

### DC Performance

| Parameter | Result |
|---|---|
| Output voltage | Approximately 1.3 V |
| Quiescent current | Approximately 19 uA to 73.66 uA |
| Dropout voltage | Approximately 187.8 mV to 212.2 mV |
| Maximum load current | 10 mA |
| Load regulation | Approximately 2.45 mV/mA |
| On-chip capacitance | Approximately 3.11 pF |

The quiescent current changes with load current. At light load, the current is lower. At heavier load, the current increases because the regulator must provide more output current.


### Line Regulation

Input voltage sweep condition:

Vin = 1.6 V to 2.0 V

Line regulation result:

| Load condition | Line regulation |
|---|---|
| Nearly no load | 5.6127 mV/V |
| Light load, around 10 uA | 3.2926 mV/V |
| Maximum load, around 10 mA | 1.0640 mV/V |

Line regulation shows how much the output voltage changes when the input voltage changes.

A lower value means better rejection of input supply variation.


### Load Regulation

Load current sweep condition:

Iload = 0 A to 10 mA

Result:

Load Regulation = approximately 2.45 mV/mA

Load regulation shows how much the output voltage changes when the load current changes.

A lower load regulation value means the output voltage is more stable under changing load current.


### Temperature Coefficient

Temperature coefficient of output voltage:

| Load condition | Temperature coefficient |
|---|---|
| 1 uA load | Approximately 97.16 ppm/degC |
| 10 mA load | Approximately 22.47 ppm/degC |

The temperature coefficient shows how sensitive the output voltage is to temperature variation.

A lower value means better temperature stability.


### Startup Performance

Startup condition:

Input supply switching edge = 1 us

Result:

| Parameter | Result |
|---|---|
| Settling time | Approximately 30 us to 35 us |
| Startup overshoot | Approximately 64.5 mV to 77.5 mV |

Startup simulation verifies whether the LDO can start correctly and settle to the target output voltage.


### Load Transient Performance

Load transient condition:

Load transient up to maximum load condition

Undershoot result:

| Condition | Undershoot | Settling time |
|---|---:|---:|
| Max-cap condition | Approximately 306.4 mV | Approximately 20 us |
| Min-cap condition | Approximately 426.9 mV | Approximately 30 us |

Overshoot result:

| Condition | Overshoot | Settling time |
|---|---:|---:|
| Max-cap condition | Approximately 172.6 mV | Approximately 10 us |
| Min-cap condition | Approximately 182.6 mV | Approximately 5 us |

Load transient simulation verifies how the output voltage responds when the load current changes quickly.


### Power Supply Rejection Ratio (PSRR)

Power Supply Rejection Ratio (PSRR) result under max-cap and minimum-load condition:

| Frequency | PSRR |
|---|---:|
| 1 Hz | Approximately -31.22 dB |
| 1 kHz | Approximately -31.06 dB |
| 10 kHz | Approximately -24.39 dB |
| 100 kHz | Approximately -6.47 dB |

Power Supply Rejection Ratio shows how well the LDO rejects ripple or noise from the input supply.

A more negative value means better supply noise rejection.


### Open-Loop Response

Open-loop response under max-cap and minimum-load condition:

| Parameter | Result |
|---|---:|
| DC loop gain | Approximately 25.18 dB |
| Bandwidth | Approximately 8.67 kHz |
| Unity-Gain Frequency (UGF) | Approximately 142 kHz |
| Phase Margin (PM) | Approximately 53.16 degrees |

The open-loop response is used to evaluate loop stability.

The Phase Margin value indicates that the regulator has a usable stability margin under the reported condition.


## Layout Status

The layout implementation for LDO Version 2 has been completed.

The Magic .mag layout file has also been completed.

The layout stage includes:

1. Device placement.
2. Analog routing.
3. Power routing.
4. Ground routing.
5. Input/output pin placement.
6. Local interconnect routing.
7. Layout cleanup.
8. Final Magic layout file generation.

Important layout considerations:

1. Keep sensitive analog nodes short.
2. Use strong ground routing for reference and bias circuits.
3. Keep the feedback path clean and away from noisy nodes.
4. Minimize parasitic resistance in the pass-device current path.
5. Use proper device matching for current mirrors and analog bias devices.
6. Avoid unnecessary coupling between output node and high-impedance internal nodes.
7. Ensure that input, output, ground, and reference pins are clearly defined.
8. Keep high-current output routing wider than sensitive signal routing.
9. Keep the pass-device current path compact.
10. Use guard rings where needed for substrate noise isolation.


## Verification Plan

The LDO should be verified using both schematic-level and layout-level checks.


### Schematic-Level Verification

Recommended simulations:

1. DC operating point analysis.
2. Line regulation simulation.
3. Load regulation simulation.
4. Temperature sweep.
5. Startup transient simulation.
6. Line transient simulation.
7. Load transient simulation.
8. Power Supply Rejection Ratio simulation.
9. Open-loop stability simulation.


### Layout-Level Verification

Recommended physical verification:

1. Design Rule Check (DRC).
2. Layout Versus Schematic (LVS).
3. Parasitic extraction (PEX).
4. Post-layout simulation.
5. Final Graphic Design System (GDS) export.


### Pre-Layout versus Post-Layout Comparison

After parasitic extraction, the following parameters should be compared:

| Parameter | Why it matters |
|---|---|
| Output voltage | Checks DC accuracy after parasitics |
| Dropout voltage | Checks pass-device and routing impact |
| Quiescent current | Checks bias current shift |
| Load regulation | Checks output resistance and loop behavior |
| Line regulation | Checks supply sensitivity |
| Startup response | Checks transient and capacitance impact |
| Load transient response | Checks recovery after fast load changes |
| Power Supply Rejection Ratio | Checks supply noise rejection after parasitics |
| Loop gain | Checks stability degradation |
| Phase Margin | Checks risk of oscillation |


## How to Test the LDO

### Basic Operation Test

Apply a nominal input voltage:

Vin = 1.5 V

Expected result:

Vout is approximately 1.3 V

Check:

1. Output voltage.
2. Quiescent current.
3. Bias current.
4. Operating point of the main devices.
5. Correct regulation behavior.


### Load Regulation Test

Sweep the load current:

Iload = 0 A to 10 mA

Expected result:

Load regulation is approximately 2.45 mV/mA

This test verifies whether the output voltage remains stable when the load current changes.


### Line Regulation Test

Sweep the input voltage:

Vin = 1.6 V to 2.0 V

Calculate:

Line Regulation = Delta Vout / Delta Vin

Expected result at maximum load:

Line Regulation is approximately 1.0640 mV/V

This test verifies whether the output voltage remains stable when the input supply changes.


### Startup Test

Apply the input supply with a switching edge:

Input edge = 1 us

Expected result:

Settling time is approximately 30 us to 35 us
Startup overshoot is approximately 64.5 mV to 77.5 mV

This test verifies whether the LDO can start correctly without excessive overshoot.


### Load Transient Test

Apply a fast load current change up to maximum load.

Check:

1. Output undershoot.
2. Output overshoot.
3. Settling time.
4. Final regulated voltage.
5. Any ringing or oscillation.

Expected result:

The output may show transient undershoot or overshoot, but it should recover and settle back to the regulated output voltage.


### Power Supply Rejection Ratio Test

Run AC analysis with supply ripple injection.

Expected result:

PSRR at 1 Hz    = approximately -31.22 dB
PSRR at 1 kHz   = approximately -31.06 dB
PSRR at 10 kHz  = approximately -24.39 dB
PSRR at 100 kHz = approximately -6.47 dB

This test verifies how well the LDO rejects input supply noise.


### Open-Loop Stability Test

Break the feedback loop using a proper small-signal loop-gain testbench.

Run AC analysis and extract:

1. DC loop gain.
2. Bandwidth.
3. Unity-Gain Frequency.
4. Phase Margin.
5. Gain Margin.

Expected result:

DC loop gain is approximately 25.18 dB
Bandwidth is approximately 8.67 kHz
Unity-Gain Frequency is approximately 142 kHz
Phase Margin is approximately 53.16 degrees


## Recommended Magic Verification Commands

The exact command names may depend on the local SkyWater 130 nm setup, but a typical Magic verification flow is:

magic -T sky130A.tech

Inside Magic:

load <top_cell_name>
drc check
drc count

For extraction:

extract all
ext2spice lvs
ext2spice

For Graphic Design System export:

gds write <top_cell_name>.gds

Replace <top_cell_name> with the actual top cell name of the LDO layout.


## Recommended Repository Structure

A recommended structure for this repository is:

LDO-Regulator-Skywater130nm/
|
|-- README.md
|-- docs/
|   |-- info.md
|   |-- reports/
|   |-- figures/
|
|-- schematic/
|   |-- ldo_schematic_files
|
|-- simulation/
|   |-- pre_layout/
|   |-- post_layout/
|   |-- testbenches/
|
|-- layout/
|   |-- magic/
|   |-- gds/
|   |-- lef/
|
|-- results/
|   |-- pre_layout_results
|   |-- post_layout_results
|
|-- scripts/
|   |-- run_simulation
|   |-- run_drc
|   |-- run_lvs

This structure is only a recommended organization. The actual repository may use a different folder structure.


## External Hardware for Silicon Measurement

For real silicon or board-level validation, the following equipment is recommended:

1. Stable DC power supply.
2. Programmable DC electronic load or variable load circuit up to 10 mA.
3. Small load capacitors in the pF range.
4. Oscilloscope.
5. Digital multimeter.
6. Source-measure unit, if available.
7. Low-noise probe setup for output ripple and transient measurement.
8. Proper ground connection to reduce measurement error.


## Measurement Notes

During silicon measurement, the following points should be checked carefully:

1. Do not use a large output capacitor unless the test is specifically designed for it.
2. The simulated load capacitor range is 0 pF to 100 pF.
3. Use short wires for low-noise analog measurement.
4. Measure quiescent current with a precise current meter or source-measure unit.
5. Measure dropout voltage by sweeping the input voltage and observing when the output leaves regulation.
6. For transient measurement, use a fast electronic load if available.
7. For Power Supply Rejection Ratio measurement, inject a small AC ripple on the input supply and measure the output ripple.


## What next?

This LDO Version 2 is not only a standalone voltage regulator.

It is the first analog foundation block for the future Smart PMIC platform.

The completed LDO proves the basic analog design capability required for a mixed-signal power management chip:

1. Low-voltage analog regulation.
2. Error amplifier design.
3. Bias and current generation.
4. Feedback loop control.
5. Pass-device implementation.
6. Stability verification.
7. Pre-layout simulation.
8. Layout implementation.
9. Magic-based layout generation in SkyWater 130 nm.

The next technical direction is to evolve from a single analog LDO into a complete Smart PMIC.

The future Smart PMIC is expected to integrate:

1. Multi-output LDO array.
2. Buck converter using Peak Current-Mode Control (PCMC).
3. Digital Finite State Machine (FSM) and register map.
4. Dynamic Voltage Scaling (DVS).
5. Power sequencing logic.
6. Telemetry and monitoring system.
7. Fast analog protection path.
8. OTP/NVM trimming support.
9. Mixed-signal integration.
10. Full-chip physical implementation.

The key idea is:

Single LDO
    |
    v
Analog Foundation
    |
    v
Multi-Rail Power Architecture
    |
    v
Mixed-Signal Smart PMIC
    |
    v
Full-Chip Tape-Out


### Smart PMIC Development Roadmap

The planned roadmap is divided into six main phases.


### Phase 1: Analog Foundation

Timeframe:

Q3-Q4 2026

Main goals:

1. Complete and validate the LDO foundation.
2. Improve analog design capability in SkyWater 130 nm.
3. Develop supporting analog blocks such as Bandgap Reference (BGR), bias network, and fast comparators.
4. Prepare the analog base for future LDO array and Smart PMIC integration.
5. Review LDO Version 2 silicon and layout experience.
6. Build reusable analog design methodology for future power-management blocks.

Expected outcome:

A proven analog foundation that can be reused in the Smart PMIC platform.

This phase uses the LDO as the first real analog building block. The LDO proves that the design team can complete a full analog path from schematic to simulation and layout.


### Phase 2: LDO Silicon Bring-Up and Digital Start

Timeframe:

Q1 2027

Main goals:

1. Validate the LDO silicon result.
2. Measure real silicon performance.
3. Compare silicon data with pre-layout and post-layout simulation.
4. Generate a silicon correlation report.
5. Start the basic digital control architecture.
6. Define the first version of the register map.
7. Define the I2C control interface.
8. Start basic Digital Finite State Machine planning.

Expected outcome:

The LDO becomes a silicon-proven analog IP block, and the digital control path begins.

This phase is important because the Smart PMIC must not be only an analog chip. It must become a mixed-signal system where analog power blocks are controlled by digital logic.


### Phase 3: Buck PCMC Core Development

Timeframe:

Q2 2027

Main goals:

1. Design the Buck converter core.
2. Use Peak Current-Mode Control (PCMC) as the main Buck control architecture.
3. Use Sense FET / current mirror sensing for cycle-by-cycle current monitoring.
4. Add slope compensation to avoid sub-harmonic oscillation when duty cycle is greater than 0.5.
5. Define the protection loop for over-current and fast shutdown.
6. Design the PWM comparator.
7. Design the current sense ramp.
8. Design the gate driver concept.
9. Verify the Buck loop stability.
10. Target a phase margin greater than approximately 55 degrees.

Expected outcome:

A stable Buck PCMC core that can work together with the LDO block inside the Smart PMIC.

The Buck converter is the high-current and switching-power block of the Smart PMIC. Compared with the LDO, it introduces switching noise, inductor current, gate driver control, slope compensation, over-current protection, and power-stage layout challenges.


### Phase 4: Mixed-Signal Integration

Timeframe:

Q3 2027

Main goals:

1. Integrate analog power blocks with the digital control system.
2. Connect the LDO, Buck, telemetry, protection, and FSM together.
3. Implement power sequencing states.
4. Add Dynamic Voltage Scaling with controlled slew-rate steps.
5. Separate slow telemetry monitoring from fast analog protection.
6. Verify analog and digital interaction using mixed-signal simulation.
7. Define fault handling policy.
8. Define register control policy.
9. Define power-good and fault-status signals.
10. Prepare the design for architecture freeze.

Expected outcome:

A complete Smart PMIC architecture ready for architecture freeze.

The Smart PMIC should behave as one coordinated system, not as isolated LDO and Buck blocks.

The Digital Finite State Machine should control startup, sequencing, voltage scaling, and fault response.

The analog blocks should provide regulation, sensing, protection, and power delivery.


### Architecture Freeze

Target milestone:

09/2027

At this milestone, the following items should be locked:

1. Number of power rails.
2. LDO array architecture.
3. Buck PCMC architecture.
4. Sense FET current-sensing method.
5. Register map.
6. Digital FSM states.
7. Dynamic Voltage Scaling policy.
8. Fault handling policy.
9. OTP/NVM trim bus.
10. ADC resolution.
11. Telemetry path.
12. Fast protection path.
13. Floorplan strategy.
14. Power grid strategy.
15. Pad ring strategy.
16. ESD strategy.

After this point, major architecture changes should be avoided because they can affect full-chip integration, layout, verification, and tape-out schedule.

Architecture Freeze is the most important management milestone before full-chip implementation.


### Phase 5: System Floorplan and Physical Planning

Timeframe:

Q4 2027

Main goals:

1. Build the full-chip floorplan.
2. Separate noisy and quiet circuit regions.
3. Place the Buck power stage in a noisy island.
4. Place LDO, Bandgap Reference, bias, and ADC in a quiet analog island.
5. Place FSM and registers in the digital island.
6. Add guard rings and substrate isolation.
7. Define pad ring, power grid, ESD strategy, and routing plan.
8. Plan high-current paths for Buck and power devices.
9. Shield sensitive reference and feedback signals.
10. Prepare the chip for final signoff.

Expected outcome:

A full-chip physical plan that is ready for signoff implementation.

The floorplan must separate three major regions:

1. Quiet analog island:
   - Bandgap Reference
   - Bias circuits
   - LDO array
   - ADC
   - Sensitive analog feedback nodes

2. Noisy Buck island:
   - Power FETs
   - Gate driver
   - Switching node
   - Buck current path

3. Digital island:
   - Digital FSM
   - Register map
   - I2C interface
   - Control logic

This separation is necessary to reduce substrate noise, switching coupling, and false triggering in sensitive analog blocks.


### Phase 6: Full-Chip Signoff and Tape-Out

Timeframe:

Q1-Q2 2028

Main goals:

1. Complete full-chip layout.
2. Run Design Rule Check (DRC).
3. Run Layout Versus Schematic (LVS).
4. Run parasitic extraction (PEX).
5. Run post-layout simulation.
6. Check Electromigration / IR Drop (EM/IR).
7. Verify critical analog and power paths.
8. Review antenna rules and critical routing.
9. Review ESD structure.
10. Review final GDS file.
11. Prepare full-chip tape-out.

Expected outcome:

A complete Smart PMIC prototype ready for tape-out.

The final objective is to tape out a complete Smart PMIC that combines analog regulation, switching power conversion, digital control, telemetry, protection, and trimming.


## Smart PMIC Architecture Vision

The target Smart PMIC is not simply a combination of LDO and Buck blocks.

It is a coordinated mixed-signal power-management system.

The system contains five major pillars:

1. Analog power cores.
2. Digital FSM and register map.
3. Dynamic Voltage Scaling.
4. Telemetry and monitoring.
5. Fast analog protection.


### 1. Analog Power Cores

The analog power cores generate and regulate voltage rails.

They include:

1. LDO array.
2. Buck converter.
3. Bandgap Reference.
4. Bias network.
5. Error amplifiers.
6. Comparators.
7. Current sensing circuits.

The LDO Version 2 in this repository is the first proven block in this category.


### 2. Digital FSM and Register Map

The Digital Finite State Machine controls the power-management behavior.

It handles:

1. Startup sequence.
2. Bias enable.
3. Soft-start.
4. Power-good checking.
5. Dynamic Voltage Scaling.
6. Fault response.
7. Shutdown sequence.
8. Register-controlled configuration.

The register map allows a host System-on-Chip to control the Smart PMIC through a digital interface such as I2C.


### 3. Dynamic Voltage Scaling

Dynamic Voltage Scaling allows the output voltage to change during operation.

However, the voltage must not jump suddenly.

A sudden voltage jump can create:

1. Inrush current.
2. Output overshoot.
3. False over-voltage protection trigger.
4. False under-voltage protection trigger.
5. Error amplifier saturation.

Therefore, the Smart PMIC should use controlled slew-rate steps.

The correct behavior is:

Request new voltage
    |
    v
Change DAC / trim code step by step
    |
    v
Wait for settling
    |
    v
Check power-good window
    |
    v
Continue until target voltage is reached


### 4. Telemetry and Monitoring

Telemetry is the slow monitoring path.

It measures system health information such as:

1. Output voltage.
2. Load current.
3. Die temperature.
4. Power-good status.
5. Fault status.

The telemetry path may use:

1. Analog multiplexer.
2. SAR ADC.
3. Register map.
4. I2C readout.

Telemetry is used for reporting and monitoring. It should not be the main emergency protection path.


### 5. Fast Analog Protection

Fast Analog Protection is the emergency hardware path.

It reacts directly to dangerous conditions such as:

1. Over-current.
2. Over-voltage.
3. Under-voltage.
4. Short-circuit.
5. Thermal fault.

The protection path should use:

1. High-speed comparator.
2. Fault latch.
3. Gate shutdown path.
4. Direct hardware cutoff.

The key rule is:

Telemetry reports.
Fast analog protection shuts down.

The ADC path is too slow for emergency protection. The emergency path must be handled by direct analog comparator and hardware latch.


## Buck Converter Direction

The future Smart PMIC Buck converter should use Peak Current-Mode Control (PCMC).

Peak Current-Mode Control is selected because:

1. It provides cycle-by-cycle current control.
2. It naturally supports over-current protection.
3. It simplifies compensation compared with voltage-mode control.
4. It provides fast response to load changes.
5. It works well with digital supervision.
6. It can be combined with Sense FET current sensing.

The basic Buck PCMC loop includes:

1. Error amplifier.
2. PWM comparator.
3. Ramp or slope compensation.
4. Current sense signal.
5. Gate driver.
6. Power FETs.
7. Output LC filter.
8. Fault latch.

Important note:

For duty cycle greater than 0.5, slope compensation is required to prevent sub-harmonic oscillation.


## Current Sensing Direction

The preferred current sensing method for the Smart PMIC is Sense FET / current mirror sensing.

Reason:

1. It can be integrated on-chip.
2. It avoids large external sense resistors.
3. It reduces PCB power loss.
4. It provides fast current information.
5. It can support PCMC ramp generation.
6. It can support over-current protection.
7. It can support telemetry ADC measurement.

Comparison:

| Current sensing method | Evaluation |
|---|---|
| DCR sensing | Useful for external inductors but depends on temperature and external component variation |
| RDS(on) sensing | Area efficient but strongly affected by switching noise and process variation |
| Sense FET / Current Mirror | Preferred for on-chip integration, PCMC control, telemetry, and fast protection |


## Mixed-Signal Floorplan Direction

The future Smart PMIC should use strong floorplan isolation.

Recommended regions:

1. Quiet Analog Island
2. Noisy Buck Island
3. Digital Island


### Quiet Analog Island

This region should contain:

1. Bandgap Reference.
2. Bias circuits.
3. LDO array.
4. ADC.
5. Sensitive analog feedback circuits.

Layout rules:

1. Use guard rings.
2. Keep reference lines short.
3. Shield sensitive nodes.
4. Avoid routing near switching nodes.
5. Use quiet analog ground.


### Noisy Buck Island

This region should contain:

1. Power FETs.
2. Gate drivers.
3. Switching node.
4. High-current Buck paths.

Layout rules:

1. Keep switching loops compact.
2. Use wide metal for high-current paths.
3. Keep switching node away from analog references.
4. Use substrate isolation.
5. Avoid coupling into the ADC and Bandgap Reference.


### Digital Island

This region should contain:

1. Digital FSM.
2. Register map.
3. I2C interface.
4. Control logic.
5. Status logic.

Layout rules:

1. Keep digital switching away from quiet analog nodes.
2. Use proper power separation.
3. Use clear control routing.
4. Avoid unnecessary digital activity near analog references.


## Technical Risk Management

Important risks for the Smart PMIC roadmap:

| Risk | Impact | Mitigation |
|---|---|---|
| Buck substrate noise | Can corrupt ADC, Bandgap Reference, or LDO feedback | Use guard rings, substrate isolation, and separated floorplan |
| Sense FET mismatch | Can create incorrect current limit | Use careful layout matching, trimming, and Monte Carlo simulation |
| False comparator trigger | Can shut down the system incorrectly | Add hysteresis, blanking time, and filtering |
| Sub-harmonic oscillation | Can make Buck converter unstable | Add slope compensation for duty cycle greater than 0.5 |
| ADC used as protection path | Protection may be too slow | Use fast analog comparator path for emergency shutdown |
| Poor power sequencing | Can create inrush current or back-power issue | Use FSM-controlled startup and power-good checking |
| Late architecture change | Can delay tape-out | Lock major architecture at Architecture Freeze 09/2027 |


## Final Design Checklist

| Item | Status |
|---|---|
| Schematic design | Completed |
| Pre-layout simulation | Completed |
| Layout implementation | Completed |
| Magic .mag file | Completed |
| Design Rule Check | To be documented with final report |
| Layout Versus Schematic | To be documented with final report |
| Parasitic extraction | To be documented with final report |
| Post-layout simulation | To be documented with final report |
| Graphic Design System export | To be documented with final file |
| Final documentation | In progress |


## Important Notes

The performance numbers listed in this README are based on LDO Version 2 simulation results.

The layout and Magic .mag file have been completed.

Post-layout parasitic extraction may change the final performance, especially:

1. Dropout voltage.
2. Load regulation.
3. Line regulation.
4. Startup response.
5. Load transient response.
6. Line transient response.
7. Power Supply Rejection Ratio.
8. Loop gain.
9. Phase Margin.
10. Settling time.

Therefore, post-layout simulation results should be used as the final signoff reference after parasitic extraction.

The simulated load capacitor range is 0 pF to 100 pF, not 0 uF to 100 uF.


## Summary

This project demonstrates the design and implementation of a low-voltage analog Low Dropout Regulator using the SkyWater 130 nm Process Design Kit.

The LDO targets a regulated output voltage of approximately 1.3 V from a nominal 1.5 V input supply and supports up to 10 mA load current.

The schematic design, pre-layout simulation, layout implementation, and Magic .mag layout file have been completed.

More importantly, this LDO Version 2 is the first analog foundation block for a future Smart PMIC platform.

The next development direction is to expand from this LDO into a complete mixed-signal Smart PMIC with:

1. Multi-output LDO array.
2. Buck converter using Peak Current-Mode Control.
3. Sense FET current sensing.
4. Digital FSM and register map.
5. Dynamic Voltage Scaling.
6. Power sequencing.
7. Telemetry and monitoring.
8. Fast analog protection.
9. OTP/NVM trimming.
10. Full-chip integration and tape-out.

The long-term roadmap targets Architecture Freeze in 09/2027 and Full-Chip Tape-Out in Q1-Q2 2028.
