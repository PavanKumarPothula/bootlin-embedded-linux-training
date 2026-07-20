cmd_u-boot.lds := arm-linux-gcc -E -Wp,-MD,./.u-boot.lds.d -D__KERNEL__ -D__UBOOT__ -D__ARM__ -marm -mno-thumb-interwork  -mabi=aapcs-linux  -mword-relocations  -fno-pic  -mno-unaligned-access -ffunction-sections -fdata-sections -fno-common -ffixed-r9  -msoft-float -mgeneral-regs-only    -pipe  -march=armv7-a -D__LINUX_ARM_ARCH__=7 -mtune=generic-armv7-a -Iinclude   -I./arch/arm/include -include ./include/linux/kconfig.h -nostdinc -isystem /home/pav/x-tools/arm-training-linux-musleabihf/lib/gcc/arm-training-linux-musleabihf/15.2.0/include -ansi -include ./include/u-boot/u-boot.lds.h -DCPUDIR=arch/arm/cpu/armv7  -D__ASSEMBLY__ -x assembler-with-cpp -std=c99 -P -o u-boot.lds arch/arm/cpu/u-boot.lds

source_u-boot.lds := arch/arm/cpu/u-boot.lds

deps_u-boot.lds := \
    $(wildcard include/config/cmdline.h) \
    $(wildcard include/config/armv7/secure/base.h) \
    $(wildcard include/config/armv7/nonsec.h) \
    $(wildcard include/config/armv7/psci.h) \
    $(wildcard include/config/armv7/psci/nr/cpus.h) \
    $(wildcard include/config/armv7/secure/max/size.h) \
  include/linux/kconfig.h \
    $(wildcard include/config/booger.h) \
    $(wildcard include/config/foo.h) \
    $(wildcard include/config/spl/.h) \
    $(wildcard include/config/tpl/.h) \
    $(wildcard include/config/tools/.h) \
    $(wildcard include/config/tpl/build.h) \
    $(wildcard include/config/vpl/build.h) \
    $(wildcard include/config/spl/build.h) \
    $(wildcard include/config/tools/foo.h) \
    $(wildcard include/config/spl/foo.h) \
    $(wildcard include/config/tpl/foo.h) \
    $(wildcard include/config/vpl/foo.h) \
    $(wildcard include/config/option.h) \
    $(wildcard include/config/acme.h) \
    $(wildcard include/config/spl/acme.h) \
    $(wildcard include/config/tpl/acme.h) \
    $(wildcard include/config/if/enabled/int.h) \
    $(wildcard include/config/int/option.h) \
  include/u-boot/u-boot.lds.h \
  include/config.h \
    $(wildcard include/config/boarddir.h) \
  include/config_uncmd_spl.h \
    $(wildcard include/config/spl/dm.h) \
    $(wildcard include/config/dm/serial.h) \
    $(wildcard include/config/dm/i2c.h) \
    $(wildcard include/config/dm/stdio.h) \
  include/configs/vexpress_ca9x4.h \
  include/configs/vexpress_common.h \
    $(wildcard include/config/vexpress/extended/memory/map.h) \
    $(wildcard include/config/sys/timer/rate.h) \
    $(wildcard include/config/sys/timer/counter.h) \
    $(wildcard include/config/sys/timer/counts/down.h) \
    $(wildcard include/config/pl011/clock.h) \
    $(wildcard include/config/pl01x/ports.h) \
    $(wildcard include/config/sys/serial0.h) \
    $(wildcard include/config/sys/serial1.h) \
    $(wildcard include/config/sys/sdram/base.h) \
    $(wildcard include/config/sys/init/ram/size.h) \
    $(wildcard include/config/extra/env/settings.h) \
    $(wildcard include/config/default/fdt/file.h) \
    $(wildcard include/config/sys/flash/size.h) \
    $(wildcard include/config/sys/flash/banks/list.h) \
  include/config_distro_bootcmd.h \
    $(wildcard include/config/cmd/mmc.h) \
    $(wildcard include/config/sandbox.h) \
    $(wildcard include/config/cmd/ubifs.h) \
    $(wildcard include/config/efi/loader.h) \
    $(wildcard include/config/arm64.h) \
    $(wildcard include/config/arm.h) \
    $(wildcard include/config/x86/run/32bit.h) \
    $(wildcard include/config/x86/run/64bit.h) \
    $(wildcard include/config/arch/rv32i.h) \
    $(wildcard include/config/arch/rv64i.h) \
    $(wildcard include/config/cmd/bootefi/bootmgr.h) \
    $(wildcard include/config/sata.h) \
    $(wildcard include/config/nvme.h) \
    $(wildcard include/config/scsi.h) \
    $(wildcard include/config/ide.h) \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/cmd/usb.h) \
    $(wildcard include/config/cmd/virtio.h) \
    $(wildcard include/config/cmd/dhcp.h) \
    $(wildcard include/config/x86.h) \
    $(wildcard include/config/cmd/pxe.h) \
    $(wildcard include/config/cmd/extension.h) \
  arch/arm/include/asm/config.h \
    $(wildcard include/config/arch/ls1021a.h) \
    $(wildcard include/config/fsl/layerscape.h) \
  include/linux/kconfig.h \
  include/config_fallbacks.h \
    $(wildcard include/config/spl/pad/to.h) \
    $(wildcard include/config/spl/max/size.h) \
    $(wildcard include/config/sys/baudrate/table.h) \
  arch/arm/include/asm/psci.h \

u-boot.lds: $(deps_u-boot.lds)

$(deps_u-boot.lds):
