# Compilación y ejecución utilizando Javac

## Compilación

* La compilación se realiza a través del uso del compilador javac, el cual viene incluido en la instalación del JDK.
* Para compilar se ejecuta el siguiente comando: javac NOMBRE_ARCHIVO.java
* El uso del comando javac, genera archivos .class
* Para compilar archivos .java, es necesario compilarlos todos de una vez. No se puede compilar uno y luego otro. 
* Para esto es necesario ejecutar: javac PATH/NOMBRE_ARCHIVO1.java PATH/NOMBRE_ARCHIVO2.java PATH/NOMBRE_ARCHIVO_N.java
* Los archivos .class se generan en el mismo path de cada archivo .java
* Lo recomendado es dejar el código .java en una carpeta distinta. Esto se especifica con el argumento "-d" seguido de 
la ruta donde se mantendra estos archivos .class

* Pueden aprovechar las herramientas del sistema (GNUTools, Unix. En el caso de Windows, buscar el equivalente de find)
* Con "find", buscan todos los archivos .java en una ruta específica.
* Cabe notar que la ruta depende del sistema operativo, en el caso de Unix será /, mientras que Windows es \

* Situados en el path /ShoppingSystem, ejecuten el siguiente comando para ejecutar el proyecto.
* Cabe notar que la ruta depende del sistema operativo, en el caso de Unix será /, mientras que Windows es \

```bash
javac $(find ./src -name '*.java')
```

* Utilizando el argumento "-d" indicamos en donde se almacenará el output de la compilación. El cual es .class

```bash
javac -d bin $(find ./src -name '*.java')
```
* Finalmente, los archivos .class quedan almacenados en la ruta ShoppingSystem/bin


## Ejecución

* La ejecución se hace a través del comando "java", y este debe recibir la ruta de la clase Main. Tal como se ve en el 
siguiente ejemplo

```bash
java packagename1.packagename2.packagename3.Main 
```

* Situados en la ruta ShoppingSystem/bin, ejecutan el siguiente comando.

```bash
java com.paradigmas.shoppingsystem.Main
```


### Referencia

1. https://www.baeldung.com/java-could-not-find-load-main-class
2. https://www.dummies.com/programming/java/how-to-use-the-javac-command/


# Compilación y ejecución utilizando Gradle

* Recomiendo utilizar Gradle, ya que funciona de forma independiente al sistema operativo.
* Para la compilación se ejecuta el comando: ./gradlew build
* Para la ejecución se ejecuta el comando: ./gradlew run

## Compilación

```bash
./gradlew build
```

## Ejecución

```bash
./gradlew run
```

## Limpiar artefactos generados por la compilación

```bash
./gradlew clean
```