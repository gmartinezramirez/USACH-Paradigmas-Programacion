# PEP 1 02 2020

## Pregunta 1

RacketFlix™ es el nuevo sistema de moda para ver películas por streaming. El sistema de RacketFlix™ dispone de “películas”, las cuales son compradas por los “usuarios” y son agregadas al “perfil del usuario”. Por lo que cada usuario consta con su propio perfil que despliega las películas adquiridas en este sistema.

Cada película se identifica con un id (int), nombre (string), duración en minutos (int), año (int) y una lista de tags (string). Los tags corresponden a etiquetas asociadas a cada película. Por ejemplo, “comedia”, “clasico”, “acción”. Asimismo, cada usuario se identifica con su rut (string), username (string), una lista de preferencias de estilo.

RacketFlix utiliza su propio sistema de criptomonedas, el cual es llamado Racket Dollars™ que corresponde a un número entero. Cada usuario tiene una cartera de Racket Dollars, que indica la cantidad disponible a gastar. Del mismo modo, cada película tiene un precio asociado en este tipo de moneda.

Dentro de la compañía quieren evaluar la posibilidad de migrar RacketFlix a una implementación basada en el paradigma funcional.

a. Especificar TDAs que permitan cubrir con lo necesario para cubrir con las demandas de RacketFlix de acuerdo a los requerimientos de las siguientes preguntas. Luego para la implementación del TDA señalar las representaciones escogidas para cada uno.

b. Implementar una función que permita registrar un nuevo usuario con nombre de usuario y contraseña tomando como base la representación escogida.

c. Implementar una función que permita comprar contenido procurando descontar los montos de su cartera de RacketDollas.

d. Implementar una función que permita seleccionar películas de acuerdo a un criterio C determinado.

e. Implementar SOLO UNA de las siguientes funciones que pueden ser usadas como criterios de la función del apartado d.

i. Películas cuya duración se encuentre en un rango de minutos [min,max]
ii. Películas que contengan TODAS las etiquetas presentadas en una lista L de entrada (etiqueta1, etiqueta2, etiqueta3). Las películas pueden tener otras etiquetas, pero debe contener todas las de la lista para ser seleccionada.

f. Implementar una función que permita aplicar una rebaja dada por una función f a un conjunto de películas que cumplan con un criterio C. A modo de ejemplo la función f podría ser una rebaja del 30% y el criterio de selección aplicaría para todas las películas del catálogo etiquetadas como comedia.
