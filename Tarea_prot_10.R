
#### Taréa 1 - Modealamioento y Análisis de Datos

### A. Establezca un objetivo general para el estudio según la información que se describe. (2 ptos)

# Respuesta: El objertivo general es analizar la distribución espacial, temporal y de magnitud de los terremotos 
#            registrados a nivel global durante el año 2023, considerando sus características sismológicas y las 
#            posibles relaciones entre estas variables.

### B. Establezca 3 hipótesis para el estudio, formúlelas usando estructura de hipótesis, es decir, cada 
### hipótesis nula (H0) debe contar con su respectiva hipótesis alternativa (H1). (3 puntos)

# Respuesta: Hipótesis 1.
#            H0: La distribución espacial de los terremotos es aleatoria y no presenta patrones agrupados o 
#                zonas sísmicas definidas.
#            H1: La distribución espacial de los terremotos presenta patrones agrupados o zonas sísmicas 
#                definidas, las cuales podrían estar asociadas a fallas geológicas o procesos tectónicos 
#                específicos.

#            Hipótesis 2.
#            H0: La frecuencia de los terremotos no está relacionada con la época del año (Time) 
#                ni con eventos climáticos específicos.
#            H1: La frecuencia de los terremotos sí está relacionada con la época del año (Time) 
#                o con eventos climáticos específicos, como por ejemplo, un aumento de la actividad sísmica 
#                durante la temporada de lluvias.

#            Hipótesis 3.
#            H0: Las redes sismológicas (Net) no tienen un impacto significativo en la magnitud estimada (Mag) 
#                de los terremotos.
#            H1: Las redes sismológicas (Net) sí tienen un impacto significativo en la magnitud estimada (Mag) 
#                de los terremotos, debido a la variabilidad en sus métodos de medición y cobertura geográfica.


### C. ¿Cuáles son las dimensiones de la base de datos? ¿Cuál es el formato de cada variable? 
###    ¿El formato de las variables es el correcto? Si el formato no es el correcto, corríjalo. (2 ptos) 

install.packages("readxl")
earthquakes_2023_global <- read.csv("D:/Proyectos R/Tarea 1/earthquakes_2023_global.csv")

# Respuesta: LA base de datos consta con 26642 filas y 22 columnas.

dim(earthquakes_2023_global)
#  26642    22

# Respuesta: El formato de cada variable es el siguiente: chr y num

str(earthquakes_2023_global)
#'data.frame':	26642 obs. of  22 variables:
#  $ time           : chr  "2023-01-01T00:49:25.294Z" "2023-01-01T01:41:43.755Z" "2023-01-01T03:29:31.070Z" "2023-01-01T04:09:32.814Z" ...
#$ latitude       : num  52.1 7.14 19.16 -4.78 53.4 ...
#$ longitude      : num  178.5 126.7 -66.5 102.8 -166.9 ...
#$ depth          : num  82.8 79.2 24 63.8 10 ...
#$ mag            : num  3.1 4.5 3.93 4.3 3 2.8 4.1 4.1 2.7 4.1 ...
#$ magType        : chr  "ml" "mb" "md" "mb" ...
#$ nst            : num  14 32 23 17 19 19 15 40 30 27 ...
#$ gap            : num  139 104 246 187 190 127 87 81 154 119 ...
#$ dmin           : num  0.87 1.152 0.848 0.457 0.4 ...
#$ rms            : num  0.18 0.47 0.22 0.51 0.31 0.18 0.15 0.32 0.14 0.45 ...
#$ net            : chr  "us" "us" "pr" "us" ...
#$ id             : chr  "us7000j5a1" "us7000j3xk" "pr2023001000" "us7000j3xm" ...
#$ updated        : chr  "2023-03-11T22:51:52.040Z" "2023-03-11T22:51:45.040Z" "2023-03-11T22:51:29.040Z" "2023-03-11T22:51:45.040Z" ...
#$ place          : chr  "Rat Islands, Aleutian Islands, Alaska" "23 km ESE of Manay, Philippines" "Puerto Rico region" "99 km SSW of Pagar Alam, Indonesia" ...
#$ type           : chr  "earthquake" "earthquake" "earthquake" "earthquake" ...
#$ horizontalError: num  8.46 5.51 0.91 10.25 1.41 ...
#$ depthError     : num  21.21 7.45 15.95 6.58 2 ...
#$ magError       : num  0.097 0.083 0.09 0.238 0.085 0.06 0.213 0.095 0.112 0.123 ...
#$ magNst         : num  14 43 16 5 18 36 6 34 35 18 ...
#$ status         : chr  "reviewed" "reviewed" "reviewed" "reviewed" ...
#$ locationSource : chr  "us" "us" "pr" "us" ...
#$ magSource      : chr  "us" "us" "pr" "us" ...


