# pingML

Monitoreo de colonia de pingüino de Magallanes en el Parque Nacional Monte León.

Lu + Ian, reuniones de los jueves febrero 2023, después agosto 2023.
Ordenamos datos de recuento de nidos en 44 estacas fijas.

Guía de documentos del repo:
1. nidos.Rmd manipulación de datos que vienen del monitoreo y cómo se integran a la base de datos común
2. distance-nidos.Rmd construye data frame necesario para distance y otros métodos, toma tabla de datos y construte datos_ord que se va a usar para distance y para otros métodos
3. quadrat-nidos.Rmd
4. vec-nidos.Rmd
5. nidos-tipo.Rmd
6. mapa-nido.Rmd
7. resumen IPC23.Rmd



Historia:

- completamos datos faltantes con Grisel
- compilamos datos de monitoreo anual entre 2015 y 2021, y arreglamos errores
- estimación de abundancia con métodos de distancia

♣ Trabajamos con los perimetros de la pinguinera obtenidos mediante track GPS en el campo para cada año. Se cargaron los
tracks en QGIS 3.18.2 y se corrigieron los perimetros tomando las siguientes decisiones:
1. Revisar el track en una escala de 1:500
2. Suavizar las lineas de zig-zag de distancia corta a linea recta
3. Se mantuvieron los extremos "claros" del poligono
4. Las curvas pronunciadas cercanas se unieron entre sí tomando el extremo de la curva superior

Hasta el 10/03 se fixeo:
1) Perimetro 2016

Aclaración: el track 2022 que está en el drive es de exploracion. Ya se le pidio a Grisel el track que necesitamos. 

Dia 04-04-23
Trabajamos con la base de datos para vecino mas cercano.
Se modificaron datos en la base para llevar a 21 metros las estacas que no tenian nidos. 
Se corrió el script para vecinos mas cercanos para todos los años. Las estimaciones del vecino mas cercano dan bastante distintas a las del distance por no tener resolución adecuada a distancias cortas (en el campo, todas las medidas se llevan al metro superior inmediato). En caso de querer poner a prueba este método hay que medir con precisión las distancias.

Día 13-04-23
Completamos mapas, cueva y mata, estimaciones de densidad por quadrat count.
Para cerrar resumen, lo que vemos hasta ahora es que:
- no hay diferencia entre métodos de estimación por quadrat count y por distancia.
- hay estabilidad numérica en la cantidad de parejas en el tiempo
- no hay cambios evidentes en forma de la colonia, ni cant ni prop de mata y cueva

A futuro:
- interpolación de valores para nidos
- mapa de cambios respecto a tiempo anterior, comparando tiempo a tiempo y poniendo flecha si hay aumento o disminución en cada estaca
- todo esto con video animado por año

Julio: para quadrat count falta agregamos estacas con 0 recuento

Agosto: conseguimos perímetros de ping para ver cambios en el tiempo y ajustar 