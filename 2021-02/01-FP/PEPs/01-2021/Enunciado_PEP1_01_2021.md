
# PEP 01 2021

## Pregunta 1

Las impresoras 3D de tipo FDM se basan en el uso de un cabezal de impresión que deposita un filamento de plástico derretido sobre una superficie capa a capa. El cabezal tiene la capacidad de moverse en el eje X y en el eje Z, mientras que la base de impresión puede moverse en el eje Y.

Para poder imprimir un modelo 3D este debe estar en un formato que acepte la impresora, este formato se basa en instrucciones que le dicen a la impresora las acciones que debe realizar, como por ejemplo:

* Moverse en X e Y cierta cantidad de milímetros
* Moverse en Z cierta cantidad de milímetros
* Extruir o retraer filamento (Acciona el motor que empuja el filamento de plástico para que salga plástico por la boquilla) cierta cantidad de milímetros.

Por ejemplo, para dibujar una línea diagonal de 5mm de largo y 0.6mm de alto usando una altura de capa de 0.3mm, a la impresora se deben enviar los siguientes comandos (Es cómo un lenguaje assembler - imperativo para las impresoras 3D):

EXTRUIR 0.4 # Empuja 0.4mm de filamento por el cabezal de impresión
MOVER 3 4 # Se mueve en diagonal 3mm en X y 4mm en Y (diagonal de 5mm)
SUBIR 0.3 # Sube 0.3mm en Z
EXTRUIR 0.4 # Empuja más filamento
MOVER -3 -4 # Para devolverse en la misma diagonal
EXTRUIR 0 # Deja de presionar la salida del filamento
SUBIR 10 # Par dejar el cabezal 1cm sobre la figura ya terminada

Usted está encargado de un módulo del software utilizado para convertir un diseño 3D al formato aceptado por las impresoras, en este módulo se deben obtener estadísticas acerca de la impresión realizada.

a. Diseñe el/los TDAs necesario(s) para representar los comandos que serán enviados a la impresora 3D, implemente las funciones del TDA que pueda necesitar en las siguientes preguntas.

b. Realice una función que permita obtener el peso total de la impresión generada. Para su función asuma que además tiene como entrada el grosor (o diámetro) en centímetros del filamento y la densidad de este (en g/cm^3).

c. Realice una función que permita obtener el tiempo total de impresión, asuma que los comandos de EXTRUIR se ejecutan al mismo tiempo que el siguiente comando de movimiento (puede ser MOVER o SUBIR), los comandos de movimiento demoran siempre 0.1 segundos en ejecutarse.

d. Implemente una función de orden superior que permita obtener cualquier estadística a partir del TDA con el listado de comandos. Por ejemplo si queremos contar los comandos de tipo “SUBIR” enviados a la impresora:

(obtenerEstadistica comandos (lambda (x cont) (if (equal? "SUBIR" (getTipoComando x)) (+ cont 1) cont)) 0)

e. (7.5 pts) Implemente la misma función que en d), pero currificada.

Nota: Area de un filamento es el area de circulo: A = Pi * R^2
Volumen: V = A * L
Densidad: D = masa/volumen


## Pregunta 2

* Dado el contexto global de la pandemia, la librería “Pingüino” vio mermada su venta física de libros de programación de autores independientes que no cuentan con el apoyo de grandes editoriales como O’Reilly Publications. Es por este motivo que para impulsar la publicación y ventas de libros de este tipo, la gerencia de la empresa tiene la intención de implementar un portal en donde los usuarios tengan la posibilidad de ofrecer la venta de libros técnicos de su autoría a otros usuarios. La diferencia con la competencia es que los autores piden a los usuarios un precio mínimo y sugerido a pagar por estos libros. 
* Este sistema contiene el registro de autores asociado, todos los libros publicados en el sistema “Pingüino” y un listado de usuarios clientes registrados. En esta línea, un autor consta de nombre (string) y un listado de libros asociados a su autoría (lista de libros). Mientras que cada libro tiene asociado un nombre de autor (string, el nombre de libro (string), el precio mínimo (number) y sugerido (number) a pagar por este libro, la cantidad de ejemplares vendidos (number), el número de páginas (number) y un listado de tags que indican las tecnologías asociadas (lista de strings) (por ejemplo, “TypeScript”, “Go”, “Rust”). Finalmente, un usuario tiene un username (string) y un listado de libros comprados.

a. Especificar TDAs que permitan cubrir con lo necesario para abordar las necesidades de la editorial “Pingüino” de acuerdo a los requerimientos de las siguientes preguntas. Luego para la implementación del TDA señalar las representaciones escogidas para cada uno y las funciones de éste (constructores, selectores, modificadores) que resulten necesarias para abordar las siguientes preguntas. 
b. Implemente las funciones necesarias que permitan registrar un nuevo autor en el sistema.
c. Implemente las funciones necesarias que permitan al autor registrar un nuevo libro de su autoría en el sistema.
d. Implemente las funciones necesarias que permitan a un usuario comprar (adquirir) un libro de la lista de libros existentes en el sistema.
e. Implemente las funciones necesarias que permitan filtrar libros en el sistema de acuerdo a:
 1. precio mínimo
 2. precio máximo
 3. número de páginas
 4. un valor entre el precio mínimo y el precio máximo