# Respuesta: El foramato de las variables es el correcto, pero no el mas adecuado. Donde el recomendado es el 
#            POSIXct, que facilita cálculos con fechas y horas, además de, simplifica el orden y filtrado.

earthquakes_2023_global$time <- as.POSIXct(earthquakes_2023_global$time)
#la cadena de caracteres no está en un formato estándar inequívoco

head(earthquakes_2023_global$time)
as.POSIXct(earthquakes_2023_global$time)
strtime(earthquakes_2023_global$time)
format(earthquakes_2023_global$time)
as.Date(earthquakes_2023_global$time)
as.POSIXct(earthquakes_2023_global$time)

earthquakes_2023_global$magType <- as.POSIXct(earthquakes_2023_global$magType)
#la cadena de caracteres no está en un formato estándar inequívoco


### D. ¿La base de datos tiene valores nulos? ¿Cuántos? ¿Cuántas variables tienen valores nulos? 
###    ¿Cuál es el tratamiento adecuado para la limpieza de la base de datos? (4 ptos)

# Respuesta: Si hay valores nulnos sum(is.na(earthquakes_2023_global)) 9496 en total.

#            6 variables tienen valores nulos: nst, gap, dmin, horizontalError, magError, magNst.

#            El tratamiento adecuado comienza con la exploración de datos, luego identificación de problemas 
#            de calidad de datos como valores nulos, corrección de problemas y finalizar con la validación y 
#            verificación de la limpieza.


earthquakes_2023_global[is.na(earthquakes_2023_global)]

#[ reached getOption("max.print") -- omitted 8496 entries ]

is.na(earthquakes_2023_global)

#[ reached getOption("max.print") -- omitted 26597 rows ]

sum(is.na(earthquakes_2023_global))
#[1] 9496

sum(is.na(earthquakes_2023_global$time))
#[1] 0
sum(is.na(earthquakes_2023_global$latitude))
#[1] 0
sum(is.na(earthquakes_2023_global$longitude))
#[1] 0
sum(is.na(earthquakes_2023_global$depth))
#[1] 0
sum(is.na(earthquakes_2023_global$mag))
#[1] 0
sum(is.na(earthquakes_2023_global$magType))
#[1] 0
sum(is.na(earthquakes_2023_global$nst))
#[1] 1415
sum(is.na(earthquakes_2023_global$gap))
#[1] 1417
sum(is.na(earthquakes_2023_global$dmin))
#[1] 1866
sum(is.na(earthquakes_2023_global$rms))
#[1] 0
sum(is.na(earthquakes_2023_global$net))
#[1] 0
sum(is.na(earthquakes_2023_global$id))
#[1] 0
sum(is.na(earthquakes_2023_global$updated))
#[1] 0
sum(is.na(earthquakes_2023_global$place))
#[1] 0
sum(is.na(earthquakes_2023_global$type))
#[1] 0
sum(is.na(earthquakes_2023_global$horizontalError))
#[1] 1549
sum(is.na(earthquakes_2023_global$depthError))
#[1] 0
sum(is.na(earthquakes_2023_global$magError))
#[1] 1672
sum(is.na(earthquakes_2023_global$magNst))
#[1] 1577
sum(is.na(earthquakes_2023_global$status))
#[1] 0
sum(is.na(earthquakes_2023_global$locationSource))
#[1] 0
sum(is.na(earthquakes_2023_global$magSource))
#[1] 0



### E.	Mediante una función for-loop, cambie la unidad de medida de la variable “Mag” de tal forma que, 
###     todos los valores de la variable “Mag” estén medidos con el tipo de magnitud “Mw”. Considere que (3 ptos):

