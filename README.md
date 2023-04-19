
---
# Portable NMR Spectroscopy with Direct Sampling
## BASc Thesis | 2023 Winter Semester

### Author : Kevin Kim - kevin.kimminjun@gmail.com
### Supervisor(s) : Professor Roman Genov, Sudip Nag

---

# 1. Description

This repo contains all project files related to my 4th year Thesis.

This thesis aimed to create a simplified Rx for an NMR Spectrometor. Most NMR spectrometors have complex analog Rx to reduce the sampling rate required for analysis. This is done for many reasons, one of them being that they were constrained by slow ADCs that could not aquire high frequency signals.

This project attempts to leverage modern high frequency ADCs to conduct analysis at the high frequencies. This would mean that the Rx could be simplified. Complex Rx has the disadvantage of introducing the noise and distortion into the system, and the goal of simplifying it would be that the digital domain would get the cleanest signal as possible.

The project is split into two components:
1. The analog front-end
   - Simple band-pass filter
     - Third order Deliyannis Filter
   - Goal is to attenuate signals outside of the interested bandwidth
2. The digital back-end
   - Mixer-Based Zoom FFT
     - Implementation is a modification of the strathsdr spectrual analyzer
     - Original: https://github.com/strath-sdr/rfsoc_sam
   - Modified for deep FFT windows
     - Up to 2^16 samples

While the digial back-end achieves the the required specifications, the analog front-end requires more work. There is significant noise introduced by the analog front-end which will impact the analysis.

# 2. Custom Tutorials

I've compiled a series of .md files with images explaining specifically how the PYNQ + RFSoC 2x2 Platform works. They are available under [tutorials](tutorials)

# 3. Key Links

## 2a. StrathSDR RFSoC Spectural Analyser.
- StrathSDR Analyzer Source Files:
https://github.com/strath-sdr/rfsoc_sam

## 2b. Open Source PYNQ
- PYNQ Image to flash onto SD Card: http://www.pynq.io/board.html
- PYNQ Source Files: https://github.com/Xilinx/RFSoC-PYNQ

## 2c. Tutorial Videos for the RFSoC 2x2 Platform
- General Tutorial Landing Page: http://www.rfsoc-pynq.io/tutorial.html
- StrathSDR Spectrum Analyser Overview: https://youtu.be/PqPdfnbNxyY

# 4. Repo Directory Description

```
├───tutorials: .md tutorial write ups
|
├───analog front-end: Project files related to the front-end
│   │
│   ├───altium: Altium Files for PCB Layout
│   │
│   └───pspice: Pspice Files for Simulations
│
├───digital back-end: Project files related to the back-end
│   │
│   ├───boards: Folder containing board-specific files i.e. for RFSoC2x2
│   │   │
│   │   ├───ip: Folder containing both the Simulink/Sysgen files for blocks, as well as the synthesized blocks.
│   │   │   │
│   │   │   ├───hdlcoder_custom: simulink files of custom spectrum analyser block.
│   │   │   │
│   │   │   └───iprepo: contains custom packaged IPs.
│   │   │
│   │   └───RFSoC2x2: KEY FOLDER
│   │       │
│   │       ├─── *.tcl: tcl files for recreating the block diagrams in vivado
│   │       │
│   │       ├───drivers: board specific drivers, contains main overlay and constants
│   │       │
│   │       ├───notebooks: contains the jupyter notebooks
│   │       │
│   │       └───bitstream: contains the implemented bitstream .bit and hardware description .hwh files.
│   │
│   ├───dist: packaged python library images
│   │
│   ├───rfsoc_sam_custom: contains python drivers for interfacing with the implemented hardware
│   │
│   └───scripts: contains custom scripts for automation
│       │
│       └───customise_packages.py: makes nessary modifications to files after generating new custom blocks.
│
└───reports: contains written pdfs.
```