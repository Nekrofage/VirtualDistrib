#/bin/sh

MACADDRESS=`printf 'DE:AD:BE:EF:%02X:%02X' $((RANDOM%256)) $((RANDOM%256))`

qemu-system-i386 -enable-kvm -k fr -m 1024 -display sdl -sdl -vga std -hda ../station/01/vhda.qcow2 \
-net nic,macaddr=$MACADDRESS -net tap,ifname=tap0,script=no \
-no-quit -smp 2 -usbdevice tablet
