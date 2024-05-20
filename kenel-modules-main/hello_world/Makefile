obj-m += hello-1.o

all:
	$(MAKE) -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	$(MAKE) -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

install: all
	install -m 644 hello-1.ko /lib/modules/$(shell uname -r)/kernel/drivers/misc/
	depmod -a

uninstall:
	rm -f /lib/modules/$(shell uname -r)/kernel/drivers/misc/hello-1.ko
	depmod -a

