# pingML
Trabajamos con Ian, reuniones de los jueves febrero 2023.
Ordenamos datos de recuento de nidos en 44 estacas fijas

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

Alclaración: el track 2022 que está en el drive es de exploracion. Ya se le pidio a Grisel el track que necesitamos. 

Dia 04-04-23
Trabajamos con la base de datos para vecino mas cercano.
Se modificaron datos en la base para llevar a 21 metros las estacas que no tenian nidos. 
Se corrió el script para vecinos mas cercanos para todos los años. Debemos continuar trabajando para solucionar las estimaciones del vecino mas cercano ya que dan bastante distintas a las del distance
