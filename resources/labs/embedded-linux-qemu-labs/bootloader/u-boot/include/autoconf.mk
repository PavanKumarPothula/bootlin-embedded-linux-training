CONFIG_SYS_TIMER_COUNTS_DOWN=y
CONFIG_SYS_FLASH_SIZE=0x04000000
CONFIG_PL011_CLOCK=24000000
CONFIG_SYS_TIMER_RATE=1000000
CONFIG_SYS_FLASH_BANKS_LIST="{ V2M_NOR0, V2M_NOR1 }"
CONFIG_SYS_SERIAL0="V2M_UART0"
CONFIG_SYS_SERIAL1="V2M_UART1"
CONFIG_EXTRA_ENV_SETTINGS="loadaddr=0x601000000kernel_addr_r=0x601000000fdt_addr_r=0x600000000bootargs=console=tty0 console=ttyAMA0,38400n80" BOOTENV "console=ttyAMA0,38400n80dram=1024M0root=/dev/sda1 rw0mtd=armflash:1M@0x800000(uboot),7M@0x1000000(kernel),24M@0x2000000(initrd)0flashargs=setenv bootargs root=${root} console=${console} mem=${dram} mtdparts=${mtd} mmci.fmax=190000 devtmpfs.mount=0  vmalloc=256M0bootflash=run flashargs; cp ${ramdisk_addr} ${ramdisk_addr_r} ${maxramdisk}; bootm ${kernel_addr} ${ramdisk_addr_r}0fdtfile=" CONFIG_DEFAULT_FDT_FILE "0"
CONFIG_BOARDDIR="board/armltd/vexpress"
CONFIG_SYS_INIT_RAM_SIZE=0x1000
CONFIG_SYS_BAUDRATE_TABLE="{ 9600, 19200, 38400, 57600, 115200 }"
CONFIG_SYS_SDRAM_BASE="PHYS_SDRAM_1"
CONFIG_SYS_TIMER_COUNTER="(V2M_TIMER01 + 0x4)"
CONFIG_PL01x_PORTS="{(void *)CONFIG_SYS_SERIAL0, (void *)CONFIG_SYS_SERIAL1}"
