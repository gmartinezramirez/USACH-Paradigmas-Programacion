
# PEP 1 01 2020

## Pregunta 1

El laboratorio médico VeriHealth S.A. se encarga de recolectar y evaluar exámenes de laboratorio de pacientes de varios hospitales y clínicas de la ciudad, con el fin de determinar las posibles patologías que puedan tener (ej: diabetes, hipotiroidismo, anemia, etc.). Con el advenimiento de las enfermedades de invierno, se hace necesario implementar en VeriHealth S.A. un nuevo sistema para el etiquetado de muestras. Se le ha encargado a usted desarrollar un prototipo del sistema en pseudo-Scheme bajo el paradigma de programación funcional.

Toda muestra posee un RUT del paciente (string), ID de muestra (entero), su edad (entero), su sexo biológico (string, “M” o “F”), centro hospitalario de origen (string), si la muestra ya ha sido evaluada (booleano), si el paciente consume medicamentos (booleano), sus enfermedades preexistentes (string) y las enfermedades detectadas por la misma muestra (string).

1. Diseñe una representación para los TDAs Lista de Muestras y Muestra, añadiendo un ejemplo de uso. Luego implemente sus constructores y funciones de pertenencia

2. Implemente una función para el TDA Lista de Muestras que dado un RUT de un paciente y su ID de muestra, permita cambiar el estado de evaluación de la muestra y además cambiar las enfermedades que fueron detectadas en dicha muestra.

3. A partir de sus implementaciones en las preguntas 1 y 2, se solicita implementar funciones que permitan lo siguiente

a. Recuperar todas las muestras de un paciente determinado (por RUT).

b. Recuperar todas las muestras de pacientes dentro de un rango etáreo (especificando edad mínima y máxima)

c. Recuperar todas las muestras cuya enfermedad detectada es la indicada como parámetro de entrada. Esta función también debe aceptar coincidencias parciales (Ej: “abe” debiese retornar “Diabetes”)

d. Recuperar todas las muestras de acuerdo a un criterio personalizado en una función f, la cual debe ser indicada en el momento de ejecutar la función.

e. Hacer una función currificada que permita obtener las muestras bajo los criterios indicados en los ítems (b) y (c) de manera simultánea

