# Sistemas de Computacion
Trabajo Practico 2 - Sistemas de Computacion 

## Kernel

**Integrantes:**
- [Gil Cernich, Manuel](https://github.com/manugcr/)
- [Pallardo, Agustin](https://github.com/djpallax)
- [Saporito, Franco](https://github.com/fasaporito)

---

## Objetivo

En este trabajo practico se busca realizar una serie de preguntas relacionadas con el kernel de linux. Se busca entender el funcionamiento de los modulos del kernel, como se pueden compilar y cargar en el sistema operativo.

**¿Qué es exactamente un módulo del núcleo?**

Los módulos son fragmentos de código que se pueden cargar y descargar en el kernel según se requiera. Extienden la funcionalidad del kernel sin necesidad de reiniciar el sistema. Por ejemplo, un tipo de módulo es el controlador de dispositivo, que permite que el núcleo acceda al hardware conectado al sistema. Sin módulos, tendríamos que construir kernels monolíticos y agregar nuevas funciones directamente en la imagen del kernel. Además de tener kernels más grandes, esto tiene la desventaja de requerir que reconstruyamos y reiniciemos el kernel cada vez que queramos una nueva funcionalidad.

---

## Preparacion

Como base se necesita tener instalado linux, por otro lado vamos a utilizar un repositorio creado por la catedra de la materia el cual vamos a encontrar en el siguiente link [Repositorio](https://gitlab.com/sistemas-de-computacion-unc/kenel-modules) y vamos a clonar el repositorio en nuestra maquina local.

Tambien es importante considerar tener todas las dependencias necesarias:

```bash
sudo apt-get install build-essential checkinstall linux-source
```

En caso de que falle (por ejemplo, en ubuntu 24.04 tira error), probar lo siguiente:

```bash
sudo apt install build-essential 
sudo apt install checkinstall 
sudo apt install linux-source
```

Se descargo el codigo fuente del kernel de linux, en este caso, la versión 6.8.0, donde el archivo comprimido se llama "linux-source-6.8.0.tar.bz2", ahora debemos extraerla:

```bash
cd /usr/src
ls # Para visualizar qué versión se ha descargado
sudo tar -xvf linux-source-6.8.0.tar.bz2
```

Luego, desde la raiz del proyecto:

```bash
cd kenel-modules-main/part1/module/
```

En el código mimodulo.c, hay una advertencia que se puede solucionar fácilmente agregando las siguientes línes antes de las funciones:

int modulo_lin_init(void);

void modulo_lin_clean(void);

IMPORTANTE: Antes de ejecutar el make, verificar que la ruta no contenga carácteres especiales, como por ejemplo, espacio " "

```bash
make
sudo dmesg -C
sudo insmod mimodulo.ko
sudo dmesg
sudo rmmod mimodulo
sudo dmesg
```

Con esto, compilamos el módulo, limpiamos el historial en dmesg, instalamos el módulo, vemos los mensajes con dmesg y se comprueba la carga. Luego, removemos el módulo y verificamos. En caso de que hayan problemas en la carga, verificar que se compile para el kernel que se está utilizando, y si no se resuelve, eliminar los kernels y headers anteriores (que no sea el actual).

con "modinfo mimodulo.ko" podemos ver detalles sobre el módulo compilado.

![Carga y descarga del módulo](imgs/modCargaDescarga.png)

---

### Checkinstall

Chechinstall es una herramienta que permite la generación de paquetes de instalación de programas. Genera archivos como .deb o .rpm, facilitando su instalación. En este caso, se debe modificar el makefile con una opción nueva llamada install, luego se deberá ejecutar el make all, después se ejecuta sudo checkinstall, se configura el paquete y queda listo para instalar.

### Firma de módulos

Firmar módulos del kernel es una forma de mantener la seguridad del sistema. Esta práctica ayuda a asegurar que solo el software verificado se ejecuta en el kernel.

### Otras formas de asegurar el kernel

Se pueden realizar auditorías de código regularmente en el kernel y en los módulos cargados para identificar y corregir posibles vulnerabilidades de seguridad, aunque pueda resultar una tarea tediosa. Además, se puede habilitar la auditoría de la actividad del kernel, para registrar eventos del sistema que, por ejemplo, puedan ser intentos de acceso no autorizado, cambios en la configuración, entre otros.

Se pueden implementar sistemas de control de acceso obligatorio, como SELinux, para restringir los permisos de los programas y proteger contra ataques de escalada de privilegios.

---

### Cómo empiezan y terminan los módulos y programas

A diferencia de un programa convencional, en el que programa principal comienza en un main y termina devolviendo un número para notificar si finalizó correctamente o con errores, en un módulo se definen dos funciones, una para el inicio y la otra para el fin. Se puede ver en el código de ejemplo, que hay una línea que dice "module_init(modulo_lin_init);" que indica que el módulo comienza en la función modulo_lin_init (esto sería como un setup del módulo), y otra función, "module_exit(modulo_lin_clean);", que define que modulo_lin_clean se utilizará para cuando se quiera descargar o remover el módulo del kernel.

---

## Bibliografia

- [RedHat - Kernel](https://access.redhat.com/documentation/es-es/red_hat_enterprise_linux/8/html/managing_monitoring_and_updating_the_kernel/signing-kernel-modules-for-secure-boot_managing-kernel-modules) 
- [strace](https://opensource.com/article/19/10/strace )
- [The Linux Kernel Module Programming Guide](https://sysprog21.github.io/lkmpg/)