##  mb a Mw: Mw = 1.67 * mb - 2.0
##	ml a Mw: Mw = 1.42 * ml + 0.82
##	mwc a Mw: Mw = 1.1 * mwc + 0.35
##	mwb a Mw: Mw = 1.14 * mwb + 0.23
##  Mi a Mw: Mw = 2.67 + 0.98 * Mi
##  ms a Mw: Mw = 2.5 * log10(ms) - 1.76
##	md a Mw: Mw = 1.74 * md + 0.05
##	Mww a Mw: Mw = Mww + (0.23 * (Mww - 6.0))

#for loop 
#nrow: numero de filas

#eliminar las que no aparecen con formulas.


for(n in nrow(earthquakes_2023_global)) {
  print(n)
}
 ##print(earthquakes_2023_global[i, "mag"] )
  ##print(earthquakes_2023_global[i, "magType"])
# for-loop over rows


for(i in 1:nrow(earthquakes_2023_global)) {
  earthquakes_2023_global[i, "mag"]}

    
for(i in 1:nrow(earthquakes_2023_global))
  
  if(earthquakes_2023_global[i, "magType"] == "mb"){
    earthquakes_2023_global[i, "mag"] <- 1.67 * earthquakes_2023_global[i, "mag"] - 2.0
    earthquakes_2023_global[i, "magType"] <- "Mw"
  }
  if(earthquakes_2023_global[i, "magType"] == "ml"){
    earthquakes_2023_global[i, "mag"] <- 1.42 * earthquakes_2023_global[i, "mag"] + 0.82
    earthquakes_2023_global[i, "magType"] <- "Mw" 
  }  
  if(earthquakes_2023_global[i, "magType"] == "mwc"){
    earthquakes_2023_global[i, "mag"] <- 1.1 * earthquakes_2023_global[i, "mag"] + 0.35
    earthquakes_2023_global[i, "magType"] <- "Mw"
  }
  if(earthquakes_2023_global[i, "magType"] == "mwb"){
    earthquakes_2023_global[i, "mag"] <- 1.14 * earthquakes_2023_global[i, "mag"] + 0.23
    earthquakes_2023_global[i, "magType"] <- "Mw"
  }
  if(earthquakes_2023_global[i, "magType"] == "Mi"){
    earthquakes_2023_global[i, "mag"] <- 2.67 + 0.98 * earthquakes_2023_global[i, "mag"]
    earthquakes_2023_global[i, "magType"] <- "Mw"
  }
  if(earthquakes_2023_global[i, "magType"] == "ms"){ 
    earthquakes_2023_global[i, "mag"] <- 2.5 * log10(earthquakes_2023_global[i, "mag"]) - 1.76
    earthquakes_2023_global[i, "magType"] <- "Mw"
  }
  if(earthquakes_2023_global[i, "magType"] == "md"){
    earthquakes_2023_global[i, "mag"] <- 1.74 * earthquakes_2023_global[i, "mag"] + 0.05
    earthquakes_2023_global[i, "magType"] <- "Mw"  
  }
  if(earthquakes_2023_global[i, "magType"] == "Mww"){
    earthquakes_2023_global[i, "mag"] <- earthquakes_2023_global[i, "mag"] + (0.23 * (earthquakes_2023_global[i, "mag"] - 6.0))
    earthquakes_2023_global[i, "magType"] <- "Mw"
  }
  
    
    ## Se utuliza la función FOR la cual implementa un ciclo sobre cada fila del data frame utilizando la función NROW
    ## para obtener el dato de cada fila. Luego condicionamos si las magnitudes dentro de la variable "magType" no coinciden 
    ## con "Mw", dónde el valor de cada tipo de magnitus ("mag") tendrá que combiar con una respectiva formula mencionada en el 
    ## egercicio, para poder medirce con "Mw".   
    
    
    
    
    
    [][]
    
    nrow(earthquakes_2023_global)
    
    
    head(earthquakes_2023_global)
    
    
    
    
    convertir_magnitutd <- funcion(earthquakes_2023_global,earthquakes_2023_global$magType)
    
    
















































































































































































































