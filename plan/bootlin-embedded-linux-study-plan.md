# Bootlin Embedded Linux — Self-Study Plan

A structured 4-week plan mirroring Bootlin's official 7-half-day (28-hour) online course, adapted for self-paced learning using their freely available CC BY-SA materials.

---

## Materials to Download (all free)

| File | URL |
|------|-----|
| Slides (500+ pages) | `bootlin.com/doc/training/embedded-linux/embedded-linux-slides.pdf` |
| QEMU Lab Instructions | `bootlin.com/doc/training/embedded-linux/embedded-linux-qemu-labs.pdf` |
| QEMU Lab Data Files | `bootlin.com/doc/training/embedded-linux/embedded-linux-qemu-labs.tar.xz` |
| Official Agenda | `bootlin.com/doc/training/embedded-linux/embedded-linux-online-agenda.pdf` |
| Source (GitHub) | `github.com/bootlin/training-materials` |

**Setup:** Ubuntu 24.04 native install (or a VM, though native is recommended for lab reliability). QEMU labs need no hardware purchase.

---

## Week 1 — Foundations: Toolchain, Boot, Kernel

### Day 1–2: Introduction + Cross-Compiling Toolchain
**Slides:** "Introduction to embedded Linux" + "Cross-compiling toolchain and C library"
**Key topics:**
- Why Linux on embedded — advantages over RTOS
- Embedded Linux architecture overview (bootloader → kernel → rootfs → apps)
- What's inside a cross-compiling toolchain (binutils, gcc, C library, kernel headers)
- C library choices: glibc vs musl vs uClibc-ng
- Building a toolchain with Crosstool-NG

**QEMU Lab:** Cross-compiling toolchain
- Configure and build a toolchain with Crosstool-NG
- Explore the sysroot, examine the generated binaries

**Time estimate:** ~4 hours slides + ~2 hours lab

### Day 3–4: Boot Process + U-Boot
**Slides:** "Boot process, firmware, bootloaders"
**Key topics:**
- ROM code → SPL → U-Boot → Kernel boot chain
- ARM Trusted Firmware (TF-A)
- U-Boot configuration, compilation, environment
- U-Boot commands: `bootm`, `bootz`, `tftp`, `setenv`, `saveenv`
- U-Boot scripts and generic distro boot (`boot.scr`, `extlinux.conf`)
- UEFI boot on x86 (conceptual, less relevant for your ARM work)

**QEMU Lab:** Bootloader and U-Boot
- Configure, compile, install U-Boot
- Serial communication setup
- TFTP boot workflow
- U-Boot environment and scripting

**Time estimate:** ~3 hours slides + ~3 hours lab

### Day 5–6: Linux Kernel
**Slides:** "Linux kernel" + "Configuring, compiling and booting the Linux kernel"
**Key topics:**
- Kernel architecture: monolithic with loadable modules
- Kernel vs user-space boundary, syscall interface
- Upstream vs vendor kernels, LTS versions
- `make menuconfig` / `defconfig` / fragments
- Device Tree concept and basics
- Cross-compiling the kernel: `zImage`/`Image`, DTBs, modules
- Kernel command line (`console=`, `root=`, `rootfstype=`)

**QEMU Lab:** Kernel cross-compiling and booting
- Configure and cross-compile kernel for target
- Boot via U-Boot + TFTP
- Automate boot with U-Boot scripts

**Time estimate:** ~3 hours slides + ~3 hours lab

**Week 1 checkpoint:** You should be able to go from source to a booting kernel on QEMU, loaded via U-Boot, using your own cross-compiled toolchain.

---

## Week 2 — Root Filesystem + Hardware Access

### Day 7–8: Root Filesystem + BusyBox
**Slides:** "Root filesystem in Linux" + "BusyBox"
**Key topics:**
- FHS layout for embedded (`/bin`, `/dev`, `/etc`, `/lib`, `/proc`, `/sys`, `/tmp`)
- Device files and `devtmpfs`
- Virtual filesystems: `proc`, `sysfs`, `devtmpfs`
- NFS root for development
- BusyBox: multi-call binary, configuration, `init`

