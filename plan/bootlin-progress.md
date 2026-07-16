# Bootlin Embedded Linux — Progress Tracker

Started: ____-__-__

## Week 1 — Foundations: Toolchain, Boot, Kernel

- [X] Introduction to embedded Linux (slides)
- [X] Cross-compiling toolchain and C library (slides)
- [X] Cross-compiling toolchain with Crosstool-NG (lab)
- [X] Boot process, firmware, bootloaders (slides)
- [ ] Bootloader and U-Boot (lab)
- [ ] Linux kernel: versions, sources, fetching (slides)
- [ ] Configuring, compiling and booting the kernel (slides)
- [ ] Kernel cross-compiling and booting (lab)

Checkpoint: can you go from source to a booting kernel on QEMU via U-Boot?  
Notes:


## Week 2 — Root Filesystem + Hardware Access

- [ ] Root filesystem in Linux (slides)
- [ ] BusyBox (slides)
- [ ] Tiny rootfs from scratch with BusyBox (lab)
- [ ] Accessing hardware devices — GPIO, I2C, SPI, DT (slides)
- [ ] Hardware access — DT mods, modules, I2C joystick (lab)
- [ ] Block filesystems (slides)
- [ ] Block filesystems — SquashFS + ext4 + tmpfs (lab)
- [ ] Flash filesystems — MTD, UBIFS (slides, no lab)

Checkpoint: hand-built system with rootfs, BusyBox init, hardware access via sysfs and DT?  
Notes:


## Week 3 — Cross-Compilation + Build Systems

- [ ] Cross-compiling user-space libraries and applications (slides)
- [ ] Cross-compiling alsa-utils and dependencies (lab)
- [ ] Embedded system building tools — Buildroot, Yocto, binary distros (slides)
- [ ] Full system build with Buildroot — MPD + mpc (lab)
- [ ] Open source licenses and compliance (slides)

Checkpoint: can you articulate why build systems exist, having done it manually first?  
Notes:


## Week 4 — Integration + Application Development

- [ ] Overview of major embedded Linux software stacks (slides)
- [ ] systemd + udev integration (lab)
- [ ] Application development and debugging (slides)
- [ ] App dev and debugging — strace, ltrace, gdbserver, perf (lab)
- [ ] Useful resources + review (slides)

Checkpoint: full course complete. what's next — kernel driver dev or buildroot deep-dive?  
Notes:


## Resources

- Slides: https://bootlin.com/doc/training/embedded-linux/embedded-linux-slides.pdf
- QEMU labs: https://bootlin.com/doc/training/embedded-linux/embedded-linux-qemu-labs.pdf
- Lab data: https://bootlin.com/doc/training/embedded-linux/embedded-linux-qemu-labs.tar.xz
- Agenda: https://bootlin.com/doc/training/embedded-linux/embedded-linux-online-agenda.pdf
- Source: https://github.com/bootlin/training-materials

## Log

