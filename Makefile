obj-m += cdc-acm.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

recover:
	sudo modprobe -r cdc_acm
	sudo modprobe cdc_acm

test:
	sudo modprobe -r cdc_acm
	sudo insmod $(PWD)/cdc-acm.ko
