# paradigmas-programacion
Código visto en clases

# OOP

# Clase 1: Análisis y diseño OOP

## Ejercicio 1  (resolución en clases)
Modele el siguiente ejercicio en Java, documentando sus atributos y métodos. Luego, realice una representación mediante diagrama de clases UML.

* Critico de películas
    * Cree la clase Reviewer que modela a un critico de películas que califica películas.
    * La calificación es medida en estrellas de 1 a 5.
    * Una película tiene nombre, año, director. 
    *  El Reviewer califica un conjunto de películas y además se debe obtener la calificación de cada una de ellas.

* Tip: Primero, piense lo siguiente, ¿cómo va a especificar la película y su calificación?


# Clase 2: Relaciones POO I

## Composición y agregación

Implemente la resolución de los siguientes ejercicios en Java.

### Ejercicio 1 (resolución en clases)
* En la Universidad Acme, los profesores dictan clases y los alumnos se inscriben (asocian) a cada ramo impartido por el profesor. 
* Luego, múltiples estudiantes pueden estar asociados a un solo profesor y un solo estudiante puede estar asociado a múltiples profesores (asociación).
* Asimismo, la universidad se encuentra en período de exámenes.
* Un examen contiene preguntas y respuestas.
* Una pregunta puede tener múltiples respuestas y una respuesta no puede pertenecer a múltiples preguntas. 
* Si borramos una pregunta, las respuestas deben borrarse automáticamente (composición).

### Ejercicio 2 (Ejercicio propuesto para realizar fuera del horario de clase)
* En la empresa HardWorks se tienen empleados y supervisor de área. Cada empleado debe reportar a su supervisor.
* Cada empleado solo tiene un supervisor a cargo. Si el supervisor deja la empresa, el empleado no se ve afectado. (agregación).


## Clase 3: Relaciones POO II 
### Ejercicio 1 Herencia (resolución en clases)
* Herencia

A. Una línea 2D tiene dos dimensiones, x e y. Haciendo uso de herencia, ¿cómo implementaría una línea 3D?

B. Una línea se compone de dos puntos. Punto inicio y punto final. Primero implemente mediante composición la representación de una línea basada en la definición previamente escrita.  Luego, diseñe e implemente otra clase que contenga la representación de una línea, pero ahora utilizando herencia. Es decir, una línea hereda el comportamiento de un punto.

Tip: cuando hacemos uso de composición, “una línea se compone de dos puntos”, pero cuando hacemos uso de herencia, “una línea es un punto extendido por otro punto”

### Ejercicio 2 Composición (resolución en clases)
* Polimorfismo

Implemente un programa que obtenga múltiples tipos de formas geométricas y su área, por ejemplo, el programa obtendrá figuras tales como, triángulo, rectángulo, etc. En primer lugar, debe implementar una superclase “Figura” que definirá el comportamiento de todas las figuras. Asuma que todas las figuras tienen un atributo en común, que en este caso será el color.

Tip:

Área rectángulo: largo*ancho

Área triángulo: 0,5*base*altura