**QEMU Lab:** Tiny root filesystem from scratch with BusyBox
- NFS boot setup
- Create rootfs from scratch: directory skeleton + BusyBox
- BusyBox `init` and `/etc/inittab`
- Deploy shared libraries from toolchain sysroot
- BusyBox httpd — control target from host browser
- Compile and run a sample application

**Time estimate:** ~3 hours slides + ~4 hours lab (this one is meaty)

### Day 9–10: Hardware Access
**Slides:** "Accessing hardware devices"
**Key topics:**
- Bus access patterns: USB, SPI, I2C, PCI
- Kernel drivers vs user-space access (spidev, i2c-dev, UIO)
- Device Tree syntax deep dive: nodes, properties, `compatible`, `phandle`, `&references`
- Pin muxing in DT
- Kernel modules: `insmod`, `modprobe`, `depmod`
- `/dev` and `/sys` interfaces
- User-space APIs: GPIO (libgpiod/chardev), LEDs, audio (ALSA), graphics (DRM/KMS), video (V4L2)

**QEMU Lab:** Accessing hardware devices
- Explore `/dev` and `/sys`
- GPIO and LED control
- Device Tree modifications for pin muxing and I2C device declaration
- Load USB audio kernel module
- Out-of-tree kernel module for I2C joystick

**Time estimate:** ~4 hours slides + ~3 hours lab

*This is directly relevant to your Pi CI/CD work — the GPIO/I2C/SPI user-space access patterns and DT overlays map directly to what you're doing with peripheral testing.*

### Day 11: Block + Flash Filesystems
**Slides:** "Block filesystems" + "Flash filesystems"
**Key topics:**
- Block devices: partitioning (`fdisk`, `parted`), ext4, SquashFS, tmpfs, initramfs
- Journaling and wear considerations
- Read-only root with writable overlay pattern
- MTD subsystem, NAND/NOR differences
- JFFS2, UBIFS, UBI volumes
- Choosing the right filesystem for your storage type

**QEMU Lab:** Block filesystems
- Partition SD card / block device
- Build a mixed-filesystem system: SquashFS root + ext4 data + tmpfs scratch

**Time estimate:** ~3 hours slides + ~2 hours lab

**Week 2 checkpoint:** You should have a hand-built embedded Linux system running from scratch — toolchain, bootloader, kernel, rootfs with BusyBox, accessing hardware through sysfs and device drivers, booting from block storage.

---

## Week 3 — Cross-Compilation Workflow + Build Systems

### Day 12–13: Cross-Compiling User-Space Libraries and Applications
**Slides:** "Cross-compiling user-space libraries and applications"
**Key topics:**
- Build system landscape: raw Makefiles, autotools, CMake, meson
- `./configure --host=` pattern for autotools
- CMake toolchain files
- Meson cross files
- Common cross-compilation pitfalls: pkg-config paths, host vs target confusion, rpath issues
- Sysroot management

**QEMU Lab:** Cross-compiling applications and libraries
- Manually cross-compile several open-source libraries and their dependencies
- Handle real-world dependency chains
- Cross-compile alsa-utils, test audio playback with `speaker-test`

**Time estimate:** ~3 hours slides + ~4 hours lab

*You'll recognize many of these patterns from your Rust cross-compilation work, but the C/autotools side is its own beast and worth going through methodically.*

### Day 14–15: Build Systems (Buildroot + Yocto Overview)
**Slides:** "Embedded system building tools"
**Key topics:**
- Why manual cross-compilation doesn't scale
- Buildroot: `make menuconfig`, package infrastructure, `BR2_` variables, overlay mechanism, defconfigs
- Yocto/OpenEmbedded: layers, recipes, BitBake, `local.conf`, BSP layers — conceptual overview
- Binary distributions for embedded: Debian/Ubuntu with `debootstrap`, `multistrap`
- Specialized distros: Tizen, AGL, Android

**QEMU Lab:** System build with Buildroot
- Rebuild the entire system with Buildroot (replaces all manual work from weeks 1–2)
- Add MPD (music player daemon) + mpc client
- Remote music control from host
- Analyze package dependency graph

**Time estimate:** ~3 hours slides + ~3 hours lab

