# Hello World

This is a bootloader which can run in QEMU simulator and print "Hello World" to the screen.

## Usage

Assemble the bootloader into a binary file:
```
nasm -f bin bootloader.asm -o bootloader.bin
```

Create a disk image and write the bootloader to it:
```
dd if=/dev/zero of=disk_image.img bs=512 count=2880
dd if=bootloader.bin of=disk_image.img conv=notrunc
```

Run the image in QEMU without graphical display
```
qemu-system-x86_64 -fda disk_image.img -nographic
```