library(tidyverse)
library(kableExtra)
library(knitr)
library(rmarkdown)
#Usando read_csv
plants <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/plants.csv")
actions <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/actions.csv")
threats <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/threats.csv")

data("msleep")
Tabla <- msleep %>% group_by(vore) %>% summarise_at("sleep_total", .funs = list(Mean = mean, SD = sd)) %>% 
      dplyr::filter(!is.na(vore)) %>% arrange(desc(Mean))

kable(Tabla)


msleep_long <- msleep %>% dplyr::select(name, vore, 
                                        sleep_total, brainwt)
# digits permite reducir el número de decimales a mostrar
kable(msleep_long, digits = 2, caption = "La base de datos entera") %>%
#kable _styling permite modificar la tabla
#boostrap_options permite modificar las filas de las tablas
#striped filas con estilo de cebra, i.e., blanco, gris, blanco, gris
#hover las filas resaltan cuando se pasa el cursor encima de ella
#condensed reduce un poco las dimensiones de la tabla
#full_width parece que ajuste el tamaño de las columnas al contenido más grande de las celdas
  kable_styling(bootstrap_options = c("striped", 
                                      "hover", "condensed"), full_width = F) %>%
  #scroll_box permite ver una tabla a traves de mover una linea horizontal del lado derecho
  scroll_box(width = "800px", height = "200px") 