**Week 3 checkpoint:** You understand both the manual and automated approaches to building an embedded Linux system. You can articulate *why* build systems exist by having done it the hard way first.

---

## Week 4 — System Integration + Application Development

### Day 16–17: Licenses + Major Software Stacks
**Slides:** "Open source licenses and compliance" + "Overview of major embedded Linux software stacks"
**Key topics:**
- GPL v2 vs v3, LGPL, MIT, BSD, Apache 2.0
- Copyleft obligations: source distribution, license notices, tivoization (GPLv3)
- SBOM and compliance tooling
- systemd as init: units, targets, journald
- udev for dynamic device management
- D-Bus IPC
- Graphics stack: DRM/KMS → Wayland/X11 → Qt/GTK → OpenGL/Vulkan
- Multimedia: V4L2, GStreamer, PipeWire
- Audio: ALSA → PulseAudio/PipeWire

**QEMU Lab:** Integration of additional software stacks
- Replace BusyBox init with systemd
- Configure udev for automatic module loading

**Time estimate:** ~4 hours slides + ~2 hours lab

### Day 18–19: Application Development and Debugging
**Slides:** "Application development and debugging"
**Key topics:**
- Build systems for your app: CMake and meson
- Remote debugging: `gdbserver` on target, `gdb-multiarch` on host
- Post-mortem debugging with core dumps
- Tracing and profiling: `strace`, `ltrace`, `perf`, `valgrind`
- Memory debugging: AddressSanitizer, valgrind memcheck

**QEMU Lab:** Application development and debugging
- Write an application (I2C joystick controlling audio player)
- IDE setup for remote debugging
- Debug with `strace`, `ltrace`, `gdbserver`, `perf`

**Time estimate:** ~3 hours slides + ~3 hours lab

### Day 20: Review + Resources
**Slides:** "Useful resources"
- Review weak areas, redo labs that gave trouble
- Explore Bootlin's recommended books, conferences, online resources
- Plan next course: Linux Kernel Driver Development or Buildroot deep-dive

**Week 4 checkpoint:** You've completed the full Bootlin embedded Linux curriculum. You can build an embedded Linux system from source, integrate software stacks, and debug applications on target.

---

## Supplementary Video Resources (Free)

These aren't Bootlin course recordings, but they cover overlapping topics with good production quality:

| Topic | Video | Speaker |
|-------|-------|---------|
| Embedded Linux from scratch | "Embedded Linux from Scratch in 45 min, on RISC-V" (FOSDEM 2021) | Michael Opdenacker (Bootlin) |
| Boot time reduction | "Update on Boot Time Reduction Techniques" (ELC) | Michael Opdenacker (Bootlin) |
| Buildroot | "Buildroot: What's New?" (ELC) | Thomas Petazzoni (Bootlin) |
| Device Tree | "The Device Tree as a Stable ABI: A Fairy Tale?" (ELC) | Thomas Petazzoni (Bootlin) |
| Kernel DMA | "An Overview of the kernel DMAEngine subsystem" (ELC) | Maxime Ripard (Bootlin) |
| General podcast | "Bootlin Live" series on YouTube | Bootlin team |

All available on the Bootlin YouTube channel or linked from `bootlin.com/blog/tag/videos/`.

---

## Tips for Self-Study

1. **Do the labs.** The slides alone give you knowledge; the labs give you skill. The QEMU labs are specifically designed for this.
2. **Follow the order.** Each lab builds on the previous one — you're constructing a complete system incrementally.
3. **Keep a lab journal.** Note every command, every error, every fix. This becomes your personal reference.
4. **Use `git` for your lab work.** Commit after each successful lab step so you can roll back.
5. **Time-box generously.** Bootlin allocates 4 hours per half-day with an expert trainer. Solo, budget 5–6 hours per half-day equivalent to account for troubleshooting without a trainer.
6. **Ask questions.** Bootlin engineers are active on the Linux kernel mailing list, Buildroot mailing list, and occasionally on relevant IRC/Matrix channels. The training materials repo on GitHub also accepts issues.

---

*Based on the official Bootlin Embedded Linux System Development training agenda (7 half-days, 28 hours). All materials CC BY-SA 3.0, © Bootlin.*
