obj-m +=  mimodulo.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
#	make -C /lib/modules/6.8.0-31-generic/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
#	make -C /lib/modules/6.8.0-31-generic/build M=$(PWD) clean

# Para checkinsttall
# install:
# 	install -m 644 mimodulo.ko /lib/modules/$(shell uname -r)/kernel/drivers/misc/
# 	depmod
