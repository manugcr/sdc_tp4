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

---

## Bibliografia

- [RedHat - Kernel](https://access.redhat.com/documentation/es-es/red_hat_enterprise_linux/8/html/managing_monitoring_and_updating_the_kernel/signing-kernel-modules-for-secure-boot_managing-kernel-modules)
- [What is a kernel Module](https://sysprog21.github.io/lkmpg/#what-is-a-kernel-module) 
- [strace](https://opensource.com/article/19/10/strace )

