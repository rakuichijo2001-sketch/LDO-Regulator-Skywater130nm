## How it works

This project is an analog Low Drop Out (LDO) Regulator designed using the SkyWater 130nm PDK[cite: 2]. The architecture consists of four main functional blocks: a Current Generator, an Error Amplifier (OTA), a Push-Pull Composite Power Transistor (Pass Device), and a Feedback Network[cite: 2].

* **Current Generator**: Generates a supply-independent bias voltage of approximately 0.5V to bias the MOSFETs in the sub-threshold or saturation region[cite: 2]. It uses CTAT (Complementary to Absolute Temperature) currents and consumes about 1.18 uA[cite: 2].
* **Error Amplifier**: Utilizes a basic OTA with a 1.3 uA tail current, providing a DC gain of ~36.46 dB and a phase margin of ~60 degrees[cite: 2].
* **Performance**: The LDO is optimized for a nominal supply voltage of 1.5V (operating range 1.35V - 1.65V)[cite: 2]. It supports a maximum load current of 10 mA with a dropout voltage of under 200mV[cite: 2].

## How to test

To verify the LDO Regulator's operation, you can perform the following tests:

* **Basic Operation**: Apply a typical supply voltage (V_in) of 1.5V[cite: 2]. Measure the output voltage at the V_out pin and verify the quiescent current is around 17.32 uA to 19 uA[cite: 2].
* **Load Regulation**: Connect an external load capacitor ranging from 0 to 100 uF[cite: 2]. Sink a load current from 0 up to 10 mA and observe the output stability[cite: 2]. The expected load regulation is around 5.30 mV/mA[cite: 2].
* **Line Transient**: Switch the supply voltage from 0V to 1.5V with a 1us edge (1 MHz)[cite: 2]. Measure the settling time, which should be under 15 to 20 us depending on the load capacitance conditions[cite: 2].

## External hardware

* A stable DC power supply capable of providing 1.35V to 1.65V[cite: 2].
* External capacitors for load testing (up to 100 uF)[cite: 2].
* Variable resistors or a programmable DC electronic load to draw up to 10 mA of current[cite: 2].
* Oscilloscope and Multimeter for measuring transient responses, dropout voltage, and quiescent current.
